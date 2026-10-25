using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class StudentDrivesClass
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

        // select drive SQL Query
        string getBaseQuery(string sess)
        {
            return "SELECT d.*, c.compName, c.compLogo, c.compIndustry, CASE WHEN d.DriveStatus <> 'Open' THEN 'Closed' WHEN EXISTS (SELECT 1 FROM Company_Applications a WHERE a.DriveId = d.Id AND (a.StudentEmail = '" + sess + "' OR a.StudentUsername = '" + sess + "' OR a.StudentRollNo = '" + sess + "')) THEN 'Applied' ELSE 'Apply Now' END AS ApplyButton FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail)";
        }

        // search_drives
        public DataSet search_drives(string search, string sess)
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return select_all_drives(sess);
            }
            getcon();
            string abc  = getBaseQuery(sess);
            da = new SqlDataAdapter(abc + " WHERE (d.JobRole LIKE '%" + search + "%' OR c.compName LIKE '%" + search + "%' OR c.compIndustry LIKE '%" + search + "%' OR d.VenueLocation LIKE '%" + search + "%' OR d.PackageOffered LIKE '%" + search + "%') ORDER BY d.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_drives
        public DataSet select_all_drives(string sess)
        {
            getcon();
            string abc = getBaseQuery(sess);
            da = new SqlDataAdapter(abc + " ORDER BY d.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_drives_by_status
        public DataSet select_drives_by_status(string status, string sess)
        {
            getcon();
            string abc = getBaseQuery(sess);
            if (string.IsNullOrEmpty(status) || status.ToLower() == "all")
            {
                da = new SqlDataAdapter(abc + " ORDER BY d.Id DESC", con);
            }
            else if (status.ToLower() == "open")
            {
                da = new SqlDataAdapter(abc + " WHERE d.DriveStatus = 'Open' ORDER BY d.Id DESC", con);
            }
            else if (status.ToLower() == "closed")
            {
                da = new SqlDataAdapter(abc + " WHERE d.DriveStatus <> 'Open' ORDER BY d.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter(abc + " WHERE d.DriveStatus = '" + status + "' ORDER BY d.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
