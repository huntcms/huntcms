module app.lib.other.Paginate;
import std.conv;
class Paginate
{    
    this(string linkUrl, int nowPage = 1, int totalPageNum = 1, int blockNum = 10)
    {
        _linkUrl = linkUrl;            //链接地址
        _nowPage = nowPage;            //当前页
        _totalPageNum = totalPageNum;  //总共页数
        _blockNum = blockNum;          //显示几个按钮块
    }

    public string showPages()
    {
        if(_totalPageNum <= 1) return "";
        import std.math;

        float temFval = ceil((cast(float)_blockNum)/2) ;
        int midPage = cast(int)temFval;

        string pagingStr = "";
        pagingStr ~= "<nav style=\"text-align:right\"><ul class=\"pagination\" style=\"display: inline-flex;\" ><input type=\"hidden\" name=\"page\" id=\"page\">";

        pagingStr ~= firstPage();  //首页按钮
        pagingStr ~= pageLast();  //上一页按钮
        pagingStr ~= pageBtns();
        //pagingStr ~= prePageBtn(midPage);  //当前页面前面页码按钮
        //pagingStr ~= nextPageBtn(midPage); //当前页面后面页码按钮
        pagingStr ~= pageNext();  //下一页按钮
        pagingStr ~= endPage(); //尾页按钮

        pagingStr ~= "</ul></nav>";
        return pagingStr;
    }


   //地址替换
    private string pageReplace(string page) 
    {
        import std.array;
        return _linkUrl.replace("{page}", page) ;
    }

    //首页
    private string firstPage() 
    {
        return "<li class=\"page-item\" ><a class=\"page-link\" href='" ~ (1 != _nowPage ? pageReplace("1") : "javascript:;;") ~ "' aria-label='Previous'  title='首页'><span aria-hidden='true'>首页</span></a></li>";
    }

    //尾页
    private string endPage() 
    {
        return "<li class=\"page-item\" ><a class=\"page-link\" href='" ~ (_totalPageNum != _nowPage ? pageReplace(to!string(_totalPageNum))  : "javascript:;;") ~ "' aria-label='Previous'  title='尾页'><span aria-hidden='true'>尾页</span></a></li>";
    }
    //上一页
    private string pageLast() 
    {
        int page = _nowPage == 1 ? 1 : (_nowPage-1);
        return "<li class=\"page-item\" ><a class=\"page-link\" href='" ~ (page != _nowPage ? pageReplace(to!string(page)) : "javascript:;;") ~ "' aria-label='Previous'  title='上一页'><span aria-hidden='true'>&laquo;</span></a></li>";

    }
    //下一页
    private string pageNext()
    {
        int page = (_nowPage== _totalPageNum ? _totalPageNum : (_nowPage+1) );
        return "<li class=\"page-item\" ><a class=\"page-link\" href='" ~ (page != _nowPage ? pageReplace(to!string(page)) : "javascript:;;") ~ "' aria-label='Next'  title='下一页'><span aria-hidden='true'>&raquo;</span></a></li>";
    }

    private string pageBtns()
    {
        string btnStr = "";
        int num = 4;
        int minPage = _nowPage - num < 1 ? 1 : _nowPage - num;
        int maxPage = _nowPage + num > _totalPageNum ? _totalPageNum : _nowPage + num;
        for(int i = minPage; i <= maxPage; i++)
        {
            string li = "";
            if(i == _nowPage)
            {
                li = "<li class=\"paginate_button page-item active\"><a href=\"#\" aria-controls=\"responsive-datatable\" data-dt-idx=\""~i.to!string~"\" tabindex=\"0\" class=\"page-link\">"~i.to!string~"</a></li>";
            }else{
                li = "<li class=\"paginate_button page-item \"><a href=\""~pageReplace(to!string(i))~"\" aria-controls=\"responsive-datatable\" data-dt-idx=\""~i.to!string~"\" tabindex=\"0\" class=\"page-link\">"~i.to!string~"</a></li>";
            }
            btnStr ~= li;
        }
        return btnStr;
    }
    //当前页面之前的按钮块
    private string prePageBtn(int midpage = 1)
    {
        string preBtnstr = "";
       
        int startIndex = _nowPage - midpage > 0? _nowPage - midpage : 1;
        startIndex = _totalPageNum-_nowPage > midpage || startIndex == 1 ? startIndex : _nowPage-(_blockNum-(_totalPageNum-_nowPage));
        startIndex = startIndex == 0 ? 1 : startIndex;
        int endIndex = _nowPage;

        for (int tem = startIndex ; tem < endIndex; tem=tem+1)
        {
            string css = "";
            if (tem == _nowPage)
            {
                css = "style=\"background-color:#00acd6;color:#FFFFFF;\" " ;
            }
            preBtnstr ~= "<li class=\"page-item\" ><a class=\"page-link\" " ~ css ~ " href=\" " ~ (tem != _nowPage ? pageReplace(to!string(tem)) : "javascript:;;") ~ "\"  > " ~ to!string(tem) ~ "</a></li>";
        }

        return preBtnstr;
    }

    //当前页面之后的按钮块
    private string nextPageBtn(int midpage = 1)
    {
        string nextBtnstr = "";
        int startIndex = _nowPage;
        int endIndex = (_blockNum - _nowPage > midpage ? _blockNum : (startIndex+midpage-1));
        endIndex = ( _totalPageNum-_nowPage < midpage || _nowPage == _totalPageNum ? _totalPageNum : endIndex );
        endIndex = endIndex > _totalPageNum ? _totalPageNum : endIndex;

        for (int tem = startIndex; tem <= endIndex; tem=tem+1)
        {
            string css = "";
            if (tem == _nowPage)
            {
                css = "style=\"background-color:#00acd6;color:#FFFFFF;\"" ;
            }
            nextBtnstr ~= "<li class=\"page-item\" ><a class=\"page-link\" " ~ css ~ " href=\" " ~ (tem != _nowPage ? pageReplace(to!string(tem)) : "javascript:;;") ~ "\" > " ~ to!string(tem) ~ "</a></li>";
        }
        return nextBtnstr;
    }

    private :
        int _blockNum;
        int _nowPage;
        int _totalPageNum;      
        string _linkUrl; 
     
}