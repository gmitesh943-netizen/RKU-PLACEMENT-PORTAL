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

        void studentfilldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth where id=" + ViewState["id"], con);
            ds = new DataSet();
            da.Fill(ds);

            regFullName.Text = ds.Tables[0].Rows[0]["regFullname"].ToString();
            regRollNo.Text = ds.Tables[0].Rows[0]["regRollNo"].ToString();
            regEmail.Text = ds.Tables[0].Rows[0]["regEmail"].ToString();
            regMobile.Text = ds.Tables[0].Rows[0]["regmobile"].ToString();
            regUsername.Text = ds.Tables[0].Rows[0]["regUsername"].ToString();
            regPassword.Text = ds.Tables[0].Rows[0]["regPassword"].ToString();
            regConfirmPassword.Text = ds.Tables[0].Rows[0]["regConfirmPassword"].ToString();
        }

        void Compnayfilldata()
        {
            getcon();

            da = new SqlDataAdapter("select * from register_auth_company where id=" + ViewState["CompanyID"], con);
            ds = new DataSet();
            da.Fill(ds);

            compName.Text = ds.Tables[0].Rows[0]["compName"].ToString();
            compHRName.Text = ds.Tables[0].Rows[0]["compHRName"].ToString();
            compEmail.Text = ds.Tables[0].Rows[0]["compEmail"].ToString();
            compMobile.Text = ds.Tables[0].Rows[0]["compMobile"].ToString();
            compUsername.Text = ds.Tables[0].Rows[0]["compUsername"].ToString();
            compPassword.Text = ds.Tables[0].Rows[0]["compPassword"].ToString();
            compConfirmPassword.Text = ds.Tables[0].Rows[0]["compConfirmPassword"].ToString();

            con.Close();

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
                con.Close();
                GridStudent();
                clearStudent();
            }
            else
            {
                // update code for student gridview

                getcon();
                cmd = new SqlCommand("update register_auth set regFullname='" + regFullName.Text + "',regRollNo='" + regRollNo.Text + "',regEmail='" + regEmail.Text + "',regmobile='" + regMobile.Text + "',regUsername='" + regUsername.Text + "',regPassword='" + regPassword.Text + "',regConfirmPassword='" + regConfirmPassword.Text + "' where id=" + ViewState["id"], con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridStudent();
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
                con.Close();
                GridCompany();
                clearCompany();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("update register_auth_company set compName='" + compName.Text + "',compHRName='" + compHRName.Text + "',compEmail='" + compEmail.Text + "',compMobile='" + compMobile.Text + "',compUsername='" + compUsername.Text + "',compPassword='" + compPassword.Text + "',compConfirmPassword='" + compConfirmPassword.Text + "' where id=" + ViewState["CompanyID"], con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridCompany();
                clearCompany();
                btnSubmitCompany.Text = "Create Company Account";
                hfRole.Value = "Company";

            }
        }

        protected void hfRole_ValueChanged(object sender, EventArgs e)
        {
        }

        //compny  gridview 
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cedt")
            {
               
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["CompanyID"] = id;
                Compnayfilldata();

                btnSubmitCompany.Text = "Update";
                hfRole.Value = "UpdateCompany";
            }
            else
            {
                //delete 

                getcon();
                cmd = new SqlCommand("delete  from register_auth_company where id=" + e.CommandArgument,con);
                cmd.ExecuteNonQuery();
                GridCompany();
            }
        }

        //student gridview 
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //update and delete command
            if (e.CommandName == "cmd_edt")
            {
                getcon();

                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                studentfilldata();

                hfRole.Value = "UpdateStudent";

                btnSubmitRegister.Text = "Update";
            }
            else
            {
                //delete 

                getcon();
                cmd = new SqlCommand("delete  from register_auth where id=" + e.CommandArgument, con);
                cmd.ExecuteNonQuery();
                GridStudent();
            }
        }

    }
}