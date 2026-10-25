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
    public partial class CompanyStudentDirectory : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        CompanyStudentDirectoryClass studClass;

        string compName;
        string compUsername;
        string compEmail;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filtergrid(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (dt != null && dt.Rows.Count > 0)
            {
                lblStudentCount.Text = dt.Rows.Count.ToString();
            }
            else
            {
                lblStudentCount.Text = "0";
            }
        }

        void fillgrid()
        {
            studClass = new CompanyStudentDirectoryClass();
            filtergrid(studClass.select_all_students().Tables[0]);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["company"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from register_auth_company where compEmail='" + Session["company"] + "' or compUsername='" + Session["company"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    compName = ds.Tables[0].Rows[0]["compName"].ToString();
                    compUsername = ds.Tables[0].Rows[0]["compUsername"].ToString();
                    compEmail = ds.Tables[0].Rows[0]["compEmail"].ToString();

                    ViewState["compName"] = compName;
                    ViewState["compUsername"] = compUsername;
                    ViewState["compEmail"] = compEmail;
                }
                else
                {
                    ViewState["compUsername"] = Session["company"].ToString();
                    ViewState["compEmail"] = Session["company"].ToString();
                }

                if (!IsPostBack)
                {
                    fillgrid();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        //<----------- Search/Filter --------------->

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            studClass = new CompanyStudentDirectoryClass();
            filtergrid(studClass.search_students(studentSearchInput.Text).Tables[0]);
        }

        protected void studentBranchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            studClass = new CompanyStudentDirectoryClass();
            filtergrid(studClass.select_students_by_branch(studentBranchFilter.SelectedValue).Tables[0]);
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            studentSearchInput.Text = "";
            studentBranchFilter.SelectedIndex = 0;
            fillgrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProfile")
            {
                getcon();
                da = new SqlDataAdapter("select * from register_auth where Id='" + e.CommandArgument + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblStudentName.Text = ds.Tables[0].Rows[0]["regFullName"].ToString();
                    lblRollNo.Text = ds.Tables[0].Rows[0]["regRollNo"].ToString();
                    lblEmail.Text = ds.Tables[0].Rows[0]["regEmail"].ToString();
                    lblMobile.Text = ds.Tables[0].Rows[0]["regMobile"].ToString();
                    lblDegreeBranch.Text = ds.Tables[0].Rows[0]["degree"].ToString() + " (" + ds.Tables[0].Rows[0]["branch"].ToString() + ")";
                    lblSemester.Text = ds.Tables[0].Rows[0]["semester"].ToString() + " Sem";
                    lblCgpa.Text = ds.Tables[0].Rows[0]["cgpa"].ToString();
                    lblBacklogs.Text = ds.Tables[0].Rows[0]["backlogs"].ToString();
                    lblSkills.Text = ds.Tables[0].Rows[0]["skills"].ToString();

                    string photo = ds.Tables[0].Rows[0]["photoUrl"].ToString();
                    if (photo != "")
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
                    string resume = ds.Tables[0].Rows[0]["resumeUrl"].ToString();
                    if (resume != "")
                    {
                        lnkResume.NavigateUrl = ResolveUrl("~/assets/StudentPDF/" + resume);
                        lnkResume.Visible = true; //resume link dekhase
                        lblNoResume.Visible = false;//remuse link hide karse nai hoy to 
                    }
                    else
                    {
                        lnkResume.Visible = false; ///resume messge hide kare
                        lblNoResume.Visible = true;//resume uploaded nathi evu show karave
                    }
                    //profile details display
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
