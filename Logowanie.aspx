<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="DaneDynamiczne1.Formularz_sieci_Web12" %>

<script runat="server">

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        DetailsView1.Visible = true;
        DetailsView1.Attributes.Add("autocomplete", "off");
        RequiredFieldValidator1.Enabled = false;
        RequiredFieldValidator2.Enabled = false;

    }

    protected void Odswiez(object sender, EventArgs e)
    {

        RequiredFieldValidator1.Enabled = true;
        RequiredFieldValidator2.Enabled = true;



        //System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();

        //conn.ConnectionString = ConfigurationManager.ConnectionStrings[@"ConnectionString"].ConnectionString;
        //conn.Open();
        //try
        //{
        //    System.Data.SqlClient.SqlCommand objSqlCommand = new System.Data.SqlClient.SqlCommand();
        //    objSqlCommand.Connection = conn;
        //    objSqlCommand.CommandType = System.Data.CommandType.Text;

        //    objSqlCommand.CommandText = "SELECT login  FROM Uzytkownik where Login = @login ";

        //    objSqlCommand.Parameters.AddWithValue("@login",['login']);

        //    object result = objSqlCommand.ExecuteScalar();
        //    if () { TextBox1.Text = "Login jest zajenty prosze wybrać inny :( "; } else { TextBox1.Text = "Ten login jest wolny :)"; }

        //}
        //catch (Exception ex)
        //{

        //    TextBox1.Text = " Wystąpił bląd ";

        //}
        //finally { conn.Close(); }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();

        conn.ConnectionString = ConfigurationManager.ConnectionStrings[@"ConnectionString"].ConnectionString;
        conn.Open();
        System.Data.SqlClient.SqlCommand objSqlCommand = new System.Data.SqlClient.SqlCommand();
        objSqlCommand.Connection = conn;
        System.Data.SqlClient.SqlCommand objSqlCommand1 = new System.Data.SqlClient.SqlCommand();
        objSqlCommand1.Connection = conn;
        objSqlCommand.CommandType = System.Data.CommandType.Text;
        objSqlCommand1.CommandType = System.Data.CommandType.Text;
        objSqlCommand.CommandText = "SELECT login  FROM Uzytkownik where Login =  @login ";
        objSqlCommand1.CommandText = "SELECT haslo FROM Uzytkownik where Haslo =  @haslo ";
        objSqlCommand.Parameters.AddWithValue("@login ", TextBox1.Text);
        objSqlCommand1.Parameters.AddWithValue("@haslo ", TextBox2.Text);
        object result = objSqlCommand.ExecuteScalar();
        object result1 = objSqlCommand1.ExecuteScalar();

        // if (TextBox1.Text == result.(null) || TextBox2.Text == result1.(null))
        //if (TextBox1.Text != result.ToString() || TextBox2.Text != result1.ToString())
        if( (objSqlCommand.ExecuteScalar() == null) || (objSqlCommand1.ExecuteScalar() == null) )
        {
            // TextBox1.Text = "Bledne dane logowania ";
            // Server.Transfer("~/Logowanie.aspx", true);//przekierowanie na strone       
            string script = "alert(\"Wprowadz poprawne dane, po wcześniejszym zarejestrowaniu\");"; //dziala - skrypt messageBox
            ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script, true);


            //string message = "Wprowadz poprawne dane, po wcześniejszym zarejestrowaniu";
            //MessageBoxResult result = MessageBox.Show(message);


            //  if (result != null && result1 != null )//&& result.ToString() == TextBox2.Text)

            //   {


            //    //Session.Add("zmienna1", TextBox1.Text);// zmienn globaln przekazywana na stone sala
            //    //Server.Transfer("Sala.aspx", true);
            //    }
            //else TextBox1.Text = " Niepoprawne dane, spróbuj ponownie ";
        }

        else if (TextBox1.Text == result.ToString() && TextBox2.Text == result1.ToString())
        {
            Session.Add("login", TextBox1.Text); //login przekazany na str zamowienia 
            Server.Transfer("~/Zamowienia/Zamowienia.aspx", true);//przekierowanie na strone


        }



        conn.Close();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">Stona logowania.</p>
                  <asp:Image ID="Image1" runat="server" Height="232px" Width="754px" ImageUrl="~/Grafika/Tytulowa.png" />

        </p>
    <div>
      
        <br />
        <table  align="center" style="width: 354px">
                     <tr >
                <td style="height: 22px; width: 317px">
                    <asp:Label ID="Label2" runat="server" Text="Podaj login:" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" Wprowadź login" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
               </td>
                    </tr>
                     <tr>  
                <td style="height: 22px; width: 317px">
                    <asp:Label ID="Label1" runat="server" Text="Podaj hasło" Font-Size="Medium"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" Wprowadź hasło" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </td>
                    </tr>
                     <tr>  
                <td style="height: 26px; width: 317px;" align="center"  >
                    <br>
                    <asp:Button ID="Button2" runat="server" Text="Zarejestruj" OnClick="Button2_Click" CausesValidation="False" ValidateRequestMode="Disabled" />

                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Zaloguj" Width="106px" />
                </td>
                    </tr>
                           
                </table>
        <br />
      
        <asp:DetailsView ID="DetailsView1" runat="server" AutoCompleteType="Disabled" EmptyDataText=" "  align="center" CausesValidation="false"
            AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource" Height="126px" Visible="False" Width="387px" CellPadding="4" DefaultMode="Insert" ForeColor="#333333" GridLines="None" EnableModelValidation="False" ValidateRequestMode="Disabled" ViewStateMode="Disabled" OnItemInserted="Odswiez">
   
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#E0E4E4" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="Imie" SortExpression="Imie">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Imie") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Imie") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="TextBox3" ErrorMessage="Proszę podać imię"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                        ControlToValidate="TextBox3" ErrorMessage="Prosze wprowadzić litery"
                                                        ValidationExpression="[a-zA-ZąćęłńóśźżĄĘĆŁŃÓŚŹŻ]*"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Imie") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nazwisko" SortExpression="Nazwisko">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Nazwisko") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Nazwisko") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="TextBox4" ErrorMessage="Proszę podać nazwisko"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                        ControlToValidate="TextBox4" ErrorMessage="Prosze wprowadzić litery"
                                                        ValidationExpression="[a-zA-ZąćęłńóśźżĄĘĆŁŃÓŚŹŻ]*"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nazwisko") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                                                        ControlToValidate="TextBox5" ErrorMessage="Proszę wprowadzić adres poczty"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telelefon" SortExpression="Telelefon">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Telelefon") %>'></asp:TextBox>
                     
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Telelefon") %>'></asp:TextBox>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                                                        ControlToValidate="TextBox2" ErrorMessage="Proszę wprowadzić cyfry w jednym ciągu"
                                                        ValidationExpression="\w+[0-9]"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Telelefon") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Miasto" SortExpression="Miasto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Miasto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Miasto") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="TextBox1" ErrorMessage="Proszę podać miasto"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Prosze wprowadzić litery"
                        ValidationExpression="[a-zA-ZąćęłńóśźżĄĘĆŁŃÓŚŹŻ]*"></asp:RegularExpressionValidator>
                    
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Miasto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ulica" SortExpression="Ulica">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Ulica") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Ulica") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server"  ControlToValidate="TextBox9" ErrorMessage="Proszę podać ulicę"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                        ControlToValidate="TextBox9" ErrorMessage="Prosze wprowadzić litery"
                                                        ValidationExpression="[a-zA-ZąćęłńóśźżĄĘĆŁŃÓŚŹŻ]*"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Ulica") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nr" SortExpression="Nr">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Nr") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Nr") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                                        ControlToValidate="TextBox10" ErrorMessage="Proszę wprowadzić cyfry"
                                                        ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Nr") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Login" SortExpression="Login">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Login") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Login") %>'></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ControlToValidate="TextBox6" ErrorMessage="Proszę podać login"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Login") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Haslo" SortExpression="Haslo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Haslo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="Password" Text='<%# Bind("Haslo") %>'></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="TextBox7" ErrorMessage="Proszę podać hasło"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Haslo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Potwierdź hasło" SortExpression="PotwierdzHaslo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("PotwierdzHaslo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" Text='<%# Bind("PotwierdzHaslo") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="TextBox8" ErrorMessage="Proszę potwierdzić hasło"></asp:RequiredFieldValidator>
                   <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBox8" ControlToCompare="TextBox7" runat="server" ErrorMessage="Prosze powtórzyć hasło"></asp:CompareValidator>
                        </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("PotwierdzHaslo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        
        </asp:DetailsView>


        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Uzytkownik] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Uzytkownik] ([Imie], [Email], [Nazwisko], [Telelefon], [Miasto], [Nr], [Ulica], [Login], [Haslo], [PotwierdzHaslo]) VALUES (@Imie, @Email, @Nazwisko, @Telelefon, @Miasto, @Nr, @Ulica, @Login, @Haslo, @PotwierdzHaslo)"
            SelectCommand="SELECT [Id], [Imie], [Email], [Nazwisko], [Telelefon], [Miasto], [Nr], [Ulica], [Login], [Haslo], [PotwierdzHaslo] FROM [Uzytkownik]"
            UpdateCommand="UPDATE [Uzytkownik] SET [Imie] = @Imie, [Email] = @Email, [Nazwisko] = @Nazwisko, [Telelefon] = @Telelefon, [Miasto] = @Miasto, [Nr] = @Nr, [Ulica] = @Ulica, [Login] = @Login, [Haslo] = @Haslo, [PotwierdzHaslo] = @PotwierdzHaslo WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Telelefon" Type="Int32" />
                <asp:Parameter Name="Miasto" Type="String" />
                <asp:Parameter Name="Nr" Type="Int32" />
                <asp:Parameter Name="Ulica" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Haslo" Type="String" />
                <asp:Parameter Name="PotwierdzHaslo" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Telelefon" Type="Int32" />
                <asp:Parameter Name="Miasto" Type="String" />
                <asp:Parameter Name="Nr" Type="Int32" />
                <asp:Parameter Name="Ulica" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Haslo" Type="String" />
                <asp:Parameter Name="PotwierdzHaslo" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br>
      
       <p aria-disabled="False"><asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Startowa.aspx" class="btn btn-primary btn-lg" OnClick="LinkButton2_Click">Na stronę startową &raquo;</asp:LinkButton> </p>
        </div> 
    </div>
</asp:Content>
