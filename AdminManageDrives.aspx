<%@ Page Title="Manage Drives | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-red: #e03627;
            --rku-red-dark: #c5281b;
            --rku-maroon: #991b1b;
            --rku-dark: #0f172a;
        }

        .directory-hero-card {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 16px;
            padding: 1.5rem 1.85rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            margin-top: 0.25rem;
            margin-bottom: 1.5rem;
        }

        .directory-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .directory-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #0f172a !important;
            font-size: 1.75rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .directory-hero-card p {
            color: #64748b !important;
            font-size: 0.92rem;
            line-height: 1.55;
            margin-bottom: 0;
            max-width: 650px;
        }

        .hero-stat-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 0.55rem 1.15rem;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .hero-stat-badge.student-badge {
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
        }

        .hero-stat-badge.company-badge {
            background: #f8fafc;
            color: #0f172a;
            border: 1px solid #e2e8f0;
        }

        /* Filter Tab Buttons */
        .filter-tab-btn {
            font-size: 0.82rem;
            font-weight: 600;
            color: #64748b;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            padding: 0.45rem 1rem;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .filter-tab-btn:hover {
            background: #f8fafc;
            color: #0f172a;
            border-color: #cbd5e1;
        }

        .filter-tab-btn.active {
            background: linear-gradient(135deg, #e03627, #c5281b) !important;
            color: #ffffff !important;
            border-color: transparent !important;
            box-shadow: 0 4px 12px rgba(224, 54, 39, 0.25);
        }

        .tab-count-badge {
            background: #f1f5f9;
            color: #475569;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.78rem;
            font-weight: 800;
        }

        /* Main Card Container */
        .dir-main-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.03);
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .dir-main-card-head {
            padding: 1.15rem 1.5rem;
            background: #ffffff;
            border-bottom: 1px solid #edf2f7;
        }

        /* Custom Grid-Table Styling (Matches dir-table in AdminStudentDirectory) */
        .dir-grid-table {
            width: 100%;
            min-width: 960px;
            background: #ffffff;
        }

        .dir-grid-thead {
            display: flex;
            align-items: center;
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
            padding: 1rem 1.15rem;
            font-weight: 700;
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            color: #475569;
        }

        .dir-grid-trow {
            display: flex;
            align-items: center;
            padding: 1.05rem 1.15rem;
            border-bottom: 1px solid #f1f5f9;
            background: #ffffff;
            font-size: 0.88rem;
            transition: background 0.15s ease;
        }

        .dir-grid-trow:hover {
            background-color: #f8fafc !important;
        }

        /* Badges & Tags */
        .roll-badge {
            background: #f8fafc;
            color: #334155;
            font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
            font-weight: 700;
            font-size: 0.82rem;
            padding: 4px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            display: inline-block;
        }

        .cpi-tag {
            background: #fef2f2;
            color: #e03627;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 6px;
            border: 1px solid #fee2e2;
            font-size: 0.76rem;
            display: inline-block;
        }

        .backlog-tag {
            background: #f8fafc;
            color: #64748b;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            font-size: 0.74rem;
            display: inline-block;
        }

        .company-avatar-fallback {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: #ffffff;
            font-size: 1.05rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            flex-shrink: 0;
        }

        .company-table-logo {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
            background: #ffffff;
            flex-shrink: 0;
            padding: 2px;
        }

        /* Action Buttons */
        .btn-action-profile {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.75rem;
            border-radius: 8px;
            background: #ffffff;
            color: #1e293b;
            border: 1px solid #cbd5e1;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-action-profile:hover {
            background: #0f172a;
            color: #ffffff;
            border-color: #0f172a;
        }

        .btn-action-delete {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.75rem;
            border-radius: 8px;
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-action-delete:hover {
            background: #e03627;
            color: #ffffff;
            border-color: #e03627;
        }

        .drawer-detail-card {
            background: #f8fafc;
            border-radius: 14px;
            padding: 1.15rem;
            border: 1px solid #e2e8f0;
        }

        .offcanvas-profile-drawer {
            width: 460px !important;
            border-left: 1px solid #e2e8f0;
            box-shadow: -5px 0 30px rgba(0,0,0,0.1);
        }

        @media (max-width: 768px) {
            .offcanvas-profile-drawer {
                width: 100% !important;
            }
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

    <!-- Hero Header Banner (Matching AdminStudentDirectory design) -->
    <div class="directory-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="directory-hero-kicker">
                    <i class="fa-solid fa-briefcase me-1"></i> CAMPUS RECRUITMENT
                </div>
                <h2>Campus Placement Drives</h2>
                <p>
                    Manage campus recruitment drives, student eligibility criteria, active corporate openings, and placement schedules.
                </p>
            </div>
            <div class="col-lg-5 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap">
                <span class="hero-stat-badge student-badge shadow-sm">
                    <i class="fa-solid fa-circle-check text-success"></i> Open Drives: <strong><asp:Label ID="statOpenCount" runat="server" Text="0" ClientIDMode="Static"></asp:Label></strong>
                </span>
                <span class="hero-stat-badge company-badge shadow-sm">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i> Closed Drives: <strong><asp:Label ID="statClosedCount" runat="server" Text="0" ClientIDMode="Static"></asp:Label></strong>
                </span>
            </div>
        </div>
    </div>

    <!-- Main Card Container -->
    <div class="dir-main-card">
        <div class="dir-main-card-head">
            <div class="row g-2 justify-content-between align-items-center">
                <div class="col-md-4">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-building-flag me-2" style="color: #e03627;"></i>Recruitment Drives List
                    </h6>
                </div>
                <div class="col-md-8 d-flex gap-2 flex-wrap flex-sm-nowrap justify-content-end align-items-center">
                    <div class="input-group input-group-sm" style="max-width: 280px;">
                        <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm border-start-0" placeholder="Search role, company, venue..."></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-sm btn-danger px-2.5 fw-semibold" Style="border-radius: 0 8px 8px 0;" />
                    </div>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select form-select-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" Style="border-radius: 8px; font-weight: 500; width: auto; max-width: 140px;">
                        <asp:ListItem Value="All" Text="All Drives" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                        <asp:ListItem Value="Closed" Text="Closed"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnClearFilters" runat="server" Text="Reset" OnClick="btnClearFilters_Click" CssClass="btn btn-sm btn-light border px-2.5 fw-semibold" Style="border-radius: 8px;" />
                    <asp:Label ID="driveCountLabel" runat="server" CssClass="tab-count-badge" Text="0 Drives" style="font-size: 0.8rem; padding: 5px 12px;"></asp:Label>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <div class="dir-grid-table">
                <!-- Table Header -->
                <div class="dir-grid-thead">
                    <div style="width: 8%;">Drive ID</div>
                    <div style="width: 28%;">Company &amp; Job Role</div>
                    <div style="width: 20%;">Package &amp; Eligibility</div>
                    <div style="width: 20%;">Date &amp; Venue</div>
                    <div style="width: 10%;">Status</div>
                    <div style="width: 14%; text-align: center;">Actions</div>
                </div>

                <!-- DataList Row Feed -->
                <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div class="dir-grid-trow" 
                             data-search='<%# (Eval("JobRole") + " " + (Eval("compName") != DBNull.Value ? Eval("compName") : "") + " " + Eval("VenueLocation")).ToString().ToLower() %>' 
                             data-status='<%# Eval("DriveStatus") %>'>
                            
                            <!-- Drive ID -->
                            <div style="width: 8%;">
                                <span class="roll-badge">#<%# Eval("Id") %></span>
                            </div>

                            <!-- Company & Job Role -->
                            <div style="width: 28%;" class="d-flex align-items-center gap-3 pe-2">
                                <%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? 
                                    "<img src='" + ResolveUrl(Eval("compLogo").ToString().StartsWith("~") || Eval("compLogo").ToString().StartsWith("/") ? Eval("compLogo").ToString() : "~/CompanyUploads/" + Eval("compLogo")) + "' class='company-table-logo' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Company Logo' />" : "" %>
                                <div class="company-avatar-fallback" style='<%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? "display:none;": "display:inline-flex;" %>'>
                                    <%# Eval("compName") != DBNull.Value && Eval("compName").ToString().Trim().Length > 0 ? Eval("compName").ToString().Trim().Substring(0, 1).ToUpper() : (Eval("JobRole") != null && Eval("JobRole").ToString().Trim().Length > 0 ? Eval("JobRole").ToString().Trim().Substring(0, 1).ToUpper() : "C") %>
                                </div>
                                <div class="overflow-hidden">
                                    <div class="fw-bold font-heading text-dark text-truncate" style="font-size: 0.92rem;"><%# Eval("JobRole") %></div>
                                    <div class="text-muted small mt-0.5 text-truncate" style="font-size: 0.78rem;">
                                        <i class="fa-regular fa-building me-1" style="color: #e03627;"></i>
                                        <%# Eval("compName") != DBNull.Value && !string.IsNullOrEmpty(Eval("compName").ToString()) ? Eval("compName") : "Corporate Partner" %>
                                    </div>
                                </div>
                            </div>

                            <!-- Package & Eligibility -->
                            <div style="width: 20%;" class="pe-2">
                                <div class="d-flex gap-1.5 align-items-center flex-wrap">
                                    <span class="cpi-tag"><i class="fa-solid fa-sack-dollar me-1"></i><%# Eval("PackageOffered") %></span>
                                    <span class="backlog-tag">CGPA &ge; <%# Eval("MinCgpa") %></span>
                                </div>
                            </div>

                            <!-- Date & Venue -->
                            <div style="width: 20%;" class="pe-2">
                                <div class="fw-semibold text-dark small" style="font-size: 0.82rem;">
                                    <i class="fa-regular fa-calendar-days text-danger me-1"></i><%# Eval("DriveDate") %>
                                </div>
                                <div class="text-muted small mt-0.5 text-truncate" style="font-size: 0.78rem;" title='<%# Eval("VenueLocation") %>'>
                                    <i class="fa-solid fa-location-dot text-secondary me-1"></i><%# Eval("VenueLocation") %>
                                </div>
                            </div>

                            <!-- Status -->
                            <div style="width: 10%;">
                                <span class='<%# Eval("DriveStatus").ToString() == "Open" ? "badge bg-success-subtle text-success border border-success-subtle rounded-pill px-2.5 py-1 fw-bold small" : "badge bg-secondary-subtle text-secondary border border-secondary-subtle rounded-pill px-2.5 py-1 fw-bold small" %>'>
                                    <%# Eval("DriveStatus") %>
                                </span>
                            </div>

                            <!-- Actions -->
                            <div style="width: 14%; text-align: center;">
                                <div class="d-flex justify-content-center gap-1.5">
                                    <button type="button" class="btn-action-profile btn-view-drive"
                                        data-id='<%# Eval("Id") %>'
                                        data-role='<%# HttpUtility.HtmlAttributeEncode(Eval("JobRole") != null ? Eval("JobRole").ToString() : "") %>'
                                        data-company='<%# HttpUtility.HtmlAttributeEncode(Eval("compName") != null ? Eval("compName").ToString() : "Corporate Partner") %>'
                                        data-industry='<%# HttpUtility.HtmlAttributeEncode(Eval("compIndustry") != null ? Eval("compIndustry").ToString() : "IT & Software") %>'
                                        data-venue='<%# HttpUtility.HtmlAttributeEncode(Eval("VenueLocation") != null ? Eval("VenueLocation").ToString() : "TBD") %>'
                                        data-package='<%# HttpUtility.HtmlAttributeEncode(Eval("PackageOffered") != null ? Eval("PackageOffered").ToString() : "Best in Industry") %>'
                                        data-cgpa='<%# HttpUtility.HtmlAttributeEncode(Eval("MinCgpa") != null ? Eval("MinCgpa").ToString() : "6.0") %>'
                                        data-date='<%# HttpUtility.HtmlAttributeEncode(Eval("DriveDate") != null ? Eval("DriveDate").ToString() : "TBD") %>'
                                        data-vacancies='<%# HttpUtility.HtmlAttributeEncode(Eval("TotalVacancies") != null ? Eval("TotalVacancies").ToString() : "Multiple") %>'
                                        data-status='<%# HttpUtility.HtmlAttributeEncode(Eval("DriveStatus") != null ? Eval("DriveStatus").ToString() : "Open") %>'
                                        data-description='<%# HttpUtility.HtmlAttributeEncode(Eval("JobDescription") != null ? Eval("JobDescription").ToString() : "No detailed description provided.") %>'
                                        data-logo='<%# ResolveUrl(Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? (Eval("compLogo").ToString().StartsWith("~") || Eval("compLogo").ToString().StartsWith("/") ? Eval("compLogo").ToString() : "~/CompanyUploads/" + Eval("compLogo")) : "") %>'
                                        onclick="viewDriveFromBtn(this);"
                                        title="View Full Drive Details in Drawer">
                                        <i class="fa-regular fa-id-card"></i>Details
                                    </button>
                                    <asp:LinkButton ID="btnDeleteDrive" runat="server" CssClass="btn-action-delete" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure you want to delete this placement drive?');" title="Delete Drive">
                                        <i class="fa-regular fa-trash-can"></i>Delete
                                    </asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:DataList>

                <!-- Empty State Message -->
                <div id="noDrivesMessage" runat="server" visible="false" class="text-center text-muted small py-5">
                    <i class="fa-solid fa-briefcase text-muted opacity-25 mb-3" style="font-size: 3rem;"></i>
                    <h6 class="fw-bold text-dark font-heading">No campus drives found</h6>
                    <p class="text-muted small">No recruitment drives match your current search or filter criteria.</p>
                </div>
            </div>
        </div>

        <!-- Pagination Controls -->
        <div class="pagination d-flex justify-content-center align-items-center gap-3 mt-3 pt-3 border-top">
            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill fw-semibold" />
            <asp:Label ID="lblPages" runat="server" CssClass="pagination-pages" Text="Page 1 of 1" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn btn-sm btn-danger px-3 rounded-pill fw-semibold" />
        </div>
    </div>

    <!-- ==================== OFFCANVAS SIDE DRAWER FOR DRIVE DETAILS ==================== -->
    <div class="offcanvas offcanvas-end offcanvas-profile-drawer" tabindex="-1" id="driveProfileDrawer">
        <div class="offcanvas-header border-bottom py-3 px-4">
            <div>
                <span class="directory-hero-kicker d-block mb-1">RECRUITMENT DRIVE</span>
                <h5 class="offcanvas-title fw-bold text-dark font-heading mb-0">
                    Drive Details #<span id="drawerDriveId"></span>
                </h5>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-4">
            
            <!-- Company & Role Header Card -->
            <div class="d-flex align-items-center gap-3 mb-4 p-3 bg-light rounded-3 border">
                <img id="drawerDriveLogoImg" src="#" class="company-table-logo d-none" alt="Company Logo" />
                <div class="company-avatar-fallback" id="drawerDriveAvatarFallback">
                    C
                </div>
                <div class="flex-grow-1 overflow-hidden">
                    <h5 class="fw-bold text-dark mb-0 font-heading" id="drawerDriveRole">Job Role</h5>
                    <div class="text-muted small mt-0.5" id="drawerDriveCompany">Company Name</div>
                    <div class="mt-1">
                        <span class="badge bg-secondary-subtle text-secondary small px-2 py-0.5 rounded-pill" id="drawerDriveIndustry">IT &amp; Software</span>
                    </div>
                </div>
            </div>

            <!-- Status Banner -->
            <div class="d-flex justify-content-between align-items-center mb-3 p-3 bg-white border rounded-3">
                <span class="text-muted small fw-bold text-uppercase">Drive Status:</span>
                <span id="drawerDriveStatus" class="badge bg-success-subtle text-success border border-success-subtle rounded-pill px-3 py-1.5 fw-bold">Open</span>
            </div>

            <!-- Key Drive Metrics Card -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-3">
                    <i class="fa-solid fa-list-check me-2" style="color: #e03627;"></i>Drive Overview
                </h6>
                <div class="row g-3 small">
                    <div class="col-6">
                        <span class="text-muted d-block">Package Offered:</span>
                        <strong class="text-danger fs-6" id="drawerDrivePackage">8.5 LPA</strong>
                    </div>
                    <div class="col-6">
                        <span class="text-muted d-block">Eligibility:</span>
                        <strong class="text-dark" id="drawerDriveCgpa">CGPA &ge; 7.0</strong>
                    </div>
                    <div class="col-6">
                        <span class="text-muted d-block">Drive Date:</span>
                        <strong class="text-dark" id="drawerDriveDate">25 Nov 2026</strong>
                    </div>
                    <div class="col-6">
                        <span class="text-muted d-block">Total Vacancies:</span>
                        <strong class="text-dark" id="drawerDriveVacancies">15 Openings</strong>
                    </div>
                    <div class="col-12">
                        <span class="text-muted d-block">Drive Venue / Mode:</span>
                        <strong class="text-dark" id="drawerDriveVenue">Main Seminar Hall</strong>
                    </div>
                </div>
            </div>

            <!-- Job Description Card -->
            <div class="drawer-detail-card mb-4">
                <h6 class="fw-bold text-dark small mb-2">
                    <i class="fa-regular fa-file-lines me-2" style="color: #e03627;"></i>Job Description
                </h6>
                <div class="p-3 bg-white rounded-3 border text-secondary small" id="drawerDriveDescription" style="white-space: pre-wrap; line-height: 1.6; max-height: 220px; overflow-y: auto;">
                    Job description goes here...
                </div>
            </div>

            <!-- Close Action -->
            <button type="button" class="btn btn-light border w-100 py-2 rounded-pill fw-semibold text-secondary" data-bs-dismiss="offcanvas">
                Close Details
            </button>
        </div>
    </div>

    <!-- Client-Side Filtering and Side Drawer Script -->
    <script>
        let driveDrawerInst = null;

        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-drives');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Campus Placement Drives';
        });

        function viewDriveFromBtn(btn) {
            const id = btn.getAttribute('data-id') || '';
            const role = btn.getAttribute('data-role') || 'Role';
            const company = btn.getAttribute('data-company') || 'Company';
            const industry = btn.getAttribute('data-industry') || 'Industry';
            const venue = btn.getAttribute('data-venue') || 'TBD';
            const pkg = btn.getAttribute('data-package') || 'Negotiable';
            const cgpa = btn.getAttribute('data-cgpa') || '0.0';
            const date = btn.getAttribute('data-date') || 'TBD';
            const vacancies = btn.getAttribute('data-vacancies') || 'TBD';
            const status = btn.getAttribute('data-status') || 'Open';
            const desc = btn.getAttribute('data-description') || 'No description provided.';
            const logo = btn.getAttribute('data-logo') || '';

            document.getElementById('drawerDriveId').innerText = id;
            document.getElementById('drawerDriveRole').innerText = role;
            document.getElementById('drawerDriveCompany').innerText = company;
            document.getElementById('drawerDriveIndustry').innerText = industry;
            document.getElementById('drawerDriveVenue').innerText = venue;
            document.getElementById('drawerDrivePackage').innerText = pkg;
            document.getElementById('drawerDriveCgpa').innerText = 'CGPA >= ' + cgpa;
            document.getElementById('drawerDriveDate').innerText = date;
            document.getElementById('drawerDriveVacancies').innerText = vacancies;
            document.getElementById('drawerDriveDescription').innerText = desc;

            const statusBadge = document.getElementById('drawerDriveStatus');
            statusBadge.innerText = status;
            if (status.toLowerCase() === 'open') {
                statusBadge.className = 'badge bg-success-subtle text-success border border-success-subtle rounded-pill px-3 py-1.5 fw-bold';
            } else {
                statusBadge.className = 'badge bg-secondary-subtle text-secondary border border-secondary-subtle rounded-pill px-3 py-1.5 fw-bold';
            }

            const logoImg = document.getElementById('drawerDriveLogoImg');
            const fallback = document.getElementById('drawerDriveAvatarFallback');
            if (logo && logo.trim() !== '') {
                logoImg.src = logo;
                logoImg.classList.remove('d-none');
                fallback.classList.add('d-none');
            } else {
                logoImg.classList.add('d-none');
                fallback.classList.remove('d-none');
                fallback.innerText = company.trim().length > 0 ? company.trim().charAt(0).toUpperCase() : 'C';
            }

            const drawerEl = document.getElementById('driveProfileDrawer');
            if (!driveDrawerInst) {
                driveDrawerInst = new bootstrap.Offcanvas(drawerEl);
            }
            driveDrawerInst.show();
        }
    </script>
</asp:Content>
