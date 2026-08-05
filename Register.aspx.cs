using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;



namespace RKU_PLACEMENT_PORTAL
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader ad;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            regFullName.Text = "";
            regRollNo.Text = "";
            regEmail.Text = "";
            regMobile.Text = "";
            regUsername.Text = "";
            regPassword.Text = "";
            regConfirmPassword.Text = "";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            getcon();

            if (btnSubmitRegister.Text == "Create Account")
            {
                cmd = new SqlCommand("insert into register_auth (regFullname,regRollNo,regEmail,regmobile,regUsername,regPassword,regConfirmPassword) values('" + regFullName.Text + "','" + regRollNo.Text + "','" + regEmail.Text + "','" + regMobile.Text + "','" + regUsername.Text + "','" + regPassword.Text + "','" + regConfirmPassword.Text + "')", con);
                cmd.ExecuteNonQuery();
                clear();
                Response.Redirect("Login.aspx");
               
            }
        }
    }
}