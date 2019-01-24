module app.lib.yun.YunUpLoad;

import app.lib.yun.status;
import app.lib.yun.exception;

import std.json;
import std.net.curl;
import std.array;
import std.datetime;
static import std.file;
import std.digest.sha;
import std.digest.hmac;
import std.base64;
import std.conv;
import std.string;
import hunt.util.Configuration;
import hunt.logging;

import std.experimental.allocator.mallocator;
import core.stdc.time;

alias YunStatusCallBack = void delegate(YunUpLoad,UpLoadStuts);
alias YunUpPeocess = void delegate(size_t, size_t);
                
//ConfigBuilder con = Config.config("hunt");
//auto upload = new YunUpLoad(con.file.cloud.appid, con.file.cloud.write, con.file.cloud.access_key, con.file.cloud.secret);
enum SliceLength =  4 * 1024 * 1024;
// static string uploadImg(request.postForm.File f)
// {
// 	ubyte[] file_data;
// 	auto filesize = f.fileSize;
// 	f.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
// 	auto sha1 = toHexString(sha1Of(file_data));
// 	auto saveName = sha1 ~ "." ~ Utils.fileExt(f.fileName);
// 	auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));

// 	return con.file.cloud.read ~ json["hash"].str ~ "_nodown.png";
// }
class YunUpLoad
{
	this(string appid , string baseurl , string publickey , string signkey)
	{
		_appid = appid;
		_baseurl = baseurl;
		_uploadtoken = buildToken(publickey , signkey);

	}

	@property onStatus(YunStatusCallBack cback){_status = cback;}
	@property onProcess(YunUpPeocess cback){_process = cback;}

	string doUpload(const byte[] data , string filename = "test")
	{
		JSONValue json = getDataInfo(data,filename);
		if(json["hash"].str != ""){
			json["url"] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ ".png";
		}
		if (json["error_code"].integer != 0){
			status(UpLoadStuts.UploadErro);
			return null;
		}
		auto fstatue = json["filestate"].integer;
		if(fstatue == 1){
			status(UpLoadStuts.NotNeedUpload);
			status(UpLoadStuts.WaitHandle);
			return doReturnUrl(json, filename);
		}
		json = sliceUpLoad(json["key"].str ,data,cast(size_t)(json["begin"].integer));
		if(json["error_code"].integer == 0 && json["filestate"].integer == 1){
			status(UpLoadStuts.WaitHandle);
			json["url"] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ ".png";
			return doReturnUrl(json, filename);
		} else {
			status(UpLoadStuts.UploadErro);
			return null;
		}
	}


	string doUpload( string filename, string rename = "")
	{

		if(!std.file.exists(filename))
			throw new FileNotExistsException(filename);
		status(UpLoadStuts.BeginUpLoad);
		scope(failure)status(UpLoadStuts.UploadErro);
		JSONValue json = getFileInfo(filename,rename);
		if (json["error_code"].integer != 0){
			status(UpLoadStuts.UploadErro);
			return null;
		}
		auto fstatue = json["filestate"].integer;
		if(fstatue == 1){
			status(UpLoadStuts.NotNeedUpload);
			status(UpLoadStuts.WaitHandle);
			return doReturnUrl(json, filename);
		}
		version(ONCEUPLOAD)
			json = doUpLoad(json["key"].str,filename,cast(size_t)(json["begin"].integer));
		else
			json = sliceUpLoad(json["key"].str,filename,cast(size_t)(json["begin"].integer));
		
		if(json["error_code"].integer == 0 &&  json["filestate"].integer == 1){
			status(UpLoadStuts.WaitHandle);
			return doReturnUrl(json, filename);
		} else {
			status(UpLoadStuts.UploadErro);
			return null;
		}
	}

	static string getFileHash1(string filename)
	{
		import std.digest.digest;
		import std.digest.sha;
		import std.stdio;
		import std.string;

		File file = File(filename,"r");
		SHA1 ahs = SHA1();
		ahs.start();
		ubyte[] data = new ubyte[4 * 1024];
		scope(exit){
			import core.memory;
			GC.free(data.ptr);
		}
		while(!file.eof){
			auto tdata = file.rawRead(data);
			ahs.put(tdata);
		}
		auto sha  = ahs.finish;
		auto str = toHexString(sha);
		string tstr = cast(string)(str[]);
		return toLower(tstr);
	}
protected:

