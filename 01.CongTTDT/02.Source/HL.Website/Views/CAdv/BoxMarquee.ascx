<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;
    string title = ViewBag.Title as string;
    int i = 0;
%>

<style type="text/css">
    fieldset {
        display: block;
        margin-left: 2px;
        margin-right: 2px;
        /*padding: 0.35em 0.75em 0.625em;*/
        border: 1px solid #000;
    }

        fieldset legend {
            width: auto;
            border: none;
            padding: 5px 0;
        }

    .nav-doitac {
        list-style: none;
    }

        .nav-doitac li {
            display: inline;
            padding: 8px;
        }

    #demo {
        overflow: hidden;
    }

        #demo img {
            border: 0px solid #F2F2F2;
        }

    #indemo {
        float: left;
        width: 10000%;
    }

    #demo1, #demo2 {
        float: left;
    }

        #demo1 img, #demo2 img {
            margin-left: 5px;
        }
</style>

<div class="mt-15">
    <div class="row-fluid titleContainer">
        <span><%=title %></span>
    </div>
    <div class="row-fluid contentNews">
        <div class="sameCate">
            <%if (c > 0)
                {%>
            <div id="demo">
                <div id="indemo">
                    <ul id="demo1" class="nav-doitac">
                        <% for (i = 0; listItem != null && i < listItem.Count; i++)
                            { %>
                        <li>
                            <a href="<%=listItem[i].URL %>" title="">
                                <img src="<%=listItem[i].File.Replace("~/","/") %>" alt="" /></a>
                        </li>
                        <% } %>
                    </ul>
                    <ul id="demo2" class="nav-doitac"></ul>
                </div>
            </div>
            <%} %>
        </div>
    </div>
</div>

<script>
    var speed = 40;
    var tab = document.getElementById("demo");
    var tab1 = document.getElementById("demo1");
    var tab2 = document.getElementById("demo2");
    tab2.innerHTML = tab1.innerHTML;
    function Marquee() {
        if (tab2.offsetWidth - tab.scrollLeft <= 0) {
            tab.scrollLeft -= tab1.offsetWidth;
        } else {
            tab.scrollLeft++;
        }
    }
    var MyMar = setInterval(Marquee, speed);
    tab.onmouseover = function () { clearInterval(MyMar) };
    tab.onmouseout = function () { MyMar = setInterval(Marquee, speed) };
</script>
<!--End Block 5: Doi tac-->
