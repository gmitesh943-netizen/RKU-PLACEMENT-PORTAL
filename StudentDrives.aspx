<%@ Page Title="Campus Drives | RKU Placement Portal" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="StudentDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentDrives" %>

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
        .drives-hero {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .drives-hero::before {
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

        .drives-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-orange-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
            font-family: var(--font-heading, 'Outfit', sans-serif);
        }

        .drives-hero h2 {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 800;
            color: var(--rku-dark) !important;
            font-size: 1.85rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .drives-hero p {
            margin-bottom: 0;
            color: var(--rku-gray) !important;
            font-size: 0.95rem;
            line-height: 1.6;
            max-width: 650px;
        }

        /* ─── SECTION HEADER ─── */
        .drives-section-header {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: var(--rku-orange-red);
            margin-bottom: 1.25rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid rgba(239, 55, 36, 0.15);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* ─── STAT CARDS (Clean White & Bordered Top Accent) ─── */
        .stat-card-clean {
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
            flex-shrink: 0;
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

        /* ─── FILTER CONTAINER ─── */
        .filter-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.25rem 1.5rem;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.02);
            margin-bottom: 1.5rem;
        }

            .filter-card .form-control, .filter-card .form-select {
                border: 1px solid var(--rku-border);
                border-radius: 10px;
                font-size: 0.88rem;
                padding: 0.55rem 0.9rem;
                transition: all 0.2s ease;
            }

                .filter-card .form-control:focus, .filter-card .form-select:focus {
                    border-color: var(--rku-orange-red);
                    box-shadow: 0 0 0 3px rgba(239, 55, 36, 0.1);
                }

        /* ─── DRIVE CARDS ─── */
        .drive-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.5rem;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.02);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
        }

            .drive-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 14px 30px rgba(15, 23, 42, 0.07);
                border-color: #fca5a5;
            }

        .company-logo {
            width: 48px;
            height: 48px;
            object-fit: cover;
            border-radius: 12px;
            border: 1px solid var(--rku-border);
            padding: 3px;
            background: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
        }

        .drive-title {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 700;
            font-size: 1.05rem;
            color: var(--rku-dark);
            line-height: 1.25;
            margin-bottom: 2px;
        }

        .company-name {
            color: var(--rku-gray);
            font-size: 0.82rem;
            font-weight: 600;
        }

        .pkg-highlight-box {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            border-radius: 12px;
            padding: 0.75rem 1rem;
        }

        .info-pill-item {
            font-size: 0.82rem;
            color: var(--rku-gray);
            display: flex;
            align-items: center;
            margin-bottom: 0.45rem;
        }

            .info-pill-item i {
                width: 20px;
                color: var(--rku-orange-red);
                margin-right: 6px;
                text-align: center;
            }

        /* ─── BUTTONS ─── */
        .btn-rku {
            background: var(--rku-orange-red);
            color: #ffffff !important;
            border: 1px solid var(--rku-orange-red);
            font-weight: 600;
            font-family: var(--font-heading, 'Outfit', sans-serif);
            border-radius: 50px;
            padding: 0.45rem 1.25rem;
            transition: all 0.25s ease;
            box-shadow: 0 2px 8px rgba(239, 55, 36, 0.2);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 0.82rem;
        }

            .btn-rku:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                box-shadow: 0 4px 14px rgba(239, 55, 36, 0.35);
                transform: translateY(-1px);
                color: #ffffff !important;
            }

        .status-badge-open {
            background: #ecfdf5;
            color: #059669;
            border: 1px solid #a7f3d0;
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.3rem 0.75rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .status-badge-closed {
            background: #f1f5f9;
            color: var(--rku-gray);
            border: 1px solid var(--rku-border);
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.3rem 0.75rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .sd-desc-text {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            font-size: 0.82rem;
            line-height: 1.5;
            color: var(--rku-gray);
        }

        /* ─── FLEXBOX GRID LAYOUT FOR HORIZONTAL CARDS ─── */
        .drives-grid {
            display: flex !important;
            flex-wrap: wrap !important;
            margin-left: -0.75rem !important;
            margin-right: -0.75rem !important;
            row-gap: 1.5rem !important;
            width: calc(100% + 1.5rem) !important;
        }

            .drives-grid > span:empty {
                display: none !important;
            }

            .drives-grid > span {
                display: flex !important;
                flex: 0 0 33.333333% !important;
                max-width: 33.333333% !important;
                padding-left: 0.75rem !important;
                padding-right: 0.75rem !important;
                box-sizing: border-box !important;
            }

        @media (max-width: 1199px) {
            .drives-grid > span {
                flex: 0 0 50% !important;
                max-width: 50% !important;
            }
        }

        @media (max-width: 767px) {
            .drives-grid > span {
                flex: 0 0 100% !important;
                max-width: 100% !important;
            }
        }

        .drives-grid .drive-item {
            width: 100% !important;
            display: flex !important;
            flex-direction: column !important;
        }

        /* Pagination */
        .pagination-pages {
            font-weight: 700;
            font-size: 0.88rem;
            color: var(--rku-dark);
            padding: 0 0.5rem;
        }

        .btn-rku-orange {
            background: linear-gradient(135deg, #ef3724 0%, #d82b19 100%) !important;
            background-color: #ef3724 !important;
            border: 1px solid #d82b19 !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            padding: 0.38rem 1.25rem !important;
            border-radius: 50px !important;
            font-size: 0.82rem !important;
            transition: all 0.25s ease !important;
            text-decoration: none !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            box-shadow: 0 2px 8px rgba(239, 55, 36, 0.25) !important;
            cursor: pointer !important;
        }

            .btn-rku-orange:hover {
                background: linear-gradient(135deg, #d82b19 0%, #a30f14 100%) !important;
                background-color: #d82b19 !important;
                border-color: #a30f14 !important;
                color: #ffffff !important;
                transform: translateY(-1px) !important;
                box-shadow: 0 4px 14px rgba(239, 55, 36, 0.35) !important;
            }

        .pagination .btn[disabled],
        .pagination .btn:disabled {
            opacity: 0.5 !important;
            cursor: not-allowed !important;
            pointer-events: none !important;
            box-shadow: none !important;
            transform: none !important;
        }

        .pagination .btn-light {
            background-color: #ffffff !important;
            border: 1px solid #cbd5e1 !important;
            color: #475569 !important;
            border-radius: 50px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Hero Header -->
    <div class="drives-hero">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-briefcase"></i>STUDENT WORKSPACE
                    </span>
                </div>
                <h2 class="mb-1 font-heading">Campus Placement Drives</h2>
                <p>Browse live recruitment drives, check package and eligibility, and apply with your verified profile.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <span class="hero-badge-red" style="font-size: 0.85rem; padding: 0.5rem 1.1rem;">
                    <i class="fa-solid fa-layer-group text-danger me-1"></i>
                    <asp:Label ID="driveCountLabel" runat="server" Text="0 Drives"></asp:Label>
                </span>
            </div>
        </div>
    </div>

    <!-- Alert / Message -->
    <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="alert alert-dismissible fade show mb-4 d-block"></asp:Label>

    <!-- Stat Cards Row -->
    <div class="row g-3 mb-4">
        <!-- 1. Open Drives -->
        <div class="col-12 col-md-4">
            <div class="stat-card-clean" style="border-top-color: #16a34a;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">LIVE DRIVES</span>
                    <div class="stat-icon-chip" style="background: rgba(22, 163, 74, 0.08); color: #16a34a;">
                        <i class="fa-solid fa-door-open"></i>
                    </div>
                </div>
                <div class="stat-label-sub">Open Drives</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="statOpenCount" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- 2. Eligible Drives -->
        <div class="col-12 col-md-4">
            <div class="stat-card-clean" style="border-top-color: #2563eb;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">CRITERIA MATCHED</span>
                    <div class="stat-icon-chip" style="background: rgba(37, 99, 235, 0.08); color: #2563eb;">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                </div>
                <div class="stat-label-sub">Eligible Drives</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="statEligibleCount" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- 3. Applied Drives -->
        <div class="col-12 col-md-4">
            <div class="stat-card-clean" style="border-top-color: var(--rku-orange-red);">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">YOUR SUBMISSIONS</span>
                    <div class="stat-icon-chip">
                        <i class="fa-solid fa-paper-plane"></i>
                    </div>
                </div>
                <div class="stat-label-sub">Applied Drives</div>
                <h3 class="stat-num-black">
                    <asp:Label ID="statAppliedCount" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>
    </div>

    <!-- Search & Filter Card -->
    <div class="filter-card">
        <div class="row g-3 align-items-center">
            <div class="col-12 col-md-6">
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0 text-muted" style="border-color: var(--rku-border); border-radius: 10px 0 0 10px;">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-start-0 ps-0" placeholder="Search by role, company name or industry..." Style="border-radius: 0 10px 10px 0; border-color: var(--rku-border);"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-sm btn-rku px-3 fw-semibold ms-2" Style="border-radius: 8px;" />
                </div>
            </div>

            <div class="col-12 col-md-3">
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                    <asp:ListItem Value="all">All Status (Open &amp; Closed)</asp:ListItem>
                    <asp:ListItem Value="open">Open Only</asp:ListItem>
                    <asp:ListItem Value="closed">Closed Only</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-12 col-md-3">
                <asp:LinkButton ID="btnResetFilter" runat="server" CssClass="btn btn-outline-secondary w-100 rounded-pill fw-semibold" OnClick="btnResetFilter_Click" Style="font-size: 0.85rem; padding: 0.55rem 1rem;">
                    <i class="fa-solid fa-rotate-left me-1"></i>Reset Filter
                </asp:LinkButton>
            </div>
        </div>
    </div>

    <!-- Drives List Section Header -->
    <div class="drives-section-header">
        <i class="fa-solid fa-bullhorn"></i>Available Recruitment Opportunities
   
    </div>

    <!-- DataList Container -->
    <div class="mb-4">
        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" CssClass="drives-grid" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="drive-item" data-company='<%# Eval("compName") %>' data-role='<%# Eval("JobRole") %>' data-industry='<%# Eval("compIndustry") %>' data-status='<%# Eval("DriveStatus") %>'>

                    <div class="drive-card">
                        <div>
                            <!-- Header: Logo + Title + Status -->
                            <div class="d-flex align-items-start justify-content-between mb-3">
                                <div class="d-flex align-items-center gap-3">
                                    <asp:Image ID="imgCompanyLogo" runat="server" ImageUrl='<%# "~/Comp_Images/" + Eval("compLogo") %>' Width="48px" Height="48px" CssClass="company-logo flex-shrink-0" onerror="this.style.display='none';" AlternateText="Logo" />

                                    <div>
                                        <h5 class="drive-title">
                                            <asp:Label ID="lblJobRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                        </h5>
                                        <div class="company-name">
                                            <i class="fa-regular fa-building me-1 text-secondary"></i>
                                            <asp:Label ID="lblCompName" runat="server" Text='<%# Eval("compName") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <span class='<%# Eval("DriveStatus").ToString() == "Open" ? "status-badge-open" : "status-badge-closed" %>'>
                                    <i class="fa-solid fa-circle" style="font-size: 6px;"></i>
                                    <asp:Label ID="lblDriveStatus" runat="server" Text='<%# Eval("DriveStatus") %>'></asp:Label>
                                </span>
                            </div>

                            <!-- Package & Eligibility Box -->
                            <div class="pkg-highlight-box d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.65rem; letter-spacing: 0.05em;">Package</small>
                                    <strong class="text-danger font-heading" style="font-size: 0.95rem;">
                                        <asp:Label ID="lblPackageOffered" runat="server" Text='<%# Eval("PackageOffered") %>'></asp:Label>
                                    </strong>
                                </div>
                                <div class="text-end">
                                    <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.65rem; letter-spacing: 0.05em;">Eligibility</small>
                                    <span class="badge bg-light text-dark border fw-semibold" style="font-size: 0.75rem;">CPI &ge;
                                       
                                        <asp:Label ID="lblMinCgpa" runat="server" Text='<%# Eval("MinCgpa") %>'></asp:Label>
                                    </span>
                                </div>
                            </div>

                            <!-- Drive Metadata -->
                            <div class="mb-3">
                                <div class="info-pill-item">
                                    <i class="fa-solid fa-industry"></i>
                                    <span>
                                        <asp:Label ID="lblIndustry" runat="server" Text='<%# Eval("compIndustry") %>'></asp:Label>
                                    </span>
                                </div>
                                <div class="info-pill-item">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("VenueLocation") %>'></asp:Label>
                                    </span>
                                </div>
                                <div class="info-pill-item">
                                    <i class="fa-regular fa-calendar-days"></i>
                                    <span>Drive Date: <strong>
                                        <asp:Label ID="lblDriveDate" runat="server" Text='<%# Eval("DriveDate") %>'></asp:Label>
                                    </strong></span>
                                </div>
                                <div class="info-pill-item">
                                    <i class="fa-solid fa-users"></i>
                                    <span>Vacancies: <strong>
                                        <asp:Label ID="lblVacancies" runat="server" Text='<%# Eval("TotalVacancies") %>'></asp:Label>
                                        Positions</strong></span>
                                </div>
                            </div>

                            <!-- Job Description -->
                            <p class="sd-desc-text mb-3">
                                <asp:Label ID="lblJobDescription" runat="server" Text='<%# Eval("JobDescription") %>'></asp:Label>
                            </p>
                        </div>

                        <!-- Card Footer Action -->
                        <div class="pt-3 border-top d-flex align-items-center justify-content-between mt-auto">
                            <asp:LinkButton ID="btnApplyDrive" runat="server" CssClass='<%# Eval("ApplyButton").ToString() == "Applied" ? "btn btn-sm btn-outline-success disabled fw-bold rounded-pill px-3" : (Eval("ApplyButton").ToString() == "Closed" ? "btn btn-sm btn-secondary disabled rounded-pill px-3" : "btn-rku btn-sm") %>' Enabled='<%# Eval("ApplyButton").ToString() == "Apply Now" %>' CommandName="Apply" CommandArgument='<%# Eval("Id") %>'><i class='<%# Eval("ApplyButton").ToString() == "Applied" ? "fa-solid fa-circle-check me-1" : (Eval("ApplyButton").ToString() == "Closed" ? "fa-solid fa-lock me-1" : "fa-solid fa-paper-plane me-1") %>'></i><%# Eval("ApplyButton") %></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <!-- Pagination Controls -->
    <div class="pagination d-flex justify-content-center align-items-center gap-3 mt-3 mb-4 pt-3 border-top">
        <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill fw-semibold" />
        <asp:Label ID="lblPages" runat="server" CssClass="pagination-pages" Text="Page 1 of 1" />
        <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn btn-sm btn-rku-orange px-3 rounded-pill fw-semibold" />
    </div>

    <!-- No Result Message -->
    <div id="noResultMessage" runat="server" visible="false" class="text-center py-5">
        <div class="stat-icon-chip mx-auto mb-3" style="width: 60px; height: 60px; background: #f8fafc; color: #94a3b8; font-size: 1.6rem; border: 1px solid var(--rku-border);">
            <i class="fa-solid fa-folder-open"></i>
        </div>
        <h5 class="fw-bold text-dark mb-1 font-heading">No Drives Matching Filter</h5>
        <p class="text-muted small">Try searching with different keywords or reset your filter status.</p>
    </div>

    <!-- Alert Hidden Fields -->
    <asp:HiddenField ID="hfAlertType" runat="server" />
    <asp:HiddenField ID="hfAlertMessage" runat="server" />
</asp:Content>
