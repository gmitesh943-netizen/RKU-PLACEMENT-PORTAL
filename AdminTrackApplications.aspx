<%@ Page Title="Master Application Tracker | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminTrackApplications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminTrackApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-red: #e03627;
            --rku-red-dark: #c5281b;
            --rku-maroon: #991b1b;
            --rku-dark: #0f172a;
            --rku-border: #e2e8f0;
            --rku-gray: #64748b;
        }

        /* ─── HERO HEADER BANNER ─── */
        .directory-hero-card {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 14px;
            padding: 1.15rem 1.5rem;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.02);
            margin-top: 0.25rem;
            margin-bottom: 1.25rem;
        }

        .directory-hero-kicker {
            font-size: 0.72rem;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.25rem;
        }

        .directory-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #0f172a !important;
            font-size: 1.45rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.25rem;
        }

        .directory-hero-card p {
            color: #64748b !important;
            font-size: 0.85rem;
            line-height: 1.45;
            margin-bottom: 0;
            max-width: 680px;
        }

        .hero-stat-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 0.42rem 0.95rem;
            border-radius: 10px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .hero-stat-badge.tracker-badge {
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
        }

        /* ─── 4 STAT KPI CARDS ─── */
        .stat-card-clean {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-top: 3px solid var(--rku-red);
            border-radius: 12px;
            padding: 1rem 1.15rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
            transition: all 0.2s ease;
            position: relative;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .stat-card-clean:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(224, 54, 39, 0.08);
            border-color: #fca5a5;
        }

        .stat-icon-chip {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background: rgba(224, 54, 39, 0.08);
            color: var(--rku-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            transition: all 0.2s ease;
        }

        .stat-card-clean:hover .stat-icon-chip {
            background: var(--rku-red);
            color: #ffffff;
        }

        .stat-card-tag {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            color: var(--rku-gray);
            font-size: 0.68rem;
            font-weight: 600;
            padding: 0.2rem 0.55rem;
            border-radius: 50px;
        }

        .stat-num-black {
            font-family: var(--font-heading);
            font-weight: 800;
            color: var(--rku-dark);
            font-size: 1.55rem;
            line-height: 1.1;
            margin: 0.25rem 0 0 0;
        }

        .stat-watermark-icon {
            position: absolute;
            right: -6px;
            bottom: -8px;
            font-size: 3.4rem;
            color: var(--rku-red);
            opacity: 0.04;
            pointer-events: none;
        }

        /* ─── FILTER CONTAINER ─── */
        .filter-main-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 12px;
            padding: 1rem 1.25rem;
            box-shadow: 0 2px 12px rgba(15, 23, 42, 0.02);
            margin-bottom: 1.25rem;
        }

        .filter-main-card .form-label {
            font-size: 0.76rem;
            font-weight: 600;
            color: #334155;
            margin-bottom: 0.25rem;
        }

        .filter-main-card .form-select,
        .filter-main-card .form-control {
            font-size: 0.82rem;
            height: 36px;
            border-radius: 8px;
            border-color: #cbd5e1;
        }

        .filter-main-card .form-select:focus,
        .filter-main-card .form-control:focus {
            border-color: var(--rku-red);
            box-shadow: 0 0 0 3px rgba(224, 54, 39, 0.12);
        }

        /* ─── MAIN TABLE CONTAINER ─── */
        .dir-main-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(15, 23, 42, 0.02);
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .dir-main-card-head {
            padding: 0.85rem 1.25rem;
            background: #ffffff;
            border-bottom: 1px solid #edf2f7;
        }

        .dir-table {
            margin-bottom: 0;
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .dir-table thead th {
            background: #f8fafc !important;
            color: #475569 !important;
            font-weight: 700 !important;
            font-size: 0.72rem !important;
            text-transform: uppercase !important;
            letter-spacing: 0.05em !important;
            padding: 0.65rem 0.85rem !important;
            border-top: none !important;
            border-bottom: 2px solid #e2e8f0 !important;
            vertical-align: middle;
            white-space: nowrap;
        }

        .dir-table tbody td {
            padding: 0.65rem 0.85rem !important;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
            background: #ffffff;
            font-size: 0.82rem;
            line-height: 1.35;
            transition: background 0.15s ease;
        }

        .dir-table tbody tr:hover td {
            background-color: #f8fafc !important;
        }

        /* Badges & Tags (Medium Proportions) */
        .roll-badge {
            background: #f8fafc;
            color: #334155;
            font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
            font-weight: 700;
            font-size: 0.72rem;
            padding: 1px 6px;
            border-radius: 4px;
            border: 1px solid #e2e8f0;
            display: inline-block;
        }

        .cpi-tag {
            background: #fef2f2;
            color: #e03627;
            font-weight: 700;
            padding: 1px 5px;
            border-radius: 4px;
            border: 1px solid #fee2e2;
            font-size: 0.7rem;
            display: inline-block;
        }

        .student-table-avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            object-fit: cover;
            border: 1.5px solid #ffffff;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
            flex-shrink: 0;
        }

        .student-table-avatar-fallback {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff;
            font-size: 0.82rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 1px 4px rgba(224, 54, 39, 0.2);
            flex-shrink: 0;
        }

        .company-logo-avatar {
            width: 34px;
            height: 34px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background: #fff;
            padding: 2px;
            flex-shrink: 0;
        }

        .company-logo-placeholder {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 0.85rem;
            flex-shrink: 0;
        }

        .resume-view-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 6px;
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
            font-size: 0.8rem;
        }

        .resume-view-btn:hover {
            background: #e03627;
            color: #ffffff;
            transform: scale(1.05);
        }

        .btn-action-delete {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 6px;
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            font-size: 0.78rem;
        }

        .btn-action-delete:hover {
            background: #e03627;
            color: #ffffff;
            border-color: #e03627;
            transform: scale(1.05);
        }

        /* Pagination */
        .pagination-pages {
            font-weight: 700;
            font-size: 0.88rem;
            color: #1e293b;
            padding: 0 0.5rem;
        }

        .pagination .btn[disabled] {
            opacity: 0.45;
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner (Consistent White Card + Red Kicker) -->
    <div class="directory-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="directory-hero-kicker">
                    <i class="fa-solid fa-list-check me-1"></i> Central Application Monitoring
                </div>
                <h2>Master Application Tracker</h2>
                <p>
                    Track student applications across all recruiters, monitor the recruitment funnel, and manage interview schedules.
                </p>
            </div>
            <div class="col-lg-5 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap">
                <span class="hero-stat-badge tracker-badge shadow-sm">
                    <i class="fa-solid fa-layer-group me-1"></i> All Drives &amp; Recruiters
                </span>
            </div>
        </div>
    </div>

    <!-- 4 KPI Stat Cards (Matching Admin Style with Medium Balanced Sizing) -->
    <div class="row g-3 mb-3">
        <div class="col-6 col-lg-3">
            <div class="stat-card-clean">
                <div class="d-flex justify-content-between align-items-start">
                    <div class="stat-icon-chip">
                        <i class="fa-solid fa-file-signature"></i>
                    </div>
                    <span class="stat-card-tag">Total</span>
                </div>
                <div class="mt-2">
                    <div class="stat-num-black"><asp:Label ID="lblKpiTotal" runat="server" Text="0"></asp:Label></div>
                    <div class="text-muted fw-semibold" style="font-size: 0.75rem;">Total Applications</div>
                </div>
                <i class="fa-solid fa-file-signature stat-watermark-icon"></i>
            </div>
        </div>

        <div class="col-6 col-lg-3">
            <div class="stat-card-clean">
                <div class="d-flex justify-content-between align-items-start">
                    <div class="stat-icon-chip" style="background: rgba(14, 165, 233, 0.08); color: #0ea5e9;">
                        <i class="fa-solid fa-user-check"></i>
                    </div>
                    <span class="stat-card-tag">Funnel</span>
                </div>
                <div class="mt-2">
                    <div class="stat-num-black"><asp:Label ID="lblKpiShortlisted" runat="server" Text="0"></asp:Label></div>
                    <div class="text-muted fw-semibold" style="font-size: 0.75rem;">Shortlisted Candidates</div>
                </div>
                <i class="fa-solid fa-user-check stat-watermark-icon" style="color: #0ea5e9;"></i>
            </div>
        </div>

        <div class="col-6 col-lg-3">
            <div class="stat-card-clean">
                <div class="d-flex justify-content-between align-items-start">
                    <div class="stat-icon-chip" style="background: rgba(245, 158, 11, 0.08); color: #f59e0b;">
                        <i class="fa-regular fa-calendar-check"></i>
                    </div>
                    <span class="stat-card-tag">Scheduled</span>
                </div>
                <div class="mt-2">
                    <div class="stat-num-black"><asp:Label ID="lblKpiInterviews" runat="server" Text="0"></asp:Label></div>
                    <div class="text-muted fw-semibold" style="font-size: 0.75rem;">Interviews Scheduled</div>
                </div>
                <i class="fa-regular fa-calendar-check stat-watermark-icon" style="color: #f59e0b;"></i>
            </div>
        </div>

        <div class="col-6 col-lg-3">
            <div class="stat-card-clean">
                <div class="d-flex justify-content-between align-items-start">
                    <div class="stat-icon-chip" style="background: rgba(34, 197, 94, 0.08); color: #22c55e;">
                        <i class="fa-solid fa-trophy"></i>
                    </div>
                    <span class="stat-card-tag">Placed</span>
                </div>
                <div class="mt-2">
                    <div class="stat-num-black"><asp:Label ID="lblKpiSelected" runat="server" Text="0"></asp:Label></div>
                    <div class="text-muted fw-semibold" style="font-size: 0.75rem;">Selected / Placed</div>
                </div>
                <i class="fa-solid fa-trophy stat-watermark-icon" style="color: #22c55e;"></i>
            </div>
        </div>
    </div>

    <!-- Filters & Search Bar Card -->
    <div class="filter-main-card">
        <div class="row g-2 align-items-end">
            <div class="col-md-4">
                <label class="form-label">
                    <i class="fa-solid fa-building me-1 text-secondary"></i>Filter by Company
                </label>
                <asp:DropDownList ID="ddlCompanyFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCompanyFilter_SelectedIndexChanged" CssClass="form-select form-select-sm">
                    <asp:ListItem Value="All">All Companies / Recruiters</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label class="form-label">
                    <i class="fa-solid fa-filter me-1 text-secondary"></i>Filter by Status
                </label>
                <asp:DropDownList ID="ddlStatusFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged" CssClass="form-select form-select-sm">
                    <asp:ListItem Value="All">All Statuses</asp:ListItem>
                    <asp:ListItem Value="Applied">Applied</asp:ListItem>
                    <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                    <asp:ListItem Value="Interview Scheduled">Interview Scheduled</asp:ListItem>
                    <asp:ListItem Value="Selected">Selected / Placed</asp:ListItem>
                    <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label class="form-label">
                    <i class="fa-solid fa-magnifying-glass me-1 text-secondary"></i>Search Student / Roll No
                </label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm" placeholder="Search name, roll no, role..."></asp:TextBox>
            </div>

            <div class="col-md-2 d-flex gap-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-sm btn-rku flex-grow-1" style="border-radius: 8px; font-weight: 600; height: 36px;" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-sm btn-light border" style="border-radius: 8px; font-weight: 600; height: 36px; padding: 0 0.85rem;" />
            </div>
        </div>
    </div>

    <!-- Master Applications Grid Card -->
    <div class="dir-main-card">
        <div class="dir-main-card-head d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center gap-2">
                <i class="fa-solid fa-list-check" style="color: #e03627; font-size: 0.95rem;"></i>
                <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 0.92rem;">
                    Applications Master Roster
                </h6>
            </div>
            <asp:Label ID="lblRecordsCount" runat="server" CssClass="badge bg-light text-dark border px-2.5 py-1 rounded-pill fw-bold" style="font-size: 0.74rem;"></asp:Label>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvMasterApplications" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table align-middle dir-table" GridLines="None"
                ShowHeaderWhenEmpty="True" EmptyDataText="No student applications found matching your criteria."
                OnRowCommand="gvMasterApplications_RowCommand">
                <Columns>
                    <%-- 1. Applicant --%>
                    <asp:TemplateField HeaderText="Applicant">
                        <HeaderStyle Width="24%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? 
                                    "<img src='" + ResolveUrl(Eval("photoUrl").ToString().StartsWith("~") || Eval("photoUrl").ToString().StartsWith("/") || Eval("photoUrl").ToString().StartsWith("http") ? Eval("photoUrl").ToString() : "~/assets/ProfilePhotos/" + Eval("photoUrl")) + "' class='student-table-avatar' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Student Photo' />" : "" %>
                                <div class="student-table-avatar-fallback" style='<%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? "display:none;" : "display:inline-flex;" %>'>
                                    <%# Eval("StudentName") != DBNull.Value && Eval("StudentName").ToString().Trim().Length > 0 ? Eval("StudentName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>
                                </div>
                                <div>
                                    <div class="fw-bold text-dark font-heading" style="font-size: 0.85rem; line-height: 1.2;"><%# Eval("StudentName") %></div>
                                    <div class="d-flex align-items-center gap-1.5 mt-0.5">
                                        <span class="roll-badge"><%# Eval("StudentRollNo") %></span>
                                    </div>
                                    <div class="text-muted mt-0.5" style="font-size: 0.73rem;">
                                        <%# Eval("StudentBranch") %> &bull; <span class="cpi-tag">CGPA: <%# Eval("StudentCgpa") %></span>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 2. Company & Drive --%>
                    <asp:TemplateField HeaderText="Company &amp; Drive">
                        <HeaderStyle Width="22%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? 
                                    "<img src='" + ResolveUrl(Eval("compLogo").ToString().StartsWith("~") || Eval("compLogo").ToString().StartsWith("/") || Eval("compLogo").ToString().StartsWith("http") ? Eval("compLogo").ToString() : "~/CompanyUploads/" + Eval("compLogo")) + "' class='company-logo-avatar' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Company Logo' />" : "" %>
                                <div class="company-logo-placeholder" style='<%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? "display:none;" : "display:inline-flex;" %>'>
                                    <%# Eval("compName") != DBNull.Value && Eval("compName").ToString().Trim().Length > 0 ? Eval("compName").ToString().Trim().Substring(0, 1).ToUpper() : "C" %>
                                </div>
                                <div>
                                    <div class="fw-bold text-dark font-heading" style="font-size: 0.84rem; line-height: 1.2;"><%# Eval("JobRole") %></div>
                                    <div class="text-muted" style="font-size: 0.74rem;"><%# Eval("compName") != DBNull.Value && Eval("compName").ToString() != "" ? Eval("compName") : Eval("CompanyUsername") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 3. Status --%>
                    <asp:TemplateField HeaderText="Status">
                        <HeaderStyle Width="13%" />
                        <ItemTemplate>
                            <span class='badge <%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted") ? "bg-success-subtle text-success border border-success-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Shortlisted" ? "bg-info-subtle text-info border border-info-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Interview Scheduled" ? "bg-primary-subtle text-primary border border-primary-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Rejected" ? "bg-danger-subtle text-danger border border-danger-subtle" : "bg-secondary-subtle text-secondary border"))) %> px-2 py-0.5 rounded-pill fw-semibold' style="font-size: 0.72rem;">
                                <%# Eval("ApplicationStatus") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 4. Interview Schedule & Info --%>
                    <asp:TemplateField HeaderText="Interview Schedule &amp; Info">
                        <HeaderStyle Width="21%" />
                        <ItemTemplate>
                            <%# Eval("InterviewDate") != DBNull.Value && !string.IsNullOrEmpty(Eval("InterviewDate").ToString()) ? 
                                "<div class='fw-bold text-primary' style='font-size: 0.76rem;'><i class='fa-regular fa-calendar-check me-1'></i>" + Eval("InterviewDate") + "</div>" : "<span class='text-muted' style='font-size: 0.74rem;'><em>Pending Scheduling</em></span>" %>
                            <%# Eval("InterviewVenue") != DBNull.Value && !string.IsNullOrEmpty(Eval("InterviewVenue").ToString()) ? 
                                (Eval("InterviewVenue").ToString().ToLower().Contains("http") || Eval("InterviewVenue").ToString().ToLower().Contains("meet") || Eval("InterviewVenue").ToString().ToLower().Contains("zoom") ? 
                                    "<div class='mt-0.5'><a href='" + Eval("InterviewVenue") + "' target='_blank' class='badge bg-primary text-white text-decoration-none' style='font-size:0.7rem; padding: 2px 6px;'><i class='fa-solid fa-video me-1'></i>Meet Link</a></div>" : 
                                    "<div class='text-muted mt-0.5' style='font-size:0.73rem;'><i class='fa-solid fa-location-dot text-danger me-1'></i>" + Eval("InterviewVenue") + "</div>") : "" %>
                            <%# Eval("Remarks") != DBNull.Value && !string.IsNullOrEmpty(Eval("Remarks").ToString()) ? 
                                "<div class='text-secondary fst-italic mt-0.5' style='font-size:0.72rem;'>" + Eval("Remarks") + "</div>" : "" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 5. Applied Date --%>
                    <asp:TemplateField HeaderText="Applied Date">
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <div class="text-muted" style="font-size: 0.76rem; white-space: nowrap;">
                                <i class="fa-regular fa-clock me-1 text-secondary"></i><%# Eval("AppliedDate", "{0:dd MMM yyyy}") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 6. Resume --%>
                    <asp:TemplateField HeaderText="Resume" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle Width="5%" />
                        <ItemTemplate>
                            <%# Eval("StudentResume") != DBNull.Value && !string.IsNullOrEmpty(Eval("StudentResume").ToString()) ? 
                                "<a href='" + ResolveUrl("~/assets/StudentPDF/" + Eval("StudentResume")) + "' target='_blank' class='resume-view-btn' title='View Resume PDF'><i class='fa-solid fa-file-pdf'></i></a>" : 
                                "<span class='text-muted' style='font-size: 0.75rem;'>-</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 7. Actions --%>
                    <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle Width="5%" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>'
                                CssClass="btn-action-delete" OnClientClick="return confirm('Are you sure you want to remove this application record?');"
                                title="Delete Application">
                                <i class="fa-regular fa-trash-can"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center text-muted small py-4">
                        <i class="fa-solid fa-list-check text-muted opacity-25 mb-2" style="font-size: 2.2rem;"></i>
                        <h6 class="fw-bold text-dark font-heading" style="font-size: 0.88rem;">No student applications found</h6>
                        <p class="text-muted" style="font-size: 0.78rem;">Applications submitted by students will appear in this roster.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <!-- Pagination Controls -->
        <div class="pagination d-flex justify-content-center align-items-center gap-3 mt-3 pt-3 border-top">
            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill fw-semibold" />
            <asp:Label ID="lblPages" runat="server" CssClass="pagination-pages" Text="Page 1 of 1" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn btn-sm btn-danger px-3 rounded-pill fw-semibold" />
        </div>
    </div>

</asp:Content>
