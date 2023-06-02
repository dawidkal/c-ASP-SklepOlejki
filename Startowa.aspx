<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Startowa.aspx.cs" Inherits="DaneDynamiczne1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>ASP.NET</h2>
        <p class="lead">Witamy w sklepie z olejkami.</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="232px" Width="754px" ImageUrl="~/Grafika/Tytulowa.png" />
&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p><asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Logowanie.aspx" class="btn btn-primary btn-lg">Rrejstracja/logowanie &raquo;</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Testowa.aspx" class="btn btn-primary btn-lg">Str. Testowa &raquo;</asp:LinkButton>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Szczypta informacji</h2>
            <p>   <span style="font-size: medium">            
                Olejki zapachowe&nbsp;i&nbsp;eteryczne mogą być stosowane&nbsp;do&nbsp;kominka&nbsp;zapachowego, odświeżacza i nawilżacza powietrza. Olejki eteryczne oraz niektóre zapachowe (z atestami)&nbsp;można w rozcieńczeniu stosować do masażu,&nbsp;kąpieli, inhalacji oraz domowego wyrobu kosmetyków. Jakie są różnice między&nbsp;olejkami eterycznymi a&nbsp;zapachowymi można przeczytać artykule</a>.</span></p>
            <p>
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Informacje.aspx" class="btn btn-primary btn-lg">Dowiedz się więcej&raquo;</asp:LinkButton>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Galeria</h2>
            <p><span style="font-size: medium"> </span>
                Zapraszamy do obejrzenia galerii.
            </p>
            <p>
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Galeria.aspx" class="btn btn-primary btn-lg">Dowiedz się więcej&raquo;</asp:LinkButton>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Jak składać zamówienia</h2>
            <p><span style="font-size: medium"> </span>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Zasady.aspx" class="btn btn-primary btn-lg">Dowiedz się więcej&raquo;</asp:LinkButton>
            </p>
        </div>
    </div>

</asp:Content>
