<%@ Page Title="Company Dashboard | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyOverview.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-orange-red: #ef3724;
            --rku-orange-red-dark: #d82b19;
            --rku-dark: #0f172a;
            --rku-gray: #64748b;
            --rku-light: #f8fafc;
            --rku-border: #e2e8f0;
        }

        /* ─── HERO HEADER (Clean White + Red/Orange Accent) ─── */
        .page-header-box {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .page-header-box::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 6px;
                background: linear-gradient(180deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            }

        .hero-badge-red {
            background: rgba(239, 55, 36, 0.08);
            border: 1px solid rgba(239, 55, 36, 0.2);
            color: var(--rku-orange-red);
            font-size: 0.76rem;
            font-weight: 700;
            padding: 0.35rem 0.85rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            letter-spacing: 0.5px;
        }

        .page-header-box h3 {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 800;
            color: var(--rku-dark) !important;
            font-size: 1.85rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .page-header-box p {
            color: var(--rku-gray) !important;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 0;
            max-width: 650px;
        }

        .btn-rku-orange {
            background: var(--rku-orange-red);
            border: 1px solid var(--rku-orange-red);
            color: #ffffff !important;
            font-weight: 600;
            padding: 0.5rem 1.25rem;
            border-radius: 50px;
            font-size: 0.85rem;
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
        }

            .btn-rku-orange:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                transform: translateY(-1px);
                box-shadow: 0 6px 16px rgba(239, 55, 36, 0.35);
                color: #ffffff !important;
            }

        /* ─── 4 STAT CARDS (Clean White + Accent Top Border) ─── */
        .stat-card-custom {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-top: 4px solid var(--rku-orange-red);
            border-radius: 16px;
            padding: 1.3rem 1.4rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .stat-card-custom:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 28px rgba(239, 55, 36, 0.1);
                border-color: #fca5a5;
            }

        .stat-icon-wrapper {
            width: 46px;
            height: 46px;
            border-radius: 12px;
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            transition: all 0.25s ease;
            flex-shrink: 0;
        }

        .stat-card-custom:hover .stat-icon-wrapper {
            background: var(--rku-orange-red);
            color: #ffffff;
        }

        .stat-card-tag {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            color: var(--rku-gray);
            font-size: 0.72rem;
            font-weight: 600;
            padding: 0.25rem 0.65rem;
            border-radius: 50px;
        }

        .stat-num-black {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 800;
            color: var(--rku-dark);
            font-size: 2.1rem;
            line-height: 1.1;
            margin: 0.3rem 0 0 0;
        }

        .stat-label-sub {
            font-size: 0.75rem;
            font-weight: 700;
            color: var(--rku-gray);
            text-transform: uppercase;
            letter-spacing: 0.06em;
            margin-top: 6px;
        }

        /* ─── QUICK SHORTCUT CARDS ─── */
        .quick-action-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-left: 4px solid var(--rku-orange-red);
            border-radius: 14px;
            padding: 1.1rem 1.25rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            text-decoration: none !important;
            color: var(--rku-dark);
            transition: all 0.25s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            height: 100%;
        }

            .quick-action-card:hover {
                background: #fffafa;
                border-color: var(--rku-orange-red);
                color: var(--rku-orange-red);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(239, 55, 36, 0.08);
            }

        .quick-action-icon-box {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.15rem;
            flex-shrink: 0;
            transition: all 0.25s ease;
        }

        .quick-action-card:hover .quick-action-icon-box {
            background: var(--rku-orange-red);
            color: #ffffff;
        }

        /* ─── DASHBOARD WHITE BOXES (Charts & Tables) ─── */
        .dashboard-box-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            margin-bottom: 1.25rem;
            height: 100%;
        }

        /* ─── CLEAN DATA TABLES ─── */
        .table-custom-dash {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            margin-bottom: 0;
        }

            .table-custom-dash th {
                background-color: #f8fafc;
                color: var(--rku-dark);
                font-size: 0.74rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.6px;
                padding: 13px 14px;
                border-bottom: 1px solid var(--rku-border);
            }

            .table-custom-dash td {
                padding: 13px 14px;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                font-size: 0.88rem;
                background: #ffffff;
            }

            .table-custom-dash tr:last-child td {
                border-bottom: none;
            }

            .table-custom-dash tr:hover td {
                background-color: #fffafa;
            }

        .candidate-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            color: #ffffff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 0.85rem;
            flex-shrink: 0;
        }

        .candidate-img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
            border: 1.5px solid var(--rku-border);
            flex-shrink: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Page Top Header -->
    <div class="page-header-box">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-briefcase"></i>RECRUITER WORKSPACE
                    </span>
                </div>
                <h3 class="mb-1 fw-bold text-dark font-heading">Welcome,
                    <asp:Label ID="lblHeroCompanyName" runat="server" Text="Company Recruiter"></asp:Label>
                </h3>
                <p>Track live campus placement drives, review candidate applications, manage interviews, and hire talent.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:HyperLink ID="lnkPostDriveHero" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="btn-rku-orange"><i class="fa-solid fa-plus me-1"></i>Post New Drive</asp:HyperLink>
            </div>
        </div>
    </div>

    <!-- Live Statistics Cards -->
    <div class="row g-3 mb-4">
        <!-- 1. Total Registered Students -->
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom" style="border-top-color: #0284c7;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">TALENT POOL</span>
                    <div class="stat-icon-wrapper" style="background: rgba(2, 132, 199, 0.08); color: #0284c7;">
                        <i class="fa-solid fa-user-graduate"></i>
                    </div>
                </div>
                <div class="stat-label-sub">Total Students</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblStatRegisteredStudents" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- 2. Active Drives -->
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom" style="border-top-color: #059669;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">OPEN POSITIONS</span>
                    <div class="stat-icon-wrapper" style="background: rgba(5, 150, 105, 0.08); color: #059669;">
                        <i class="fa-regular fa-building"></i>
                    </div>
                </div>
                <div class="stat-label-sub">My Active Drives</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblStatActiveDrives" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- 3. Applications Received -->
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom" style="border-top-color: var(--rku-orange-red);">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">SUBMISSIONS</span>
                    <div class="stat-icon-wrapper">
                        <i class="fa-solid fa-file-invoice"></i>
                    </div>
                </div>
                <div class="stat-label-sub">Applications</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblStatTotalApps" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- 4. Selected / Hired -->
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom" style="border-top-color: #d97706;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">PLACEMENTS</span>
                    <div class="stat-icon-wrapper" style="background: rgba(217, 119, 6, 0.08); color: #d97706;">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                </div>
                <div class="stat-label-sub">Selected / Hired</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblStatPlacedStudents" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>
    </div>

    <!-- Quick Shortcuts Row -->
    <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
            <asp:HyperLink ID="lnkShortcutDrives" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="quick-action-card"><div class="quick-action-icon-box"><i class="fa-solid fa-bullhorn"></i></div><div><div class="fw-bold text-dark small">Manage Drives</div><div class="text-muted" style="font-size: 0.74rem;">Post &amp; Edit Openings</div></div></asp:HyperLink>
        </div>
        <div class="col-6 col-md-3">
            <asp:HyperLink ID="lnkShortcutApplicants" runat="server" NavigateUrl="CompanyApplicants.aspx" CssClass="quick-action-card" Style="border-left-color: #0284c7;">
                <div class="quick-action-icon-box" style="background: rgba(2, 132, 199, 0.08); color: #0284c7;">
                    <i class="fa-solid fa-user-check"></i>
                </div>
                <div>
                    <div class="fw-bold text-dark small">Review Applicants</div>
                    <div class="text-muted" style="font-size: 0.74rem;">Shortlist &amp; Select</div>
                </div>
            </asp:HyperLink>
        </div>
        <div class="col-6 col-md-3">
            <asp:HyperLink ID="lnkShortcutDirectory" runat="server" NavigateUrl="CompanyStudentDirectory.aspx" CssClass="quick-action-card" Style="border-left-color: #059669;">
                <div class="quick-action-icon-box" style="background: rgba(5, 150, 105, 0.08); color: #059669;">
                    <i class="fa-solid fa-address-book"></i>
                </div>
                <div>
                    <div class="fw-bold text-dark small">Student Directory</div>
                    <div class="text-muted" style="font-size: 0.74rem;">Search Talent &amp; Skills</div>
                </div>
            </asp:HyperLink>
        </div>
        <div class="col-6 col-md-3">
            <asp:HyperLink ID="lnkShortcutProfile" runat="server" NavigateUrl="CompanyProfile.aspx" CssClass="quick-action-card" Style="border-left-color: #d97706;">
                <div class="quick-action-icon-box" style="background: rgba(217, 119, 6, 0.08); color: #d97706;">
                    <i class="fa-solid fa-building-user"></i>
                </div>
                <div>
                    <div class="fw-bold text-dark small">Company Profile</div>
                    <div class="text-muted" style="font-size: 0.74rem;">Update Info &amp; Logo</div>
                </div>
            </asp:HyperLink>
        </div>
    </div>

    <!-- ASP.NET Server Controls: Live Data from Database for Logged-in Company Only -->
    <asp:HiddenField ID="hfFunnelApps" runat="server" Value="0" />
    <asp:HiddenField ID="hfFunnelReview" runat="server" Value="0" />
    <asp:HiddenField ID="hfFunnelShortlisted" runat="server" Value="0" />
    <asp:HiddenField ID="hfFunnelInterviews" runat="server" Value="0" />
    <asp:HiddenField ID="hfFunnelSelected" runat="server" Value="0" />

    <asp:HiddenField ID="hfDeptLabels" runat="server" Value="" />
    <asp:HiddenField ID="hfDeptData" runat="server" Value="" />
    <asp:HiddenField ID="hfDeptTotal" runat="server" Value="0" />

    <!-- Charts Row -->
    <div class="row g-3 mb-4">
        <div class="col-lg-7">
            <div class="dashboard-box-card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-chart-simple text-danger me-2"></i>Recruitment Funnel &amp; Progress
                    </h6>
                    <span class="badge bg-light text-secondary border small fw-semibold">
                        <i class="fa-regular fa-clock me-1"></i>Live Applications
                    </span>
                </div>
                <div class="chart-container-wrapper" style="height: 230px;">
                    <canvas id="admChartGrowth"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="dashboard-box-card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-chart-pie text-danger me-2"></i>Candidate Demographics
                    </h6>
                    <span class="badge bg-light text-secondary border small fw-semibold">By Department</span>
                </div>
                <div class="chart-container-wrapper" style="height: 230px;">
                    <canvas id="admChartDepartment"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Drives & Recent Applications Row -->
    <div class="row g-3">
        <!-- Recent Drives Table -->
        <div class="col-lg-6">
            <div class="dashboard-box-card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-bullhorn text-danger me-2"></i>Recent Campus Drives
                    </h6>
                    <asp:HyperLink ID="lnkViewAllDrives" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="text-danger small fw-bold text-decoration-none">View All &rarr;</asp:HyperLink>

                </div>
                <div class="table-responsive" style="border-radius: 12px; border: 1px solid var(--rku-border); overflow: hidden;">
                    <asp:GridView ID="gvRecentDrives" runat="server" AutoGenerateColumns="False" Width="100%"
                        CssClass="table table-custom-dash align-middle mb-0" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Job Role">
                                <ItemTemplate>
                                    <div class="fw-bold text-dark font-heading">
                                        <asp:Label ID="lblJobRoleDrive" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package">
                                <ItemTemplate>
                                    <span class="fw-bold text-danger font-heading small">
                                        <i class="fa-solid fa-indian-rupee-sign me-0.5"></i>
                                        <asp:Label ID="lblPkgDrive" runat="server" Text='<%# Eval("PackageOffered") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Drive Date">
                                <ItemTemplate>
                                    <div class="small text-muted">
                                        <i class="fa-regular fa-calendar me-1"></i>
                                        <asp:Label ID="lblDateDrive" runat="server" Text='<%# Eval("DriveDate", "{0:dd MMM yyyy}") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge <%# Eval("DriveStatus").ToString() == "Open" ? "bg-success-subtle text-success border border-success-subtle" : "bg-secondary-subtle text-secondary border" %> px-2.5 py-1 rounded-pill fw-bold small'>
                                        <asp:Label ID="lblStatusDrive" runat="server" Text='<%# Eval("DriveStatus") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center text-muted py-4 small">
                                No drives published yet. 
                               
                                <asp:HyperLink ID="lnkCreateDriveEmpty" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="text-danger fw-semibold">Create One</asp:HyperLink>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Recent Applications Table -->
        <div class="col-lg-6">
            <div class="dashboard-box-card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-user-clock text-danger me-2"></i>Recent Applicants
                    </h6>
                    <asp:HyperLink ID="lnkViewAllApplicants" runat="server" NavigateUrl="CompanyApplicants.aspx" CssClass="text-danger small fw-bold text-decoration-none">
                        View All &rarr;
                    </asp:HyperLink>
                </div>
                <div class="table-responsive" style="border-radius: 12px; border: 1px solid var(--rku-border); overflow: hidden;">
                    <asp:GridView ID="gvRecentApplicants" runat="server" AutoGenerateColumns="False" Width="100%"
                        CssClass="table table-custom-dash align-middle mb-0" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Student">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center gap-2">
                                        <!-- Actual Student Profile Photo if exists -->
                                        <%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? 
                                            "<img src='" + ResolveUrl(Eval("photoUrl").ToString().StartsWith("~") || Eval("photoUrl").ToString().StartsWith("/") ? Eval("photoUrl").ToString() : "~/assets/ProfilePhotos/" + Eval("photoUrl")) + "' class='candidate-img' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Student Photo' />" : "" %>

                                        <!-- Fallback Initials Avatar -->
                                        <div class="candidate-avatar" style='<%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? "display:none;": "display:inline-flex;" %>'>
                                            <%# Eval("StudentName") != null && Eval("StudentName").ToString().Trim().Length > 0 ? Eval("StudentName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>
                                        </div>

                                        <div>
                                            <div class="fw-bold text-dark" style="font-size: 0.88rem;">
                                                <asp:Label ID="lblCandidateName" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                                            </div>
                                            <div class="text-muted" style="font-size: 0.72rem;">
                                                <asp:Label ID="lblCandidateRoll" runat="server" Text='<%# Eval("StudentRollNo") %>'></asp:Label>
                                                &bull; 
                                               
                                                <asp:Label ID="lblCandidateBranch" runat="server" Text='<%# Eval("StudentBranch") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Job Role">
                                <ItemTemplate>
                                    <div class="small fw-semibold text-secondary">
                                        <asp:Label ID="lblCandidateRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge <%# Eval("ApplicationStatus").ToString() == "Offer Accepted" || Eval("ApplicationStatus").ToString() == "Selected" ? "bg-success-subtle text-success border border-success-subtle" : (Eval("ApplicationStatus").ToString() == "Shortlisted" ? "bg-info-subtle text-info border border-info-subtle" : "badge bg-light text-dark border") %> px-2.5 py-1 rounded-pill fw-bold small'>
                                        <asp:Label ID="lblCandidateStatus" runat="server" Text='<%# Eval("ApplicationStatus") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center text-muted py-4 small">No applications received yet.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Initialization Script -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-overview');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Company Dashboard Overview';

            initOverviewCharts();
        });

        function initOverviewCharts() {
            // ─── 1. Recruitment Funnel & Progress (Logged-in Company Data) ───
            const fApps = parseInt(document.getElementById('<%= hfFunnelApps.ClientID %>').value) || 0;
            const fReview = parseInt(document.getElementById('<%= hfFunnelReview.ClientID %>').value) || 0;
            const fShort = parseInt(document.getElementById('<%= hfFunnelShortlisted.ClientID %>').value) || 0;
            const fInterviews = parseInt(document.getElementById('<%= hfFunnelInterviews.ClientID %>').value) || 0;
            const fSelected = parseInt(document.getElementById('<%= hfFunnelSelected.ClientID %>').value) || 0;

            const ctxGrowth = document.getElementById('admChartGrowth');
            if (ctxGrowth) {
                new Chart(ctxGrowth, {
                    type: 'bar',
                    data: {
                        labels: ['Applications', 'Under Review', 'Shortlisted', 'Interviews', 'Selected'],
                        datasets: [{
                            label: 'Candidates',
                            data: [fApps, fReview, fShort, fInterviews, fSelected],
                            backgroundColor: [
                                'rgba(239, 55, 36, 0.85)',
                                'rgba(253, 126, 20, 0.85)',
                                'rgba(13, 202, 240, 0.85)',
                                'rgba(37, 99, 235, 0.85)',
                                'rgba(22, 163, 74, 0.85)'
                            ],
                            borderRadius: 8
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: { display: false },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return ' ' + context.parsed.y + ' Candidates';
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 1,
                                    precision: 0,
                                    font: { family: "'Outfit', sans-serif" }
                                },
                                grid: { color: '#f1f5f9' }
                            },
                            x: {
                                grid: { display: false },
                                ticks: { font: { family: "'Outfit', sans-serif" } }
                            }
                        }
                    }
                });
            }

            // ─── 2. Candidate Demographics (Logged-in Company Data - Comma Separated) ───
            const rawLabels = (document.getElementById('<%= hfDeptLabels.ClientID %>').value || '').trim();
            const rawData = (document.getElementById('<%= hfDeptData.ClientID %>').value || '').trim();
            const totalApplicants = parseInt(document.getElementById('<%= hfDeptTotal.ClientID %>').value) || 0;

            const deptLabels = rawLabels ? rawLabels.split(',') : [];
            const deptData = rawData ? rawData.split(',').map(n => parseInt(n) || 0) : [];

            const palette = [
                '#ef3724', '#2563eb', '#16a34a', '#fd7e14', '#0dcef0',
                '#8b5cf6', '#d97706', '#ec4899', '#64748b'
            ];

            const ctxDept = document.getElementById('admChartDepartment');
            if (ctxDept) {
                if (totalApplicants === 0 || deptLabels.length === 0) {
                    new Chart(ctxDept, {
                        type: 'doughnut',
                        data: {
                            labels: ['No Applicants Yet'],
                            datasets: [{
                                data: [1],
                                backgroundColor: ['#e2e8f0']
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: {
                                    position: 'bottom',
                                    labels: { boxWidth: 10, font: { family: "'Outfit', sans-serif", size: 11 } }
                                },
                                tooltip: {
                                    callbacks: {
                                        label: function () {
                                            return ' 0 Applications for this company';
                                        }
                                    }
                                }
                            },
                            cutout: '68%'
                        }
                    });
                } else {
                    const bgColors = deptLabels.map((_, i) => palette[i % palette.length]);

                    new Chart(ctxDept, {
                        type: 'doughnut',
                        data: {
                            labels: deptLabels,
                            datasets: [{
                                data: deptData,
                                backgroundColor: bgColors
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: {
                                    position: 'bottom',
                                    labels: { boxWidth: 10, font: { family: "'Outfit', sans-serif", size: 11 } }
                                },
                                tooltip: {
                                    callbacks: {
                                        label: function (context) {
                                            const val = context.parsed;
                                            const pct = totalApplicants > 0 ? Math.round((val / totalApplicants) * 100) : 0;
                                            return ' ' + context.label + ': ' + val + ' (' + pct + '%)';
                                        }
                                    }
                                }
                            },
                            cutout: '68%'
                        }
                    });
                }
            }
        }
    </script>
</asp:Content>
