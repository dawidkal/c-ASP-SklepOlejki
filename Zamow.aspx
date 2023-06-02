<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Zamow.aspx.cs" Inherits="Zamow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 189px;         
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
       


              <div class="jumbotron">
        <h2>ASP.NET</h2>
        <p class="lead"><asp:TextBox ID="TextBox1" runat="server" Width="138px" ReadOnly="True"></asp:TextBox>  Strona zamówień. Witaj
            <asp:Label ID="Label1" runat="server"></asp:Label> 
            </p>
           
            <asp:Image ID="Image1" runat="server" Height="126px" Width="558px" ImageUrl="~/Grafika/Tytulowa.png" />
           
       </div>
    <table>
      <tr>
      <td class="auto-style1"> </td> 
          <td class="auto-style1"><asp:Label ID="Label2" runat="server" Text="Olejki:"></asp:Label><asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NazwaOlejku" DataValueField="Cena" Height="23px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="222px"></asp:ListBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="ListBox1" ErrorMessage="Proszę wybrać" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT  NazwaOlejku,Cena FROM Olejki inner join OlejkiCeny on Olejki.IDOlejku = OlejkiCeny.IDOlejku order by NazwaOlejku ASC" ></asp:SqlDataSource>
      </td> 

          <td class="auto-style1">Ilość sztuk:
              <asp:TextBox ID="TextBox2" runat="server" Width="59px"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                        ControlToValidate="TextBox2" ErrorMessage="Proszę wprowadzić cyfry"
                                                        ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
          </td>
          <td class="auto-style1">       </td>
          <td class="auto-style1">
              <asp:Label ID="Label3" runat="server" Text="Zamówienia"></asp:Label> <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="IdZamowienia" AutoGenerateEditButton="True">
                  <Columns>
                      <asp:BoundField DataField="IdZamowienia" HeaderText="Id zamowienia" ReadOnly="True" SortExpression="IdZamowienia" />
                      <asp:BoundField DataField="NazwaOlejku" HeaderText="Nazwa olejku" SortExpression="NazwaOlejku" />
                      <asp:BoundField DataField="Ilosc" HeaderText="Ilość" SortExpression="Ilosc" />
                      <asp:BoundField DataField="DataZamowienia" HeaderText="Data zamówienia" SortExpression="DataZamowienia" />
                      <asp:TemplateField HeaderText="Login" SortExpression="Login">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Login") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("Login") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top 10 * FROM [Zamowienie] where Login=@login order by DataZamowienia desc " DeleteCommand="DELETE FROM [Zamowienie] WHERE [IdZamowienia] = @IdZamowienia" InsertCommand="INSERT INTO [Zamowienie] ([IdZamowienia], [Ilosc], [NazwaOlejku], [DataZamowienia], [Login]) VALUES (@IdZamowienia, @Ilosc, @NazwaOlejku, @DataZamowienia, @Login)" UpdateCommand="UPDATE [Zamowienie] SET [Ilosc] = @Ilosc, [NazwaOlejku] = @NazwaOlejku, [DataZamowienia] = @DataZamowienia, [Login] = @Login WHERE [IdZamowienia] = @IdZamowienia">
                      <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="Login" PropertyName="Text" />
                    </SelectParameters>
                  
                  <DeleteParameters>
                      <asp:Parameter Name="IdZamowienia" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="IdZamowienia" Type="Int32" />
                      <asp:Parameter Name="Ilosc" Type="Int32" />
                      <asp:Parameter Name="NazwaOlejku" Type="String" />
                      <asp:Parameter DbType="Date" Name="DataZamowienia" />
                      <asp:Parameter Name="Login" Type="String" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="Ilosc" Type="Int32" />
                      <asp:Parameter Name="NazwaOlejku" Type="String" />
                      <asp:Parameter DbType="Date" Name="DataZamowienia" />
                      <asp:Parameter Name="Login" Type="String" />
                      <asp:Parameter Name="IdZamowienia" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
          </td>
   </tr>
   <tr>
      <td> &nbsp;</td> <td>     
       
       </td> <td> <asp:Button ID="Button2" runat="server" Text="Zamów" Width="86px" OnClick="Button2_Click" />
           <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
       </td>
   </tr>

</table>
    <p> </p>
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Startowa.aspx" class="btn btn-primary btn-lg">Na stronę startową &raquo;</asp:LinkButton>
    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Zamowienia/Zamowienia.aspx" class="btn btn-primary btn-lg">Zamówienia  »</asp:LinkButton> 




        </div>
    </form>
</body>
</html>
