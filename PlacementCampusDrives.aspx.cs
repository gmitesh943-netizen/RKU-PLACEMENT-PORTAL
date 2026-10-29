using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class PlacementCampusDrives : System.Web.UI.Page
    {
        PlacementCampusDrivesClass driveClass = new PlacementCampusDrivesClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void startcon()
        {
            driveClass = new PlacementCampusDrivesClass();
            driveClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            driveClass = new PlacementCampusDrivesClass();
            DataTable dt = driveClass.select_drives().Tables[0];

            rptPublicDrives.DataSource = dt;
            rptPublicDrives.DataBind();
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            rptPublicDrives.DataSource = dt;
            rptPublicDrives.DataBind();
        }

        // SearchButton 
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            driveClass = new PlacementCampusDrivesClass();
            filtergrid(driveClass.search_drives(txtSearch.Text).Tables[0]);
        }

        // Department
        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            driveClass = new PlacementCampusDrivesClass();
            filtergrid(driveClass.select_drives_by_dept(ddlDepartment.SelectedValue).Tables[0]);
        }

        // ResetButton
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlDepartment.SelectedIndex = 0;
            fillgrid();
        }

        // Backward compatibility
        void LoadPublicDrives()
        {
            fillgrid();
        }
    }
}
