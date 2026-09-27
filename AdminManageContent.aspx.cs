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
    public partial class AdminManageContent : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;


        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                fillGrid();
                fillStoryGrid();
                fillGalleryGrid();
                fillTeamGrid();
            }
        }


        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        void imgupload()
        {
            if (placementImage.HasFile)
            {
                fnm = "~/assets/PlacmentStudentImage/" + placementImage.FileName;
                placementImage.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "";
            }
        }


        void clear()
        {
            placementStudentName.Text = "";
            placementDepartment.SelectedIndex = 0;
            placementCompanyName.Text = "";
            placementYear.SelectedIndex = 0;
            placementImagePreview.ImageUrl = "";
            placementImagePreview.Style["display"] = "none";
            placementSubmitBtn.Text = "Add Placed Student";
        }

        
        protected void placementSubmitBtn_Click(object sender, EventArgs e)
        {
            if (placementSubmitBtn.Text == "Add Placed Student")
            {
              
                getcon();
                imgupload();
                cmd = new SqlCommand("insert into Placed_Students(StudentName,Department,CompanyName,PlacementYear,StudentImage) values('" + placementStudentName.Text + "','" + placementDepartment.SelectedValue + "','" + placementCompanyName.Text + "','" + placementYear.SelectedValue + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clear();
                fillGrid();
            }
            else
            {
                
                getcon();
                if (placementImage.HasFile)
                {
                    imgupload();
                    cmd = new SqlCommand("update Placed_Students set StudentName='" + placementStudentName.Text + "',Department='" + placementDepartment.SelectedValue + "',CompanyName='" + placementCompanyName.Text + "',PlacementYear='" + placementYear.SelectedValue + "',StudentImage='" + fnm + "' where StudentName='" + ViewState["name"] + "'", con);
                }
                else
                {
                    cmd = new SqlCommand("update Placed_Students set StudentName='" + placementStudentName.Text + "',Department='" + placementDepartment.SelectedValue + "',CompanyName='" + placementCompanyName.Text + "',PlacementYear='" + placementYear.SelectedValue + "' where StudentName='" + ViewState["name"] + "'", con);
                }
                cmd.ExecuteNonQuery();
                fillGrid();
                clear();
                placementSubmitBtn.Text = "Add Placed Student";
            }
        }

        
        void fillGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placed_Students", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNoPlacedStudents.Visible = false;
                placementCountBadge.InnerText = ds.Tables[0].Rows.Count + " students";
            }
            else
            {
                lblNoPlacedStudents.Visible = true;
                placementCountBadge.InnerText = "0 students";
            }
        }

        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placed_Students where StudentName='" + ViewState["name"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                placementStudentName.Text = ds.Tables[0].Rows[0]["StudentName"].ToString();
                placementDepartment.SelectedValue = ds.Tables[0].Rows[0]["Department"].ToString();
                placementCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                placementYear.SelectedValue = ds.Tables[0].Rows[0]["PlacementYear"].ToString();

                string img = ds.Tables[0].Rows[0]["StudentImage"].ToString();
                if (!string.IsNullOrEmpty(img) && img != "~/assets/PlacmentStudentImage/")
                {
                    placementImagePreview.ImageUrl = img;
                    placementImagePreview.Style["display"] = "block";
                }
                else
                {
                    placementImagePreview.ImageUrl = "";
                    placementImagePreview.Style["display"] = "none";
                }
            }
        }


        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                string name = e.CommandArgument.ToString();
                ViewState["name"] = name;
                placementSubmitBtn.Text = "Update";
                filldata();
            }
            else
            {

                getcon();
                cmd = new SqlCommand("delete from Placed_Students where StudentName='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }

        protected void placementCancelBtn_Click(object sender, EventArgs e)
        {
            clear();
        }

        //========================== SUCCESS STORIES ==========================

        void storyImgUpload()
        {
            if (storyImage.HasFile)
            {
                fnm = "~/assets/PlacmentStudentImage/" + storyImage.FileName;
                storyImage.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "";
            }
        }

        void clearStory()
        {
            storyStudentName.Text = "";
            storyDegree.Text = "";
            storyRecruiter.Text = "";
            storyPackage.Text = "";
            storyRole.Text = "";
            storyQuote.Text = "";
            storySkills.Text = "";
            storyIsHallOfFame.Checked = false;
            storyRank.SelectedIndex = 0;
            storyImagePreview.ImageUrl = "";
            storyImagePreview.Style["display"] = "none";
            storySubmitBtn.Text = "Publish Success Story";
        }

        void fillStoryGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from Success_Stories", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView3.DataSource = ds;
            GridView3.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNoStories.Visible = false;
                storyCountBadge.InnerText = ds.Tables[0].Rows.Count + " stories";
            }
            else
            {
                lblNoStories.Visible = true;
                storyCountBadge.InnerText = "0 stories";
            }
        }

        void fillStoryData()
        {
            getcon();
            da = new SqlDataAdapter("select * from Success_Stories where StoryId='" + ViewState["storyid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                storyStudentName.Text = ds.Tables[0].Rows[0]["StudentName"].ToString();
                storyDegree.Text = ds.Tables[0].Rows[0]["DegreeBranch"].ToString();
                storyRecruiter.Text = ds.Tables[0].Rows[0]["Recruiter"].ToString();
                storyPackage.Text = ds.Tables[0].Rows[0]["Package"].ToString();
                storyRole.Text = ds.Tables[0].Rows[0]["JobDesignation"].ToString();
                storyQuote.Text = ds.Tables[0].Rows[0]["Testimonial"].ToString();
                storySkills.Text = ds.Tables[0].Rows[0]["KeySkills"].ToString();

                string isHof = ds.Tables[0].Rows[0]["IsHallOfFame"].ToString();
                storyIsHallOfFame.Checked = (isHof == "1" || isHof.ToLower() == "true");

                string rank = ds.Tables[0].Rows[0]["PodiumRank"].ToString();
                if (storyRank.Items.FindByValue(rank) != null)
                {
                    storyRank.SelectedValue = rank;
                }
                else
                {
                    storyRank.SelectedIndex = 0;
                }

                //string img = ds.Tables[0].Rows[0]["StudentPhoto"].ToString();
                //if (!string.IsNullOrEmpty(img) && img != "~/assets/PlacmentStudentImage/")
                //{
                //    storyImagePreview.ImageUrl = img;
                //    storyImagePreview.Style["display"] = "block";
                //}
                //else
                //{
                //    storyImagePreview.ImageUrl = "";
                //    storyImagePreview.Style["display"] = "none";
                //}
            }
        }

        protected void storySubmitBtn_Click(object sender, EventArgs e)
        {
            string isHof = storyIsHallOfFame.Checked ? "1" : "0";
            string rank = storyIsHallOfFame.Checked ? storyRank.SelectedValue : "";

            if (storySubmitBtn.Text == "Publish Success Story")
            {
                getcon();
                storyImgUpload();
                cmd = new SqlCommand("insert into Success_Stories(StudentName,DegreeBranch,StudentPhoto,Recruiter,Package,JobDesignation,Testimonial,KeySkills,IsHallOfFame,PodiumRank) values('" + storyStudentName.Text + "','" + storyDegree.Text + "','" + fnm + "','" + storyRecruiter.Text + "','" + storyPackage.Text + "','" + storyRole.Text + "','" + storyQuote.Text + "','" + storySkills.Text + "','" + isHof + "','" + rank + "')", con);
                cmd.ExecuteNonQuery();
                clearStory();
                fillStoryGrid();
            }
            else
            {
                getcon();
                if (storyImage.HasFile)
                {
                    storyImgUpload();
                    cmd = new SqlCommand("update Success_Stories set StudentName='" + storyStudentName.Text + "',DegreeBranch='" + storyDegree.Text + "',StudentPhoto='" + fnm + "',Recruiter='" + storyRecruiter.Text + "',Package='" + storyPackage.Text + "',JobDesignation='" + storyRole.Text + "',Testimonial='" + storyQuote.Text + "',KeySkills='" + storySkills.Text + "',IsHallOfFame='" + isHof + "',PodiumRank='" + rank + "' where StoryId='" + ViewState["storyid"] + "'", con);
                }
                else
                {
                    cmd = new SqlCommand("update Success_Stories set StudentName='" + storyStudentName.Text + "',DegreeBranch='" + storyDegree.Text + "',Recruiter='" + storyRecruiter.Text + "',Package='" + storyPackage.Text + "',JobDesignation='" + storyRole.Text + "',Testimonial='" + storyQuote.Text + "',KeySkills='" + storySkills.Text + "',IsHallOfFame='" + isHof + "',PodiumRank='" + rank + "' where StoryId='" + ViewState["storyid"] + "'", con);
                }
                cmd.ExecuteNonQuery();
                fillStoryGrid();
                clearStory();
                storySubmitBtn.Text = "Publish Success Story";
            }
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_sedt")
            {
                string id = e.CommandArgument.ToString();
                ViewState["storyid"] = id;
                storySubmitBtn.Text = "Update";
                fillStoryData();
            }
            else if (e.CommandName == "cmd_sdel")
            {
                getcon();
                cmd = new SqlCommand("delete from Success_Stories where StoryId='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillStoryGrid();
            }
        }

        protected void storyCancelBtn_Click(object sender, EventArgs e)
        {
            clearStory();
        }

        //====== ================= Galary image add===========

       
        void galleryImgUpload()
        {
            if (galleryImage.HasFile)
            {
                fnm = "~/assets/GalleryImages/" + galleryImage.FileName;
                galleryImage.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "";
            }
        }

        
        void clearGallery()
        {
            galleryTitle.Text = "";
            gallerySubmitBtn.Text = "+ Add Gallery Item";
        }

        
        void fillGalleryGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placement_Gallery", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNoGallery.Visible = false;
                galleryCountBadge.InnerText = ds.Tables[0].Rows.Count + " items";
            }
            else
            {
                lblNoGallery.Visible = true;
                galleryCountBadge.InnerText = "0 items";
            }
        }

       
        void fillGalleryData()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placement_Gallery where GalleryTitle='" + ViewState["gtitle"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                galleryTitle.Text = ds.Tables[0].Rows[0]["GalleryTitle"].ToString();
            }
        }

        protected void gallerySubmitBtn_Click(object sender, EventArgs e)
        {
            if (gallerySubmitBtn.Text == "+ Add Gallery Item")
            {
                getcon();
                galleryImgUpload();
                cmd = new SqlCommand("insert into Placement_Gallery(GalleryTitle,GalleryImage) values('" + galleryTitle.Text + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clearGallery();
                fillGalleryGrid();
            }
            else
            {
                getcon();
                if (galleryImage.HasFile)
                {
                    galleryImgUpload();
                    cmd = new SqlCommand("update Placement_Gallery set GalleryTitle='" + galleryTitle.Text + "',GalleryImage='" + fnm + "' where GalleryTitle='" + ViewState["gtitle"] + "'", con);
                }
                else
                {
                    cmd = new SqlCommand("update Placement_Gallery set GalleryTitle='" + galleryTitle.Text + "' where GalleryTitle='" + ViewState["gtitle"] + "'", con);
                }
                cmd.ExecuteNonQuery();
                fillGalleryGrid();
                clearGallery();
                gallerySubmitBtn.Text = "+ Add Gallery Item";
            }
        }

        
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_gedt")
            {
                string title = e.CommandArgument.ToString();
                ViewState["gtitle"] = title;
                gallerySubmitBtn.Text = "Update";
                fillGalleryData();
            }
            else
            {
                getcon();
                cmd = new SqlCommand("delete from Placement_Gallery where GalleryTitle='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGalleryGrid();
            }
        }

        protected void galleryCancelBtn_Click(object sender, EventArgs e)
        {
            clearGallery();
        }

        //========================== PLACEMENT TEAM ==========================

        void teamImgUpload()
        {
            fnm = "~/assets/PlacmentCell_TeamImage/" + teamMemberPhoto.FileName;
            teamMemberPhoto.SaveAs(Server.MapPath(fnm));
        }

        void clearTeam()
        {
            teamMemberName.Text = "";
            teamMemberRole.Text = "";
            teamMemberDesc.Text = "";
            teamMemberMobile.Text = "";
            teamMemberEmail.Text = "";
            teamImagePreview.ImageUrl = "";
            teamImagePreview.Style["display"] = "none";
            teamSubmitBtn.Text = "Add Team Member";
        }

        void fillTeamGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placement_Team", con);
            ds = new DataSet();
            da.Fill(ds);
            GridViewTeam.DataSource = ds;
            GridViewTeam.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNoTeamMembers.Visible = false;
                teamCountBadge.InnerText = ds.Tables[0].Rows.Count + " members";
            }
            else
            {
                lblNoTeamMembers.Visible = true;
                teamCountBadge.InnerText = "0 members";
            }
        }

        void fillTeamData()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placement_Team where MemberName='" + ViewState["teamname"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                teamMemberName.Text = ds.Tables[0].Rows[0]["MemberName"].ToString();
                teamMemberRole.Text = ds.Tables[0].Rows[0]["MemberRole"].ToString();
                teamMemberDesc.Text = ds.Tables[0].Rows[0]["MemberDesc"].ToString();
                teamMemberMobile.Text = ds.Tables[0].Rows[0]["MemberMobile"].ToString();
                teamMemberEmail.Text = ds.Tables[0].Rows[0]["MemberEmail"].ToString();

                string img = ds.Tables[0].Rows[0]["MemberPhoto"].ToString();
                if (!string.IsNullOrEmpty(img) && img != "~/assets/PlacmentCell_TeamImage/")
                {
                    teamImagePreview.ImageUrl = img;
                    teamImagePreview.Style["display"] = "block";
                }
                else
                {
                    teamImagePreview.ImageUrl = "";
                    teamImagePreview.Style["display"] = "none";
                }
            }
        }

        protected void teamSubmitBtn_Click(object sender, EventArgs e)
        {
            if (teamSubmitBtn.Text == "Add Team Member")
            {
                getcon();
                teamImgUpload();
                cmd = new SqlCommand("insert into Placement_Team(MemberName,MemberRole,MemberDesc,MemberMobile,MemberEmail,MemberPhoto) values('" + teamMemberName.Text + "','" + teamMemberRole.Text + "','" + teamMemberDesc.Text + "','" + teamMemberMobile.Text + "','" + teamMemberEmail.Text + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();
                clearTeam();
                fillTeamGrid();
            }
            else
            {
                getcon();
                if (teamMemberPhoto.HasFile)
                {
                    teamImgUpload();
                    cmd = new SqlCommand("update Placement_Team set MemberName='" + teamMemberName.Text + "',MemberRole='" + teamMemberRole.Text + "',MemberDesc='" + teamMemberDesc.Text + "',MemberMobile='" + teamMemberMobile.Text + "',MemberEmail='" + teamMemberEmail.Text + "',MemberPhoto='" + fnm + "' where MemberName='" + ViewState["teamname"] + "'", con);
                }
                else
                {
                    cmd = new SqlCommand("update Placement_Team set MemberName='" + teamMemberName.Text + "',MemberRole='" + teamMemberRole.Text + "',MemberDesc='" + teamMemberDesc.Text + "',MemberMobile='" + teamMemberMobile.Text + "',MemberEmail='" + teamMemberEmail.Text + "' where MemberName='" + ViewState["teamname"] + "'", con);
                }
                cmd.ExecuteNonQuery();
                fillTeamGrid();
                clearTeam();
                teamSubmitBtn.Text = "Add Team Member";
            }
        }

        protected void GridViewTeam_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_tedt")
            {
                string name = e.CommandArgument.ToString();
                ViewState["teamname"] = name;
                teamSubmitBtn.Text = "Update";
                fillTeamData();
            }
            else
            {
                getcon();
                cmd = new SqlCommand("delete from Placement_Team where MemberName='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillTeamGrid();
            }
        }

        protected void teamCancelBtn_Click(object sender, EventArgs e)
        {
            clearTeam();
        }
    }
}