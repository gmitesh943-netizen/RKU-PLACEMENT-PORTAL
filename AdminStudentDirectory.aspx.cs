using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminStudentDirectory : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        AdminStudentDirectoryClass dirClass;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridStudent();
                GridCompany();
            }
        }

        void filterStudentGrid(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (lblStudentCount != null)
            {
                lblStudentCount.Text = (dt != null ? dt.Rows.Count : 0).ToString();
            }
        }

        void filterCompanyGrid(DataTable dt)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();

            if (lblCompanyCount != null)
            {
                lblCompanyCount.Text = (dt != null ? dt.Rows.Count : 0).ToString();
            }
        }

        void GridStudent()
        {
            dirClass = new AdminStudentDirectoryClass();
            filterStudentGrid(dirClass.select_all_students().Tables[0]);
        }

        void GridCompany()
        {
            dirClass = new AdminStudentDirectoryClass();
            filterCompanyGrid(dirClass.select_all_companies().Tables[0]);
        }

        //<----------- Student Search/Filter --------------->

        protected void btnStudentSearch_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            dirClass = new AdminStudentDirectoryClass();
            filterStudentGrid(dirClass.search_students(studentSearchInput.Text).Tables[0]);
        }

        protected void studentBranchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            dirClass = new AdminStudentDirectoryClass();
            filterStudentGrid(dirClass.select_students_by_branch(studentBranchFilter.SelectedValue).Tables[0]);
        }

        protected void btnResetStudent_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            studentSearchInput.Text = "";
            studentBranchFilter.SelectedIndex = 0;
            GridStudent();
        }

        //<----------- Company Search/Filter --------------->

        protected void btnCompanySearch_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            dirClass = new AdminStudentDirectoryClass();
            filterCompanyGrid(dirClass.search_companies(companySearchInput.Text).Tables[0]);
        }

        protected void companyIndustryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            dirClass = new AdminStudentDirectoryClass();
            filterCompanyGrid(dirClass.select_companies_by_industry(companyIndustryFilter.SelectedValue).Tables[0]);
        }

        protected void btnResetCompany_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            companySearchInput.Text = "";
            companyIndustryFilter.SelectedIndex = 0;
            GridCompany();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from register_auth where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                GridStudent();
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cdel")
            {
                getcon();
                cmd = new SqlCommand("delete from register_auth_company where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                GridCompany();
            }
        }
    }
}
