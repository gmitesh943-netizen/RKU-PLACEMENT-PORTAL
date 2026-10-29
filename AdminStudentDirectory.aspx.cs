using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminStudentDirectory : System.Web.UI.Page
    {
        AdminStudentDirectoryClass dirClass = new AdminStudentDirectoryClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                ViewState["student_page"] = 0;
                ViewState["company_page"] = 0;
                fillStudentGrid();
                fillCompanyGrid();
            }
        }

        void startcon()
        {
            dirClass = new AdminStudentDirectoryClass();
            dirClass.getcon();
        }

        // --------------------- STUDENT SECTION ------------------------

        // without filter all show students
        void fillStudentGrid()
        {
            dirClass = new AdminStudentDirectoryClass();
            DataTable dt = dirClass.select_students().Tables[0];

            lblStudentCount.Text = dt.Rows.Count.ToString();

            int page = Convert.ToInt32(ViewState["student_page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["student_page"] = page;
            }

            GridView1.DataSource = dirClass.certificate_pagination(dt, page);
            GridView1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show students data
        void filterStudentGrid(DataTable dt)
        {
            lblStudentCount.Text = dt.Rows.Count.ToString();

            ViewState["student_page"] = 0;

            GridView1.DataSource = dirClass.certificate_pagination(dt, 0);
            GridView1.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPages.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = false;
            btnNext.Enabled = dt != null && dt.Rows.Count > 6;
        }

        // Student Previous Button
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            ViewState["student_page"] = Convert.ToInt32(ViewState["student_page"]) - 1;
            fillStudentGrid();
        }

        // Student Next Button
        protected void btnNext_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            ViewState["student_page"] = Convert.ToInt32(ViewState["student_page"]) + 1;
            fillStudentGrid();
        }

        // Student SearchButton 
        protected void btnStudentSearch_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            dirClass = new AdminStudentDirectoryClass();
            filterStudentGrid(dirClass.search_students(studentSearchInput.Text).Tables[0]);
        }

        // Student Branch DropDownList
        protected void studentBranchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            dirClass = new AdminStudentDirectoryClass();
            filterStudentGrid(dirClass.select_students_by_branch(studentBranchFilter.SelectedValue).Tables[0]);
        }

        // Student ResetButton
        protected void btnResetStudent_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "students";
            ViewState["student_page"] = 0;
            studentSearchInput.Text = "";
            studentBranchFilter.SelectedIndex = 0;
            fillStudentGrid();
        }

        // Delete Student
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                dirClass = new AdminStudentDirectoryClass();
                dirClass.delete_student(Convert.ToInt32(e.CommandArgument));
                fillStudentGrid();
            }
        }

        // --------------------COMPANY SECTION --------------------

        // without filter all show companies
        void fillCompanyGrid()
        {
            dirClass = new AdminStudentDirectoryClass();
            DataTable dt = dirClass.select_companies().Tables[0];
            lblCompanyCount.Text = dt.Rows.Count.ToString();

            int page = Convert.ToInt32(ViewState["company_page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["company_page"] = page;
            }

            GridView2.DataSource = dirClass.certificate_pagination(dt, page);
            GridView2.DataBind();

            lblPagesCompany.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPreviousCompany.Enabled = page > 0;
            btnNextCompany.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show companies data
        void filterCompanyGrid(DataTable dt)
        {
            lblCompanyCount.Text = dt.Rows.Count.ToString();

            ViewState["company_page"] = 0;

            GridView2.DataSource = dirClass.certificate_pagination(dt, 0);
            GridView2.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPagesCompany.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPreviousCompany.Enabled = false;
            btnNextCompany.Enabled = dt != null && dt.Rows.Count > 6;
        }

        // Company Previous Button
        protected void btnPreviousCompany_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            ViewState["company_page"] = Convert.ToInt32(ViewState["company_page"]) - 1;
            fillCompanyGrid();
        }

        // Company Next Button
        protected void btnNextCompany_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            ViewState["company_page"] = Convert.ToInt32(ViewState["company_page"]) + 1;
            fillCompanyGrid();
        }

        // Company SearchButton
        protected void btnCompanySearch_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            dirClass = new AdminStudentDirectoryClass();
            filterCompanyGrid(dirClass.search_companies(companySearchInput.Text).Tables[0]);
        }

        // Company Industry DropDownList
        protected void companyIndustryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            dirClass = new AdminStudentDirectoryClass();
            filterCompanyGrid(dirClass.select_companies_by_industry(companyIndustryFilter.SelectedValue).Tables[0]);
        }

        // Company ResetButton
        protected void btnResetCompany_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "companies";
            ViewState["company_page"] = 0;
            companySearchInput.Text = "";
            companyIndustryFilter.SelectedIndex = 0;
            fillCompanyGrid();
        }

        // Delete Company
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cdel")
            {
                dirClass = new AdminStudentDirectoryClass();
                dirClass.delete_company(Convert.ToInt32(e.CommandArgument));
                fillCompanyGrid();
            }
        }

        // Backward compatibility methods
        void GridStudent()
        {
            fillStudentGrid();
        }

        void GridCompany()
        {
            fillCompanyGrid();
        }
    }
}
