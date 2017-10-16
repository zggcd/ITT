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
                _Weather.Icon = ds.Tables["icon"].Rows[0][0].ToString();
                _Weather.Current = ds.Tables["temp_c"].Rows[0][0].ToString();
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

<%Weather _Weather = GetWeather("Hà Nội", "http://www.google.com/ig/api?weather=Ha Noi&hl=vi"); %>

<p class="weather">
    <img src="/Content/images/weather.png" alt="" />
    <span><%=_Weather.Current %>&deg;C</span> <span>HN, VIETNAM</span>
</p>
<p class="clear"></p>
            