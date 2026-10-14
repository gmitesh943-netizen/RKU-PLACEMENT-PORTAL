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
    public partial class PlacmentProminentRecruiters : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                LoadLiveRecruiters();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadLiveRecruiters()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            rptLivePartners.DataSource = ds;
            rptLivePartners.DataBind();
        }
    }
}