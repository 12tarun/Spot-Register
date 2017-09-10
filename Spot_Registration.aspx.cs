using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Spot_Registration : System.Web.UI.Page
{
    int c = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if(IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from registration_info where Username ='"+username.Text+"'";
            SqlCommand com = new SqlCommand(checkuser,conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString()); //ExecuteScalar has return type object so converting it into string to be able to be displayed then converting to int
            if (temp == 1)
            {
                Response.Write("username already exists.");
                c = 1;
            }
            else
                c = 0;
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (c != 1)
        {
            try
            {
                Guid newGuid = Guid.NewGuid();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into registration_info(Id,Username,Email,Password,Country) values (@Id,@uname,@email,@password,@country)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@Id", newGuid.ToString());
                com.Parameters.AddWithValue("@uname", username.Text);
                com.Parameters.AddWithValue("@email", email.Text);
                com.Parameters.AddWithValue("@password", password.Text);
                com.Parameters.AddWithValue("@country", country.SelectedItem.ToString());
                com.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
                Response.Write("Registration is successful.");
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }
        }
      }
 
    }