	static string buildToken(string publickey , string signkey)
	{
		time_t deadline = time(null);
		string str = "{\"deadline\":" ~ to!string(cast(int)deadline) ~ "}";
		string enc_str = Base64URL.encode(cast(byte[])str);

		auto hmac = HMAC!SHA1(cast(ubyte[])signkey);
		hmac.put(cast(ubyte[])enc_str);
	    string hmac_str = Base64URL.encode(hmac.finish());


		return (publickey ~ ":" ~ hmac_str ~ ":" ~ enc_str);
	}
	/**
	 * {
	 * 		error_code // 0 suess
	 * 		returnUrl // 从uploadtoken里解析出来的
	 *      filename 
	 * 		hash
	 * 		filestate // 0 是需要上传，1 是已经存在，不需要上传
	 * 		begin	//  从那个字节开始上传，断点续传用
	 * 		key		//  上传的key，上传文件时需要验证的： 一次性的
	 * 		mime    // 文件的conent-type 类型，根据文件头获取的
	 * }
	*/
	JSONValue getFileInfo(string filename, string rename = "")
	{
		status(UpLoadStuts.CheckFileInfo);
		_http = HTTP();
		import std.path;
		JSONValue json;
		json["sha1"] = getFileHash1(filename);
		if(rename.length == 0)
			json["filename"] = baseName(filename);
		else
			json["filename"] = rename;
		json["appid"] = _appid;
		json["uploadToken"] = _uploadtoken;
		json["size"] = std.file.getSize(filename);
		string url = _baseurl ~ "/upfileinfo";
		string data = json.toString();
		_http.url(url);
		_http.method(HTTP.Method.post);
		_http.setPostData(data,"application/json");
		Appender!(ubyte[]) revData = appender!(ubyte[]);
		_http.onReceive = (ubyte[] rev){revData.put(rev); return rev.length;};
		_http.operationTimeout = 30.seconds;
		_http.perform();
		_http.handle.clear(CurlOption.timeout_ms);
		return parseJSON(cast(string)revData.data);
	}

	/**
	 * {
	 * 		error_code // 0 suess
	 * 		returnUrl // 从uploadtoken里解析出来的
	 *      filename 
	 * 		hash
	 * 		filestate // 0 是需要上传，1 是已经存在，不需要上传
	 * 		begin	//  从那个字节开始上传，断点续传用
	 * 		key		//  上传的key，上传文件时需要验证的： 一次性的
	 * 		mime    // 文件的conent-type 类型，根据文件头获取的
	 * }
	*/
	JSONValue getDataInfo(const byte[] bdata, string filename )
	{
		status(UpLoadStuts.CheckFileInfo);
		_http = HTTP();
		import std.path;
		JSONValue json;
		json["sha1"] = toLower(toHexString(sha1Of(bdata)));
		json["filename"] = filename;
		json["appid"] = _appid;
		json["uploadToken"] = _uploadtoken;
		json["size"] = bdata.length;
		string url = _baseurl ~ "/upfileinfo";
		string data = json.toString();
		_http.url(url);
		_http.method(HTTP.Method.post);
		_http.setPostData(data,"application/json");
		Appender!(ubyte[]) revData = appender!(ubyte[]);
		_http.onReceive = (ubyte[] rev){revData.put(rev); return rev.length;};
		_http.operationTimeout = 30.seconds;
		_http.perform();
		_http.handle.clear(CurlOption.timeout_ms);
		return parseJSON(cast(string)revData.data);
	}





	/**
	 * 请求参数： 把fileinfo返回的key 写道上传的头 yun_store 字段先面。
	 * body直接是文件的二进制数据。 支持put和post。
	 * 
	 * 返回值
	 * {
	 * 		error_code // 0 suess
	 * 		returnUrl // 从uploadtoken里解析出来的
	 *      filename 
	 * 		hash
	 * 		filestate // 0 是需要上传，1 是已经存在，不需要上传
	 * 		begin	//  从那个字节开始上传，断点续传用
	 * 		key		//  上传的key，上传文件时需要验证的： 一次性的
	 * 		mime    // 文件的conent-type 类型，根据文件头获取的
	 * }
	**/
	JSONValue doUpLoad(string token , string name,size_t begin)
	{

		string url = _baseurl ~ "/largeupload";
		import std.stdio;
		_http.clearRequestHeaders();
		_http.url(url);
		_http.method(HTTP.Method.put);
		_http.addRequestHeader("yun_store",token);
		_http.addRequestHeader("yun-store",token);
		auto f = File(name, "rb");
		auto sz = f.size;
		sz -= begin;
		f.seek(begin);
		_http.contentLength = sz;
		_http.onSend = (void[] data){
			{
				import std.experimental.logger;
				trace("------------data.length : ", data.length);
			}
			auto buf = f.rawRead(data);
			return buf.length;
		};
		Appender!(ubyte[]) revData = appender!(ubyte[]);
		_http.onReceive = (ubyte[] rev){revData.put(rev); return rev.length;};
		_http.onProgress = (size_t dlTotal, size_t dlNow,
			size_t ulTotal, size_t ulNow){
			process(ulNow,ulTotal);
			return 0;
		};
		_http.perform();
		return parseJSON(cast(string)revData.data);
	}

