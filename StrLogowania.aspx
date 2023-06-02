<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StrLogowania.aspx.cs" Inherits="DaneDynamiczne1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 28px;
        }
        .auto-style4 {
            margin-left: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="jumbotron">
        <h1>ASP.NET</h1>
        <asp:Label ID="Label1" runat="server" Text="Witamy na stronie logowania " Font-Bold="True" Font-Size="Larger"></asp:Label>
        
    </div>


        <br />
       <div>      
        <asp:Image ID="Image1" runat="server" Height="147px" Width="290px" ImageUrl="~/Grafika/Logowania.png" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             </div>
        <div>
        <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="138px" Width="271px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0" style="height:138px;width:257px;">
                                <tr>
                                    <td align="center" colspan="2" style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">Zaloguj</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nazwa użytkownika:</asp:Label>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" CssClass="auto-style1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Pole Nazwa użytkownika jest wymagane." ToolTip="Pole Nazwa użytkownika jest wymagane." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Hasło:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Hasło jest wymagane." ToolTip="Hasło jest wymagane." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Zapamiętaj moje dane." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Zaloguj" ValidationGroup="Login1" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="ZarejstrujButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Zarejstruj" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Zarejstruj" ValidationGroup="Zarejestruj" OnClick="Button1_Click1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceLogowanie" ForeColor="#333333" GridLines="None" Height="50px" Visible="False" Width="125px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telelefon" HeaderText="Telelefon" SortExpression="Telelefon" />
                <asp:BoundField DataField="Miasto" HeaderText="Miasto" SortExpression="Miasto" />
                <asp:BoundField DataField="Ulica" HeaderText="Ulica" SortExpression="Ulica" />
                <asp:BoundField DataField="Nr" HeaderText="Nr" SortExpression="Nr" />
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                <asp:BoundField DataField="Haslo" HeaderText="Haslo" SortExpression="Haslo" />
                <asp:BoundField DataField="PotwierdzHaslo" HeaderText="PotwierdzHaslo" SortExpression="PotwierdzHaslo" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourceLogowanie" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Uzytkownik] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Uzytkownik] ([Imie], [Nazwisko], [Email], [Telelefon], [Miasto], [Ulica], [Nr], [PotwierdzHaslo], [Haslo], [Login]) VALUES (@Imie, @Nazwisko, @Email, @Telelefon, @Miasto, @Ulica, @Nr, @PotwierdzHaslo, @Haslo, @Login)" SelectCommand="SELECT [Imie], [Nazwisko], [Email], [Telelefon], [Miasto], [Ulica], [Nr], [PotwierdzHaslo], [Haslo], [Login], [Id] FROM [Uzytkownik]" UpdateCommand="UPDATE [Uzytkownik] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Telelefon] = @Telelefon, [Miasto] = @Miasto, [Ulica] = @Ulica, [Nr] = @Nr, [PotwierdzHaslo] = @PotwierdzHaslo, [Haslo] = @Haslo, [Login] = @Login WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telelefon" Type="Int32" />
                <asp:Parameter Name="Miasto" Type="String" />
                <asp:Parameter Name="Ulica" Type="String" />
                <asp:Parameter Name="Nr" Type="Int32" />
                <asp:Parameter Name="PotwierdzHaslo" Type="String" />
                <asp:Parameter Name="Haslo" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telelefon" Type="Int32" />
                <asp:Parameter Name="Miasto" Type="String" />
                <asp:Parameter Name="Ulica" Type="String" />
                <asp:Parameter Name="Nr" Type="Int32" />
                <asp:Parameter Name="PotwierdzHaslo" Type="String" />
                <asp:Parameter Name="Haslo" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
       <p><asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Startowa.aspx" class="btn btn-primary btn-lg">Na stronę domową &raquo;</asp:LinkButton> </p>
        </div> 
    </form>
</body>
</html>
