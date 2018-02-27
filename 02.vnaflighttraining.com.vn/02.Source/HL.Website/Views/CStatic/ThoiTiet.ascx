<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    public string GetHtml(string url)
    {
        string sHtml = string.Empty;

        string sKey = "GetHtml_" + HL.Lib.Global.Security.MD5(url);
        object _obj = HL.Core.Web.Cache.GetValue(sKey);
        if (_obj != null)
            return _obj.ToString();

        try
        {
            System.Net.WebClient a = new System.Net.WebClient();
            byte[] b = a.DownloadData(url);

            sHtml = System.Text.Encoding.UTF8.GetString(b);
            HL.Core.Web.Cache.SetValue(sKey, sHtml, 30);
        }
        catch { }

        return sHtml;
    }

    public System.Data.DataSet ConvertXMLToDataSet(string xmlData)
    {
        System.IO.StringReader stream = null;
        System.Xml.XmlTextReader reader = null;
        try
        {
            System.Data.DataSet xmlDS = new System.Data.DataSet();
            stream = new System.IO.StringReader(xmlData);
            reader = new System.Xml.XmlTextReader(stream);
            xmlDS.ReadXml(reader);
            return xmlDS;
        }
        catch
        {
            return null;
        }
        finally
        {
            if (reader != null)
                reader.Close();
        }
    }

    public Weather GetWeather(string name, string url)
    {
        Weather _Weather = new Weather();

        string sHtml = GetHtml(url);
        if (sHtml != string.Empty)
        {
            System.Data.DataSet ds = ConvertXMLToDataSet(sHtml);
            if (ds != null)
            {
                _Weather.Name = name;
                _Weather.Icon = ds.Tables["weather"].Rows[0][2].ToString();
                _Weather.Current = ds.Tables["temperature"].Rows[0][0].ToString();
            }
        }

        return _Weather;
    }

    public class Weather
    {
        public string Name = string.Empty;
        public string Icon = string.Empty;
        public string Current = string.Empty;
    }

</script>

<%--<%Weather _Weather = GetWeather("Hà Nội", "http://www.google.com/ig/api?weather=Ha Noi&hl=vi"); %>--%>
<%Weather _Weather = GetWeather("Hà Nội", "http://api.openweathermap.org/data/2.5/weather?q=Hanoi,vn&appid=0e34aed4c07b867d4549ae445e654d9b&units=metric&lang=vi&mode=xml");
    Weather _Weather1 = GetWeather("Hồ Chí Minh", "http://api.openweathermap.org/data/2.5/weather?q=Thanh pho Ho Chi Minh,vn&appid=0e34aed4c07b867d4549ae445e654d9b&units=metric&lang=vi&mode=xml");%>

<div class="portlet-boundary portlet-boundary_6110_WAR_ui61portlet_ portlet-static portlet-static-end 6110-portlet ">
    <div class="portlet-body">
        <section id="portlet_6110_WAR_ui61portlet" class="portlet">
            <header class="portlet-topper">
                <h1 class="portlet-title"><span>
                    <img class="icon" id="ecli" src="/Content/skins/portlet/icon.png" alt="Thời tiết" title="Thời tiết" />
                </span><span class="portlet-title-text">Thời tiết</span> </h1>
                <menu class="portlet-topper-toolbar" id="portlet-topper-toolbar_6110_WAR_ui61portlet" type="toolbar"></menu>
            </header>
            <div class="portlet-content">
                <div class=" portlet-content-container" style="">
                    <div class="portlet-body">
                        <div class="liferay-faces-bridge-body">
                            <div id="A8753:frm:pnWeather" class="ui-panel ui-widget ui-widget-content ui-corner-all">
                                <div id="A8753:frm:pnWeather_content" class="ui-panel-content ui-widget-content">
                                    <div class="listLocal">
                                        <ul>
                                            <li><span class="txtLocal">Hồ Chí Minh</span><span class="txtoC"><%=_Weather1.Current %></span><img src="http://openweathermap.org/img/w/<%=_Weather1.Icon %>.png" />
                                            </li>
                                            <li><span class="txtLocal">Hà Nội </span><span class="txtoC"><%=_Weather.Current %></span><img src="http://openweathermap.org/img/w/<%=_Weather.Icon %>.png" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