	JSONValue sliceUpLoad(string token ,const byte[] data , size_t begin)
	{
		string url = _baseurl ~ "/largeupload";
		JSONValue json;
		size_t len;
		size_t block;

		if(data.length - begin > SliceLength)
			block = SliceLength;
		else
			block = data.length - begin;
		
		ubyte[] buffer = cast(ubyte[])data[begin .. begin + block];

		do{
			_http.clearRequestHeaders();
			_http.url(url);
			_http.method(HTTP.Method.post);
			_http.addRequestHeader("yun_store",token);
			_http.addRequestHeader("yun-store",token);
			_http.contentLength = buffer.length;
			_http.setPostData(buffer,"application/octet-stream");
			Appender!(ubyte[]) revData = appender!(ubyte[]);
			_http.onReceive = (ubyte[] rev){revData.put(rev); return rev.length;};
			_http.onProgress = (size_t dlTotal, size_t dlNow,
				size_t ulTotal, size_t ulNow){
				process(len + ulNow,data.length - begin);
				return 0;
			};
			_http.perform();
			len += buffer.length;
			//process(len,sz);
			
			json = parseJSON(cast(string)revData.data);
			if (json["error_code"].integer != 0){
				status(UpLoadStuts.UploadErro);
				break;
			}
			if(json["filestate"].integer == 1){
				break;
			} else {
				token = json["key"].str;
				begin = cast(size_t)(json["begin"].integer);
			}
			
		} while(true);
		return json;
	}



	JSONValue sliceUpLoad(string token ,string name,size_t begin)
	{
		string url = _baseurl ~ "/largeupload";
		import std.stdio;
		auto f = File(name, "rb");
		auto sz = f.size;
		sz -= begin;
		size_t len = 0;
		ubyte[] buffer = cast(ubyte[])Mallocator.instance.allocate(SliceLength);
		scope(exit) Mallocator.instance.deallocate(buffer);
		JSONValue json;
		do{
			f.seek(begin);
			ubyte[] buf = f.rawRead(buffer);
			_http.clearRequestHeaders();
			_http.url(url);
			_http.method(HTTP.Method.post);
			_http.addRequestHeader("yun_store",token);
			_http.addRequestHeader("yun-store",token);
			_http.contentLength = buf.length;
			_http.setPostData(buf,"application/octet-stream");
			Appender!(ubyte[]) revData = appender!(ubyte[]);
			_http.onReceive = (ubyte[] rev){revData.put(rev); return rev.length;};
			_http.onProgress = (size_t dlTotal, size_t dlNow,
				size_t ulTotal, size_t ulNow){
				process(len + ulNow,cast(uint)sz);
				return 0;
			};
			_http.perform();
			len += buf.length;
			//process(len,sz);

			json = parseJSON(cast(string)revData.data);
			writeln(json);
			if (json["error_code"].integer != 0){
				status(UpLoadStuts.UploadErro);
				break;
			}
			if(json["filestate"].integer == 1){
				break;
			} else {
				token = json["key"].str;
				begin = cast(size_t)(json["begin"].integer);
			}

		} while(true);
		return json;
	}

	void status(UpLoadStuts state)
	{
		if(_status)
			_status(this,state);
	}

	void process(size_t now,size_t all){
		if(_process)
			_process(now,all);
	}

	string doReturnUrl(ref JSONValue json,string filename)
	{
		import std.path;
		string ext = extension(filename);
		string url = json["returnUrl"].str;
		if(url.length == 0) {
			json["ext"] = ext;
			status(UpLoadStuts.UploadSuess);
			return json.toString;
		}

		Appender!string turl = appender!string();
		turl.put(url);
		if(url.indexOf("?") == -1)
			turl.put("?");
		else
			turl.put("&");
		turl.put("width=0&width=0&ext=");
		turl.put(ext);turl.put("&filename=");turl.put(json["filename"].str);
		turl.put("&hash=");turl.put(json["hash"].str);turl.put("&mime=");turl.put(json["mime"].str);
		_http = HTTP();
		_http.url(turl.data);
		_http.method(HTTP.Method.get);
		_http.operationTimeout = 30.seconds;
		Appender!(ubyte[]) revData = appender!(ubyte[]);
		_http.onReceive = (ubyte[] rev){revData.put(rev); return rev.length;};
		_http.perform(ThrowOnError.no);
		status(UpLoadStuts.UploadSuess);
		return cast(string)revData.data;
	}

private:
	YunStatusCallBack _status;
	YunUpPeocess _process;
	string _appid;
	string _baseurl;
	string _uploadtoken;
	HTTP _http;
}
