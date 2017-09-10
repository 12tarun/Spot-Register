using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from registration_info where Username ='" + username.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                string passwordQuery = "select password from registration_info where Username ='" + username.Text + "'";
                SqlCommand passcomm = new SqlCommand(passwordQuery, conn);
                string pass = passcomm.ExecuteScalar().ToString().Replace(" ","");
                if (pass == password.Text)
                {
                    Session["New"] = username.Text;
                    Response.Write("password is correct");
                    Response.Redirect("user.aspx");
                }
                else
                {
                    Response.Write("password is incorrect");
                }
            }
            else
            {
                Response.Write("username is incorrect");
            }
            conn.Close();
        }
}