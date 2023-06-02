using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Zamow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = (string)Session["login"];
        DateTime thisDay = DateTime.Now;
        TextBox1.Text = thisDay.ToString();
        GridView1.DataBind();

        //SqlConnection conn = new SqlConnection();
        //conn.ConnectionString = ConfigurationManager.ConnectionStrings[@"ConnectionString"].ConnectionString;


        //SqlCommand objSqlCommand = new SqlCommand();

        //objSqlCommand.Connection = conn;

        //objSqlCommand.CommandType = CommandType.Text;

        //objSqlCommand.CommandText = "SELECT TOP 1  IdZamowienia FROM Zamowienie order by IdZamowienia DESC ";



        //conn.Open();
        // // int id = 0;
        // // id = objSqlCommand.ExecuteScalar();
        //// int value = int.Parse(TextBox3.Text);
       // this.TextBox3.Text = objSqlCommand.ExecuteScalar().ToString();
        // int value = int.Parse(TextBox3.Text)+1;
      //  conn.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime thisDay = DateTime.Now;
        TextBox1.Text = thisDay.ToString();
        //TextBox1.Text = "Tekst";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();

        conn.ConnectionString = ConfigurationManager.ConnectionStrings[@"ConnectionString"].ConnectionString;

        conn.Open();

        try
        {


            if (ListBox1.SelectedItem.Selected)
            {

                System.Data.SqlClient.SqlCommand objSqlCommand = new System.Data.SqlClient.SqlCommand();

                objSqlCommand.Connection = conn;

                objSqlCommand.CommandType = System.Data.CommandType.Text;

                SqlTransaction tran = conn.BeginTransaction();

                objSqlCommand.Transaction = tran;

                // id =( objSqlCommand1.CommandText = "SELECT TOP 1 IdZamowienia FROM Zamowienie order by IdZamowienia DESC")+1;
                objSqlCommand.CommandText = "INSERT INTO Zamowienie ( NazwaOlejku, DataZamowienia,Login,Ilosc) VALUES (@NazwaOlejku,@DataZamowienia,@Login,@Ilosc)";
                objSqlCommand.Parameters.AddWithValue("@NazwaOlejku", this.ListBox1.SelectedItem.Text);
                objSqlCommand.Parameters.AddWithValue("@DataZamowienia", this.TextBox1.Text);
                objSqlCommand.Parameters.AddWithValue("@Ilosc", this.TextBox2.Text);
                objSqlCommand.Parameters.AddWithValue("Login", this.Label1.Text);
                //  objSqlCommand.Parameters.AddWithValue("@IdZamowienia",this.TextBox3.Text );

                objSqlCommand.ExecuteNonQuery();

                tran.Commit();

                //TextBox3.Text = id.ToString();
            }

        }
        catch (Exception ex)
        {
            Label4.Visible = true;
            Label4.Text = " Wystapił błąd ";
        }
        finally
        {
            conn.Close();
            GridView1.DataBind();
            Label4.Visible = true;
            Label4.Text = "Zamówiono: " + ListBox1.SelectedItem.Text + " " + TextBox2.Text + " szt.";
        }

        //TextBox10.Visible = true;
        // TextBox2.Text = "Rezerwacja na seans : " + DropDownList1.SelectedItem.Text + ", dnia " + DropDownList3.SelectedItem.Text + " na godzinę " + DropDownList2.SelectedItem.Text + ", sala nr: " + DropDownList4.SelectedItem.Text + ", liczba wybranych miejsc " + ileZaz;
        //czyscimy
        // foreach (ListItem li in CheckBoxList1.Items)
        //{
        // li.Selected = false;
    }     

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
