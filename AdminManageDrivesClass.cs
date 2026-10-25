using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class AdminManageDrivesClass
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        //SQL QUary datalist ma display karva mate 
        string getBaseQuery()
        {
            return "SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)";
        }

        // search_drives
        public DataSet search_drives(string search)
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return select_all_drives();
            }
            getcon();
            string baseQ = getBaseQuery();
            da = new SqlDataAdapter(baseQ + " WHERE (d.JobRole LIKE '%" + search + "%' OR c.compName LIKE '%" + search + "%' OR c.compIndustry LIKE '%" + search + "%' OR d.VenueLocation LIKE '%" + search + "%' OR d.PackageOffered LIKE '%" + search + "%' OR CAST(d.Id AS VARCHAR) LIKE '%" + search + "%') ORDER BY d.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_drives
        public DataSet select_all_drives()
        {
            getcon();
            string baseQ = getBaseQuery();
            da = new SqlDataAdapter(baseQ + " ORDER BY d.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_drives_by_status
        public DataSet select_drives_by_status(string status)
        {
            getcon();
            string baseQ = getBaseQuery();
            if (string.IsNullOrEmpty(status) || status.ToLower() == "all")
            {
                da = new SqlDataAdapter(baseQ + " ORDER BY d.Id DESC", con);
            }
            else if (status.ToLower() == "open")
            {
                da = new SqlDataAdapter(baseQ + " WHERE d.DriveStatus = 'Open' ORDER BY d.Id DESC", con);
            }
            else if (status.ToLower() == "closed")
            {
                da = new SqlDataAdapter(baseQ + " WHERE d.DriveStatus <> 'Open' ORDER BY d.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter(baseQ + " WHERE d.DriveStatus = '" + status + "' ORDER BY d.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
