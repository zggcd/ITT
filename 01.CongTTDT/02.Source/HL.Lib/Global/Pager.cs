namespace HL.Lib.Global
{
    public class Pager
    {
        public Pager()
        {
        }

        private int _TotalRecord = -1;
        private int _PageSize = 10;
        private int _PageMax = 10;
        private int _TotalBegin = 0;
        private int _TotalEnd = 0;
        private string _CssClass = string.Empty;
        private string _URL = string.Empty;
        private string _ParamName = "Page";
        private string _ActionName = "";
        private string _BackText = "<span>Trước&lt;&lt;</span>";
        private string _NextText = "<span>Sau&gt;&gt;</span>";
        private string _BackEndText = "<span>Trang đầu</span>";
        private string _NextEndText = "<span>Trang cuối</span>";
        private bool _IsCPLayout = false;
        private bool _DisableMode = false;

        public int TotalRecord
        {
            get { return _TotalRecord; }
            set
            {
                if (value > 0)
                    _TotalRecord = value;
            }
        }

        public int PageSize
        {
            get { return _PageSize; }
            set
            {
                if (value > 0)
                    _PageSize = value;
            }
        }

        private int _PageIndex = 0;
        public int PageIndex
        {
            get
            {
                //int _PageIndex = PageViewState.GetValue(ParamName).ToInt(1) - 1;

                //return (_PageIndex > -1) ? _PageIndex : 0;

                return _PageIndex;
            }
            set { _PageIndex = value; }
        }

        public int PageMax
        {
            get { return _PageMax; }
            set
            {
                if (value > 0)
                    _PageMax = value;
            }
        }

        public int Skip
        {
            get { return PageIndex * PageSize; }
        }

        public int TotalBegin
        {
            get { return _TotalBegin; }
        }

        public int TotalEnd
        {
            get { return _TotalEnd; }
        }

        public int TotalPage
        {
            get
            {
                if (PageSize == 0)
                    return 0;

                return (TotalRecord % PageSize == 0 ? 0 : 1) + (TotalRecord / PageSize);
            }
        }

        public string URL
        {
            get { return _URL; }
            set { _URL = value; }
        }

        public string ParamName
        {
            get { return _ParamName; }
            set { _ParamName = value; }
        }

        public string ActionName
        {
            get { return _ActionName; }
            set { _ActionName = value; }
        }

        public string CssClass
        {
            get { return _CssClass; }
            set { _CssClass = value; }
        }

        public string BackText
        {
            get { return _BackText; }
            set { _BackText = value; }
        }

        public string NextText
        {
            get { return _NextText; }
            set { _NextText = value; }
        }

        public string BackEndText
        {
            get { return _BackEndText; }
            set { _BackEndText = value; }
        }

        public string NextEndText
        {
            get { return _NextEndText; }
            set { _NextEndText = value; }
        }

        public bool IsCPLayout
        {
            get { return _IsCPLayout; }
            set { _IsCPLayout = value; }
        }

        public bool DisableMode
        {
            get { return _DisableMode; }
            set { _DisableMode = value; }
        }

        public string HtmlPage
        {
            get { return _HtmlPage; }
        }

        private string _HtmlPage = string.Empty;

        public void Update()
        {
            int _PageIndex = PageIndex;
            int MinPage = (int)(_PageIndex / _PageMax) * _PageMax;
            int MaxPage = MinPage + _PageMax;

            double MaxPageIndex = (double)_TotalRecord / ((double)_PageSize);
            _TotalBegin = _PageIndex * _PageSize;
            _TotalEnd = _TotalBegin + _PageSize;

            if (MaxPageIndex - _PageIndex < 1)
                _TotalEnd = _TotalRecord;

            string sURL = URL;

            if (sURL.EndsWith("/"))
                sURL = ParamName;
            else
                sURL += "/" + ParamName;

            if (IsCPLayout)
            {
                #region CP

                if (MaxPageIndex > 1)
                {
                    if (MaxPage > _PageMax)
                    {
                        _HtmlPage += "<div class=\"button2-right\"><div class=\"start\"><a href=\"javascript:HLRedirect('" + ActionName + "', " + 1 + ", '" + ParamName + "');\">" + BackEndText + "</a></div></div>";
                        _HtmlPage += "<div class=\"button2-right\"><div class=\"prev\"><a href=\"javascript:HLRedirect('" + ActionName + "', " + MinPage + ", '" + ParamName + "');\">" + BackText + "</a></div></div>";
                    }
                    else
                    {
                        _HtmlPage += "<div class=\"button2-right off\"><div class=\"start\"><span>" + BackEndText + "</span></div></div>";
                        _HtmlPage += "<div class=\"button2-right off\"><div class=\"prev\"><span>" + BackText + "</span></div></div>";
                    }

                    _HtmlPage += "<div class=\"button2-left\"><div class=\"page\">";
                    for (int i = MinPage; i < MaxPage; i++)
                    {
                        if (i != _PageIndex)
                        {
                            if (i < MaxPageIndex)
                                _HtmlPage += "<a href=\"javascript:HLRedirect('" + ActionName + "', " + (i + 1) + ", '" + ParamName + "');\">" + (i + 1) + "</a>";
                        }
                        else
                        {
                            if (i < MaxPageIndex)
                                _HtmlPage += "<span>" + (i + 1) + "</span>";
                        }
                    }
                    _HtmlPage += "</div></div>";

                    if (MaxPage < MaxPageIndex)
                    {
                        _HtmlPage += "<div class=\"button2-left\"><div class=\"next\"><a href=\"javascript:HLRedirect('" + ActionName + "', " + (MaxPage + 1) + ", '" + ParamName + "');\">" + NextText + "</a></div></div>";
                        _HtmlPage += "<div class=\"button2-left\"><div class=\"end\"><a href=\"javascript:HLRedirect('" + ActionName + "', " + (MaxPageIndex > (int)MaxPageIndex ? (int)MaxPageIndex + 1 : MaxPageIndex) + ", '" + ParamName + "');\">" + NextEndText + "</a></div></div>";
                    }
                    else
                    {
                        _HtmlPage += "<div class=\"button2-left off\"><div class=\"next\"><span>" + NextText + "</span></div></div>";
                        _HtmlPage += "<div class=\"button2-left off\"><div class=\"end\"><span>" + NextEndText + "</span></div></div>";
                    }
                }

                #endregion
            }
            else
            {
                #region web

                _HtmlPage = string.Empty;
                if (MaxPageIndex > 1)
                {
                    _HtmlPage += "<div class=\"navigation\"><ul>";
                    if (MaxPage > _PageMax)
                    {
                        _HtmlPage += "<li class=\"\"><a class=\"\" href=\"" + sURL + "/" + 1 + "\">" + BackEndText + "</a></li>";
                        _HtmlPage += "<li class=\"\"><a class=\"\" href=\"" + sURL + "/" + MinPage + "\">" + BackText + "</a></li>";
                    }
                    else if (DisableMode)
                    {
                        _HtmlPage += "<li class=\" disabled " + CssClass + "\"><a class=\"\" href=\"#\">" + BackEndText + "</a></li>";
                        _HtmlPage += "<li class=\" disabled " + CssClass + "\"><a class=\"\" href=\"#\">" + BackText + "</a></li>";
                    }

                    for (int i = MinPage; i < MaxPage; i++)
                    {
                        if (i != _PageIndex)
                        {
                            if (i < MaxPageIndex)
                            {
                                _HtmlPage += "<li class=\"\"><a class=\"\" href=\"" + sURL + "/" + (i + 1) + "\">" + (i + 1) + "</a></li>";
                            }
                        }
                        else
                        {
                            if (i < MaxPageIndex) _HtmlPage += "<li class=\" active\"><a class=\"" + CssClass + "\" href=\"#\">" + (i + 1) + "</a></li>";
                        }
                    }

                    if (MaxPage < MaxPageIndex)
                    {
                        _HtmlPage += "<li class=\"\"><a class=\"\" href=\"" + sURL + "/" + (MaxPage + 1) + "\">" + NextText + "</a></li>";
                        _HtmlPage += "<li class=\"\"><a class=\"\" href=\"" + sURL + "/" + (MaxPageIndex > (int)MaxPageIndex ? (int)MaxPageIndex + 1 : MaxPageIndex) + "\">" + NextEndText + "</a></li>";
                    }
                    else if (DisableMode)
                    {
                        _HtmlPage += "<li class=\" " + CssClass + " disabled\"><a class=\"\" href=\"#\">" + NextText + "</a></li>";
                        _HtmlPage += "<li class=\" " + CssClass + " disabled\"><a class=\"\" href=\"#\">" + NextEndText + "</a></li>";
                    }
                    _HtmlPage += "</ul></div>";
                }

                #endregion
            }
        }
    }
}
