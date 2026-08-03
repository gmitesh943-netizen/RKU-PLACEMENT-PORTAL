<%@ Page Title="Company Overview | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyOverview.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyOverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific CSS for CompanyOverview -->
    <style>

                        :root {
                            --rku-maroon: #a30f14;
                            --rku-red: #ef3724;
                            --rku-dark: #111111;
                            --sidebar-width: 260px;
                            --font-heading: 'Outfit', sans-serif;
                            --font-body: 'Inter', sans-serif;
                        }

                        body {
                            font-family: var(--font-body);
                            background-color: #f4f6f9;
                        }

                        /* ─── LAYOUT STRUCTURE ─── */
                        .wrapper {
                            display: flex;
                            min-height: 100vh;
                            overflow-x: hidden;
                        }

                        /* ─── SIDEBAR ─── */
                        .sidebar {
                            width: var(--sidebar-width);
                            background: linear-gradient(180deg, var(--rku-red) 0%, var(--rku-maroon) 100%);
                            color: rgba(255,255,255,0.95);
                            position: fixed;
                            top: 0;
                            bottom: 0;
                            left: 0;
                            z-index: 100;
                            transition: all 0.3s ease;
                            box-shadow: 4px 0 15px rgba(0,0,0,0.05);
                            display: flex;
                            flex-direction: column;
                            justify-content: space-between;
                        }

                        .sidebar-brand {
                            padding: 1.5rem;
                            border-bottom: 1px solid rgba(255,255,255,0.05);
                            background-color: rgba(255,255,255,0.03);
                        }

                        .sidebar-menu {
                            list-style: none;
                            padding: 1rem 0;
                            margin: 0;
                            flex-grow: 1;
                        }

                        .sidebar-item a {
                            display: flex;
                            align-items: center;
                            padding: 0.85rem 1.5rem;
                            color: rgba(255,255,255,0.95);
                            font-family: var(--font-heading);
                            font-weight: 500;
                            font-size: 0.95rem;
                            border-left: 4px solid transparent;
                            transition: all 0.25s ease;
                        }

                            .sidebar-item a i {
                                width: 25px;
                                font-size: 1.1rem;
                                margin-right: 10px;
                            }

                            .sidebar-item a:hover, .sidebar-item.active a {
                                color: #fff;
                                background-color: rgba(255,255,255,0.06);
                                border-left-color: #ffffff;
                            }

                        .sidebar-footer {
                            padding: 1.5rem;
                            border-top: 1px solid rgba(255,255,255,0.05);
                            background-color: rgba(255,255,255,0.04);
                        }

                        /* ─── CONTENT AREA ─── */
                        .main-panel {
                            flex-grow: 1;
                            margin-left: var(--sidebar-width);
                            min-height: 100vh;
                            display: flex;
                            flex-direction: column;
                            transition: all 0.3s ease;
                        }

                        .top-navbar {
                            background-color: #fff;
                            padding: 1rem 2rem;
                            border-bottom: 1px solid #eef0f3;
                            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
                            z-index: 99;
                        }

                        .content-container {
                            padding: 2rem;
                            flex-grow: 1;
                        }

                        /* ─── CARD WIDGETS ─── */
                        .dashboard-card {
                            background-color: #fff;
                            border-radius: 12px;
                            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.02);
                            border: 1px solid #eef0f3;
                            padding: 1.5rem;
                            height: 100%;
                            transition: all 0.3s ease;
                        }

                            .dashboard-card:hover {
                                transform: translateY(-2px);
                                box-shadow: 0 8px 20px rgba(0,0,0,0.04);
                            }

                        .company-hero-card {
                            background: linear-gradient(135deg, #ffffff 0%, #f9fafb 100%);
                            border: 1px solid #eef0f3;
                            border-radius: 18px;
                            padding: 1.5rem 1.75rem;
                            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.02);
                        }

                        .company-hero-kicker {
                            font-size: 0.8rem;
                            letter-spacing: 0.16em;
                            text-transform: uppercase;
                            color: var(--rku-red);
                            font-weight: 800;
                            margin-bottom: 0.35rem;
                        }

                        .company-hero-card h2 {
                            font-family: var(--font-heading);
                            font-weight: 800;
                            color: #111;
                            margin-bottom: 0.35rem;
                        }

                        .company-hero-card p {
                            margin-bottom: 0;
                            color: #64748b;
                            font-size: 0.98rem;
                        }

                        .company-hero-avatar {
                            width: 56px;
                            height: 56px;
                            font-size: 1rem;
                        }

                        /* ─── STAT BOXES ─── */
                        .stat-widget {
                            display: flex;
                            align-items: center;
                            background-color: #fff;
                            border-radius: 12px;
                            padding: 1.25rem 1.5rem;
                            border: 1px solid #eef0f3;
                            box-shadow: 0 4px 15px rgba(0,0,0,0.01);
                            margin-bottom: 1.5rem;
                        }

                        .stat-widget-icon {
                            width: 48px;
                            height: 48px;
                            border-radius: 10px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 1.4rem;
                            margin-right: 15px;
                        }

                        .stat-widget-info h3 {
                            margin: 0;
                            font-size: 1.6rem;
                            font-family: var(--font-heading);
                            font-weight: 700;
                        }

                        .stat-widget-info span {
                            font-size: 0.85rem;
                            color: #64748b;
                            font-weight: 500;
                        }

                        /* Colors */
                        .bg-icon-primary {
                            background-color: rgba(163, 15, 20, 0.1);
                            color: var(--rku-maroon);
                        }

                        .bg-icon-success {
                            background-color: rgba(40, 167, 69, 0.1);
                            color: #28a745;
                        }

                        .bg-icon-warning {
                            background-color: rgba(255, 193, 7, 0.1);
                            color: #ffc107;
                        }

                        .bg-icon-info {
                            background-color: rgba(23, 162, 184, 0.1);
                            color: #17a2b8;
                        }

                        /* RKU color utilities */
                        .bg-rku-red {
                            background-color: var(--rku-red) !important;
                            color: #fff !important;
                        }

                        .bg-rku-maroon {
                            background-color: var(--rku-maroon) !important;
                            color: #fff !important;
                        }

                        .text-rku-maroon {
                            color: var(--rku-maroon) !important;
                        }

                        /* ─── TAB TRANSITIONS ─── */
                        .tab-pane-content {
                            display: none;
                        }

                            .tab-pane-content.active {
                                display: block;
                                animation: fadeIn 0.4s ease;
                            }

                        @keyframes fadeIn {
                            from {
                                opacity: 0;
                                transform: translateY(8px);
                            }

                            to {
                                opacity: 1;
                                transform: translateY(0);
                            }
                        }

                        /* Chart Canvas Wrappers */
                        .chart-container-wrapper {
                            position: relative;
                            height: 250px;
                            width: 100%;
                        }

                        /* ─── MOBILE RESPONSIVE ─── */
                        @media (max-width: 991.98px) {
                            .sidebar {
                                left: -260px;
                            }

                                .sidebar.show {
                                    left: 0;
                                }

                            .main-panel {
                                margin-left: 0;
                            }

                            .content-container {
                                padding: 1rem;
                            }
                        }

                        /* ─── MANAGE CONTENT REDESIGN ─── */
                        .section-header {
                            display: flex;
                            align-items: center;
                            gap: 12px;
                            padding: 1rem 1.5rem;
                            background: linear-gradient(135deg, #fff 0%, #f9fafb 100%);
                            border: 1px solid #eef0f3;
                            border-radius: 12px;
                            margin-bottom: 1.5rem;
                        }

                        .section-header-icon {
                            width: 44px;
                            height: 44px;
                            border-radius: 10px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 1.1rem;
                            flex-shrink: 0;
                        }

                        .section-header h5 {
                            margin: 0;
                            font-family: var(--font-heading);
                            font-weight: 700;
                            font-size: 1.05rem;
                            color: #111;
                        }

                        .section-header p {
                            margin: 0;
                            font-size: 0.8rem;
                            color: #888;
                        }

                        .content-section {
                            background: #fff;
                            border: 1px solid #eef0f3;
                            border-radius: 16px;
                            overflow: hidden;
                            margin-bottom: 2rem;
                        }

                        .content-section-head {
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                            padding: 1.25rem 1.5rem;
                            border-bottom: 1px solid #f0f2f5;
                            background: #fafbfc;
                        }

                        .content-section-body {
                            padding: 1.5rem;
                        }

                            .content-section-body.no-pad {
                                padding: 0;
                            }

                        .form-panel {
                            background: #fff;
                            border: 1px solid #eef0f3;
                            border-radius: 16px;
                            overflow: hidden;
                        }

                        .form-panel-head {
                            padding: 1.25rem 1.5rem;
                            border-bottom: 1px solid #f0f2f5;
                            background: #fafbfc;
                        }

                        .form-panel-body {
                            padding: 1.5rem;
                        }

                        .img-upload-zone {
                            border: 2px dashed #dde1e7;
                            border-radius: 10px;
                            padding: 1.5rem;
                            text-align: center;
                            background: #fafbfc;
                            transition: border-color 0.2s ease;
                            cursor: pointer;
                        }

                            .img-upload-zone:hover {
                                border-color: var(--rku-red);
                            }

                        .list-item-row {
                            display: flex;
                            align-items: center;
                            padding: 0.85rem 1.25rem;
                            border-bottom: 1px solid #f5f6f8;
                            transition: background 0.15s ease;
                        }

                            .list-item-row:last-child {
                                border-bottom: none;
                            }

                            .list-item-row:hover {
                                background: #fafbfc;
                            }

                        .badge-story-type {
                            font-size: 0.65rem;
                            padding: 0.25rem 0.6rem;
                            border-radius: 20px;
                            font-weight: 700;
                            letter-spacing: 0.3px;
                        }

                        /* Company Profile Tab Styles */
                        .company-logo-upload-zone {
                            border: 2px dashed #dee2e6;
                            border-radius: 16px;
                            padding: 1.5rem;
                            text-align: center;
                            cursor: pointer;
                            transition: all 0.3s;
                            background: #fafafa;
                        }

                            .company-logo-upload-zone:hover {
                                border-color: var(--rku-red);
                                background: #fff5f5;
                            }

                        .company-logo-preview {
                            width: 100px;
                            height: 100px;
                            object-fit: contain;
                            border-radius: 12px;
                            border: 1px solid #eee;
                            background: #fff;
                            padding: 6px;
                        }

                        .company-logo-placeholder {
                            width: 100px;
                            height: 100px;
                            border-radius: 12px;
                            background: linear-gradient(135deg, #a30f14, #c0392b);
                            display: inline-flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 2rem;
                            font-weight: 900;
                            color: #fff;
                            font-family: var(--font-heading);
                        }

                        .sidebar-company-logo {
                            width: 44px;
                            height: 44px;
                            border-radius: 10px;
                            object-fit: contain;
                            border: 2px solid rgba(255,255,255,0.2);
                            background: #fff;
                            padding: 2px;
                        }

                        .sidebar-company-avatar {
                            width: 44px;
                            height: 44px;
                            border-radius: 10px;
                            background: linear-gradient(135deg, #a30f14, #c0392b);
                            display: inline-flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 1.1rem;
                            font-weight: 900;
                            color: #fff;
                            font-family: var(--font-heading);
                            flex-shrink: 0;
                        }

                        @media (max-width: 991.98px) {
                            .sticky-form {
                                position: static !important;
                            }
                        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

                    <!-- Auth protection script -->
                    <script src="js/portal-db.js"></script>
                    <script>
                        // Check session
                        const currentUser = PortalDB.getCurrentUser();
                        if (!currentUser) {
                            window.location.href = 'Login.aspx';
                        } else if (String(currentUser.role).toLowerCase() !== 'company') {
                            window.location.href = 'Login.aspx';
                        }
                    </script>

                    <div class="wrapper">

                        <!-- ==========================================
             1. SIDEBAR NAVIGATION
             ========================================== -->
                        <aside class="sidebar" id="sidebar">
                            <div>
                                <!-- Brand logo -->
                                <div class="sidebar-brand">
                                    <div class="d-flex align-items-center gap-2">
                                        <div id="sidebarBrandLogoWrap">
                                        </div>
                                        <div class="text-white overflow-hidden">
                                            <div class="fw-bold text-truncate" style="font-size: 0.9rem; line-height: 1.1;" id="sidebarBrandCompanyName">
                                                Company</div>
                                            <div class="text-white-50" style="font-size: 0.72rem; letter-spacing: 0.08em; text-transform: uppercase;">
                                                Company Portal</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Navigation menu -->
                                <ul class="sidebar-menu">
                                    <li class="sidebar-item active" data-tab="tab-overview"><a href="CompanyOverview.aspx"><i class="fa-solid fa-gauge"></i>Overview</a> </li>
                                    <li class="sidebar-item" data-tab="tab-my-profile"><a href="CompanyProfile.aspx"><i class="fa-solid fa-building-user"></i>My Company Profile</a> </li>
                                    <li class="sidebar-item" data-tab="tab-student-directory"><a href="CompanyStudentDirectory.aspx"><i class="fa-solid fa-users"></i>Student Directory</a> </li>
                                </ul>

                                <!-- Company Logo in Sidebar -->
                                <div class="mt-4 px-2" id="sidebarCompanyCard" style="display: none;">
                                    <div class="d-flex align-items-center gap-2 p-2" style="background: rgba(255,255,255,0.06); border-radius: 12px;">
                                        <div id="sidebarCompanyLogoWrap">
                                        </div>
                                        <div style="overflow: hidden;">
                                            <div class="text-white fw-bold" style="font-size: 0.78rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" id="sidebarCompanyName">
                                                Company</div>
                                            <div class="text-white-50" style="font-size: 0.7rem;">
                                                Logged In</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Sidebar footer (Logout) -->
                            <div class="sidebar-footer">
                                <a href="index.aspx" class="btn btn-outline-light btn-sm w-100 py-2 border-0" onclick="handleLogout()"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign Out </a>
                            </div>
                        </aside>

                        <!-- ==========================================
             2. MAIN CONTENT PANEL
             ========================================== -->
                        <div class="main-panel">

                            <!-- Navbar Header -->
                            <header class="top-navbar d-flex justify-content-between align-items-center">
                                <button class="btn btn-sm d-lg-none me-3 fs-4 border-0" id="sidebarToggleBtn">
                                    <i class="fa-solid fa-bars"></i>
                                </button>
                                <div class="d-none d-md-block">
                                    <h4 class="mb-0 text-dark fw-bold" id="panelTitleBar" style="font-family: var(--font-heading);">Company Dashboard</h4>
                                </div>
                                <div class="d-flex align-items-center gap-3 ms-auto">
                                    <div class="avatar-circle bg-rku-red text-white fw-bold rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; font-size: 1rem;">
                                        AD
                                    </div>
                                </div>
                            </header>

                            <!-- Container for Tab Panes -->
                            <main class="content-container">

                                <!-- ─── OVERVIEW TAB ─── -->
                                <div id="tab-overview" class="tab-pane-content active">
                                    <div class="company-hero-card mb-4">
                                        <div class="row align-items-center g-3">
                                            <div class="col-lg-8">
                                                <div class="company-hero-kicker">
                                                    Company Dashboard</div>
                                                <h2 class="mb-1" id="panelTitle">Company Dashboard</h2>
                                                <p>
                                                    Manage your profile and review student registrations.</p>
                                            </div>
                                            <div class="col-lg-4 text-lg-end">
                                                <div class="d-inline-flex align-items-center gap-3">
                                                    <div class="text-lg-end d-none d-lg-block">
                                                        <div class="fw-semibold text-dark">
                                                            Logged In</div>
                                                        <div class="text-muted small">
                                                            Company Portal</div>
                                                    </div>
                                                    <div class="avatar-circle bg-rku-red text-white fw-bold rounded-circle d-flex align-items-center justify-content-center company-hero-avatar">
                                                        AD
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Statistics Widgets -->
                                    <div class="row g-4 mb-4">
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="stat-widget">
                                                <div class="stat-widget-icon bg-icon-primary">
                                                    <i class="fa-solid fa-users"></i>
                                                </div>
                                                <div class="stat-widget-info">
                                                    <h3 id="admStatStudents">0</h3>
                                                    <span>Students Registered</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="stat-widget">
                                                <div class="stat-widget-icon bg-icon-info">
                                                    <i class="fa-regular fa-building"></i>
                                                </div>
                                                <div class="stat-widget-info">
                                                    <h3 id="admStatDrives">0</h3>
                                                    <span>Active Drives</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="stat-widget">
                                                <div class="stat-widget-icon bg-icon-success">
                                                    <i class="fa-solid fa-circle-check"></i>
                                                </div>
                                                <div class="stat-widget-info">
                                                    <h3 id="admStatPlaced">0</h3>
                                                    <span>Students Placed</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="stat-widget">
                                                <div class="stat-widget-icon bg-icon-warning">
                                                    <i class="fa-solid fa-percent"></i>
                                                </div>
                                                <div class="stat-widget-info">
                                                    <h3 id="admStatPercent">0%</h3>
                                                    <span>Placement Rate</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Charts Grid -->
                                    <div class="row g-4 mb-4">
                                        <div class="col-lg-6">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 font-heading text-dark">Annual Placement Trend</h5>
                                                <div class="chart-container-wrapper">
                                                    <canvas id="admChartGrowth"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 font-heading text-dark">Placement by Department</h5>
                                                <div class="chart-container-wrapper">
                                                    <canvas id="admChartDepartment"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Recent Activity Logs -->
                                    <div class="row g-4">
                                        <div class="col-12">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 font-heading text-dark">Recent System Activity</h5>
                                                <div class="table-responsive">
                                                    <table class="table table-hover align-middle table-sm small">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>Action Details</th>
                                                                <th>Associated Entity</th>
                                                                <th>Timestamp</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="activityLogTableBody">
                                                            <!-- Dynamically populated activities -->
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                                <!-- ─── MANAGE DRIVES TAB ─── -->
                                <div id="tab-manage-drives" class="tab-pane-content d-none">
                                    <div class="row g-4">
                                        <!-- Drives list -->
                                        <div class="col-lg-7">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 d-flex justify-content-between align-items-center"><span>Active Recruiting Drives</span>
                                                    <button class="btn btn-rku btn-sm" onclick="clearDriveForm()">
                                                        <i class="fa-solid fa-plus me-1"></i>Add New
                                                    </button>
                                                </h5>
                                                <div class="list-group overflow-auto" id="adminDrivesList" style="max-height: 550px;">
                                                    <!-- Loaded dynamically -->
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Add/Edit form -->
                                        <div class="col-lg-5">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 text-dark" id="driveFormTitle">Create New Campus Drive</h5>
                                                <form id="driveForm" onsubmit="saveDrive(event)">
                                                    <input type="hidden" id="driveIdField">
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Company Name</label>
                                                        <input type="text" class="form-control" id="driveCompany" placeholder="e.g. Google India" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Recruiting Job Role</label>
                                                        <input type="text" class="form-control" id="driveRole" placeholder="e.g. SDE-1 Freshers" required>
                                                    </div>
                                                    <div class="row g-3 mb-3">
                                                        <div class="col-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Package Offered</label>
                                                            <input type="text" class="form-control" id="drivePackage" placeholder="e.g. 7.5 LPA" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Min CGPA Required</label>
                                                            <input type="number" step="0.1" min="0" max="10" class="form-control" id="driveMinCgpa" placeholder="e.g. 7.0" required>
                                                        </div>
                                                    </div>
                                                    <div class="row g-3 mb-3">
                                                        <div class="col-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Drive Date</label>
                                                            <input type="date" class="form-control" id="driveDate" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Job Status</label>
                                                            <select class="form-select" id="driveStatus">
                                                                <option value="Open">Open</option>
                                                                <option value="Closed">Closed</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Venue Location / Test Mode</label>
                                                        <input type="text" class="form-control" id="driveLocation" placeholder="e.g. SJT Lab 102 / Online" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Job Profile Description</label>
                                                        <textarea class="form-control" id="driveDescription" rows="4" placeholder="Enter key eligibility, coding rounds, syllabus criteria..." required></textarea>
                                                    </div>
                                                    <div class="d-flex gap-2 justify-content-end">
                                                        <button type="button" class="btn btn-secondary btn-sm" onclick="clearDriveForm()">
                                                            Reset
                                                        </button>
                                                        <button type="submit" class="btn btn-rku btn-sm" id="btnSubmitDrive">
                                                            Create Drive
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                                <!-- ─── MY COMPANY PROFILE TAB ─── -->
                                <div id="tab-my-profile" class="tab-pane-content">
                                    <div class="row g-4">
                                        <!-- Left: Logo & Quick Info -->
                                        <div class="col-lg-4">
                                            <div class="dashboard-card text-center">
                                                <div class="mb-3" id="profileLogoDisplay">
                                                    <!-- Rendered dynamically -->
                                                </div>
                                                <h5 class="fw-bold font-heading mb-1" id="profileDisplayName">Company Name</h5>
                                                <div class="text-muted small mb-3" id="profileDisplayIndustry">
                                                    Industry</div>
                                                <div class="text-muted small">
                                                    <i class="fa-solid fa-location-dot me-1 text-rku-red"></i><span id="profileDisplayLocation">Location</span>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center gap-3 text-center small">
                                                    <div>
                                                        <div class="fw-bold text-dark fs-5" id="profileDisplayPackage">
                                                            -</div>
                                                        <div class="text-muted">
                                                            Package Range</div>
                                                    </div>
                                                    <div>
                                                        <div class="fw-bold text-dark fs-5" id="profileDisplayRoles">
                                                            -</div>
                                                        <div class="text-muted">
                                                            Open Roles</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right: Edit Form -->
                                        <div class="col-lg-8">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold font-heading text-dark mb-4"><i class="fa-solid fa-pen-to-square me-2 text-rku-red"></i>Edit Company Profile</h5>
                                                <form id="companyProfileForm" onsubmit="saveCompanyProfile(event)">

                                                    <!-- Logo Upload -->
                                                    <div class="mb-4">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Company Logo</label>
                                                        <div class="company-logo-upload-zone" id="logoUploadZone" onclick="document.getElementById('companyLogoInput').click()">
                                                            <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2"></i>
                                                            <p class="text-muted small mb-0">
                                                                Click to upload company logo<br><span style="font-size: 0.75rem;">PNG, JPG, SVG (max 1MB)</span></p>
                                                        </div>
                                                        <input type="file" id="companyLogoInput" accept="image/*" class="d-none" onchange="handleLogoUpload(event)">
                                                        <input type="hidden" id="companyLogoBase64">
                                                    </div>

                                                    <!-- Company Name -->
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Company Name *</label>
                                                        <input type="text" class="form-control" id="cpName" placeholder="e.g. Tata Consultancy Services" required>
                                                    </div>

                                                    <!-- Tagline -->
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Tagline / Motto</label>
                                                        <input type="text" class="form-control" id="cpTagline" placeholder="e.g. Building on belief">
                                                    </div>

                                                    <!-- Description -->
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Company Description</label>
                                                        <textarea class="form-control" id="cpDescription" rows="3" placeholder="Briefly describe what your company does..."></textarea>
                                                    </div>
                                                    <div class="row g-3 mb-3">
                                                        <!-- Industry -->
                                                        <div class="col-md-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Industry</label>
                                                            <select class="form-select" id="cpIndustry">
                                                                <option value="it">IT / Software</option>
                                                                <option value="mnc">MNC</option>
                                                                <option value="consulting">Consulting</option>
                                                                <option value="finance">Finance / Banking</option>
                                                                <option value="fmcg">FMCG</option>
                                                                <option value="manufacturing">Manufacturing</option>
                                                            </select>
                                                        </div>
                                                        <!-- Location -->
                                                        <div class="col-md-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Location (HQ)</label>
                                                            <input type="text" class="form-control" id="cpLocation" placeholder="e.g. Mumbai, India">
                                                        </div>
                                                    </div>
                                                    <div class="row g-3 mb-3">
                                                        <!-- Package Range -->
                                                        <div class="col-md-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Package Range</label>
                                                            <input type="text" class="form-control" id="cpPackageRange" placeholder="e.g. 3.5 LPA - 12 LPA">
                                                        </div>
                                                        <!-- Open Roles -->
                                                        <div class="col-md-6">
                                                            <label class="form-label text-muted small fw-bold">
                                                            No. of Open Roles</label>
                                                            <input type="text" class="form-control" id="cpOpenRoles" placeholder="e.g. 25 Open Roles">
                                                        </div>
                                                    </div>

                                                    <!-- Website -->
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Website URL</label>
                                                        <input type="url" class="form-control" id="cpWebsite" placeholder="https://www.yourcompany.com">
                                                    </div>

                                                    <!-- Tags / Skills -->
                                                    <div class="mb-4">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Hiring Skills / Tags (comma-separated)</label>
                                                        <input type="text" class="form-control" id="cpTags" placeholder="e.g. Java, Python, SQL, DevOps">
                                                        <div class="form-text text-muted">
                                                            These tags appear on your company card in the Companies page.</div>
                                                    </div>
                                                    <div class="d-flex gap-2">
                                                        <button type="submit" class="btn btn-rku">
                                                            <i class="fa-solid fa-floppy-disk me-1"></i>Save Profile
                                                        </button>
                                                        <button type="button" class="btn btn-outline-secondary" onclick="loadCompanyProfileForm()">
                                                            <i class="fa-solid fa-rotate-left me-1"></i>Reset
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                                <!-- ─── STUDENT DIRECTORY TAB ─── -->
                                <div id="tab-student-directory" class="tab-pane-content">
                                    <div class="dashboard-card">
                                        <div class="row g-3 mb-4 justify-content-between align-items-center">
                                            <div class="col-md-5">
                                                <h5 class="fw-bold mb-0">Registered Student Directory</h5>
                                            </div>
                                            <div class="col-md-7 d-flex gap-2">
                                                <input type="text" class="form-control form-control-sm" id="studentSearchInput" placeholder="Search by name, roll, email..." onkeyup="filterStudentTable()">
                                                <select class="form-select form-select-sm" id="studentBranchFilter" onchange="filterStudentTable()" style="max-width: 180px;">
                                                    <option value="all">All Branches</option>
                                                    <option value="Computer Engineering">CE</option>
                                                    <option value="Information Technology">IT</option>
                                                    <option value="Mechanical Engineering">Mechanical</option>
                                                    <option value="Civil Engineering">Civil</option>
                                                    <option value="Marketing">MBA-Marketing</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th>Enrollment</th>
                                                        <th>Student Details</th>
                                                        <th>Branch &amp; GPA</th>
                                                        <th>Registered Skills</th>
                                                        <th>Resume</th>
                                                        <th class="text-center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="studentTableBody">
                                                    <!-- Populated dynamically -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                            </div>

                                <!-- ─── APPLICATION TRACKER TAB ─── -->
                                <div id="tab-track-applications" class="tab-pane-content d-none">
                                    <div class="row g-4">
                                        <div class="col-md-4">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3">Select Placement Drive</h5>
                                                <p class="text-muted small">
                                                    Choose a drive to view and manage applied student profiles.</p>
                                                <select class="form-select" id="applicationTrackerDriveSelect" onchange="loadApplicationsForDrive()">
                                                    <!-- Loaded dynamically -->
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 d-flex justify-content-between"><span>Applicants Roster</span> <span class="badge bg-rku-maroon" id="applicantsCountBadge">0 Applicants</span> </h5>
                                                <div class="table-responsive">
                                                    <table class="table table-hover align-middle">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>Applicant</th>
                                                                <th>GPA</th>
                                                                <th>Applied Date</th>
                                                                <th>Recruitment Stage</th>
                                                                <th class="text-center">Modify Stage</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="driveApplicantsTableBody">
                                                            <!-- Dynamically populated applicant list -->
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="emptyApplicantsState" class="text-center py-5 text-muted d-none">
                                                    <i class="fa-solid fa-users-slash mb-3" style="font-size: 2.5rem;"></i>
                                                    <h6>No Applicants Found</h6>
                                                    <p class="small text-muted mb-0">
                                                        No students have applied to this placement drive yet.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                                <!-- ─── BROADCAST NOTIFICATIONS TAB ─── -->
                                <div id="tab-notifications" class="tab-pane-content d-none">
                                    <div class="row g-4">
                                        <div class="col-md-5">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 text-dark">Send Broadcast Notification</h5>
                                                <p class="text-muted small">
                                                    Broadcasting a message instantly places it on the student panels.</p>
                                                <form id="announcementForm" onsubmit="postBroadcast(event)">
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Broadcast Subject</label>
                                                        <input type="text" class="form-control" id="annTitle" placeholder="e.g. TCS Technical assessment details" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label text-muted small fw-bold">
                                                        Notification Message</label>
                                                        <textarea class="form-control" id="annMessage" rows="5" placeholder="Include exam details, venue details, criteria links, instructions..." required></textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-rku btn-sm w-100">
                                                        <i class="fa-solid fa-paper-plane me-1"></i>Send Broadcast Notice
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="dashboard-card">
                                                <h5 class="fw-bold mb-3 text-dark">Recent Placement Alerts Broadcasted</h5>
                                                <div class="list-group overflow-auto" id="adminAnnouncementsList" style="max-height: 400px;">
                                                    <!-- Loaded dynamically -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                                <!-- ─── MANAGE CONTENT TAB ─── -->
                                <div id="tab-manage-content" class="tab-pane-content d-none">

                                    <!-- ══════════════════════════════════════
                         SECTION 1: SUCCESS STORIES
                    ══════════════════════════════════════ -->
                                    <div class="section-header mb-4">
                                        <div class="section-header-icon" style="background: rgba(163,15,20,0.1); color: var(--rku-maroon);">
                                            <i class="fa-solid fa-trophy"></i>
                                        </div>
                                        <div>
                                            <h5>Success Stories</h5>
                                            <p>
                                                Manage placed student stories shown on the website</p>
                                        </div>
                                    </div>
                                    <div class="row g-4 mb-5">
                                        <!-- Left: List -->
                                        <div class="col-xl-7 col-lg-6">
                                            <div class="content-section h-100">
                                                <div class="content-section-head">
                                                    <div class="fw-bold font-heading" style="font-size: 0.9rem;">
                                                        <i class="fa-solid fa-list me-2 text-muted"></i>All Stories</div>
                                                    <span class="badge bg-light text-muted border" id="storyCountBadge">0 stories</span>
                                                </div>
                                                <div class="content-section-body no-pad">
                                                    <div id="adminStoriesList" style="max-height: 580px; overflow-y: auto;">
                                                        <!-- Loaded dynamically -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right: Form -->
                                        <div class="col-xl-5 col-lg-6">
                                            <div class="form-panel" style="position: sticky; top: 20px;">
                                                <div class="form-panel-head">
                                                    <h6 class="fw-bold mb-0 font-heading" id="storyFormTitle"><i class="fa-solid fa-user-graduate me-2 text-rku-maroon"></i>Add Placed Student Story</h6>
                                                </div>
                                                <div class="form-panel-body">
                                                    <form id="storyForm" onsubmit="saveStory(event)">
                                                        <input type="hidden" id="editStoryId" value="">
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Student Full Name</label>
                                                            <input type="text" class="form-control" id="storyName" placeholder="e.g. Krishna Patel" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Degree &amp; Branch</label>
                                                            <input type="text" class="form-control" id="storyDegree" placeholder="e.g. BCA | School of Computer Applications" required>
                                                        </div>

                                                        <!-- Image Upload Zone -->
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Student Photo (Optional)</label>
                                                            <label for="storyImage" class="img-upload-zone d-block">
                                                            <img id="storyImagePreview" src="" style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 10px; margin: 0 auto 10px; display: none;">
                                                            <div id="storyUploadHint">
                                                                <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i><span class="text-muted small">Click to upload student photo</span>
                                                            </div>
                                                            </label>
                                                            &nbsp;<input type="file" class="d-none" id="storyImage" accept="image/*" onchange="previewStoryImage(this)">
                                                        </div>
                                                        <div class="row g-2 mb-3">
                                                            <div class="col-6">
                                                                <label class="form-label text-muted small fw-bold">
                                                                Recruiter</label>
                                                                <input type="text" class="form-control" id="storyRecruiter" placeholder="e.g. TCS" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label class="form-label text-muted small fw-bold">
                                                                Package</label>
                                                                <input type="text" class="form-control" id="storyPackage" placeholder="e.g. ₹ 12 LPA" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Job Designation</label>
                                                            <input type="text" class="form-control" id="storyRole" placeholder="e.g. Software Engineer" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Student Testimonial</label>
                                                            <textarea class="form-control" id="storyQuote" rows="3" placeholder="Student experience quote..." required></textarea>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Key Skills <span class="text-muted fw-normal">(comma-separated)</span></label>
                                                            <input type="text" class="form-control" id="storySkills" placeholder="HTML, CSS, JavaScript, SQL" required>
                                                        </div>

                                                        <!-- Featured Story is auto-calculated based on Rank 1 -->

                                                        <div class="form-check mb-2">
                                                            <input class="form-check-input" type="checkbox" id="storyIsHallOfFame" onchange="toggleRankSelect()">
                                                            <label class="form-check-label small fw-semibold" for="storyIsHallOfFame">
                                                            <i class="fa-solid fa-award text-warning me-1"></i>Add to Hall of Fame Podium
                                                            </label>
                                                        </div>
                                                        <div class="mb-3" id="rankSelectGroup" style="display: none;">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Podium Rank</label>
                                                            <select class="form-select" id="storyRank">
                                                                <option value="">-- Select Rank --</option>
                                                                <option value="1">🥇 Rank 1 (Gold – Highest Package)</option>
                                                                <option value="2">🥈 Rank 2 (Silver)</option>
                                                                <option value="3">🥉 Rank 3 (Bronze)</option>
                                                            </select>
                                                        </div>
                                                        <div class="d-grid gap-2 mt-3">
                                                            <button type="submit" class="btn btn-rku btn-sm" id="storySubmitBtn">
                                                                <i class="fa-solid fa-cloud-arrow-up me-1"></i>Publish Success Story
                                                            </button>
                                                            <button type="button" class="btn btn-outline-secondary btn-sm" id="storyCancelBtn" style="display: none;" onclick="cancelEditStory()">
                                                                <i class="fa-solid fa-xmark me-1"></i>Cancel Edit
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ══════════════════════════════════════
                         SECTION 2: PLACEMENT GALLERY
                    ══════════════════════════════════════ -->
                                    <div class="section-header mb-4">
                                        <div class="section-header-icon" style="background: rgba(23,162,184,0.1); color: #17a2b8;">
                                            <i class="fa-solid fa-images"></i>
                                        </div>
                                        <div>
                                            <h5>Placement Gallery</h5>
                                            <p>
                                                Upload photos shown in the gallery section of the website</p>
                                        </div>
                                    </div>
                                    <div class="row g-4 mb-5">
                                        <!-- Left: List -->
                                        <div class="col-xl-7 col-lg-6">
                                            <div class="content-section h-100">
                                                <div class="content-section-head">
                                                    <div class="fw-bold font-heading" style="font-size: 0.9rem;">
                                                        <i class="fa-regular fa-images me-2 text-muted"></i>Gallery Items</div>
                                                </div>
                                                <div class="content-section-body no-pad">
                                                    <div id="adminGalleryList" style="max-height: 400px; overflow-y: auto;">
                                                        <!-- Loaded dynamically -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right: Form -->
                                        <div class="col-xl-5 col-lg-6">
                                            <div class="form-panel" style="position: sticky; top: 20px;">
                                                <div class="form-panel-head">
                                                    <h6 class="fw-bold mb-0 font-heading" id="galleryFormTitle"><i class="fa-solid fa-plus-circle me-2" style="color: #17a2b8;"></i>Add Gallery Image</h6>
                                                </div>
                                                <div class="form-panel-body">
                                                    <form id="galleryForm" onsubmit="saveGalleryItem(event)">
                                                        <input type="hidden" id="editGalleryId" value="">
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Gallery Event / Title</label>
                                                            <input type="text" class="form-control" id="galleryTitle" placeholder="e.g. Placement Batch 2026" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Gallery Image</label>
                                                            <input type="file" class="form-control" id="galleryImage" accept="image/*">
                                                        </div>
                                                        <div class="d-grid gap-2">
                                                            <button type="submit" class="btn btn-rku btn-sm" id="gallerySubmitBtn">
                                                                <i class="fa-solid fa-plus me-1"></i>Add Gallery Item
                                                            </button>
                                                            <button type="button" class="btn btn-outline-secondary btn-sm" id="galleryCancelBtn" style="display: none;" onclick="cancelEditGallery()">
                                                                <i class="fa-solid fa-xmark me-1"></i>Cancel Edit
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ══════════════════════════════════════
                         SECTION 3: COMPANIES DIRECTORY
                    ══════════════════════════════════════ -->
                                    <div class="section-header mb-4">
                                        <div class="section-header-icon" style="background: rgba(40,167,69,0.1); color: #28a745;">
                                            <i class="fa-solid fa-building"></i>
                                        </div>
                                        <div>
                                            <h5>Companies Directory</h5>
                                            <p>
                                                Add and manage recruiting companies shown on the Companies page</p>
                                        </div>
                                    </div>
                                    <div class="row g-4 mb-5">
                                        <!-- Left: List -->
                                        <div class="col-xl-7 col-lg-6">
                                            <div class="content-section h-100">
                                                <div class="content-section-head">
                                                    <div class="fw-bold font-heading" style="font-size: 0.9rem;">
                                                        <i class="fa-solid fa-list me-2 text-muted"></i>Companies List</div>
                                                    <span class="badge bg-light text-muted border" id="companyCountBadge">0 companies</span>
                                                </div>
                                                <div class="content-section-body no-pad">
                                                    <div id="adminCompaniesList" style="max-height: 620px; overflow-y: auto;">
                                                        <!-- Loaded dynamically -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right: Form -->
                                        <div class="col-xl-5 col-lg-6">
                                            <div class="form-panel" style="position: sticky; top: 20px;">
                                                <div class="form-panel-head">
                                                    <h6 class="fw-bold mb-0 font-heading" id="companyFormTitle"><i class="fa-solid fa-plus-circle me-2" style="color: #28a745;"></i>Add Company</h6>
                                                </div>
                                                <div class="form-panel-body">
                                                    <form id="companyForm" onsubmit="saveCompany(event)">
                                                        <input type="hidden" id="editCompanyId" value="">
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Company Name</label>
                                                            <input type="text" class="form-control" id="compName" placeholder="e.g. Wipro Technologies" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Industry / Category</label>
                                                            <select class="form-select" id="compIndustry" required>
                                                                <option value="">-- Select Industry --</option>
                                                                <option value="it">IT / Software</option>
                                                                <option value="mnc">MNC</option>
                                                                <option value="consulting">Consulting</option>
                                                                <option value="finance">Finance</option>
                                                                <option value="fmcg">FMCG</option>
                                                                <option value="manufacturing">Manufacturing</option>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Tagline</label>
                                                            <input type="text" class="form-control" id="compTagline" placeholder="e.g. Apply thought">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Description</label>
                                                            <textarea class="form-control" id="compDesc" rows="2" placeholder="Brief description of the company..."></textarea>
                                                        </div>
                                                        <div class="row g-2 mb-3">
                                                            <div class="col-6">
                                                                <label class="form-label text-muted small fw-bold">
                                                                Location</label>
                                                                <input type="text" class="form-control" id="compLocation" placeholder="e.g. Bangalore">
                                                            </div>
                                                            <div class="col-6">
                                                                <label class="form-label text-muted small fw-bold">
                                                                Package Range</label>
                                                                <input type="text" class="form-control" id="compPackage" placeholder="e.g. 3.5 – 8 LPA">
                                                            </div>
                                                        </div>
                                                        <div class="row g-2 mb-3">
                                                            <div class="col-6">
                                                                <label class="form-label text-muted small fw-bold">
                                                                Open Roles</label>
                                                                <input type="text" class="form-control" id="compRoles" placeholder="e.g. 15 Open Roles">
                                                            </div>
                                                            <div class="col-6">
                                                                <label class="form-label text-muted small fw-bold">
                                                                Website</label>
                                                                <input type="url" class="form-control" id="compWebsite" placeholder="https://wipro.com">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Company Logo (Optional)</label>
                                                            <input type="file" class="form-control" id="compLogo" accept="image/*">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-muted small fw-bold">
                                                            Tags <span class="text-muted fw-normal">(comma-separated)</span></label>
                                                            <input type="text" class="form-control" id="compTags" placeholder="Java, Python, React">
                                                        </div>
                                                        <div class="d-grid gap-2 mt-3">
                                                            <button type="submit" class="btn btn-rku btn-sm" id="companySubmitBtn">
                                                                <i class="fa-solid fa-plus me-1"></i>Add Company
                                                            </button>
                                                            <button type="button" class="btn btn-outline-secondary btn-sm" id="companyCancelBtn" style="display: none;" onclick="cancelEditCompany()">
                                                                <i class="fa-solid fa-xmark me-1"></i>Cancel Edit
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            </main>
                        </div>
                    </div>

                    <!-- Bootstrap 5 Bundle JS -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                    <!-- Admin Panel JavaScript Controller -->
                    <script>
                        document.addEventListener('DOMContentLoaded', () => {
                            try { renderSidebarNavigation(); } catch (e) { console.error(e); }
                            try { initCharts(); } catch (e) { console.error(e); }
                            try { loadOverviewStats(); } catch (e) { console.error(e); }
                            try { renderManageDrives(); } catch (e) { console.error(e); }
                            try { renderStudentDirectory(); } catch (e) { console.error(e); }
                            try { renderApplicationsDropdown(); } catch (e) { console.error(e); }
                            try { renderAnnouncementsList(); } catch (e) { console.error(e); }
                            try { renderStoriesList(); } catch (e) { console.error(e); }
                            try { renderGalleryList(); } catch (e) { console.error(e); }
                            try { renderCompaniesList(); } catch (e) { console.error(e); }
                            try { loadCompanyProfileUI(); } catch (e) { console.error(e); }

                            const initialTab = new URLSearchParams(window.location.search).get('tab');
                            if (initialTab) {
                                activateCompanyTab(initialTab);
                            }

                            // Mobile sidebar toggle
                            const toggleBtn = document.getElementById('sidebarToggleBtn');
                            if (toggleBtn) {
                                toggleBtn.addEventListener('click', () => {
                                    const sidebar = document.getElementById('sidebar');
                                    if (sidebar) sidebar.classList.toggle('show');
                                });
                            }
                        });

                        // 1. Sidebar navigation tab switching
                        function renderSidebarNavigation() {
                            const menuItems = document.querySelectorAll('.sidebar-item');
                            const tabPanes = document.querySelectorAll('.tab-pane-content');
                            const panelTitle = document.getElementById('panelTitle');
                            const panelTitleBar = document.getElementById('panelTitleBar');

                            menuItems.forEach(item => {
                                item.addEventListener('click', (e) => {
                                    const href = item.querySelector('a')?.getAttribute('href') || '#';
                                    if (href && href !== '#') {
                                        return;
                                    }
                                    e.preventDefault();

                                    // Toggle active class on sidebar
                                    menuItems.forEach(m => m.classList.remove('active'));
                                    item.classList.add('active');

                                    // Toggle active tab pane
                                    const targetTabId = item.getAttribute('data-tab');
                                    tabPanes.forEach(pane => {
                                        pane.classList.remove('active');
                                        if (pane.id === targetTabId) {
                                            pane.classList.add('active');
                                        }
                                    });

                                    // Set header title
                                    const tabName = item.innerText.trim();
                                    const titleText = tabName === 'Overview' ? 'Company Dashboard' : tabName;
                                    if (panelTitle) panelTitle.innerText = titleText;
                                    if (panelTitleBar) panelTitleBar.innerText = titleText;

                                    // Close sidebar on mobile after clicking
                                    document.getElementById('sidebar').classList.remove('show');
                                });
                            });
                        }

                        function activateCompanyTab(tabId) {
                            const target = document.getElementById(tabId);
                            if (!target) return;

                            const menuItems = document.querySelectorAll('.sidebar-item');
                            const tabPanes = document.querySelectorAll('.tab-pane-content');
                            const panelTitle = document.getElementById('panelTitle');
                            const panelTitleBar = document.getElementById('panelTitleBar');

                            menuItems.forEach(item => {
                                item.classList.toggle('active', item.getAttribute('data-tab') === tabId);
                            });

                            tabPanes.forEach(pane => {
                                pane.classList.remove('active');
                                if (pane.id === tabId) {
                                    pane.classList.add('active');
                                    pane.classList.remove('d-none');
                                } else {
                                    pane.classList.add('d-none');
                                }
                            });

                            const activeLabel = document.querySelector(`.sidebar-item[data-tab="${tabId}"] a`);
                            if (panelTitle && activeLabel) {
                                const tabName = activeLabel.innerText.trim();
                                const titleText = tabName === 'Overview' ? 'Company Dashboard' : tabName;
                                panelTitle.innerText = titleText;
                                if (panelTitleBar) panelTitleBar.innerText = titleText;
                            }
                        }

                        // 2. Load Overview statistics counters and charts
                        function loadOverviewStats() {
                            const students = PortalDB.getUsers().filter(u => u.role === 'student');
                            const drives = PortalDB.getDrives();
                            const applications = PortalDB.getApplications();

                            const totalStudents = students.length;
                            const activeDrives = drives.filter(d => d.status === 'Open').length;
                            const placedStudentsCount = applications.filter(a => a.status === 'Selected').map(a => a.studentEnrollment);
                            const uniquePlacedCount = [...new Set(placedStudentsCount)].length;

                            const placementRate = totalStudents > 0 ? Math.round((uniquePlacedCount / totalStudents) * 100) : 0;

                            const sEl = document.getElementById('admStatStudents'); if (sEl) sEl.innerText = totalStudents;
                            const dEl = document.getElementById('admStatDrives'); if (dEl) dEl.innerText = activeDrives;
                            const pEl = document.getElementById('admStatPlaced'); if (pEl) pEl.innerText = uniquePlacedCount;
                            const prEl = document.getElementById('admStatPercent'); if (prEl) prEl.innerText = placementRate + '%';

                            const logTbody = document.getElementById('activityLogTableBody');
                            if (logTbody) {
                                const logs = [
                                    { act: 'New Student Registered', ent: 'Amit Joshi (20SOECE11002)', tm: '3 hours ago', st: 'success' },
                                    { act: 'Applied to Drive', ent: 'Raj Patel -> TCS System Eng.', tm: 'Yesterday', st: 'primary' },
                                    { act: 'Application Stage Changed', ent: 'Sneha Vyas -> Tech Round (TCS)', tm: '2 days ago', st: 'warning' },
                                    { act: 'Drive Created', ent: 'Infosys (Power Programmer)', tm: '3 days ago', st: 'success' }
                                ];
                                logTbody.innerHTML = '';
                                logs.forEach(l => {
                                    const tr = document.createElement('tr');
                                    tr.innerHTML = `
                                        <td><div class="fw-bold">${l.act}</div></td>
                                        <td>${l.ent}</td>
                                        <td>${l.tm}</td>
                                        <td><span class="badge bg-${l.st}-subtle text-${l.st} rounded-pill font-heading" style="font-size:0.65rem;">Completed</span></td>
                                    `;
                                    logTbody.appendChild(tr);
                                });
                            }
                        }

                        // ─── COMPANY PROFILE MANAGEMENT ───────────────────────────────────────

                        function getCompanyLogoHTML(company, size = 100, cssClass = '') {
                            if (company && company.logoBase64) {
                                return `<img src="${company.logoBase64}" alt="${company.name}" class="${cssClass}" style="width:${size}px;height:${size}px;object-fit:contain;border-radius:12px;border:1px solid #eee;background:#fff;padding:6px;">`;
                            }
                            const initials = (company && company.name) ? company.name.split(' ').map(w => w[0]).join('').toUpperCase().slice(0, 2) : 'C';
                            return `<div class="company-logo-placeholder" style="width:${size}px;height:${size}px;font-size:${Math.round(size * 0.35)}px;">${initials}</div>`;
                        }

                        function loadCompanyProfileUI() {
                            const user = PortalDB.getCurrentUser();
                            if (!user) return;

                            // Ensure this company has an entry in COMPANIES directory
                            let compEntry = PortalDB.getCompanyByUsername(user.username);
                            if (!compEntry) {
                                const companies = PortalDB.getCompanies();
                                compEntry = companies.find(c =>
                                    (c.linkedUsername && c.linkedUsername === user.username) ||
                                    (user.name && c.name && c.name.toLowerCase() === user.name.toLowerCase())
                                );
                                if (!compEntry) {
                                    compEntry = {
                                        id: 'cu_' + Date.now(),
                                        linkedUsername: user.username,
                                        name: user.name || user.username,
                                        tagline: '',
                                        description: '',
                                        industry: 'it',
                                        location: '',
                                        packageRange: '',
                                        openRoles: '',
                                        website: '',
                                        tags: '',
                                        logoBase64: user.logoBase64 || ''
                                    };
                                    companies.push(compEntry);
                                    localStorage.setItem(PortalDB.KEYS.COMPANIES, JSON.stringify(companies));
                                }
                            }

                            const companyName = compEntry.name || user.name || user.username || 'Company';
                            const logoSrc = compEntry.logoBase64 || user.logoBase64 || '';

                            // Render sidebar company logo + name
                            const sidebarBrandLogoWrap = document.getElementById('sidebarBrandLogoWrap');
                            const sidebarBrandCompanyName = document.getElementById('sidebarBrandCompanyName');
                            const sidebarCard = document.getElementById('sidebarCompanyCard');
                            const sidebarLogoWrap = document.getElementById('sidebarCompanyLogoWrap');
                            const sidebarNameEl = document.getElementById('sidebarCompanyName');

                            if (sidebarBrandLogoWrap) {
                                if (logoSrc) {
                                    sidebarBrandLogoWrap.innerHTML = `<img src="${logoSrc}" alt="${companyName}" class="sidebar-company-logo" style="width:36px;height:36px;border-radius:8px;object-fit:contain;background:#fff;padding:2px;">`;
                                } else {
                                    const initials = companyName.charAt(0).toUpperCase();
                                    sidebarBrandLogoWrap.innerHTML = `<div class="sidebar-company-avatar" style="width:36px;height:36px;font-size:0.9rem;">${initials}</div>`;
                                }
                            }
                            if (sidebarBrandCompanyName) {
                                sidebarBrandCompanyName.textContent = companyName;
                            }

                            if (sidebarCard && sidebarLogoWrap && sidebarNameEl) {
                                sidebarCard.style.display = 'block';
                                sidebarNameEl.textContent = companyName;
                                if (logoSrc) {
                                    sidebarLogoWrap.innerHTML = `<img src="${logoSrc}" alt="logo" class="sidebar-company-logo">`;
                                } else {
                                    const initials = companyName.charAt(0).toUpperCase();
                                    sidebarLogoWrap.innerHTML = `<div class="sidebar-company-avatar">${initials}</div>`;
                                }
                            }

                            // Populate left preview panel if elements exist
                            updateProfilePreview(compEntry);

                            // Fill form fields if elements exist
                            loadCompanyProfileForm();
                        }

                        function loadCompanyProfileForm() {
                            const user = PortalDB.getCurrentUser();
                            if (!user) return;
                            const comp = PortalDB.getCompanyByUsername(user.username) || user;
                            if (!comp) return;

                            const setVal = (id, val) => { const el = document.getElementById(id); if (el) el.value = val; };

                            setVal('cpName', comp.name || '');
                            setVal('cpTagline', comp.tagline || '');
                            setVal('cpDescription', comp.description || '');
                            setVal('cpIndustry', comp.industry || 'it');
                            setVal('cpLocation', comp.location || '');
                            setVal('cpPackageRange', comp.packageRange || '');
                            setVal('cpOpenRoles', comp.openRoles || '');
                            setVal('cpWebsite', comp.website || '');
                            setVal('cpTags', Array.isArray(comp.tags) ? comp.tags.join(', ') : (comp.tags || ''));
                            setVal('companyLogoBase64', comp.logoBase64 || comp.logo || '');

                            const zone = document.getElementById('logoUploadZone');
                            if (zone) {
                                const logo = comp.logoBase64 || comp.logo;
                                if (logo) {
                                    zone.innerHTML = `<img src="${logo}" class="company-logo-preview" alt="Company Logo"><br><span class="text-muted small mt-2 d-block">Click to change logo</span>`;
                                } else {
                                    zone.innerHTML = `<i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2"></i><p class="text-muted small mb-0">Click to upload company logo<br><span style="font-size:0.75rem;">PNG, JPG, SVG (max 1MB)</span></p>`;
                                }
                            }
                        }

                        function updateProfilePreview(comp) {
                            if (!comp) return;
                            const setText = (id, txt) => { const el = document.getElementById(id); if (el) el.textContent = txt; };

                            setText('profileDisplayName', comp.name || 'Company Name');
                            setText('profileDisplayIndustry', (comp.industry || 'IT').toUpperCase());
                            setText('profileDisplayLocation', comp.location || 'Not set');
                            setText('profileDisplayPackage', comp.packageRange || '-');
                            setText('profileDisplayRoles', comp.openRoles || '-');

                            const logoDisp = document.getElementById('profileLogoDisplay');
                            if (logoDisp) logoDisp.innerHTML = getCompanyLogoHTML(comp, 100);
                        }

                        function handleLogoUpload(event) {
                            const file = event.target.files[0];
                            if (!file) return;
                            if (file.size > 1024 * 1024) {
                                alert('Logo file is too large. Please upload an image under 1MB.');
                                return;
                            }
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                const base64 = e.target.result;
                                document.getElementById('companyLogoBase64').value = base64;
                                const zone = document.getElementById('logoUploadZone');
                                zone.innerHTML = `<img src="${base64}" class="company-logo-preview" alt="Company Logo"><br><span class="text-muted small mt-2 d-block">Click to change logo</span>`;
                                // Live update the preview panel
                                document.getElementById('profileLogoDisplay').innerHTML = `<img src="${base64}" style="width:100px;height:100px;object-fit:contain;border-radius:12px;border:1px solid #eee;background:#fff;padding:6px;">`;
                            };
                            reader.readAsDataURL(file);
                        }

                        function saveCompanyProfile(e) {
                            e.preventDefault();
                            const user = PortalDB.getCurrentUser();
                            if (!user) return;

                            const tagsRaw = document.getElementById('cpTags').value;
                            const tagsArray = tagsRaw ? tagsRaw.split(',').map(t => t.trim()).filter(Boolean) : [];

                            const updatedData = {
                                name: document.getElementById('cpName').value.trim(),
                                tagline: document.getElementById('cpTagline').value.trim(),
                                description: document.getElementById('cpDescription').value.trim(),
                                industry: document.getElementById('cpIndustry').value,
                                location: document.getElementById('cpLocation').value.trim(),
                                packageRange: document.getElementById('cpPackageRange').value.trim(),
                                openRoles: document.getElementById('cpOpenRoles').value.trim(),
                                website: document.getElementById('cpWebsite').value.trim(),
                                tags: tagsArray,
                                logoBase64: document.getElementById('companyLogoBase64').value
                            };

                            PortalDB.updateCompanyByUsername(user.username, updatedData);

                            // Refresh sidebar and preview
                            loadCompanyProfileUI();

                            // Show success
                            const btn = document.querySelector('#companyProfileForm button[type="submit"]');
                            btn.innerHTML = '<i class="fa-solid fa-check me-1"></i> Saved!';
                            btn.classList.add('btn-success');
                            btn.classList.remove('btn-rku');
                            setTimeout(() => {
                                btn.innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Profile';
                                btn.classList.remove('btn-success');
                                btn.classList.add('btn-rku');
                            }, 2500);
                        }

                        let growthChartInstance = null;
                        let deptChartInstance = null;

                        function initCharts() {
                            const colorMaroon = '#a30f14';
                            const colorRed = '#ef3724';
                            const colorOrange = '#fd7e14';
                            const colorGray = '#6c757d';

                            // 1. Growth Line Chart
                            const ctxGrowth = document.getElementById('admChartGrowth');
                            if (ctxGrowth) {
                                if (growthChartInstance) growthChartInstance.destroy();
                                growthChartInstance = new Chart(ctxGrowth, {
                                    type: 'line',
                                    data: {
                                        labels: ['2022-23', '2023-24', '2024-25', '2025-26'],
                                        datasets: [{
                                            label: 'Placement rate',
                                            data: [72, 78, 82, 88],
                                            borderColor: colorRed,
                                            borderWidth: 2,
                                            backgroundColor: 'rgba(239, 55, 36, 0.05)',
                                            fill: true,
                                            tension: 0.35
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: { legend: { display: false } }
                                    }
                                });
                            }

                            // 2. Department Wise Donut Chart
                            const ctxDept = document.getElementById('admChartDepartment');
                            if (ctxDept) {
                                if (deptChartInstance) deptChartInstance.destroy();

                                // Get counts dynamically if possible, or use stats
                                const students = PortalDB.getUsers().filter(u => u.role === 'student');
                                const apps = PortalDB.getApplications().filter(a => a.status === 'Selected');
                                const placedEnrollments = [...new Set(apps.map(a => a.studentEnrollment))];

                                let counts = { CE: 0, IT: 0, MBA: 0, Others: 0 };
                                placedEnrollments.forEach(enroll => {
                                    const st = students.find(s => s.enrollment === enroll);
                                    if (st) {
                                        if (st.branch === 'Computer Engineering') counts.CE++;
                                        else if (st.branch === 'Information Technology') counts.IT++;
                                        else if (st.branch === 'Marketing' || st.branch === 'Finance') counts.MBA++;
                                        else counts.Others++;
                                    }
                                });

                                // Fallback demo numbers if empty database
                                if (placedEnrollments.length === 0) {
                                    counts = { CE: 15, IT: 8, MBA: 6, Others: 2 };
                                }

                                deptChartInstance = new Chart(ctxDept, {
                                    type: 'doughnut',
                                    data: {
                                        labels: ['Computer Engineering', 'Information Technology', 'Management (MBA)', 'Others'],
                                        datasets: [{
                                            data: [counts.CE, counts.IT, counts.MBA, counts.Others],
                                            backgroundColor: [colorMaroon, colorRed, colorOrange, colorGray]
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: { legend: { position: 'right', labels: { boxWidth: 10, font: { size: 9 } } } },
                                        cutout: '60%'
                                    }
                                });
                            }
                        }

                        // 3. Manage Drives Section Controller
                        function renderManageDrives() {
                            const drives = PortalDB.getDrives();
                            const list = document.getElementById('adminDrivesList');
                            list.innerHTML = '';

                            if (drives.length === 0) {
                                list.innerHTML = `<p class="text-center text-muted small py-4">No active placement drives found.</p>`;
                                return;
                            }

                            drives.forEach(d => {
                                const isClosed = d.status === 'Closed';
                                const div = document.createElement('div');
                                div.className = `list-group-item list-group-item-action border-0 border-bottom p-3 d-flex justify-content-between align-items-center`;
                                div.innerHTML = `
                    <div style="max-width: 70%;">
                        <div class="d-flex align-items-center gap-2 mb-1">
                            <span class="badge ${isClosed ? 'bg-secondary' : 'bg-success'} text-white rounded-pill px-2" style="font-size: 0.65rem;">${d.status}</span>
                            <span class="fw-bold small text-rku-maroon font-monospace">${d.package}</span>
                        </div>
                        <h6 class="fw-bold mb-0 text-dark font-heading">${d.companyName}</h6>
                        <p class="mb-0 text-muted small">${d.role} &bull; CGPA >= ${d.minCgpa}</p>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editDrive('${d.id}')" title="Edit Drive"><i class="fa-regular fa-edit"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteDrive('${d.id}')" title="Delete Drive"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                                list.appendChild(div);
                            });
                        }

                        function clearDriveForm() {
                            document.getElementById('driveIdField').value = '';
                            document.getElementById('driveCompany').value = '';
                            document.getElementById('driveRole').value = '';
                            document.getElementById('drivePackage').value = '';
                            document.getElementById('driveMinCgpa').value = '';
                            document.getElementById('driveDate').value = '';
                            document.getElementById('driveStatus').value = 'Open';
                            document.getElementById('driveLocation').value = '';
                            document.getElementById('driveDescription').value = '';

                            document.getElementById('driveFormTitle').innerText = 'Create New Campus Drive';
                            document.getElementById('btnSubmitDrive').innerText = 'Create Drive';
                        }

                        function editDrive(id) {
                            const drive = PortalDB.getDrive(id);
                            if (!drive) return;

                            document.getElementById('driveIdField').value = drive.id;
                            document.getElementById('driveCompany').value = drive.companyName;
                            document.getElementById('driveRole').value = drive.role;
                            document.getElementById('drivePackage').value = drive.package;
                            document.getElementById('driveMinCgpa').value = drive.minCgpa;
                            document.getElementById('driveDate').value = drive.date;
                            document.getElementById('driveStatus').value = drive.status;
                            document.getElementById('driveLocation').value = drive.location || '';
                            document.getElementById('driveDescription').value = drive.description;

                            document.getElementById('driveFormTitle').innerText = 'Modify Campus Drive';
                            document.getElementById('btnSubmitDrive').innerText = 'Save Changes';
                        }

                        function saveDrive(e) {
                            e.preventDefault();

                            const driveId = document.getElementById('driveIdField').value;
                            const companyName = document.getElementById('driveCompany').value.trim();
                            const role = document.getElementById('driveRole').value.trim();
                            const packageVal = document.getElementById('drivePackage').value.trim();
                            const minCgpa = document.getElementById('driveMinCgpa').value.trim();
                            const date = document.getElementById('driveDate').value;
                            const status = document.getElementById('driveStatus').value;
                            const location = document.getElementById('driveLocation').value.trim();
                            const description = document.getElementById('driveDescription').value.trim();

                            const driveObj = {
                                companyName: companyName,
                                role: role,
                                package: packageVal,
                                minCgpa: minCgpa,
                                date: date,
                                status: status,
                                location: location,
                                description: description
                            };

                            if (driveId) {
                                // Editing
                                driveObj.id = driveId;
                                const success = PortalDB.updateDrive(driveObj);
                                if (success) alert('Recruitment Drive updated successfully!');
                            } else {
                                // Creating
                                PortalDB.addDrive(driveObj);
                                alert('New recruitment drive added successfully!');
                            }

                            clearDriveForm();
                            renderManageDrives();
                            loadOverviewStats();
                            renderApplicationsDropdown(); // Update list of drives in application tab
                        }

                        function deleteDrive(id) {
                            if (confirm('Are you sure you want to delete this placement drive? All corresponding student applications will also be deleted.')) {
                                PortalDB.deleteDrive(id);
                                renderManageDrives();
                                loadOverviewStats();
                                renderApplicationsDropdown();
                            }
                        }

                        // 4. Student Directory Controller
                        function renderStudentDirectory() {
                            const students = PortalDB.getUsers().filter(u => u.role === 'student');
                            const tbody = document.getElementById('studentTableBody');
                            tbody.innerHTML = '';

                            if (students.length === 0) {
                                tbody.innerHTML = `<tr><td colspan="6" class="text-center text-muted small py-4">No registered students found.</td></tr>`;
                                return;
                            }

                            students.forEach(st => {
                                const branchInitials = st.branch ? st.branch.split(' ').map(p => p[0]).join('').toUpperCase() : 'N/A';

                                const tr = document.createElement('tr');
                                tr.className = 'student-row';
                                tr.setAttribute('data-search', st.name.toLowerCase() + ' ' + st.enrollment.toLowerCase() + ' ' + st.email.toLowerCase());
                                tr.setAttribute('data-branch', st.branch);

                                tr.innerHTML = `
                    <td><span class="fw-bold font-monospace small text-dark">${st.enrollment}</span></td>
                    <td>
                        <div class="fw-bold font-heading text-dark">${st.name}</div>
                        <div class="text-muted small">${st.email} &bull; ${st.mobile}</div>
                    </td>
                    <td>
                        <div class="fw-bold font-heading text-dark">${st.degree} (${branchInitials})</div>
                        <div class="text-muted small">CGPA: ${parseFloat(st.cgpa).toFixed(2)} &bull; Backlogs: ${st.backlogs}</div>
                    </td>
                    <td>
                        <div style="max-width: 250px; overflow-wrap: break-word;">
                            ${st.skills ? st.skills.split(',').map(sk => `<span class="badge bg-light text-dark border me-1 my-1" style="font-size:0.7rem;">${sk.trim()}</span>`).join('') : '<span class="text-muted small">None</span>'}
                        </div>
                    </td>
                    <td>
                        ${st.resumeUrl
                                        ? `<a href="#" onclick="alert('Downloading resume PDF: ${st.resumeUrl} (Simulated)')" class="btn btn-outline-danger btn-sm py-1 border-0" title="${st.resumeUrl}"><i class="fa-solid fa-file-pdf fs-5"></i></a>`
                                        : '<span class="text-muted small">Not Uploaded</span>'
                                    }
                    </td>
                    <td class="text-center">
                        <div class="d-flex justify-content-center gap-1">
                            <button class="btn btn-outline-info btn-sm border-0" onclick="viewStudentFullProfile('${st.username}')" title="View Full Profile"><i class="fa-solid fa-id-card me-1"></i>Profile</button>
                        </div>
                    </td>
                `;
                                tbody.appendChild(tr);
                            });
                        }

                        function filterStudentTable() {
                            const query = document.getElementById('studentSearchInput').value.toLowerCase();
                            const branch = document.getElementById('studentBranchFilter').value;
                            const rows = document.querySelectorAll('.student-row');

                            rows.forEach(row => {
                                const matchesSearch = row.getAttribute('data-search').includes(query);
                                const matchesBranch = branch === 'all' || row.getAttribute('data-branch') === branch;

                                if (matchesSearch && matchesBranch) {
                                    row.style.display = '';
                                } else {
                                    row.style.display = 'none';
                                }
                            });
                        }

                        function deleteStudent(username) {
                            if (confirm(`Are you sure you want to delete student account "${username}"? All profile history and drive applications of this user will be removed.`)) {
                                PortalDB.deleteUser(username);
                                renderStudentDirectory();
                                loadOverviewStats();
                                loadApplicationsForDrive(); // Refresh application rosters if any
                            }
                        }

                        // Student Profile & Mail Modal Controllers
                        let profileModalInstance = null;
                        let mailModalInstance = null;

                        function viewStudentFullProfile(username) {
                            const st = PortalDB.getUser(username);
                            if (!st) return;

                            const modalBody = document.getElementById('studentProfileModalBody');
                            const avatarHtml = st.photoBase64
                                ? `<img src="${st.photoBase64}" alt="${st.name}" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%;" class="border border-3 border-danger shadow-sm me-3">`
                                : `<div class="rounded-circle bg-rku-maroon text-white fw-bold d-inline-flex align-items-center justify-content-center border me-3" style="width: 80px; height: 80px; font-size: 1.8rem;">${(st.name || 'SP').split(' ').map(p => p[0]).join('').substring(0, 2).toUpperCase()}</div>`;

                            const certs = st.certificates || [];
                            let certsHtml = '';
                            if (certs.length === 0) {
                                certsHtml = `<p class="text-muted small mb-0"><i class="fa-solid fa-certificate me-1 text-muted"></i>No certificates uploaded by student yet.</p>`;
                            } else {
                                certsHtml = `<div class="row g-2 mt-1">` + certs.map(c => `
                    <div class="col-md-6">
                        <div class="p-2 border rounded bg-white shadow-sm d-flex justify-content-between align-items-center">
                            <div>
                                <div class="fw-bold small text-dark"><i class="fa-solid fa-award text-warning me-1"></i>${c.title}</div>
                                <div class="text-muted" style="font-size:0.75rem;">${c.issuer} &bull; ${c.date}</div>
                            </div>
                            ${c.fileBase64 ? `<a href="${c.fileBase64}" target="_blank" class="btn btn-sm btn-outline-secondary py-0 px-2" title="View Certificate"><i class="fa-solid fa-eye"></i></a>` : ''}
                        </div>
                    </div>
                `).join('') + `</div>`;
                            }

                            modalBody.innerHTML = `
                <div class="d-flex align-items-center mb-4 pb-3 border-bottom">
                    ${avatarHtml}
                    <div>
                        <h4 class="fw-bold mb-1 font-heading text-dark">${st.name}</h4>
                        <div class="text-muted small">
                            <span class="badge bg-rku-maroon me-2">${(st.role || 'STUDENT').toUpperCase()}</span> 
                            Enrollment: <strong class="text-dark font-monospace">${st.enrollment}</strong>
                        </div>
                    </div>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block">Email Address</label>
                        <span class="fw-semibold text-dark">${st.email}</span>
                    </div>
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block">Mobile Contact</label>
                        <span class="fw-semibold text-dark">${st.mobile || 'N/A'}</span>
                    </div>
                    <div class="col-md-4">
                        <label class="text-muted small fw-bold d-block">Degree &amp; Branch</label>
                        <span class="fw-semibold text-dark">${st.degree || 'B.Tech'} (${st.branch || 'CE'})</span>
                    </div>
                    <div class="col-md-4">
                        <label class="text-muted small fw-bold d-block">Current Semester</label>
                        <span class="fw-semibold text-dark">${st.semester || '7th'}</span>
                    </div>
                    <div class="col-md-4">
                        <label class="text-muted small fw-bold d-block">CGPA &amp; Backlogs</label>
                        <span class="fw-semibold text-rku-maroon">CGPA: ${st.cgpa || '0.0'}</span> <small class="text-muted">(Backlogs: ${st.backlogs || 0})</small>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="text-muted small fw-bold d-block mb-1">Key Technical Skills</label>
                    <div>${st.skills ? st.skills.split(',').map(s => `<span class="badge bg-light text-dark border me-1 my-1" style="font-size:0.75rem;">${s.trim()}</span>`).join('') : '<span class="text-muted small">None listed</span>'}</div>
                </div>

                <div class="mb-4">
                    <label class="text-muted small fw-bold d-block mb-1">Uploaded Resume</label>
                    <div>${st.resumeUrl ? `<span class="badge bg-success-subtle text-success border border-success-subtle p-2" style="font-size:0.82rem;"><i class="fa-solid fa-file-pdf me-1 text-danger"></i> ${st.resumeUrl}</span>` : '<span class="text-muted small">No resume uploaded</span>'}</div>
                </div>

                <div>
                    <label class="text-muted small fw-bold d-block mb-1"><i class="fa-solid fa-certificate me-1 text-warning"></i>Certificates &amp; Achievements (${certs.length})</label>
                    ${certsHtml}
                </div>
            `;

                            if (!profileModalInstance) {
                                profileModalInstance = new bootstrap.Modal(document.getElementById('studentProfileModal'));
                            }
                            profileModalInstance.show();
                        }

                        function openSendMailModal(username) {
                            const st = PortalDB.getUser(username);
                            if (!st) return;

                            document.getElementById('mailStudentUsername').value = st.username;
                            document.getElementById('mailStudentDetails').value = `${st.name} (${st.email})`;

                            const driveSelect = document.getElementById('mailDriveSelect');
                            driveSelect.innerHTML = `<option value="">-- Select Placement Drive --</option>`;
                            const drives = PortalDB.getDrives();
                            drives.forEach(d => {
                                driveSelect.innerHTML += `<option value="${d.id}">${d.companyName} - ${d.role} (${d.package})</option>`;
                            });

                            document.getElementById('mailSubject').value = `Invitation: Campus Placement Drive`;
                            document.getElementById('mailMessage').value = `Dear ${st.name},\n\nYou are invited to participate in our upcoming campus placement drive at RK University. Please review the drive requirements and ensure your student profile and resume are updated.\n\nBest regards,\nTraining & Placement Cell,\nRK University`;

                            if (!mailModalInstance) {
                                mailModalInstance = new bootstrap.Modal(document.getElementById('sendMailModal'));
                            }
                            mailModalInstance.show();
                        }

                        function autoFillMailContent(driveId) {
                            if (!driveId) return;
                            const drive = PortalDB.getDrives().find(d => d.id === driveId);
                            const username = document.getElementById('mailStudentUsername').value;
                            const st = PortalDB.getUser(username);
                            if (drive && st) {
                                document.getElementById('mailSubject').value = `Invitation: ${drive.companyName} (${drive.role}) Placement Drive`;
                                document.getElementById('mailMessage').value = `Dear ${st.name},\n\nWe are pleased to invite you to participate in the upcoming campus recruitment drive for ${drive.companyName} for the position of ${drive.role} (${drive.package}).\n\nDate: ${drive.date}\nVenue/Location: ${drive.location}\nMinimum CGPA Required: ${drive.minCgpa}\n\nPlease submit your application from your Student Panel prior to the deadline.\n\nBest regards,\nTraining & Placement Cell,\nRK University`;
                            }
                        }

                        function sendStudentPlacementMail(e) {
                            e.preventDefault();
                            const username = document.getElementById('mailStudentUsername').value;
                            const st = PortalDB.getUser(username);
                            const subject = document.getElementById('mailSubject').value.trim();
                            const message = document.getElementById('mailMessage').value.trim();

                            if (!st || !subject || !message) return;

                            // Broadcast alert to PortalDB announcements so student receives notification
                            PortalDB.addAnnouncement(subject, `[Direct Email to ${st.email}]\n${message}`);

                            // Log mail in PortalDB company mails log for Admin Visibility
                            const currentComp = PortalDB.getCurrentUser();
                            PortalDB.addCompanyMail({
                                companyUsername: currentComp ? currentComp.username : 'company',
                                companyName: currentComp ? (currentComp.enrollment || currentComp.name) : 'Company HR',
                                studentUsername: st.username || st.enrollment,
                                studentName: st.name || st.enrollment,
                                studentEmail: st.email || (st.enrollment + '@rku.ac.in'),
                                subject: subject,
                                message: message,
                                sentAt: new Date().toISOString().replace('T', ' ').slice(0, 16)
                            });

                            alert(`📧 Placement Invite Email Dispatched!\n\nTo: ${st.email}\nSubject: ${subject}\n\nSent email logged for Admin review and pushed to student panel.`);

                            if (mailModalInstance) mailModalInstance.hide();
                        }

                        // 5. Application Tracker Controller
                        function renderApplicationsDropdown() {
                            const drives = PortalDB.getDrives();
                            const select = document.getElementById('applicationTrackerDriveSelect');

                            select.innerHTML = '<option value="">-- Choose Placement Drive --</option>';
                            drives.forEach(d => {
                                const option = document.createElement('option');
                                option.value = d.id;
                                option.innerText = `${d.companyName} - ${d.role} (${d.package})`;
                                select.appendChild(option);
                            });

                            // If we have drives, select the first one by default to load some data
                            if (drives.length > 0) {
                                select.value = drives[0].id;
                                loadApplicationsForDrive();
                            }
                        }

                        function loadApplicationsForDrive() {
                            const driveId = document.getElementById('applicationTrackerDriveSelect').value;
                            const tbody = document.getElementById('driveApplicantsTableBody');
                            const emptyState = document.getElementById('emptyApplicantsState');
                            const badge = document.getElementById('applicantsCountBadge');

                            tbody.innerHTML = '';
                            badge.innerText = '0 Applicants';

                            if (!driveId) {
                                emptyState.classList.remove('d-none');
                                return;
                            }

                            const applications = PortalDB.getApplications().filter(a => a.driveId === driveId);
                            badge.innerText = `${applications.length} Applicants`;

                            if (applications.length === 0) {
                                emptyState.classList.remove('d-none');
                                return;
                            }

                            emptyState.classList.add('d-none');

                            // Get students catalog to join names
                            const students = PortalDB.getUsers().filter(u => u.role === 'student');

                            applications.forEach(app => {
                                const student = students.find(s => s.enrollment === app.studentEnrollment) || {
                                    name: 'Deleted Student',
                                    cgpa: 'N/A',
                                    branch: 'N/A'
                                };

                                const tr = document.createElement('tr');
                                tr.innerHTML = `
                    <td>
                        <div class="fw-bold font-heading text-dark">${student.name}</div>
                        <div class="text-muted small font-monospace">${app.studentEnrollment} &bull; ${student.branch}</div>
                    </td>
                    <td><span class="fw-semibold font-heading text-dark">${student.cgpa}</span></td>
                    <td><span class="text-muted small font-monospace">${app.appliedDate}</span></td>
                    <td>
                        <span class="badge ${app.status === 'Selected' ? 'bg-success' : app.status === 'Rejected' ? 'bg-danger' : app.status === 'Shortlisted' ? 'bg-warning text-dark' : 'bg-primary'} text-white rounded-pill px-2">
                            ${app.stage}
                        </span>
                    </td>
                    <td class="text-center">
                        <select class="form-select form-select-sm d-inline-block w-auto" onchange="changeApplicantStage('${app.id}', this.value)">
                            <option value="Applied" ${app.stage === 'Applied' ? 'selected' : ''}>Applied</option>
                            <option value="Shortlisted" ${app.stage === 'Shortlisted' ? 'selected' : ''}>Shortlisted</option>
                            <option value="Technical Round" ${app.stage === 'Technical Round' ? 'selected' : ''}>Technical Round</option>
                            <option value="HR Round" ${app.stage === 'HR Round' ? 'selected' : ''}>HR Round</option>
                            <option value="Selected" ${app.stage === 'Selected' ? 'selected' : ''}>Selected (Placed)</option>
                            <option value="Rejected" ${app.stage === 'Rejected' ? 'selected' : ''}>Rejected</option>
                        </select>
                    </td>
                `;
                                tbody.appendChild(tr);
                            });
                        }

                        function changeApplicantStage(appId, newStage) {
                            let status = 'Applied';
                            if (newStage === 'Selected') status = 'Selected';
                            else if (newStage === 'Rejected') status = 'Rejected';
                            else if (newStage === 'Shortlisted' || newStage === 'Technical Round' || newStage === 'HR Round') status = 'Shortlisted';

                            const success = PortalDB.updateApplicationStatus(appId, status, newStage);
                            if (success) {
                                loadApplicationsForDrive();
                                loadOverviewStats();
                                initCharts(); // Redraw donut placements chart
                            } else {
                                alert('Error updating recruitment stage in localStorage.');
                            }
                        }

                        // 6. Broadcast Manager Section Controller
                        function renderAnnouncementsList() {
                            const announcements = PortalDB.getAnnouncements();
                            const list = document.getElementById('adminAnnouncementsList');
                            list.innerHTML = '';

                            if (announcements.length === 0) {
                                list.innerHTML = `<p class="text-center text-muted small py-4">No broadcast alerts sent yet.</p>`;
                                return;
                            }

                            announcements.forEach(ann => {
                                const div = document.createElement('div');
                                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-start';
                                div.innerHTML = `
                    <div style="max-width: 85%;">
                        <div class="d-flex align-items-center gap-2 mb-1">
                            <span class="text-muted small font-monospace"><i class="fa-regular fa-calendar me-1"></i> ${ann.date}</span>
                        </div>
                        <h6 class="fw-bold text-dark font-heading mb-1">${ann.title}</h6>
                        <p class="mb-0 text-muted small" style="line-height:1.5;">${ann.message}</p>
                    </div>
                    <div>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteAnnouncement('${ann.id}')" title="Delete Announcement"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                                list.appendChild(div);
                            });
                        }

                        function postBroadcast(e) {
                            e.preventDefault();

                            const title = document.getElementById('annTitle').value.trim();
                            const message = document.getElementById('annMessage').value.trim();

                            if (!title || !message) return;

                            PortalDB.addAnnouncement(title, message);
                            alert('Notice broadcasted to all students successfully!');

                            document.getElementById('annTitle').value = '';
                            document.getElementById('annMessage').value = '';

                            renderAnnouncementsList();
                        }

                        function deleteAnnouncement(id) {
                            if (confirm('Are you sure you want to delete this notice broadcast?')) {
                                PortalDB.deleteAnnouncement(id);
                                renderAnnouncementsList();
                            }
                        }

                        // 7. Success Stories Management
                        function renderStoriesList() {
                            const stories = PortalDB.getStories();
                            const list = document.getElementById('adminStoriesList');
                            const countBadge = document.getElementById('storyCountBadge');
                            if (countBadge) countBadge.textContent = `${stories.length} stories`;
                            list.innerHTML = '';

                            if (stories.length === 0) {
                                list.innerHTML = `<p class="text-center text-muted small py-4">No success stories published yet.</p>`;
                                return;
                            }

                            stories.forEach(s => {
                                const badge = s.isFeatured
                                    ? `<span class="badge bg-primary text-white rounded-pill px-2" style="font-size:0.65rem;">Featured</span>`
                                    : s.isHallOfFame
                                        ? `<span class="badge bg-warning text-dark rounded-pill px-2" style="font-size:0.65rem;">Hall of Fame (Rank ${s.rank})</span>`
                                        : `<span class="badge bg-secondary text-white rounded-pill px-2" style="font-size:0.65rem;">Standard</span>`;

                                const div = document.createElement('div');
                                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                                const avatarHtml = s.studentPhoto
                                    ? `<img src="${s.studentPhoto}" style="width:36px;height:36px;object-fit:cover;border-radius:50%;" class="me-2">`
                                    : `<span class="me-2" style="width:36px;height:36px;border-radius:50%;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-user text-muted"></i></span>`;
                                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${avatarHtml}
                        <div>
                            <div class="d-flex align-items-center gap-2 mb-1">
                                ${badge}
                                <span class="fw-bold text-rku-maroon font-monospace small">${s.packageLpa}</span>
                            </div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">${s.studentName}</h6>
                            <p class="mb-0 text-muted small">${s.degreeBranch} &bull; Placed at ${s.recruiterName} (${s.role})</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editStory('${s.id}')" title="Edit Story"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteStory('${s.id}')" title="Delete Story"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                                list.appendChild(div);
                            });
                        }

                        function toggleRankSelect() {
                            const isHof = document.getElementById('storyIsHallOfFame').checked;
                            document.getElementById('rankSelectGroup').style.display = isHof ? 'block' : 'none';
                        }

                        function getBase64(file) {
                            return new Promise((resolve, reject) => {
                                const reader = new FileReader();
                                reader.readAsDataURL(file);
                                reader.onload = () => resolve(reader.result);
                                reader.onerror = error => reject(error);
                            });
                        }

                        async function saveStory(e) {
                            e.preventDefault();
                            const editId = document.getElementById('editStoryId').value;
                            const studentName = document.getElementById('storyName').value.trim();
                            const degreeBranch = document.getElementById('storyDegree').value.trim();
                            const recruiterName = document.getElementById('storyRecruiter').value.trim();
                            const packageLpa = document.getElementById('storyPackage').value.trim();
                            const role = document.getElementById('storyRole').value.trim();
                            const quote = document.getElementById('storyQuote').value.trim();
                            const skills = document.getElementById('storySkills').value.trim();
                            const isHallOfFame = document.getElementById('storyIsHallOfFame').checked;
                            const rank = isHallOfFame ? document.getElementById('storyRank').value : '';
                            const isFeatured = (isHallOfFame && rank === '1');
                            const fileInput = document.getElementById('storyImage');

                            let studentPhoto = editId ? (PortalDB.getStories().find(s => s.id === editId)?.studentPhoto || '') : '';
                            if (fileInput && fileInput.files.length > 0) {
                                try {
                                    studentPhoto = await getBase64(fileInput.files[0]);
                                } catch (error) {
                                    alert('Error reading image file.');
                                    return;
                                }
                            }

                            if (isHallOfFame && !rank) {
                                alert('Please select a podium rank for the Hall of Fame.');
                                return;
                            }

                            const storyData = { studentName, degreeBranch, recruiterName, packageLpa, role, quote, skills, studentPhoto, isFeatured, isHallOfFame, rank };

                            if (editId) {
                                PortalDB.updateStory(editId, storyData);
                                alert('Story updated successfully!');
                            } else {
                                if (isFeatured) {
                                    let currentStories = PortalDB.getStories();
                                    currentStories.forEach(s => s.isFeatured = false);
                                    localStorage.setItem(PortalDB.KEYS.STORIES, JSON.stringify(currentStories));
                                }
                                PortalDB.addStory(storyData);
                                alert('Success story published successfully!');
                            }

                            cancelEditStory();
                            renderStoriesList();
                        }

                        function previewStoryImage(input) {
                            const preview = document.getElementById('storyImagePreview');
                            const hint = document.getElementById('storyUploadHint');
                            if (input.files && input.files[0]) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    preview.src = e.target.result;
                                    preview.style.display = 'block';
                                    if (hint) hint.style.display = 'none';
                                }
                                reader.readAsDataURL(input.files[0]);
                            } else {
                                preview.src = '';
                                preview.style.display = 'none';
                                if (hint) hint.style.display = 'block';
                            }
                        }

                        function deleteStory(id) {
                            if (confirm('Are you sure you want to delete this success story?')) {
                                PortalDB.deleteStory(id);
                                renderStoriesList();
                            }
                        }

                        function editStory(id) {
                            const s = PortalDB.getStories().find(x => x.id === id);
                            if (!s) return;
                            document.getElementById('editStoryId').value = s.id;
                            document.getElementById('storyName').value = s.studentName;
                            document.getElementById('storyDegree').value = s.degreeBranch;
                            document.getElementById('storyRecruiter').value = s.recruiterName;
                            document.getElementById('storyPackage').value = s.packageLpa;
                            document.getElementById('storyRole').value = s.role;
                            document.getElementById('storyQuote').value = s.quote;
                            document.getElementById('storySkills').value = s.skills;
                            document.getElementById('storyIsHallOfFame').checked = s.isHallOfFame;
                            if (s.isHallOfFame) {
                                document.getElementById('rankSelectGroup').style.display = 'block';
                                document.getElementById('storyRank').value = s.rank;
                            } else {
                                document.getElementById('rankSelectGroup').style.display = 'none';
                            }
                            // Show current photo preview if exists
                            const preview = document.getElementById('storyImagePreview');
                            const hint = document.getElementById('storyUploadHint');
                            if (s.studentPhoto) {
                                preview.src = s.studentPhoto;
                                preview.style.display = 'block';
                                if (hint) hint.style.display = 'none';
                            } else {
                                preview.src = '';
                                preview.style.display = 'none';
                                if (hint) hint.style.display = 'block';
                            }
                            document.getElementById('storyFormTitle').textContent = 'Edit Student Story';
                            document.getElementById('storySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
                            document.getElementById('storyCancelBtn').style.display = 'block';
                            document.getElementById('storyForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }

                        function cancelEditStory() {
                            document.getElementById('editStoryId').value = '';
                            document.getElementById('storyForm').reset();
                            document.getElementById('rankSelectGroup').style.display = 'none';
                            document.getElementById('storyImagePreview').style.display = 'none';
                            document.getElementById('storyImagePreview').src = '';
                            const hint = document.getElementById('storyUploadHint');
                            if (hint) hint.style.display = 'block';
                            document.getElementById('storyFormTitle').textContent = 'Add Placed Student Story';
                            document.getElementById('storySubmitBtn').innerHTML = '<i class="fa-solid fa-cloud-arrow-up me-1"></i> Publish Success Story';
                            document.getElementById('storyCancelBtn').style.display = 'none';
                        }

                        // 8. Placement Gallery Management
                        function renderGalleryList() {
                            const gallery = PortalDB.getGallery();
                            const list = document.getElementById('adminGalleryList');
                            list.innerHTML = '';

                            if (gallery.length === 0) {
                                list.innerHTML = `<p class="text-center text-muted small py-4">No gallery items added yet.</p>`;
                                return;
                            }

                            gallery.forEach(g => {
                                const div = document.createElement('div');
                                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                                const imgThumb = g.imageBase64
                                    ? `<img src="${g.imageBase64}" style="width:36px;height:36px;object-fit:cover;border-radius:6px;" class="me-2">`
                                    : `<span class="me-2" style="width:36px;height:36px;border-radius:6px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-regular fa-image text-muted"></i></span>`;
                                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${imgThumb}
                        <h6 class="fw-bold mb-0 text-dark font-heading">${g.title}</h6>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editGalleryItem('${g.id}')" title="Edit"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteGalleryItem('${g.id}')" title="Delete"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                                list.appendChild(div);
                            });
                        }

                        async function saveGalleryItem(e) {
                            e.preventDefault();
                            const editId = document.getElementById('editGalleryId').value;
                            const title = document.getElementById('galleryTitle').value.trim();
                            if (!title) return;

                            const fileInput = document.getElementById('galleryImage');
                            let imageBase64 = editId ? (PortalDB.getGallery().find(g => g.id === editId)?.imageBase64 || '') : '';
                            if (fileInput && fileInput.files.length > 0) {
                                try {
                                    imageBase64 = await getBase64(fileInput.files[0]);
                                } catch (error) {
                                    alert('Error reading image file.');
                                    return;
                                }
                            }

                            if (editId) {
                                PortalDB.updateGalleryItem(editId, { title, imageBase64 });
                                alert('Gallery item updated successfully!');
                            } else {
                                PortalDB.addGalleryItem({ title, imageBase64 });
                                alert('Gallery item added successfully!');
                            }

                            cancelEditGallery();
                            renderGalleryList();
                        }

                        function deleteGalleryItem(id) {
                            if (confirm('Are you sure you want to delete this gallery item?')) {
                                PortalDB.deleteGalleryItem(id);
                                renderGalleryList();
                            }
                        }

                        function editGalleryItem(id) {
                            const g = PortalDB.getGallery().find(x => x.id === id);
                            if (!g) return;
                            document.getElementById('editGalleryId').value = g.id;
                            document.getElementById('galleryTitle').value = g.title;
                            document.getElementById('galleryFormTitle').textContent = 'Edit Gallery Item';
                            document.getElementById('gallerySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
                            document.getElementById('galleryCancelBtn').style.display = 'block';
                            document.getElementById('galleryForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }

                        function cancelEditGallery() {
                            document.getElementById('editGalleryId').value = '';
                            document.getElementById('galleryForm').reset();
                            document.getElementById('galleryFormTitle').textContent = 'Add Gallery Image Caption';
                            document.getElementById('gallerySubmitBtn').innerHTML = '<i class="fa-solid fa-plus me-1"></i> Add Gallery Item';
                            document.getElementById('galleryCancelBtn').style.display = 'none';
                        }

                        // 9. Companies Directory Management
                        function renderCompaniesList() {
                            const companies = PortalDB.getCompanies();
                            const list = document.getElementById('adminCompaniesList');
                            const countBadge = document.getElementById('companyCountBadge');
                            if (countBadge) countBadge.textContent = `${companies.length} companies`;
                            if (!list) return;
                            list.innerHTML = '';

                            if (companies.length === 0) {
                                list.innerHTML = `<p class="text-center text-muted small py-4">No companies added yet.</p>`;
                                return;
                            }

                            companies.forEach(c => {
                                const div = document.createElement('div');
                                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                                const logoHtml = c.logoBase64 ? `<img src="${c.logoBase64}" alt="${c.name}" style="height: 36px; width: 36px; object-fit: contain;" class="me-2 rounded">` : `<span class="me-2" style="width:36px;height:36px;border-radius:6px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-building text-muted"></i></span>`;
                                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${logoHtml}
                        <div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">${c.name}</h6>
                            <p class="mb-0 text-muted small">${c.industry} &bull; ${c.location || '-'} &bull; ${c.packageRange || '-'}</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editCompany('${c.id}')" title="Edit Company"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteCompany('${c.id}')" title="Delete Company"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                                list.appendChild(div);
                            });
                        }

                        async function saveCompany(e) {
                            e.preventDefault();
                            const editId = document.getElementById('editCompanyId').value;
                            const name = document.getElementById('compName').value.trim();
                            const industry = document.getElementById('compIndustry').value.trim();
                            const tagline = document.getElementById('compTagline').value.trim();
                            const description = document.getElementById('compDesc').value.trim();
                            const location = document.getElementById('compLocation').value.trim();
                            const packageRange = document.getElementById('compPackage').value.trim();
                            const openRoles = document.getElementById('compRoles').value.trim();
                            const website = document.getElementById('compWebsite').value.trim();
                            const tagsInput = document.getElementById('compTags').value.trim();
                            const tags = tagsInput ? tagsInput.split(',').map(t => t.trim()) : [];

                            const fileInput = document.getElementById('compLogo');
                            let logoBase64 = editId ? (PortalDB.getCompanies().find(c => c.id === editId)?.logoBase64 || '') : '';
                            if (fileInput && fileInput.files.length > 0) {
                                try {
                                    logoBase64 = await getBase64(fileInput.files[0]);
                                } catch (error) {
                                    alert('Error reading logo file.');
                                    return;
                                }
                            }

                            const companyData = { name, industry, tagline, description, location, packageRange, openRoles, website, logoBase64, tags };

                            if (editId) {
                                PortalDB.updateCompany(editId, companyData);
                                alert('Company updated successfully!');
                            } else {
                                PortalDB.addCompany(companyData);
                                alert('Company added successfully!');
                            }

                            cancelEditCompany();
                            renderCompaniesList();
                        }

                        function deleteCompany(id) {
                            if (confirm('Are you sure you want to delete this company?')) {
                                PortalDB.deleteCompany(id);
                                renderCompaniesList();
                            }
                        }

                        function editCompany(id) {
                            const c = PortalDB.getCompanies().find(x => x.id === id);
                            if (!c) return;
                            document.getElementById('editCompanyId').value = c.id;
                            document.getElementById('compName').value = c.name;
                            document.getElementById('compIndustry').value = c.industry;
                            document.getElementById('compTagline').value = c.tagline || '';
                            document.getElementById('compDesc').value = c.description || '';
                            document.getElementById('compLocation').value = c.location || '';
                            document.getElementById('compPackage').value = c.packageRange || '';
                            document.getElementById('compRoles').value = c.openRoles || '';
                            document.getElementById('compWebsite').value = c.website || '';
                            document.getElementById('compTags').value = c.tags ? c.tags.join(', ') : '';
                            document.getElementById('companyFormTitle').textContent = 'Edit Company';
                            document.getElementById('companySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
                            document.getElementById('companyCancelBtn').style.display = 'block';
                            document.getElementById('companyForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }

                        function cancelEditCompany() {
                            document.getElementById('editCompanyId').value = '';
                            document.getElementById('companyForm').reset();
                            document.getElementById('companyFormTitle').textContent = 'Add Company';
                            document.getElementById('companySubmitBtn').innerHTML = '<i class="fa-solid fa-plus me-1"></i> Add Company';
                            document.getElementById('companyCancelBtn').style.display = 'none';
                        }

                        // 10. Logout
                        function handleLogout() {
                            if (confirm('Are you sure you want to sign out?')) {
                                PortalDB.logout();
                                window.location.href = 'login.html';
                            }
                        }
                    </script>
                    <!-- ─── STUDENT FULL PROFILE MODAL ─── -->
                    <div class="modal fade" id="studentProfileModal" tabindex="-1" aria-labelledby="studentProfileModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content border-0 shadow">
                                <div class="modal-header bg-dark text-white">
                                    <h5 class="modal-title font-heading fw-bold" id="studentProfileModalLabel"><i class="fa-solid fa-user-graduate me-2 text-rku-red"></i>Student Full Profile</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close">
                                    </button>
                                </div>
                                <div class="modal-body p-4" id="studentProfileModalBody">
                                    <!-- Populated dynamically -->
                                </div>
                                <div class="modal-footer bg-light py-2">
                                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ─── SEND MAIL / PLACEMENT INVITE MODAL ─── -->
                    <div class="modal fade" id="sendMailModal" tabindex="-1" aria-labelledby="sendMailModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content border-0 shadow">
                                <div class="modal-header bg-rku-maroon text-white">
                                    <h5 class="modal-title font-heading fw-bold" id="sendMailModalLabel"><i class="fa-regular fa-paper-plane me-2"></i>Send Placement Invite Email</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close">
                                    </button>
                                </div>
                                <div class="modal-body p-4">
                                    <form id="sendMailForm" onsubmit="sendStudentPlacementMail(event)">
                                        <input type="hidden" id="mailStudentUsername">
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">
                                            Student Name &amp; Email</label>
                                            <input type="text" class="form-control" id="mailStudentDetails" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">
                                            Select Placement Drive</label>
                                            <select class="form-select" id="mailDriveSelect" onchange="autoFillMailContent(this.value)">
                                                <!-- Populated dynamically -->
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">
                                            Email Subject</label>
                                            <input type="text" class="form-control" id="mailSubject" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">
                                            Invite Message / Placement Details</label>
                                            <textarea class="form-control" id="mailMessage" rows="5" required></textarea>
                                        </div>
                                        <div class="alert alert-info py-2 small mb-0">
                                            <i class="fa-solid fa-circle-info me-1"></i>Submitting this form dispatches an email notification to the student's email and pushes a live alert to their Student Panel.
                                        </div>
                                        <div class="mt-3 text-end">
                                            <button type="button" class="btn btn-secondary btn-sm me-1" data-bs-dismiss="modal">
                                                Cancel
                                            </button>
                                            <button type="submit" class="btn btn-rku btn-sm">
                                                <i class="fa-solid fa-paper-plane me-1"></i>Send Email &amp; Notify
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Code injected by live-server -->
                    <script>
                        // <![CDATA[  <-- For SVG support
                        if ('WebSocket' in window) {
                            (function () {
                                function refreshCSS() {
                                    var sheets = [].slice.call(document.getElementsByTagName("link"));
                                    var head = document.getElementsByTagName("head")[0];
                                    for (var i = 0; i < sheets.length; ++i) {
                                        var elem = sheets[i];
                                        var parent = elem.parentElement || head;
                                        parent.removeChild(elem);
                                        var rel = elem.rel;
                                        if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                                            var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                                            elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                                        }
                                        parent.appendChild(elem);
                                    }
                                }
                                var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
                                var address = protocol + window.location.host + window.location.pathname + '/ws';
                                var socket = new WebSocket(address);
                                socket.onmessage = function (msg) {
                                    if (msg.data == 'reload') window.location.reload();
                                    else if (msg.data == 'refreshcss') refreshCSS();
                                };
                                if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                                    console.log('Live reload enabled.');
                                    sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
                                }
                            })();
                        }
                        else {
                            console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
                        }
                        // ]]>
                    </script>
</asp:Content>
