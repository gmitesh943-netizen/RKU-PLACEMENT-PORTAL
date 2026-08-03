<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageDrives" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard | RK University Placement Portal</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Chart.js CDN -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">
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

            @media (max-width: 991.98px) {
                .sticky-form {
                    position: static !important;
                }
            }

            /* ─── GLOBAL SEARCH BAR ─── */
            .global-search-wrapper {
                position: relative;
                flex: 1;
                max-width: 420px;
            }

            .global-search-input {
                border: 1.5px solid #e8eaed;
                border-radius: 50px;
                padding: 0.45rem 1rem 0.45rem 2.6rem;
                font-size: 0.88rem;
                background: #f4f6f9;
                transition: all 0.2s ease;
                width: 100%;
            }

                .global-search-input:focus {
                    border-color: var(--rku-red);
                    background: #fff;
                    box-shadow: 0 0 0 3px rgba(239,55,36,0.08);
                    outline: none;
                }

            .global-search-icon {
                position: absolute;
                left: 0.9rem;
                top: 50%;
                transform: translateY(-50%);
                color: #aaa;
                font-size: 0.85rem;
                pointer-events: none;
            }

            .search-results-dropdown {
                position: absolute;
                top: calc(100% + 8px);
                left: 0;
                right: 0;
                background: #fff;
                border: 1px solid #eef0f3;
                border-radius: 12px;
                box-shadow: 0 12px 40px rgba(0,0,0,0.12);
                z-index: 9999;
                max-height: 400px;
                overflow-y: auto;
                display: none;
            }

                .search-results-dropdown.active {
                    display: block;
                }

            .search-result-category {
                padding: 0.55rem 1rem 0.3rem;
                font-size: 0.65rem;
                font-weight: 700;
                letter-spacing: 0.8px;
                color: #a0a3b1;
                text-transform: uppercase;
                font-family: var(--font-heading);
                border-top: 1px solid #f0f2f5;
            }

                .search-result-category:first-child {
                    border-top: none;
                }

            .search-result-item {
                display: flex;
                align-items: center;
                padding: 0.6rem 1rem;
                cursor: pointer;
                transition: background 0.15s ease;
            }

                .search-result-item:hover {
                    background: #f9fafb;
                }

                .search-result-item .result-icon {
                    width: 30px;
                    height: 30px;
                    border-radius: 8px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 0.75rem;
                    flex-shrink: 0;
                    margin-right: 10px;
                }

                .search-result-item .result-title {
                    font-weight: 600;
                    font-size: 0.85rem;
                    color: #111;
                    font-family: var(--font-heading);
                    line-height: 1.2;
                }

                .search-result-item .result-sub {
                    font-size: 0.75rem;
                    color: #888;
                }

            .search-no-results {
                padding: 1.5rem;
                text-align: center;
                color: #aaa;
                font-size: 0.85rem;
            }

            /* ─── REPORTS TAB ─── */
            .report-kpi-card {
                background: #fff;
                border: 1px solid #eef0f3;
                border-radius: 14px;
                padding: 1.25rem 1.5rem;
                display: flex;
                align-items: center;
                gap: 1rem;
                box-shadow: 0 4px 15px rgba(0,0,0,0.02);
                transition: transform 0.2s, box-shadow 0.2s;
            }

                .report-kpi-card:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 20px rgba(0,0,0,0.05);
                }

            .report-kpi-icon {
                width: 50px;
                height: 50px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.4rem;
                flex-shrink: 0;
            }

            .report-kpi-value {
                font-size: 1.75rem;
                font-weight: 800;
                font-family: var(--font-heading);
                color: #111;
                line-height: 1;
            }

            .report-kpi-label {
                font-size: 0.8rem;
                color: #64748b;
                font-weight: 500;
                margin-top: 2px;
            }

            .report-section-title {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 1rem;
                color: #111;
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .report-table-wrapper {
                background: #fff;
                border: 1px solid #eef0f3;
                border-radius: 14px;
                overflow: hidden;
                margin-bottom: 2rem;
            }

            .report-table-head {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1rem 1.5rem;
                border-bottom: 1px solid #f0f2f5;
                background: #fafbfc;
            }

            .report-table-body {
                padding: 0;
            }

            .export-csv-btn {
                background: linear-gradient(135deg, #28a745, #20c997);
                color: #fff;
                border: none;
                border-radius: 8px;
                padding: 0.4rem 1rem;
                font-size: 0.8rem;
                font-weight: 600;
                font-family: var(--font-heading);
                cursor: pointer;
                transition: opacity 0.2s;
                display: inline-flex;
                align-items: center;
                gap: 5px;
            }

                .export-csv-btn:hover {
                    opacity: 0.88;
                }
        </style>
    </head>
    <body>

        <!-- Portal DB Script -->
        <script src="js/portal-db.js"></script>

        <div class="wrapper">

            <!-- ==========================================
                 1. SIDEBAR NAVIGATION
                 ========================================== -->
            <aside class="sidebar" id="sidebar">
                <div>
                    <!-- Brand logo -->
                    <div class="sidebar-brand d-flex align-items-center">
                        <img src="assets/images/white logo rku.png" alt="RK University" class="me-2" style="height: 150px; width: auto; max-width: 200px; object-fit: contain;">
                    </div>

                    <!-- Navigation menu -->
                    <ul class="sidebar-menu">
                        <li class="sidebar-item" data-tab="tab-overview">
                            <a href="AdminDashboard.aspx"><i class="fa-solid fa-chart-line"></i>Overview</a>
                        </li>
                        <li class="sidebar-item active" data-tab="tab-manage-drives">
                            <a href="AdminManageDrives.aspx"><i class="fa-regular fa-building"></i>Manage Drives</a>
                        </li>
                        <li class="sidebar-item" data-tab="tab-student-directory">
                            <a href="AdminStudentDirectory.aspx"><i class="fa-solid fa-users"></i>Student Directory</a>
                        </li>
                        <li class="sidebar-item" data-tab="tab-track-applications">
                            <a href="AdminTrackApplications.aspx"><i class="fa-solid fa-list-check"></i>Application Tracker</a>
                        </li>
                        <li class="sidebar-item" data-tab="tab-notifications">
                            <a href="AdminNotifications.aspx"><i class="fa-regular fa-bell"></i>Send Broadcast</a>
                        </li>
                        <li class="sidebar-item" data-tab="tab-manage-content">
                            <a href="AdminManageContent.aspx"><i class="fa-solid fa-photo-film"></i>Manage Web Content</a>
                        </li>
                        <li class="sidebar-item" data-tab="tab-reports">
                            <a href="AdminReports.aspx"><i class="fa-solid fa-chart-column"></i>Reports &amp; Analytics</a>
                        </li>
                    </ul>
                </div>

                <!-- Sidebar footer (Logout) -->
                <div class="sidebar-footer">
                    <a href="Login.aspx" class="btn btn-outline-light btn-sm w-100 py-2 border-0" onclick="handleLogout()">
                        <i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign Out
                    </a>
                </div>
            </aside>

            <!-- ==========================================
                 2. MAIN CONTENT PANEL
                 ========================================== -->
            <div class="main-panel">

                <!-- Top Navbar Header -->
                <header class="top-navbar d-flex justify-content-between align-items-center gap-3">
                    <!-- Left: hamburger (mobile) + page title -->
                    <div class="d-flex align-items-center flex-shrink-0">
                        <button class="btn btn-sm d-lg-none me-3 fs-4 border-0" id="sidebarToggleBtn">
                            <i class="fa-solid fa-bars"></i>
                        </button>
                        <h4 class="mb-0 text-dark fw-bold d-none d-md-block" style="font-family: var(--font-heading); white-space: nowrap;">
                            Manage Drives
                        </h4>
                    </div>

                    <!-- Centre: Global Search Bar -->
                    <div class="global-search-wrapper mx-2 flex-grow-1">
                        <i class="fa-solid fa-magnifying-glass global-search-icon"></i>
                        <input
                            type="text"
                            class="global-search-input"
                            id="globalSearchInput"
                            placeholder="Search students, drives, announcements..."
                            autocomplete="off">
                        <div class="search-results-dropdown" id="searchResultsDropdown"></div>
                    </div>

                    <!-- Right: User info + avatar -->
                    <div class="d-flex align-items-center gap-3 flex-shrink-0">
                        <div class="d-flex align-items-center text-end">
                            <div class="me-2 d-none d-sm-block">
                                <div class="fw-semibold text-dark">Placement Officer</div>
                                <div class="text-muted small">T&amp;P Department</div>
                            </div>
                            <div class="bg-rku-red fw-bold rounded-circle d-flex align-items-center justify-content-center text-white"
                                 style="width:40px; height:40px; font-size:1rem; flex-shrink:0;">
                                AD
                            </div>
                        </div>
                    </div>
                </header>

                <!-- Main Content Container -->
                <main class="content-container">

                    <!-- ─── MANAGE DRIVES TAB ─── -->
                    <div id="tab-manage-drives" class="tab-pane-content active">
                        <div class="row g-4">

                            <!-- Drives list -->
                            <div class="col-lg-7">
                                <div class="dashboard-card">
                                    <h5 class="fw-bold mb-3 d-flex justify-content-between align-items-center">
                                        <span>Active Recruiting Drives</span>
                                        <button class="btn btn-rku btn-sm" onclick="clearDriveForm()">
                                            <i class="fa-solid fa-plus me-1"></i>Add New
                                        </button>
                                    </h5>
                                    <div class="list-group overflow-auto" id="adminDrivesList" style="max-height: 550px;">
                                        <!-- Loaded dynamically -->
                                    </div>
                                </div>
                            </div>

                            <!-- Add / Edit Drive Form -->
                            <div class="col-lg-5">
                                <div class="dashboard-card">
                                    <h5 class="fw-bold mb-3 text-dark" id="driveFormTitle">Create New Campus Drive</h5>
                                    <div id="driveForm">
                                        <input type="hidden" id="driveIdField">

                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Company Name</label>
                                            <input type="text" class="form-control" id="driveCompany" placeholder="e.g. Google India" required>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Recruiting Job Role</label>
                                            <input type="text" class="form-control" id="driveRole" placeholder="e.g. SDE-1 Freshers" required>
                                        </div>

                                        <div class="row g-3 mb-3">
                                            <div class="col-6">
                                                <label class="form-label text-muted small fw-bold">Package Offered</label>
                                                <input type="text" class="form-control" id="drivePackage" placeholder="e.g. 7.5 LPA" required>
                                            </div>
                                            <div class="col-6">
                                                <label class="form-label text-muted small fw-bold">Min CGPA Required</label>
                                                <input type="number" step="0.1" min="0" max="10" class="form-control" id="driveMinCgpa" placeholder="e.g. 7.0" required>
                                            </div>
                                        </div>

                                        <div class="row g-3 mb-3">
                                            <div class="col-6">
                                                <label class="form-label text-muted small fw-bold">Drive Date</label>
                                                <input type="date" class="form-control" id="driveDate" required>
                                            </div>
                                            <div class="col-6">
                                                <label class="form-label text-muted small fw-bold">Job Status</label>
                                                <select class="form-select" id="driveStatus">
                                                    <option value="Open">Open</option>
                                                    <option value="Closed">Closed</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Venue Location / Test Mode</label>
                                            <input type="text" class="form-control" id="driveLocation" placeholder="e.g. SJT Lab 102 / Online" required>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Job Profile Description</label>
                                            <textarea class="form-control" id="driveDescription" rows="4" placeholder="Enter key eligibility, coding rounds, syllabus criteria..." required></textarea>
                                        </div>

                                        <div class="d-flex gap-2 justify-content-end">
                                            <button type="button" class="btn btn-secondary btn-sm" onclick="clearDriveForm()">
                                                Reset
                                            </button>
                                            <button type="button" class="btn btn-rku btn-sm" id="btnSubmitDrive" onclick="saveDrive(event)">
                                                Create Drive
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- ─── END MANAGE DRIVES TAB ─── -->

                </main>
            </div>
            <!-- /.main-panel -->

        </div>
        <!-- /.wrapper -->

        <!-- Bootstrap 5 Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Admin Panel – Manage Drives Controller -->
        <script>
            /* ── btn-rku style (RKU Red button) ── */
            (function () {
                var s = document.createElement('style');
                s.textContent = '.btn-rku{background:linear-gradient(135deg,#ef3724,#a30f14);color:#fff;border:none;font-family:\'Outfit\',sans-serif;font-weight:600;border-radius:8px;transition:opacity .2s,transform .15s}.btn-rku:hover{opacity:.9;color:#fff;transform:translateY(-1px)}.btn-rku:active{transform:translateY(0)}';
                document.head.appendChild(s);
            })();

            /* ── Page init ── */
            document.addEventListener('DOMContentLoaded', function () {
                renderManageDrives();

                // Mobile sidebar toggle
                var toggleBtn = document.getElementById('sidebarToggleBtn');
                if (toggleBtn) {
                    toggleBtn.addEventListener('click', function () {
                        document.getElementById('sidebar').classList.toggle('show');
                    });
                }
            });

            /* ── Render drives list ── */
            function renderManageDrives() {
                var drives = (typeof PortalDB !== 'undefined') ? PortalDB.getDrives() : [];
                var list = document.getElementById('adminDrivesList');
                list.innerHTML = '';

                if (!drives || drives.length === 0) {
                    list.innerHTML = '<p class="text-center text-muted small py-4"><i class="fa-regular fa-building me-2"></i>No placement drives found. Click <strong>Add New</strong> to create one.</p>';
                    return;
                }

                drives.forEach(function (d) {
                    var isClosed = d.status === 'Closed';
                    var div = document.createElement('div');
                    div.className = 'list-group-item list-group-item-action border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                    div.innerHTML =
                        '<div style="max-width:70%">' +
                            '<div class="d-flex align-items-center gap-2 mb-1">' +
                                '<span class="badge ' + (isClosed ? 'bg-secondary' : 'bg-success') + ' text-white rounded-pill px-2" style="font-size:.65rem">' + d.status + '</span>' +
                                '<span class="fw-bold small text-rku-maroon font-monospace">' + d.package + '</span>' +
                            '</div>' +
                            '<h6 class="fw-bold mb-0 text-dark" style="font-family:var(--font-heading)">' + d.companyName + '</h6>' +
                            '<p class="mb-0 text-muted small">' + d.role + ' &bull; CGPA &ge; ' + d.minCgpa + '</p>' +
                        '</div>' +
                        '<div class="d-flex gap-2">' +
                            '<button class="btn btn-outline-primary btn-sm border-0" onclick="editDrive(\'' + d.id + '\')" title="Edit Drive"><i class="fa-regular fa-pen-to-square"></i></button>' +
                            '<button class="btn btn-outline-danger btn-sm border-0" onclick="deleteDrive(\'' + d.id + '\')" title="Delete Drive"><i class="fa-regular fa-trash-can"></i></button>' +
                        '</div>';
                    list.appendChild(div);
                });
            }

            /* ── Date Formatter Helper ── */
            function formatDateForInput(dateStr) {
                if (!dateStr) return '';
                if (/^\d{4}-\d{2}-\d{2}$/.test(dateStr)) return dateStr;
                var d = new Date(dateStr);
                if (!isNaN(d.getTime())) {
                    var yyyy = d.getFullYear();
                    var mm = String(d.getMonth() + 1).padStart(2, '0');
                    var dd = String(d.getDate()).padStart(2, '0');
                    return yyyy + '-' + mm + '-' + dd;
                }
                return dateStr;
            }

            /* ── Clear / reset form ── */
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
                var btn = document.getElementById('btnSubmitDrive');
                btn.innerHTML = '<i class="fa-solid fa-plus me-1"></i>Create Drive';
                btn.className = 'btn btn-rku btn-sm';
                
                var card = document.getElementById('driveForm').closest('.dashboard-card');
                if (card) card.style.border = '';
            }

            /* ── Load drive data into form for editing ── */
            function editDrive(id) {
                if (typeof PortalDB === 'undefined') return;
                var drive = PortalDB.getDrive(id);
                if (!drive) return;

                document.getElementById('driveIdField').value = drive.id;
                document.getElementById('driveCompany').value = drive.companyName || '';
                document.getElementById('driveRole').value = drive.role || '';
                document.getElementById('drivePackage').value = drive.package || '';
                document.getElementById('driveMinCgpa').value = drive.minCgpa || '';
                document.getElementById('driveDate').value = formatDateForInput(drive.date);
                document.getElementById('driveStatus').value = drive.status || 'Open';
                document.getElementById('driveLocation').value = drive.location || '';
                document.getElementById('driveDescription').value = drive.description || '';

                document.getElementById('driveFormTitle').innerText = 'Modify Campus Drive: ' + (drive.companyName || '');
                var btn = document.getElementById('btnSubmitDrive');
                btn.innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i>Save Changes';
                btn.className = 'btn btn-success btn-sm';

                var card = document.getElementById('driveForm').closest('.dashboard-card');
                if (card) {
                    card.style.border = '2px solid #ef3724';
                }
                var firstInput = document.getElementById('driveCompany');
                if (firstInput) firstInput.focus({ preventScroll: true });
            }

            /* ── Save (create or update) drive ── */
            function saveDrive(e) {
                if (e && e.preventDefault) e.preventDefault();
                if (typeof PortalDB === 'undefined') { showDriveMsg('PortalDB not loaded.', 'danger'); return; }

                var driveId     = document.getElementById('driveIdField').value;
                var companyName = document.getElementById('driveCompany').value.trim();
                var role        = document.getElementById('driveRole').value.trim();
                var packageVal  = document.getElementById('drivePackage').value.trim();
                var minCgpa     = document.getElementById('driveMinCgpa').value.trim();
                var date        = document.getElementById('driveDate').value;
                var status      = document.getElementById('driveStatus').value;
                var location    = document.getElementById('driveLocation').value.trim();
                var description = document.getElementById('driveDescription').value.trim();

                // Manual validation
                if (!companyName) { showDriveMsg('Company Name is required.', 'danger'); document.getElementById('driveCompany').focus(); return; }
                if (!role)        { showDriveMsg('Job Role is required.', 'danger'); document.getElementById('driveRole').focus(); return; }
                if (!packageVal)  { showDriveMsg('Package is required.', 'danger'); document.getElementById('drivePackage').focus(); return; }
                if (!minCgpa)     { showDriveMsg('Min CGPA is required.', 'danger'); document.getElementById('driveMinCgpa').focus(); return; }
                if (!date)        { showDriveMsg('Drive Date is required.', 'danger'); document.getElementById('driveDate').focus(); return; }
                if (!location)    { showDriveMsg('Venue Location is required.', 'danger'); document.getElementById('driveLocation').focus(); return; }
                if (!description) { showDriveMsg('Job Profile Description is required.', 'danger'); document.getElementById('driveDescription').focus(); return; }

                var driveObj = { companyName: companyName, role: role, package: packageVal, minCgpa: minCgpa, date: date, status: status, location: location, description: description };

                if (driveId) {
                    var existingDrive = PortalDB.getDrive(driveId) || {};
                    var updatedDrive = Object.assign({}, existingDrive, driveObj, { id: driveId });
                    PortalDB.updateDrive(updatedDrive);
                    showDriveMsg('Recruitment Drive updated successfully! Synced to Student Panel.', 'success');
                } else {
                    driveObj.postedDate = new Date().toISOString().split('T')[0];
                    PortalDB.addDrive(driveObj);
                    showDriveMsg('New recruitment drive added successfully! Synced to Student Panel.', 'success');
                }

                clearDriveForm();
                renderManageDrives();
            }

            /* ── Attach to global window ── */
            window.editDrive = editDrive;
            window.saveDrive = saveDrive;
            window.clearDriveForm = clearDriveForm;
            window.renderManageDrives = renderManageDrives;

            /* ── Show inline message below form ── */
            function showDriveMsg(msg, type) {
                var existing = document.getElementById('driveAlert');
                if (existing) existing.remove();
                var el = document.createElement('div');
                el.id = 'driveAlert';
                el.className = 'alert alert-' + type + ' alert-dismissible py-2 mt-3 small';
                el.innerHTML = msg + '<button type="button" class="btn-close btn-sm" onclick="this.parentElement.remove()"></button>';
                document.getElementById('driveForm').appendChild(el);
                setTimeout(function(){ if (el.parentNode) el.remove(); }, 3500);
            }

            /* ── Delete a drive ── */
            function deleteDrive(id) {
                if (confirm('Are you sure you want to delete this placement drive? All corresponding student applications will also be deleted.')) {
                    if (typeof PortalDB !== 'undefined') PortalDB.deleteDrive(id);
                    renderManageDrives();
                }
            }

            /* ── Logout handler ── */
            function handleLogout() {
                if (typeof PortalDB !== 'undefined' && PortalDB.logout) PortalDB.logout();
            }
        </script>

    </body>
    </html>

</asp:Content>
