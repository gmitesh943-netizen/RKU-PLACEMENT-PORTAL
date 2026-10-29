using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class CompanyStudentDirectory : System.Web.UI.Page
    {
        CompanyStudentDirectoryClass studClass = new CompanyStudentDirectoryClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["company"] != null)
            {
                startcon();
                if (!IsPostBack)
                {
                    ViewState["page"] = 0;
                    fillgrid();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void startcon()
        {
            studClass = new CompanyStudentDirectoryClass();
            studClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            studClass = new CompanyStudentDirectoryClass();
            DataTable dt = studClass.select_students().Tables[0];

            lblStudentCount.Text = dt.Rows.Count.ToString();

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            GridView1.DataSource = studClass.certificate_pagination(dt, page);
            GridView1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            lblStudentCount.Text = (dt != null ? dt.Rows.Count.ToString() : "0");

            ViewState["page"] = 0;

            GridView1.DataSource = studClass.certificate_pagination(dt, 0);
            GridView1.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPages.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = false;
            btnNext.Enabled = dt != null && dt.Rows.Count > 6;
        }

        // Previous Button
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 1;
            fillgrid();
        }

        // Next Button
        protected void btnNext_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 1;
            fillgrid();
        }

        // SearchButton 
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            studClass = new CompanyStudentDirectoryClass();
            filtergrid(studClass.search_students(studentSearchInput.Text).Tables[0]);
        }

        // Branch
        protected void studentBranchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            studClass = new CompanyStudentDirectoryClass();
            filtergrid(studClass.select_students_by_branch(studentBranchFilter.SelectedValue).Tables[0]);
        }

        // ResetButton
        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            studentSearchInput.Text = "";
            studentBranchFilter.SelectedIndex = 0;
            fillgrid();
        }

        // Profile View
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProfile")
            {
                studClass = new CompanyStudentDirectoryClass();
                DataTable dt = studClass.select_student_by_id(Convert.ToInt32(e.CommandArgument)).Tables[0];

                if (dt.Rows.Count > 0)
                {
                    lblStudentName.Text = dt.Rows[0]["regFullName"].ToString();
                    lblRollNo.Text = dt.Rows[0]["regRollNo"].ToString();
                    lblEmail.Text = dt.Rows[0]["regEmail"].ToString();
                    lblMobile.Text = dt.Rows[0]["regMobile"].ToString();
                    lblDegreeBranch.Text = dt.Rows[0]["degree"].ToString() + " (" + dt.Rows[0]["branch"].ToString() + ")";
                    lblSemester.Text = dt.Rows[0]["semester"].ToString() + " Sem";
                    lblCgpa.Text = dt.Rows[0]["cgpa"].ToString();
                    lblBacklogs.Text = dt.Rows[0]["backlogs"].ToString();
                    lblSkills.Text = dt.Rows[0]["skills"].ToString();

                    string photo = dt.Rows[0]["photoUrl"].ToString();
                    if (!string.IsNullOrEmpty(photo))
                    {
                        imgStudentPhoto.ImageUrl = ResolveUrl("~/assets/ProfilePhotos/" + photo);
                        imgStudentPhoto.Visible = true;
                        divFallbackPhoto.Visible = false;
                    }
                    else
                    {
                        imgStudentPhoto.Visible = false;
                        divFallbackPhoto.Visible = true;
                    }

                    string resume = dt.Rows[0]["resumeUrl"].ToString();
                    if (!string.IsNullOrEmpty(resume))
                    {
                        lnkResume.NavigateUrl = ResolveUrl("~/assets/StudentPDF/" + resume);
                        lnkResume.Visible = true;
                        lblNoResume.Visible = false;
                    }
                    else
                    {
                        lnkResume.Visible = false;
                        lblNoResume.Visible = true;
                    }

                    pnlStudentProfile.Visible = true;
                }
            }
        }

        protected void btnCloseProfile_Click(object sender, EventArgs e)
        {
            pnlStudentProfile.Visible = false;
        }
    }
}
