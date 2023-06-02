<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Zasady.aspx.cs" Inherits="DaneDynamiczne1.Formularz_sieci_Web13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>ASP.NET</h2>
        <p class="lead">Witamy w sklepie z olejkami.</p>
        
            <asp:Image ID="Image1" runat="server" Height="232px" Width="754px" ImageUrl="~/Grafika/Tytulowa.png" />
    <p></p>
       
<p style="text-indent: 2%; " >
      Aby złożyć zamówienie trzeba: <br>
    - Zarejestrować się, wypełniając dane. <br>
    - Gdy już Państwo posiadacie konto, zalogować się i przejść do strony zamówień.
</p>    
</div>   

        <p> <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Startowa.aspx" class="btn btn-primary btn-lg">Na stronę startową &raquo;</asp:LinkButton> </p>

</asp:Content>
