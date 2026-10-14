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
    public partial class About : System.Web.UI.Page
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
                datalistSuccess();
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
            da = new SqlDataAdapter("select * from Placement_Team", con);
            ds = new DataSet();
            da.Fill(ds);
            DataListTeam.DataSource = ds;
            DataListTeam.DataBind();
        }

        void datalistSuccess()
        {
            getcon();
            da = new SqlDataAdapter("select * from Success_Stories", con);
            ds = new DataSet();
            da.Fill(ds);
            DataListSuccess.DataSource = ds;
            DataListSuccess.DataBind();
        }
    }
}