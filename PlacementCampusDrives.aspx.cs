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
    public partial class PlacementCampusDrives : System.Web.UI.Page
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
                LoadPublicDrives();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadPublicDrives()
        { 
            getcon();
            da = new SqlDataAdapter ("select cd.*, rac.compName, rac.compLogo from Company_Drives cd LEFT JOIN register_auth_company rac ON cd.CompanyUsername = rac.compUsername order by cd.Id desc",con);
            ds = new DataSet();
            da.Fill(ds);
            rptPublicDrives.DataSource = ds;
            rptPublicDrives.DataBind();
        }
    }
}