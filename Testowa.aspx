<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testowa.aspx.cs" Inherits="DaneDynamiczne1.Formularz_sieci_Web11" %>

<script runat="server">


    protected void Button1_Click(object sender, EventArgs e)
    {
        //TextBox1.Text = "Dupa";
        DateTime thisDay = DateTime.Today;
        TextBox1.Text= thisDay.ToString();

    }

  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">Witamy w sklepie z olejkami.</p>
        
          <asp:Image ID="Image1" runat="server" Height="232px" Width="754px" ImageUrl="~/Grafika/Tytulowa.png" />  
          <p><asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Startowa.aspx" class="btn btn-primary btn-lg">Startowa &raquo;</asp:LinkButton>  
            
              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" Width="125px" AutoGenerateEditButton="True" DefaultMode="Edit" AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
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
            </asp:DetailsView>
              
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Uzytkownik]" DeleteCommand="DELETE FROM [Uzytkownik] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Uzytkownik] ([Imie], [Nazwisko], [Email], [Telelefon], [Miasto], [Ulica], [Nr], [Login], [Haslo], [PotwierdzHaslo]) VALUES (@Imie, @Nazwisko, @Email, @Telelefon, @Miasto, @Ulica, @Nr, @Login, @Haslo, @PotwierdzHaslo)" UpdateCommand="UPDATE [Uzytkownik] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Telelefon] = @Telelefon, [Miasto] = @Miasto, [Ulica] = @Ulica, [Nr] = @Nr, [Login] = @Login, [Haslo] = @Haslo, [PotwierdzHaslo] = @PotwierdzHaslo WHERE [Id] = @Id">
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
                    <asp:Parameter Name="Login" Type="String" />
                    <asp:Parameter Name="Haslo" Type="String" />
                    <asp:Parameter Name="PotwierdzHaslo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Telelefon" Type="Int32" />
                    <asp:Parameter Name="Miasto" Type="String" />
                    <asp:Parameter Name="Ulica" Type="String" />
                    <asp:Parameter Name="Nr" Type="Int32" />
                    <asp:Parameter Name="Login" Type="String" />
                    <asp:Parameter Name="Haslo" Type="String" />
                    <asp:Parameter Name="PotwierdzHaslo" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                  <Columns>
                      <asp:BoundField DataField="Firma" HeaderText="Firma" SortExpression="Firma" />
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Firma] FROM [Firma]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT TOP 15 NazwaOlejku,Cena FROM Olejki inner join OlejkiCeny on Olejki.IDOlejku = OlejkiCeny.IDOlejku order by NazwaOlejku ASC">
            </asp:SqlDataSource>
        
              <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
              </asp:GridView>
        
       </p>
    </div>



</asp:Content>
