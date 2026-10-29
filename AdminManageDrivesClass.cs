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
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // fill grid method
        public DataSet select_drives()
        {
            getcon();
            da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) ORDER BY d.Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  search filter
        public DataSet search_drives(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) ORDER BY d.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) WHERE (d.JobRole LIKE '%" + nm + "%' OR c.compName LIKE '%" + nm + "%' OR c.compIndustry LIKE '%" + nm + "%' OR d.VenueLocation LIKE '%" + nm + "%' OR d.PackageOffered LIKE '%" + nm + "%' OR CAST(d.Id AS VARCHAR) LIKE '%" + nm + "%') ORDER BY d.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  status filter
        public DataSet select_drives_by_status(string status)
        {
            getcon();
            if (status == "all" || status == "All")
            {
                da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) ORDER BY d.Id DESC", con);
            }
            else if (status.ToLower() == "open")
            {
                da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) WHERE d.DriveStatus = 'Open' ORDER BY d.Id DESC", con);
            }
            else if (status.ToLower() == "closed")
            {
                da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) WHERE d.DriveStatus <> 'Open' ORDER BY d.Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT d.*, c.compName, c.compLogo, c.compIndustry FROM Company_Drives d LEFT JOIN register_auth_company c ON (d.CompanyUsername = c.compUsername OR d.CompanyUsername = c.compEmail) WHERE d.DriveStatus = '" + status + "' ORDER BY d.Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Delete drive 
        public void delete_drive(int id)
        {
            getcon();
            cmd = new SqlCommand("delete from Company_Drives where Id = " + id, con);
            cmd.ExecuteNonQuery();
        }

        // Pagination
        public DataTable certificate_pagination(DataTable dt, int page)
        {
            DataTable dt2 = dt.Clone();
            int start = page * 6;
            for (int i = start; i < start + 6 && i < dt.Rows.Count; i++)
            {
                dt2.ImportRow(dt.Rows[i]);
            }
            return dt2;
        }
    }
}
