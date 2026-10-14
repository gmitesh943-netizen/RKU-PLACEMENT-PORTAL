<%@ Page Title="Student Workspace | RKU Placement Portal" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-orange-red: #ef3724;
            --rku-orange-red-dark: #d82b19;
            --rku-dark: #0f172a;
            --rku-gray: #64748b;
            --rku-light: #f8fafc;
            --rku-border: #e2e8f0;
            --card-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            --card-border: 1px solid #e2e8f0;
        }

        /* ─── HERO CARD (Admin Clean White + Left Red/Orange Gradient Accent) ─── */
        .student-hero-banner {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            color: var(--rku-dark) !important;
            padding: 1.75rem 2rem;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .student-hero-banner::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 6px;
                background: linear-gradient(180deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            }

            .student-hero-banner h3 {
                color: var(--rku-dark) !important;
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.65rem;
                letter-spacing: -0.02em;
                margin-bottom: 0.35rem;
            }

            .student-hero-banner p {
                color: var(--rku-gray) !important;
                font-size: 0.88rem;
                line-height: 1.5;
                margin-bottom: 1.25rem;
                max-width: 600px;
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

        .hero-chip {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            color: var(--rku-dark);
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.35rem 0.85rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
        }

        /* ─── BUTTONS (AdminDashboard style) ─── */
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
            display: inline-flex;
            align-items: center;
        }

            .btn-rku-orange:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
                color: #ffffff !important;
            }

        .btn-outline-rku {
            background: #ffffff;
            color: var(--rku-orange-red) !important;
            border: 1.5px solid var(--rku-orange-red);
            font-weight: 600;
            font-size: 0.82rem;
            border-radius: 50px;
            padding: 0.45rem 1rem;
            text-align: center;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.2s ease;
        }

            .btn-outline-rku:hover {
                background: var(--rku-orange-red);
                color: #ffffff !important;
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.2);
                transform: translateY(-1px);
            }

        /* ─── WHITE DASHBOARD CARDS ─── */
        .portal-card, .dash-card-white {
            background: #ffffff;
            border-radius: 18px;
            border: 1px solid var(--rku-border);
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            transition: all 0.25s ease;
            height: 100%;
        }

            .portal-card:hover, .dash-card-white:hover {
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
            }

        /* ─── 4 STAT KPI CARDS (AdminDashboard style) ─── */
        .stat-card-clean {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-top: 4px solid var(--rku-orange-red);
            border-radius: 16px;
            padding: 1.35rem 1.4rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

            .stat-card-clean:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 28px rgba(239, 55, 36, 0.1);
                border-color: #fca5a5;
            }

        .stat-icon-square, .stat-icon-chip {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            flex-shrink: 0;
            transition: all 0.25s ease;
        }

        .stat-card-clean:hover .stat-icon-square,
        .stat-card-clean:hover .stat-icon-chip {
            background: var(--rku-orange-red);
            color: #ffffff;
        }

        .stat-blue {
            background: #eff6ff;
            color: #2563eb;
        }

        .stat-card-clean:hover .stat-blue {
            background: #2563eb;
            color: #ffffff;
        }

        .stat-amber {
            background: #fffbeb;
            color: #d97706;
        }

        .stat-card-clean:hover .stat-amber {
            background: #d97706;
            color: #ffffff;
        }

        .stat-green {
            background: #ecfdf5;
            color: #16a34a;
        }

        .stat-card-clean:hover .stat-green {
            background: #16a34a;
            color: #ffffff;
        }

        .stat-red {
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
        }

        .stat-card-clean:hover .stat-red {
            background: var(--rku-orange-red);
            color: #ffffff;
        }

        .stat-number-lg, .stat-num-black {
            font-family: var(--font-heading);
            font-weight: 800;
            color: var(--rku-dark);
            font-size: 2.2rem;
            line-height: 1.1;
            margin: 0.25rem 0 0 0;
        }

        .stat-label-sub {
            font-size: 0.72rem;
            font-weight: 700;
            color: var(--rku-gray);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 3px;
        }

        /* ─── INTERVIEW CALL ALERT CARD (White + Red/Orange Left Accent) ─── */
        .interview-alert-card {
            background: #ffffff;
            border-radius: 18px;
            border: 1px solid var(--rku-border);
            border-left: 6px solid var(--rku-orange-red);
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            margin-bottom: 1.5rem;
        }

        .interview-inner-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 14px;
            padding: 1.25rem;
            transition: all 0.25s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

            .interview-inner-card:hover {
                transform: translateY(-2px);
                border-color: var(--rku-orange-red);
                box-shadow: 0 8px 20px rgba(239, 55, 36, 0.08);
            }

        /* ─── DRIVE ALERT CARDS ─── */
        .drive-card-item {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 16px;
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            transition: all 0.25s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

            .drive-card-item:hover {
                transform: translateY(-3px);
                border-color: var(--rku-orange-red);
                box-shadow: 0 10px 25px rgba(239, 55, 36, 0.08);
            }

        .company-logo-avatar {
            width: 44px;
            height: 44px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid var(--rku-border);
            background: #ffffff;
            padding: 2px;
            flex-shrink: 0;
        }

        .pkg-info-box {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            border-radius: 10px;
            padding: 0.5rem 0.75rem;
        }

        .btn-apply-rku {
            background: var(--rku-orange-red);
            color: #ffffff !important;
            border: 1px solid var(--rku-orange-red);
            font-weight: 600;
            font-size: 0.82rem;
            border-radius: 50px;
            padding: 0.45rem 1rem;
            text-align: center;
            display: block;
            text-decoration: none;
            transition: all 0.2s ease;
        }

            .btn-apply-rku:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
                transform: translateY(-1px);
                color: #ffffff !important;
            }

        .readiness-check-row {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            border-radius: 12px;
            padding: 0.65rem 0.95rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

            .readiness-check-row span {
                font-size: 0.84rem;
                font-weight: 600;
                color: var(--rku-dark);
            }

        /* ─── DATA TABLES (AdminDashboard custom-dash-table style) ─── */
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

        /* ─── Responsive GridView Card Grids ─── */
        .drives-gridview, .interviews-gridview {
            display: block !important;
            width: 100% !important;
            border: none !important;
            background: transparent !important;
        }

            .drives-gridview > tbody, .interviews-gridview > tbody {
                display: grid !important;
                grid-template-columns: repeat(auto-fill, minmax(290px, 1fr)) !important;
                gap: 1.25rem !important;
                width: 100% !important;
            }

                .drives-gridview > tbody > tr, .interviews-gridview > tbody > tr {
                    display: flex !important;
                    height: 100% !important;
                    background: transparent !important;
                    border: none !important;
                }

                    .drives-gridview > tbody > tr > td, .interviews-gridview > tbody > tr > td {
                        display: flex !important;
                        flex-direction: column !important;
                        width: 100% !important;
                        height: 100% !important;
                        padding: 0 !important;
                        background: transparent !important;
                        border: none !important;
                    }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- ===== ROW 1: RKU BRAND HERO (LEFT) + PROFILE READINESS (RIGHT) ===== -->
    <div class="row g-4 mb-4">

        <!-- Left: RKU Crimson-Maroon Hero Banner -->
        <div class="col-lg-7">
            <div class="student-hero-banner">
                <div>
                    <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                        <span class="hero-badge-red">
                            <i class="fa-solid fa-graduation-cap me-1"></i>STUDENT WORKSPACE
                        </span>
                        <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold font-monospace">
                            <i class="fa-solid fa-id-badge me-1" style="color: var(--rku-orange-red);"></i>Roll:
                            <asp:Label ID="lblEnrollmentNo" runat="server" Text="-"></asp:Label>
                        </span>
                    </div>

                    <h3>Hello,
                        <asp:Label ID="lblHelloName" runat="server" Text="Student"></asp:Label>!
                        <i class="fa-solid fa-sparkles text-warning ms-1" style="font-size: 1.2rem;"></i>
                    </h3>
                    <p>
                        Your central dashboard for campus placements. Explore live recruiter drives, track interview stages, and apply with your verified profile.
                    </p>
                </div>

                <!-- Info Chips Bar -->
                <div class="d-flex flex-wrap align-items-center gap-2 pt-2 border-top border-light-subtle">
                    <span class="hero-chip">
                        <i class="fa-solid fa-award me-1" style="color: var(--rku-orange-red);"></i>
                        <asp:Label ID="lblDegreeBranch" runat="server" Text="BCA (Computer Science)"></asp:Label>
                    </span>
                    <span class="hero-chip">
                        <i class="fa-solid fa-star text-warning me-1"></i>CPI: <strong class="ms-1" style="color: var(--rku-orange-red);">
                            <asp:Label ID="lblCgpaOverview" runat="server" Text="8.50"></asp:Label></strong>
                    </span>

                    <asp:HyperLink ID="lnkBrowseDrives" runat="server" NavigateUrl="StudentDrives.aspx" CssClass="btn-rku-orange ms-sm-auto shadow-sm"><i class="fa-solid fa-compass me-1"></i>Browse Drives</asp:HyperLink>

                </div>
            </div>
        </div>

        <!-- Right: Profile Readiness Card -->
        <div class="col-lg-5">
            <div class="portal-card d-flex flex-column justify-content-between">
                <div>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">
                                <i class="fa-solid fa-user-check text-success me-1"></i>Profile Readiness
                            </h6>
                            <small class="text-muted" style="font-size: 0.75rem;">Placement Eligibility Index</small>
                        </div>
                        <span class="badge bg-success bg-opacity-10 text-success border border-success-subtle rounded-pill px-3 py-1 fw-bold">
                            <asp:Label ID="lblCompletionPercent" runat="server" Text="0%"></asp:Label>
                            Complete
                        </span>
                    </div>

                    <!-- Progress Bar -->
                    <div class="progress mb-3" style="height: 8px; border-radius: 50px; background-color: #f1f5f9;">
                        <div class="progress-bar bg-success progress-bar-striped progress-bar-animated"
                            id="profileProgressBar" runat="server" role="progressbar" style="width: 0%">
                        </div>
                    </div>

                    <!-- Checklist -->
                    <div>
                        <div class="readiness-check-row">
                            <span><i class="fa-solid fa-id-card text-primary me-2"></i>Basic Registration &amp; Contact</span>
                            <i class="fa-solid fa-circle-check text-success fs-5"></i>
                        </div>
                        <div class="readiness-check-row">
                            <span><i class="fa-solid fa-graduation-cap text-success me-2"></i>Degree, Branch &amp; CGPA</span>
                            <i class="fa-regular fa-circle text-muted fs-5"></i>
                        </div>
                        <div class="readiness-check-row">
                            <span><i class="fa-solid fa-code text-warning me-2"></i>Technical Skills Domain</span>
                            <i class="fa-regular fa-circle text-muted fs-5"></i>
                        </div>
                        <div class="readiness-check-row">
                            <span><i class="fa-solid fa-file-pdf text-danger me-2"></i>Resume PDF Uploaded</span>
                            <i class="fa-regular fa-circle text-muted fs-5"></i>
                        </div>
                    </div>
                </div>

                <asp:HyperLink ID="lnkUpdateProfile" runat="server" NavigateUrl="StudentProfile.aspx" CssClass="btn-outline-rku btn-sm w-100 rounded-pill py-2 mt-2 fw-semibold"><i class="fa-solid fa-pen-to-square me-1"></i>Update Profile &amp; Resume</asp:HyperLink>

            </div>
        </div>

    </div>

    <!-- ===== INTERVIEW CALL & VENUE INFO ALERT (Single Header + Responsive Cards) ===== -->
    <div id="divInterviewAlert" runat="server" class="interview-alert-card mb-4" visible="false">
        <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
            <div class="d-flex align-items-center gap-2">
                <span class="hero-badge-red">
                    <i class="fa-solid fa-bell me-1"></i>INTERVIEW CALL
                </span>
                <h5 class="fw-bold mb-0 text-dark font-heading">Upcoming Interview Schedule</h5>
            </div>
            <asp:HyperLink ID="lnkViewTracker" runat="server" NavigateUrl="StudentApplications.aspx" CssClass="text-success small fw-semibold text-decoration-none">View Details in Tracker <i class="fa-solid fa-arrow-right ms-1"></i> </asp:HyperLink>
        </div>

        <asp:GridView ID="GridViewInterviews" runat="server" AutoGenerateColumns="False" Width="100%"
            GridLines="None" ShowHeader="False" CssClass="interviews-gridview">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="interview-inner-card">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <div class="d-flex align-items-center">
                                    <asp:Image ID="imgIntLogo" runat="server" ImageUrl='<%# "~/Comp_Images/" + Eval("compLogo") %>' Width="46px" Height="46px" CssClass="rounded-3 me-2 border p-1 bg-white shadow-sm flex-shrink-0" onerror="this.style.display='none';" AlternateText="Logo" />

                                    <div class="ms-1">
                                        <h6 class="fw-bold text-dark font-heading mb-0">
                                            <asp:Label ID="lblIntRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                        </h6>
                                        <small class="text-muted">
                                            <i class="fa-regular fa-building me-1"></i>
                                            <asp:Label ID="lblIntComp" runat="server" Text='<%# Eval("compName") != DBNull.Value && !string.IsNullOrEmpty(Eval("compName").ToString()) ? Eval("compName") : Eval("CompanyUsername") %>'></asp:Label>
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <div class="small mb-2 p-2 bg-white rounded border border-light-subtle">
                                <div class="text-primary fw-bold mb-1">
                                    <i class="fa-solid fa-calendar-check me-1"></i>
                                    <asp:Label ID="lblIntDate" runat="server" Text='<%# Eval("InterviewDate") %>'></asp:Label>
                                </div>
                                <div class="mt-1">
                                    <span class="badge bg-danger bg-opacity-10 text-danger border border-danger-subtle px-2 py-1" style="font-size: 0.75rem;">
                                        <i class="fa-solid fa-location-dot me-1"></i>
                                        <asp:Label ID="lblIntVenue" runat="server" Text='<%# Eval("InterviewVenue") %>'></asp:Label>
                                    </span>
                                </div>
                            </div>

                            <%# Eval("Remarks") != DBNull.Value && !string.IsNullOrEmpty(Eval("Remarks").ToString()) ? "<div class='text-muted small fst-italic mt-1'><i class='fa-regular fa-comment-dots me-1'></i>Note: " + Eval("Remarks") + "</div>" : "" %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- ===== ROW 2: LIVE METRICS (4 CARDS) ===== -->
    <div class="row g-3 mb-4">
        <!-- 1. Applied Drives -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card-clean">
                <div>
                    <div class="stat-number-lg">
                        <asp:Label ID="lblStatApplied" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label-sub">Applied Drives</div>
                </div>
                <div class="stat-icon-square stat-blue">
                    <i class="fa-solid fa-file-signature"></i>
                </div>
            </div>
        </div>

        <!-- 2. In Process -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card-clean">
                <div>
                    <div class="stat-number-lg">
                        <asp:Label ID="lblStatShortlisted" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label-sub">In Process / Shortlist</div>
                </div>
                <div class="stat-icon-square stat-amber">
                    <i class="fa-solid fa-user-clock"></i>
                </div>
            </div>
        </div>

        <!-- 3. Offers Placed -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card-clean">
                <div>
                    <div class="stat-number-lg">
                        <asp:Label ID="lblStatOffers" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label-sub">Offers Placed</div>
                </div>
                <div class="stat-icon-square stat-green">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
            </div>
        </div>

        <!-- 4. Active Drives -->
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card-clean">
                <div>
                    <div class="stat-number-lg">
                        <asp:Label ID="lblStatEligible" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label-sub">Active Drives</div>
                </div>
                <div class="stat-icon-square stat-red">
                    <i class="fa-solid fa-bullhorn"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== ROW 3: RECENT DRIVES (LEFT) + APPLICATIONS TRACKER (RIGHT) ===== -->
    <div class="row g-4">

        <!-- Left: Recent Campus Drive Alerts -->
        <div class="col-lg-7">
            <div class="portal-card">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom">
                    <div>
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-solid fa-bullhorn me-2" style="color: var(--rku-orange-red);"></i>Recent Campus Drive Alerts
                        </h6>
                        <small class="text-muted">Newly announced placement drives at RK University.</small>
                    </div>
                    <asp:HyperLink ID="lnkAllDrives" runat="server" NavigateUrl="StudentDrives.aspx" CssClass="btn-rku-orange">All Drives <i class="fa-solid fa-arrow-right ms-1"></i> </asp:HyperLink>
                </div>

                <!-- Drive Cards Grid (Using GridView, No Repeater & No Panel) -->
                <asp:GridView ID="GridViewDrives" runat="server" AutoGenerateColumns="False" Width="100%"
                    GridLines="None" ShowHeader="False" CssClass="drives-gridview">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="drive-card-item">
                                    <div>
                                        <!-- Header: Logo + Role + Status -->
                                        <div class="d-flex align-items-start justify-content-between mb-3">
                                            <div class="d-flex align-items-center">
                                                <asp:Image ID="imgDriveLogo" runat="server" ImageUrl='<%# "~/Comp_Images/" + Eval("compLogo") %>' Width="46px" Height="46px" CssClass="rounded-3 me-2 border p-1 bg-white shadow-sm flex-shrink-0" onerror="this.style.display='none';" AlternateText="Logo" />

                                                <div class="ms-1">
                                                    <h6 class="fw-bold text-dark mb-0 font-heading" style="font-size: 0.95rem; line-height: 1.2;">
                                                        <asp:Label ID="lblDriveRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                                    </h6>
                                                    <small class="text-muted fw-semibold" style="font-size: 0.78rem;">
                                                        <i class="fa-regular fa-building me-1 text-secondary"></i>
                                                        <asp:Label ID="lblDriveComp" runat="server" Text='<%# Eval("compName") != DBNull.Value && !string.IsNullOrEmpty(Eval("compName").ToString()) ? Eval("compName") : "Partner Recruiter" %>'></asp:Label>
                                                    </small>
                                                </div>
                                            </div>
                                            <span class="badge bg-success bg-opacity-10 text-success border border-success-subtle small fw-bold">
                                                <asp:Label ID="lblDriveStatus" runat="server" Text='<%# Eval("DriveStatus") %>'></asp:Label>
                                            </span>
                                        </div>

                                        <!-- Package & Eligibility Box -->
                                        <div class="pkg-info-box d-flex justify-content-between align-items-center mb-3">
                                            <div>
                                                <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.64rem;">Package</small>
                                                <strong class="text-danger font-heading">
                                                    <asp:Label ID="lblDrivePkg" runat="server" Text='<%# Eval("PackageOffered") %>'></asp:Label></strong>
                                            </div>
                                            <div class="text-end">
                                                <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.64rem;">Eligibility</small>
                                                <span class="badge bg-light text-dark border">CPI &ge;
                                                    <asp:Label ID="lblDriveCpi" runat="server" Text='<%# Eval("MinCgpa") %>'></asp:Label></span>
                                            </div>
                                        </div>

                                        <!-- Location & Date -->
                                        <div class="text-muted small mb-3" style="font-size: 0.78rem;">
                                            <div class="mb-1">
                                                <i class="fa-solid fa-location-dot text-danger me-2" style="width: 12px;"></i>
                                                <asp:Label ID="lblDriveVenue" runat="server" Text='<%# Eval("VenueLocation") %>'></asp:Label>
                                            </div>
                                            <div>
                                                <i class="fa-regular fa-calendar-days text-primary me-2" style="width: 12px;"></i>Date: <strong>
                                                    <asp:Label ID="lblDriveDate" runat="server" Text='<%# Eval("DriveDate") %>'></asp:Label></strong>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Apply Button -->
                                    <asp:HyperLink ID="lnkApplyDrive" runat="server" NavigateUrl="StudentDrives.aspx" CssClass="btn-apply-rku"><i class="fa-solid fa-paper-plane me-1"></i>Apply in Drives</asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="text-center py-5 text-muted">
                            <i class="fa-regular fa-calendar-xmark fa-3x mb-3 text-secondary opacity-50"></i>
                            <h6 class="fw-bold text-dark mb-1">No Active Drives Right Now</h6>
                            <p class="mb-0 small">New recruitment drives will appear here as soon as partner recruiters publish them.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <!-- Right: My Recent Applications -->
        <div class="col-lg-5">
            <div class="portal-card">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom">
                    <div>
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-solid fa-briefcase me-2" style="color: var(--rku-orange-red);"></i>My Recent Applications
                        </h6>
                        <small class="text-muted">Live tracking of your submitted drives.</small>
                    </div>
                    <asp:HyperLink ID="lnkTrackAll" runat="server" NavigateUrl="StudentApplications.aspx" CssClass="btn-rku-orange">Track All <i class="fa-solid fa-arrow-right ms-1"></i> </asp:HyperLink>
                </div>

                <!-- Applications Table (Using GridView, No Repeater & No Panel) -->
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="custom-dash-table" GridLines="None" Width="100%">
                        <HeaderStyle CssClass="text-dark small fw-bold" />
                        <Columns>
                            <asp:TemplateField HeaderText="Company &amp; Role">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center">
                                        <asp:Image ID="imgAppLogo" runat="server" ImageUrl='<%# "~/Comp_Images/" + Eval("compLogo") %>' Width="44px" Height="44px" CssClass="rounded-3 me-2 border p-1 bg-white shadow-sm flex-shrink-0" onerror="this.style.display='none';" AlternateText="Logo" />
                                        <div>
                                            <div class="fw-bold text-dark font-heading" style="font-size: 0.88rem;">
                                                <asp:Label ID="lblAppRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                            </div>
                                            <small class="text-muted" style="font-size: 0.76rem;">
                                                <i class="fa-regular fa-building me-1"></i>
                                                <asp:Label ID="lblAppComp" runat="server" Text='<%# Eval("compName") != DBNull.Value && !string.IsNullOrEmpty(Eval("compName").ToString()) ? Eval("compName") : Eval("CompanyUsername") %>'></asp:Label>
                                            </small>
                                        </div>
                                    </div>

                                    <div class="mt-2 p-2 bg-light rounded border border-light-subtle small" style='<%# Eval("InterviewDate") != DBNull.Value && !string.IsNullOrEmpty(Eval("InterviewDate").ToString()) ? "display:block;": "display:none;" %>'>

                                        <div class="text-dark fw-bold">
                                            <i class="fa-solid fa-calendar-check text-primary me-1"></i>
                                            <asp:Label ID="lblAppIntDate" runat="server" Text='<%# Eval("InterviewDate") %>'></asp:Label>
                                        </div>
                                        <div class="mt-1">
                                            <span class="badge bg-danger bg-opacity-10 text-danger border border-danger-subtle px-2 py-1" style="font-size: 0.75rem;">
                                                <i class="fa-solid fa-location-dot me-1"></i>
                                                <asp:Label ID="lblAppIntVenue" runat="server" Text='<%# Eval("InterviewVenue") %>'></asp:Label>
                                            </span>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Applied">
                                <ItemTemplate>
                                    <span class="text-muted small" style="font-size: 0.78rem;">
                                        <asp:Label ID="lblAppAppliedDate" runat="server" Text='<%# Eval("AppliedDate") != DBNull.Value ? Convert.ToDateTime(Eval("AppliedDate")).ToString("dd MMM yyyy") : "-" %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <span class="badge bg-warning bg-opacity-10 text-warning border border-warning-subtle px-2 py-1">
                                        <i class="fa-regular fa-clock me-1"></i>
                                        <asp:Label ID="lblAppStatus" runat="server" Text='<%# Eval("ApplicationStatus") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center py-5 text-muted">
                                <div class="avatar-circle-sm mx-auto mb-3" style="background: #f1f5f9; color: #94a3b8; width: 56px; height: 56px; font-size: 1.4rem;">
                                    <i class="fa-solid fa-briefcase"></i>
                                </div>
                                <h6 class="fw-bold text-dark mb-1">No Applications Yet</h6>
                                <p class="mb-3 small text-muted">You haven't applied to any campus recruitment drives yet.</p>
                                <asp:HyperLink ID="lnkBrowseOpenDrives" runat="server" NavigateUrl="StudentDrives.aspx" CssClass="btn-outline-rku px-4 py-2"><i class="fa-solid fa-compass me-1"></i>Browse Open Drives</asp:HyperLink>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
