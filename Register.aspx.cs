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
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfRole.Value = "Student";

                GridStudent();
                GridCompany();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clearStudent()
        {
            regFullName.Text = "";
            regRollNo.Text = "";
            regEmail.Text = "";
            regMobile.Text = "";
            regUsername.Text = "";
            regPassword.Text = "";
            regConfirmPassword.Text = "";
        }

        void clearCompany()
        {
            compName.Text = "";
            compHRName.Text = "";
            compEmail.Text = "";
            compMobile.Text = "";
            compUsername.Text = "";
            compPassword.Text = "";
            compConfirmPassword.Text = "";
        }

        void GridStudent()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        void GridCompany()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        // Student Registration Handler
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string role = hfRole.Value;

            if (role == "")
            {
                role = "Student";
            }

            if (role == "Student")
            {
                getcon();
                cmd = new SqlCommand("insert into register_auth (regFullname,regRollNo,regEmail,regmobile,regUsername,regPassword,regConfirmPassword,regRole) values('" + regFullName.Text + "','" + regRollNo.Text + "','" + regEmail.Text + "','" + regMobile.Text + "','" + regUsername.Text + "','" + regPassword.Text + "','" + regConfirmPassword.Text + "','" + role + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                clearStudent();
                GridStudent();
            }
        }

        // Company Registration Handler
        protected void btnSubmitCompany_Click(object sender, EventArgs e)
        {
            string role = hfRole.Value;

            if (role == "")
            {
                role = "Company";
            }

            if (role == "Company")
            {
                getcon();
                cmd = new SqlCommand("insert into register_auth_company (compName,compHRName,compEmail,compMobile,compUsername,compPassword,compConfirmPassword,regRole) values('" + compName.Text + "','" + compHRName.Text + "','" + compEmail.Text + "','" + compMobile.Text + "','" + compUsername.Text + "','" + compPassword.Text + "','" + compConfirmPassword.Text + "','" + role + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                clearCompany();
                GridCompany();
            }
        }

        protected void hfRole_ValueChanged(object sender, EventArgs e)
        {
        }
    }
}