using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadStudentProfile();
                filldata();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void loadStudentProfile()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            //< ----------  Check kare student record ---------->

            if (ds.Tables[0].Rows.Count > 0)
            {
                string photo = ds.Tables[0].Rows[0]["photoUrl"].ToString();

                imgProfPhoto.Visible = photo != "";
                profPhotoInitials.Visible = photo == "";

                if (photo != "")
                {
                    if (!photo.StartsWith("~") && !photo.StartsWith("/"))
                        photo = "~/assets/ProfilePhotos/" + photo;

                    imgProfPhoto.ImageUrl = ResolveUrl(photo);
                }
                if (photo == "")
                {
                    string name = ds.Tables[0].Rows[0]["regFullName"].ToString();

                    if (name != "")
                    {
                        string[] parts = name.Split(' ');

                        if (parts.Length > 1)
                            profPhotoInitials.Text = (parts[0][0].ToString() + parts[1][0].ToString()).ToUpper();
                        else
                            profPhotoInitials.Text = name[0].ToString().ToUpper();
                    }
                }

                string resume = ds.Tables[0].Rows[0]["resumeUrl"].ToString();
                phCurrentResume.Visible = resume != "";

                if (resume != "")
                {
                    lblCurrentResumeName.Text = resume;
                    lnkCurrentResume.NavigateUrl = "~/assets/StudentPDF/" + resume;
                }
            }
        }
        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                profName.Text = ds.Tables[0].Rows[0]["regFullName"].ToString();
                profEnroll.Text = ds.Tables[0].Rows[0]["regRollNo"].ToString();
                profEmail.Text = ds.Tables[0].Rows[0]["regEmail"].ToString();
                profMobile.Text = ds.Tables[0].Rows[0]["regMobile"].ToString();
                profDegree.SelectedValue = ds.Tables[0].Rows[0]["degree"].ToString();
                profBranch.SelectedValue = ds.Tables[0].Rows[0]["branch"].ToString();
                profSemester.SelectedValue = ds.Tables[0].Rows[0]["semester"].ToString();
                profCgpa.Text = ds.Tables[0].Rows[0]["cgpa"].ToString();
                profBacklogs.Text = ds.Tables[0].Rows[0]["backlogs"].ToString();
                profSkills.Text = ds.Tables[0].Rows[0]["skills"].ToString();
            }
        }
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            getcon();

            string photo = "";
            string resume = "";

            if (profPhotoInput.HasFile)
            {
                photo = profPhotoInput.FileName;
                profPhotoInput.SaveAs(Server.MapPath("~/assets/ProfilePhotos/" + photo));
            }

            //<-----------  resume is uploaded  ---------->
            if (fuResume.HasFile)
            {
                resume = fuResume.FileName;
                fuResume.SaveAs(Server.MapPath("~/assets/StudentPDF/" + resume));
            }

            //<--------Update profile details, photo, and resume---------->
            if (profPhotoInput.HasFile && fuResume.HasFile)
            {
                cmd = new SqlCommand("update register_auth set regEmail='" + profEmail.Text + "',regMobile='" + profMobile.Text + "',degree='" + profDegree.SelectedValue + "',branch='" + profBranch.SelectedValue + "',semester='" + profSemester.SelectedValue + "',cgpa='" + profCgpa.Text + "',backlogs='" + profBacklogs.Text + "',skills='" + profSkills.Text + "',photoUrl='" + photo + "',resumeUrl='" + resume + "' where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            }

            //<--------Only the profile photo is uploaded---------->
            else if (profPhotoInput.HasFile)
            {
                cmd = new SqlCommand("update register_auth set regEmail='" + profEmail.Text + "',regMobile='" + profMobile.Text + "',degree='" + profDegree.SelectedValue + "',branch='" + profBranch.SelectedValue + "',semester='" + profSemester.SelectedValue + "',cgpa='" + profCgpa.Text + "',backlogs='" + profBacklogs.Text + "',skills='" + profSkills.Text + "',photoUrl='" + photo + "' where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            }

            //<--------Only the resume is uploaded---------->
            else if (fuResume.HasFile)
            {
                cmd = new SqlCommand("update register_auth set regEmail='" + profEmail.Text + "',regMobile='" + profMobile.Text + "',degree='" + profDegree.SelectedValue + "',branch='" + profBranch.SelectedValue + "',semester='" + profSemester.SelectedValue + "',cgpa='" + profCgpa.Text + "',backlogs='" + profBacklogs.Text + "',skills='" + profSkills.Text + "',resumeUrl='" + resume + "' where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            }

            //<--------photo OR resume is uploaded---------->
            else
            {
                cmd = new SqlCommand("update register_auth set regEmail='" + profEmail.Text + "',regMobile='" + profMobile.Text + "',degree='" + profDegree.SelectedValue + "',branch='" + profBranch.SelectedValue + "',semester='" + profSemester.SelectedValue + "',cgpa='" + profCgpa.Text + "',backlogs='" + profBacklogs.Text + "',skills='" + profSkills.Text + "' where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            }

            cmd.ExecuteNonQuery();
            Session["student"] = profEmail.Text;
            loadStudentProfile();
            filldata();

            lblMsg.Visible = true;
            lblMsg.CssClass = "alert alert-success alert-dismissible fade show mb-4 d-block";
            lblMsg.Text = "<strong>Success!</strong> Profile and Photo updated successfully.";
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            filldata();
        }
    }
}