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
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillStoriesDataList();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillStoriesDataList()
        {
            if (DataListSuccessStories != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from Success_Stories order by case when PodiumRank='1' then 1 when PodiumRank='2' then 2 when PodiumRank='3' then 3 else 4 end, StoryId desc", con);
                ds = new DataSet();
                da.Fill(ds);
                DataListSuccessStories.DataSource = ds;
                DataListSuccessStories.DataBind();
            }
        }
    }
}