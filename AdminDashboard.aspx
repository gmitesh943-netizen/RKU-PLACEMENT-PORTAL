<%@ Page Title="Admin Dashboard | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminDashboard" %>

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

        /* ─── HERO HEADER (Clean White + Black Text + Red/Orange Accent) ─── */
        .dash-hero-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .dash-hero-card::before {
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
            letter-spacing: 0.5px;
        }

        /* ─── 4 STAT CARDS (White Card + Black Numbers + Red/Orange Icon & Accent) ─── */
        .stat-card-clean {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-top: 4px solid var(--rku-orange-red);
            border-radius: 16px;
            padding: 1.4rem 1.4rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .stat-card-clean:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 28px rgba(239, 55, 36, 0.1);
                border-color: #fca5a5;
            }

        .stat-icon-chip {
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
        }

        .stat-card-clean:hover .stat-icon-chip {
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
            font-family: var(--font-heading);
            font-weight: 800;
            color: var(--rku-dark);
            font-size: 2.2rem;
            line-height: 1.1;
            margin: 0.35rem 0 0 0;
        }

        .stat-watermark-icon {
            position: absolute;
            right: -8px;
            bottom: -10px;
            font-size: 5rem;
            color: var(--rku-orange-red);
            opacity: 0.04;
            pointer-events: none;
        }

        /* ─── QUICK SHORTCUT CARDS ─── */
        .shortcut-card-clean {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-left: 4px solid var(--rku-orange-red);
            border-radius: 14px;
            padding: 1.1rem 1.25rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            text-decoration: none;
            color: var(--rku-dark);
            transition: all 0.25s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

            .shortcut-card-clean:hover {
                background: #fffafa;
                border-color: var(--rku-orange-red);
                color: var(--rku-orange-red);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(239, 55, 36, 0.08);
            }

        .shortcut-icon-chip {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            flex-shrink: 0;
            transition: all 0.25s ease;
        }

        .shortcut-card-clean:hover .shortcut-icon-chip {
            background: var(--rku-orange-red);
            color: #ffffff;
        }

        /* ─── DATA TABLES ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            height: 100%;
        }

        .btn-rku-orange {
            background: var(--rku-orange-red);
            border: 1px solid var(--rku-orange-red);
            color: #ffffff !important;
            font-weight: 600;
            padding: 0.4rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            transition: all 0.25s ease;
            text-decoration: none;
        }

            .btn-rku-orange:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
            }

        .custom-dash-table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }

            .custom-dash-table th {
                background-color: #f8fafc;
                color: var(--rku-dark);
                font-size: 0.74rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.6px;
                padding: 13px 14px;
                border-bottom: 1px solid var(--rku-border);
            }

            .custom-dash-table td {
                padding: 13px 14px;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                font-size: 0.88rem;
            }

            .custom-dash-table tr:last-child td {
                border-bottom: none;
            }

            .custom-dash-table tr:hover td {
                background-color: #fffafa;
            }

        .company-logo-avatar {
            width: 38px;
            height: 38px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid var(--rku-border);
            background: #fff;
            padding: 2px;
            flex-shrink: 0;
        }

        .company-logo-placeholder {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            background: linear-gradient(135deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            color: #fff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 0.95rem;
            flex-shrink: 0;
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
            font-weight: 800;
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

    <!-- Hero Header (White & Dark with Red/Orange Accent) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-shield-halved me-1"></i>TPO CONTROL CENTER
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>System Active
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">TPO Master Dashboard
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Central command center for monitoring real-time placement statistics, campus recruiter drives, student recruitment funnel, and selection outcomes.
               
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <div class="d-inline-flex align-items-center gap-3 p-2 rounded-4 bg-light border">
                    <div class="text-lg-end d-none d-lg-block ps-2">
                        <div class="fw-bold text-dark" style="font-size: 0.92rem;">Training &amp; Placement Cell</div>
                        <div class="text-muted small" style="font-size: 0.78rem;">RK University &bull; Rajkot</div>
                    </div>
                    <div class="avatar-circle text-white fw-extrabold rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 46px; height: 46px; font-size: 1rem; background: var(--rku-orange-red);">
                        TPO
                   
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 4 Clean Stat KPI Cards (White Background + Bold Black Numbers + Red/Orange Icons & Accents) -->
    <div class="row g-3 mb-4">
        <!-- 1. Registered Students -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-user-graduate stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-users"></i>
                        </div>
                        <span class="stat-card-tag">Job Seekers</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Registered Students</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-circle-check text-success me-1"></i>Active Student Profiles
               
                </div>
            </div>
        </div>

        <!-- 2. Registered Companies -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-building-user stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-regular fa-building"></i>
                        </div>
                        <span class="stat-card-tag">Partners</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Registered Companies</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblTotalCompanies" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-handshake text-dark me-1"></i>Corporate Hiring Network
               
                </div>
            </div>
        </div>

        <!-- 3. Campus Drives -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-briefcase stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-calendar-check"></i>
                        </div>
                        <span class="stat-card-tag">Openings</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Campus Drives</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblTotalDrives" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-bolt text-warning me-1"></i>Active Recruitment Events
               
                </div>
            </div>
        </div>

        <!-- 4. Placed Students -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean" style="border-top-color: #d82b19;">
                <i class="fa-solid fa-trophy stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip" style="background: rgba(239,55,36,0.12);">
                            <i class="fa-solid fa-award"></i>
                        </div>
                        <span class="badge rounded-pill px-2.5 py-1 fw-bold" style="background: rgba(239, 55, 36, 0.1); color: var(--rku-orange-red); font-size: 0.74rem;">Rate:
                            <asp:Label ID="lblPlacementRate" runat="server" Text="0%"></asp:Label>
                        </span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Placed Students</div>
                    <h2 class="stat-num-black" style="color: var(--rku-orange-red);">
                        <asp:Label ID="lblPlacedStudents" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-star text-warning me-1"></i>Confirmed Selections
               
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Navigation Shortcuts (White Background + Black Text + Red/Orange Accents) -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-xl-3">
            <asp:HyperLink ID="lnkStudentDirectory" runat="server" NavigateUrl="AdminStudentDirectory.aspx" CssClass="shortcut-card-clean">
                <div class="d-flex align-items-center gap-3">
                    <div class="shortcut-icon-chip">
                        <i class="fa-solid fa-address-book"></i>
                    </div>
                    <div>
                        <div class="small text-muted" style="font-size: 0.74rem;">Manage</div>
                        <div class="fw-bold text-dark small">Student Directory</div>
                    </div>
                </div>
                <i class="fa-solid fa-chevron-right text-muted small"></i>
            </asp:HyperLink>
        </div>

        <div class="col-sm-6 col-xl-3">
            <asp:HyperLink ID="lnkManageDrives" runat="server" NavigateUrl="AdminManageDrives.aspx" CssClass="shortcut-card-clean">
                <div class="d-flex align-items-center gap-3">
                    <div class="shortcut-icon-chip">
                        <i class="fa-solid fa-briefcase"></i>
                    </div>
                    <div>
                        <div class="small text-muted" style="font-size: 0.74rem;">Control</div>
                        <div class="fw-bold text-dark small">Campus Drives</div>
                    </div>
                </div>
                <i class="fa-solid fa-chevron-right text-muted small"></i>
            </asp:HyperLink>
        </div>

        <div class="col-sm-6 col-xl-3">
            <asp:HyperLink ID="lnkTrackApplications" runat="server" NavigateUrl="AdminTrackApplications.aspx" CssClass="shortcut-card-clean">
                <div class="d-flex align-items-center gap-3">
                    <div class="shortcut-icon-chip">
                        <i class="fa-solid fa-layer-group"></i>
                    </div>
                    <div>
                        <div class="small text-muted" style="font-size: 0.74rem;">Master Tracker</div>
                        <div class="fw-bold text-dark small">All Applications</div>
                    </div>
                </div>
                <i class="fa-solid fa-chevron-right text-muted small"></i>
            </asp:HyperLink>
        </div>

        <div class="col-sm-6 col-xl-3">
            <asp:HyperLink ID="lnkContactInquiries" runat="server" NavigateUrl="AdminContactInquiries.aspx" CssClass="shortcut-card-clean">
                <div class="d-flex align-items-center gap-3">
                    <div class="shortcut-icon-chip">
                        <i class="fa-regular fa-envelope"></i>
                    </div>
                    <div>
                        <div class="small text-muted" style="font-size: 0.74rem;">Public Portal</div>
                        <div class="fw-bold text-dark small">Contact Inquiries</div>
                    </div>
                </div>
                <i class="fa-solid fa-chevron-right text-muted small"></i>
            </asp:HyperLink>
        </div>
    </div>

    <!-- 2 Column Master Data Section -->
    <div class="row g-4">
        <!-- Left: Recent Campus Drives -->
        <div class="col-lg-6">
            <div class="dash-card-white">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                    <div>
                        <h5 class="fw-bold text-dark mb-0 font-heading" style="font-size: 1.1rem;">
                            <i class="fa-solid fa-bullhorn me-2" style="color: var(--rku-orange-red);"></i>Recent Campus Drives
                        </h5>
                        <p class="text-muted small mb-0">Latest recruitment drives posted by companies</p>
                    </div>
                    <asp:HyperLink ID="lnkViewAllDrives" runat="server" NavigateUrl="AdminManageDrives.aspx" CssClass="btn-rku-orange">View All</asp:HyperLink>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="gvRecentDrives" runat="server" AutoGenerateColumns="False"
                        CssClass="custom-dash-table" GridLines="None" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Company & Role">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center gap-2">
                                        <asp:Image ID="imgCompLogo" runat="server" ImageUrl='<%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? ResolveUrl(Eval("compLogo").ToString().StartsWith("~") || Eval("compLogo").ToString().StartsWith("/") ? Eval("compLogo").ToString() : "~/CompanyUploads/" + Eval("compLogo")) : "" %>' Visible='<%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) %>' CssClass="company-logo-avatar" AlternateText="Company Logo" onerror="this.style.display='none';" />

                                        <div class="company-logo-placeholder" style='<%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? "display:none;": "display:inline-flex;" %>'>
                                            <asp:Label ID="lblLogoInitial" runat="server" Text='<%# Eval("compName") != DBNull.Value && Eval("compName").ToString().Trim().Length > 0 ? Eval("compName").ToString().Trim().Substring(0, 1).ToUpper() : "C" %>'></asp:Label>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-dark" style="font-size: 0.88rem;">
                                                <asp:Label ID="lblJobRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                            </div>
                                            <div class="text-muted small">
                                                <asp:Label ID="lblCompName" runat="server" Text='<%# Eval("compName") != DBNull.Value && Eval("compName").ToString() != "" ? Eval("compName") : Eval("CompanyUsername") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package">
                                <ItemTemplate>
                                    <span class="badge bg-light text-dark border fw-bold px-2 py-1">
                                        <asp:Label ID="lblPackageOffered" runat="server" Text='<%# Eval("PackageOffered") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Drive Date">
                                <ItemTemplate>
                                    <div class="small text-muted">
                                        <i class="fa-regular fa-calendar me-1"></i>
                                        <asp:Label ID="lblDriveDate" runat="server" Text='<%# Eval("DriveDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge <%# Eval("DriveStatus") != DBNull.Value && Eval("DriveStatus").ToString() == "Open" ? "bg-success-subtle text-success border border-success-subtle" : "bg-secondary-subtle text-secondary border" %> px-2 py-1 rounded-pill fw-bold small'>
                                        <asp:Label ID="lblDriveStatus" runat="server" Text='<%# Eval("DriveStatus") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center text-muted py-4 small">
                                <i class="fa-solid fa-briefcase mb-2 d-block fs-4 text-muted opacity-50"></i>
                                <asp:Label ID="lblNoDrives" runat="server" Text="No campus drives scheduled yet."></asp:Label>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Right: Recent Student Applications -->
        <div class="col-lg-6">
            <div class="dash-card-white">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                    <div>
                        <h5 class="fw-bold text-dark mb-0 font-heading" style="font-size: 1.1rem;">
                            <i class="fa-solid fa-file-signature me-2" style="color: var(--rku-orange-red);"></i>Recent Student Applications
                        </h5>
                        <p class="text-muted small mb-0">Live stream of student job submissions</p>
                    </div>
                    <asp:HyperLink ID="lnkViewAllApplications" runat="server" NavigateUrl="AdminTrackApplications.aspx" CssClass="btn-rku-orange">View All</asp:HyperLink>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="gvRecentApplications" runat="server" AutoGenerateColumns="False"
                        CssClass="custom-dash-table" GridLines="None" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Student">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center gap-2">
                                        <asp:Image ID="imgStudentPhoto" runat="server" ImageUrl='<%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? ResolveUrl(Eval("photoUrl").ToString().StartsWith("~") || Eval("photoUrl").ToString().StartsWith("/") ? Eval("photoUrl").ToString() : "~/assets/ProfilePhotos/" + Eval("photoUrl")) : "" %>' Visible='<%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) %>' CssClass="candidate-img" AlternateText="Student Photo" onerror="this.style.display='none';" />
                                        <div class="candidate-avatar" style='<%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? "display:none;": "display:inline-flex;" %>'>
                                            <asp:Label ID="lblStudentInitial" runat="server" Text='<%# Eval("StudentName") != null && Eval("StudentName").ToString().Trim().Length > 0 ? Eval("StudentName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>'></asp:Label>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-dark" style="font-size: 0.88rem;">
                                                <asp:Label ID="lblStudentName" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                                            </div>
                                            <div class="text-muted small" style="font-size: 0.78rem;">
                                                <asp:Label ID="lblStudentRollNo" runat="server" Text='<%# Eval("StudentRollNo") %>'></asp:Label>
                                                &bull; 
                                               
                                                <asp:Label ID="lblStudentBranch" runat="server" Text='<%# Eval("StudentBranch") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Applied For">
                                <ItemTemplate>
                                    <div class="fw-semibold text-dark small">
                                        <asp:Label ID="lblAppJobRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                    </div>
                                    <div class="text-muted small" style="font-size: 0.78rem;">
                                        <asp:Label ID="lblAppCompName" runat="server" Text='<%# Eval("compName") != DBNull.Value && Eval("compName").ToString() != "" ? Eval("compName") : Eval("CompanyUsername") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge <%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted") ? "bg-success-subtle text-success border border-success-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Shortlisted" ? "bg-info-subtle text-info border border-info-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Rejected" ? "bg-danger-subtle text-danger border border-danger-subtle" : "bg-warning-subtle text-warning border border-warning-subtle")) %> px-2 py-1 rounded-pill fw-bold small'>
                                        <asp:Label ID="lblApplicationStatus" runat="server" Text='<%# Eval("ApplicationStatus") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Applied On">
                                <ItemTemplate>
                                    <div class="small text-muted" style="font-size: 0.8rem;">
                                        <asp:Label ID="lblAppliedDate" runat="server" Text='<%# Eval("AppliedDate", "{0:dd MMM yyyy}") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center text-muted py-4 small">
                                <i class="fa-solid fa-file-lines mb-2 d-block fs-4 text-muted opacity-50"></i>
                                <asp:Label ID="lblNoApps" runat="server" Text="No student applications submitted yet."></asp:Label>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
