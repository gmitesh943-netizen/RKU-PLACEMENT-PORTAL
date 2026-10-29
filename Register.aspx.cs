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

       

        

       

     
       
        // Student Registration 
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string role = hfRole.Value;

            if (role == "")
            {
                role = "Student";
            }

            if (role == "Student")


                if (btnSubmitRegister.Text == "Create Student Account")
                {
                getcon();

                cmd = new SqlCommand("insert into register_auth (regFullname,regRollNo,regEmail,regmobile,regUsername,regPassword,regConfirmPassword,regRole) values('" + regFullName.Text + "','" + regRollNo.Text + "','" + regEmail.Text + "','" + regMobile.Text + "','" + regUsername.Text + "','" + regPassword.Text + "','" + regConfirmPassword.Text + "','" + role + "')", con);
                cmd.ExecuteNonQuery();
                clearStudent();
            }
            else
            {
                // update code for student gridview

                getcon();
                cmd = new SqlCommand("update register_auth set regFullname='" + regFullName.Text + "',regRollNo='" + regRollNo.Text + "',regEmail='" + regEmail.Text + "',regmobile='" + regMobile.Text + "',regUsername='" + regUsername.Text + "',regPassword='" + regPassword.Text + "',regConfirmPassword='" + regConfirmPassword.Text + "' where id=" + ViewState["id"], con);
                cmd.ExecuteNonQuery();
                clearStudent();
                btnSubmitRegister.Text = "Create Student Account";
             hfRole.Value = "Student";
            }
        }

        // Company Registration  
        protected void btnSubmitCompany_Click(object sender, EventArgs e)
        {
            string role = hfRole.Value;

            if (role == "")
            {
                role = "Company";
            }

            if (role == "Company")

                if(btnSubmitCompany.Text == "Create Company Account")
            {
                getcon();

                cmd = new SqlCommand("insert into register_auth_company (compName,compHRName,compEmail,compMobile,compUsername,compPassword,compConfirmPassword,regRole) values('" + compName.Text + "','" + compHRName.Text + "','" + compEmail.Text + "','" + compMobile.Text + "','" + compUsername.Text + "','" + compPassword.Text + "','" + compConfirmPassword.Text + "','" + role + "')", con);
                cmd.ExecuteNonQuery();
                clearCompany();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("update register_auth_company set compName='" + compName.Text + "',compHRName='" + compHRName.Text + "',compEmail='" + compEmail.Text + "',compMobile='" + compMobile.Text + "',compUsername='" + compUsername.Text + "',compPassword='" + compPassword.Text + "',compConfirmPassword='" + compConfirmPassword.Text + "' where id=" + ViewState["CompanyID"], con);
                cmd.ExecuteNonQuery();
                clearCompany();
                btnSubmitCompany.Text = "Create Company Account";
                hfRole.Value = "Company";

            }
        }

        protected void hfRole_ValueChanged(object sender, EventArgs e)
        {
        }

      
       
       

    }
}