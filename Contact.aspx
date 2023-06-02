<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="DaneDynamiczne1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Zapraszamy do kontaktu</h3>
    <address>
        Jakieś informacje...<br />
        Poznań 98052-6399<br />
        <abbr title="Telofon">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Wsparcie:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
