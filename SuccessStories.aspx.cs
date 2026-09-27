using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class SuccessStories : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datalist();
                fillStoriesDataList();
                fillFeaturedStory();
                fillTestimonialsDataList();
                fillHallOfFameDataList();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void datalist()
        {
            getcon();
            da = new SqlDataAdapter("select * from Placement_Gallery", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        void fillStoriesDataList()
        {
            getcon();
            da = new SqlDataAdapter("select * from Success_Stories order by case when PodiumRank='1' then 1 when PodiumRank='2' then 2 when PodiumRank='3' then 3 else 4 end, StoryId desc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataListStories.DataSource = ds;
            DataListStories.DataBind();
        }

        void fillFeaturedStory()
        {
            getcon();
            da = new SqlDataAdapter("select top 1 * from Success_Stories where PodiumRank='1' or IsHallOfFame='Yes' order by case when PodiumRank='1' then 1 when IsHallOfFame='Yes' then 2 else 3 end, StoryId desc", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                lblFeaturedName.Text = dr["StudentName"].ToString();
                lblFeaturedDegree.Text = dr["DegreeBranch"].ToString();
                lblFeaturedCompany.Text = dr["Recruiter"].ToString();
                string pkg = dr["Package"].ToString();
                lblFeaturedPackage.Text = (pkg.StartsWith("₹") || pkg.StartsWith("&#8377;")) ? pkg : pkg;

                string testimonial = dr["Testimonial"].ToString();
                if (!string.IsNullOrEmpty(testimonial) && testimonial.Trim() != "")
                {
                    lblFeaturedQuote.Text = testimonial;
                }

                string photo = dr["StudentPhoto"].ToString();
                if (!string.IsNullOrEmpty(photo) && photo.Trim() != "" && photo != "~/assets/PlacmentStudentImage/")
                {
                    imgFeatured.ImageUrl = photo;
                }

                string skills = dr["KeySkills"].ToString();
                if (!string.IsNullOrEmpty(skills) && skills.Trim() != "")
                {
                    string[] skillArr = skills.Split(new char[] { ',', ' ' }, StringSplitOptions.RemoveEmptyEntries);
                    string html = "";
                    foreach (string sk in skillArr)
                    {
                        html += "<span class='skill-badge'>" + sk + "</span>";
                    }
                    litFeaturedSkills.Text = html;
                }
            }
        }

        void fillTestimonialsDataList()
        {
            getcon();
            da = new SqlDataAdapter("select top 2 * from Success_Stories where Testimonial is not null and Testimonial <> '' order by StoryId asc", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                da = new SqlDataAdapter("select top 2 * from Success_Stories order by StoryId asc", con);
                ds = new DataSet();
                da.Fill(ds);
            }
            DataListTestimonials.DataSource = ds;
            DataListTestimonials.DataBind();
        }

        void fillHallOfFameDataList()
        {
            getcon();
            da = new SqlDataAdapter("select top 3 * from Success_Stories where PodiumRank in ('1','2','3') order by case when PodiumRank='2' then 1 when PodiumRank='1' then 2 when PodiumRank='3' then 3 else 4 end", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                da = new SqlDataAdapter("select top 3 * from Success_Stories order by case when PodiumRank='2' then 1 when PodiumRank='1' then 2 when PodiumRank='3' then 3 else 4 end, StoryId desc", con);
                ds = new DataSet();
                da.Fill(ds);
            }
            DataListHallOfFame.DataSource = ds;
            DataListHallOfFame.DataBind();
        }
    }
}