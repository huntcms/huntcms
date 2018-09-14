module app.lib.yun.exception;

import std.exception;

class YunSdkException : Exception
{
	mixin basicExceptionCtors;
}

class FileNotExistsException : Exception
{
	mixin basicExceptionCtors;
}
