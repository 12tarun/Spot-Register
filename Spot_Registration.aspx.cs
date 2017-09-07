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
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if(IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from registration_info where Username ='"+username.Text+"'";
            SqlCommand com = new SqlCommand(checkuser,conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if(temp == 1)
            {
                Response.Write("username already exists.");
            }
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into registration_info(Username,Email,Password,Country) values (@uname,@email,@password,@country)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@uname",username.Text);
            com.Parameters.AddWithValue("@email", email.Text);
            com.Parameters.AddWithValue("@password", password.Text);
            com.Parameters.AddWithValue("@country", country.SelectedItem.ToString());
            com.ExecuteNonQuery();
            Response.Redirect("Manager.aspx");
            Response.Write("Registration is successful.");
            conn.Close();
        }
        catch(Exception ex)
        {
            Response.Write("Error:"+ex.ToString());
        }
    }
}