<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

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

        <!-- Auth protection script -->
        <script src="js/portal-db.js"></script>
        <script>
            // Check session
            const currentUser = PortalDB.getCurrentUser();
            if (!currentUser) {
                window.location.href = 'Login.aspx';
            } else if (currentUser.role !== 'admin') {
                window.location.href = 'StudentDashboard.aspx';
            }
        </script>

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
                        <li class="sidebar-item active" data-tab="tab-overview"><a href="AdminDashboard.aspx"><i class="fa-solid fa-chart-line"></i>Overview</a> </li>
                        <li class="sidebar-item" data-tab="tab-manage-drives"><a href="AdminManageDrives.aspx"><i class="fa-regular fa-building"></i>Manage Drives</a> </li>
                        <li class="sidebar-item" data-tab="tab-student-directory"><a href="AdminStudentDirectory.aspx"><i class="fa-solid fa-users"></i>Student Directory</a> </li>
                        <li class="sidebar-item" data-tab="tab-track-applications"><a href="AdminTrackApplications.aspx"><i class="fa-solid fa-list-check"></i>Application Tracker</a> </li>
                        <li class="sidebar-item" data-tab="tab-notifications"><a href="AdminNotifications.aspx"><i class="fa-regular fa-bell"></i>Send Broadcast</a> </li>
                        <li class="sidebar-item" data-tab="tab-manage-content"><a href="AdminManageContent.aspx"><i class="fa-solid fa-photo-film"></i>Manage Web Content</a> </li>
                        <li class="sidebar-item" data-tab="tab-reports"><a href="AdminReports.aspx"><i class="fa-solid fa-chart-column"></i>Reports &amp; Analytics</a> </li>
                    </ul>
                </div>

                <!-- Sidebar footer (Logout) -->
                <div class="sidebar-footer">
                    <a href="Login.aspx" class="btn btn-outline-light btn-sm w-100 py-2 border-0" onclick="handleLogout()"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign Out </a>
                </div>
            </aside>

            <!-- ==========================================
             2. MAIN CONTENT PANEL
             ========================================== -->
            <div class="main-panel">

                <!-- Navbar Header -->
                <header class="top-navbar d-flex justify-content-between align-items-center gap-3">
                    <div class="d-flex align-items-center flex-shrink-0">
                        <button class="btn btn-sm d-lg-none me-3 fs-4 border-0" id="sidebarToggleBtn">
                            <i class="fa-solid fa-bars"></i>
                        </button>
                        <h4 class="mb-0 text-dark fw-bold d-none d-md-block" id="panelTitle" style="font-family: var(--font-heading); white-space: nowrap;">Admin Portal Overview</h4>
                    </div>

                    <!-- ─── GLOBAL SEARCH BAR ─── -->
                    <div class="global-search-wrapper mx-2 flex-grow-1">
                        <i class="fa-solid fa-magnifying-glass global-search-icon"></i>

                        <input
                            type="text"
                            class="global-search-input"
                            id="globalSearchInput"
                            placeholder="Search students, drives, announcements..."
                            autocomplete="off"
                            oninput="handleGlobalSearch(this.value)">



                        <div class="search-results-dropdown" id="searchResultsDropdown">
                        </div>


                    </div>
                    <div class="d-flex align-items-center gap-3 flex-shrink-0">
                        <div class="d-flex align-items-center text-end">
                            <div class="me-2 d-none d-sm-block">
                                <div class="fw-semibold text-dark">
                                    Placement Officer
                                </div>
                                <div class="text-muted small">
                                    T&amp;P Department
                                </div>
                            </div>
                            <div class="avatar-circle bg-rku-red text-white fw-bold rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; font-size: 1rem;">
                                AD
                            </div>
                        </div>
                    </div>
                </header>

                <!-- Container for Tab Panes -->
                <main class="content-container">

                    <!-- ─── OVERVIEW TAB ─── -->
                    <div id="tab-overview" class="tab-pane-content active">
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

                    <%--  --%>
                    <!-- ─── END REPORTS TAB ─── -->

                </main>
            </div>
        </div>

        <!-- Bootstrap 5 Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Admin Panel JavaScript Controller -->
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                renderSidebarNavigation();
                initCharts();
                loadOverviewStats();
                renderManageDrives();
                renderStudentDirectory();
                renderApplicationsDropdown();
                renderAnnouncementsList();
                renderStoriesList();
                renderPlacementTeamList();
                renderPlacedStudentsList();
                renderGalleryList();
                renderCompaniesList();
                renderReports();

                const initialTab = new URLSearchParams(window.location.search).get('tab');
                if (initialTab) {
                    activateAdminTab(initialTab);
                }

                // Mobile sidebar toggle
                document.getElementById('sidebarToggleBtn').addEventListener('click', () => {
                    document.getElementById('sidebar').classList.toggle('show');
                });

                // Close search dropdown when clicking outside
                document.addEventListener('click', function (e) {
                    const wrapper = document.querySelector('.global-search-wrapper');
                    if (wrapper && !wrapper.contains(e.target)) {
                        document.getElementById('searchResultsDropdown').classList.remove('active');
                    }
                });
            });

            // 1. Sidebar navigation tab switching
            function renderSidebarNavigation() {
                const menuItems = document.querySelectorAll('.sidebar-item');
                const tabPanes = document.querySelectorAll('.tab-pane-content');
                const panelTitle = document.getElementById('panelTitle');

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
                        panelTitle.innerText = tabName === 'Overview' ? 'Admin Portal Overview' : tabName;

                        // Close sidebar on mobile after clicking
                        document.getElementById('sidebar').classList.remove('show');
                    });
                });
            }

            function activateAdminTab(tabId) {
                const target = document.getElementById(tabId);
                if (!target) return;

                const menuItems = document.querySelectorAll('.sidebar-item');
                const tabPanes = document.querySelectorAll('.tab-pane-content');
                const panelTitle = document.getElementById('panelTitle');

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
                    panelTitle.innerText = tabName === 'Overview' ? 'Admin Portal Overview' : tabName;
                }
            }

            function formatAdminDateTime(value) {
                if (!value) return '—';
                const date = new Date(value);
                if (Number.isNaN(date.getTime())) return '—';
                return date.toLocaleString('en-IN', {
                    day: '2-digit',
                    month: 'short',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                });
            }

            function formatAdminDuration(ms) {
                const totalMs = Number(ms || 0);
                if (totalMs <= 0) return '0m';
                const totalMinutes = Math.max(1, Math.floor(totalMs / 60000));
                const hours = Math.floor(totalMinutes / 60);
                const minutes = totalMinutes % 60;
                if (hours && minutes) return `${hours}h ${minutes}m`;
                if (hours) return `${hours}h`;
                return `${minutes}m`;
            }

            function getActivitySummary(account) {
                const currentSession = PortalDB.getCurrentUser();
                const isOnline = !!(currentSession && currentSession.username === account.username && currentSession.role === account.role);
                const startedAt = account.currentSessionStartedAt || account.lastLoginAt || '';
                const durationMs = isOnline && startedAt
                    ? Math.max(0, Date.now() - new Date(startedAt).getTime())
                    : Number(account.lastSessionDurationMs || 0);

                return {
                    isOnline,
                    lastLoginAt: account.lastLoginAt || startedAt || '',
                    lastLogoutAt: account.lastLogoutAt || '',
                    durationMs,
                    durationText: formatAdminDuration(durationMs)
                };
            }

            // 2. Load Overview statistics counters and charts
            function loadOverviewStats() {
                const students = PortalDB.getUsers().filter(u => u.role === 'student');
                const drives = PortalDB.getDrives();
                const applications = PortalDB.getApplications();

                // Calculate metrics
                const totalStudents = students.length;
                const activeDrives = drives.filter(d => d.status === 'Open').length;
                const placedStudentsCount = applications.filter(a => a.status === 'Selected').map(a => a.studentEnrollment);
                // Count unique student enrollments placed
                const uniquePlacedCount = [...new Set(placedStudentsCount)].length;

                const placementRate = totalStudents > 0 ? Math.round((uniquePlacedCount / totalStudents) * 100) : 0;

                document.getElementById('admStatStudents').innerText = totalStudents;
                document.getElementById('admStatDrives').innerText = activeDrives;
                document.getElementById('admStatPlaced').innerText = uniquePlacedCount;
                document.getElementById('admStatPercent').innerText = placementRate + '%';

                // Populate mock activity logs
                const logs = [
                    { act: 'New Student Registered', ent: 'Amit Joshi (20SOECE11002)', tm: '3 hours ago', st: 'success' },
                    { act: 'Applied to Drive', ent: 'Raj Patel -> TCS System Eng.', tm: 'Yesterday', st: 'primary' },
                    { act: 'Application Stage Changed', ent: 'Sneha Vyas -> Tech Round (TCS)', tm: '2 days ago', st: 'warning' },
                    { act: 'Drive Created', ent: 'Infosys (Power Programmer)', tm: '3 days ago', st: 'success' }
                ];
                const logTbody = document.getElementById('activityLogTableBody');
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
                    tbody.innerHTML = `<tr><td colspan="8" class="text-center text-muted small py-4">No registered students found.</td></tr>`;
                    return;
                }

                students.forEach(st => {
                    const branchInitials = st.branch ? st.branch.split(' ').map(p => p[0]).join('').toUpperCase() : 'N/A';
                    const activity = getActivitySummary(st);

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
                        <div class="fw-semibold text-dark">${formatAdminDateTime(activity.lastLoginAt)}</div>
                        <div class="text-muted small">${activity.isOnline ? 'Currently online' : 'Last known login'}</div>
                    </td>
                    <td>
                        <span class="badge rounded-pill ${activity.isOnline ? 'bg-success-subtle text-success border border-success-subtle' : 'bg-light text-muted border'}">${activity.isOnline ? 'Online' : 'Offline'}</span>
                        <div class="text-muted small mt-1">${activity.isOnline ? `Live session: ${activity.durationText}` : `Last session: ${activity.durationText}`}</div>
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
                            <button class="btn btn-outline-primary btn-sm border-0" onclick="openSendMailModal('${st.username}')" title="Send Placement Invite Mail"><i class="fa-regular fa-paper-plane me-1"></i>Mail</button>
                            <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteStudent('${st.username}')" title="Delete Student"><i class="fa-regular fa-trash-can"></i></button>
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

                alert(`📧 Email Notification Dispatched Successfully!\n\nTo: ${st.email}\nSubject: ${subject}\n\nNotice and notification pushed to student panel for ${st.name}.`);

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

            function resolveImageSrc(src) {
                if (!src) return '';
                if (src.startsWith('data:')) return src;
                return encodeURI(src);
            }

            // 7b. Placement Team Management
            function renderPlacementTeamList() {
                const members = PortalDB.getPlacementTeam().slice().sort((a, b) => (Number(a.order) || 999) - (Number(b.order) || 999));
                const list = document.getElementById('adminPlacementTeamList');
                const countBadge = document.getElementById('placementTeamCountBadge');
                if (countBadge) countBadge.textContent = `${members.length} members`;
                if (!list) return;
                list.innerHTML = '';

                if (members.length === 0) {
                    list.innerHTML = `<p class="text-center text-muted small py-4">No placement team members added yet.</p>`;
                    return;
                }

                members.forEach(m => {
                    const div = document.createElement('div');
                    div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                    const avatarHtml = m.photo
                        ? `<img src="${resolveImageSrc(m.photo)}" style="width:54px;height:54px;object-fit:cover;border-radius:10px;" class="me-3 border bg-white">`
                        : `<span class="me-3" style="width:54px;height:54px;border-radius:10px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-user-tie text-muted"></i></span>`;

                    div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width:72%;">
                        ${avatarHtml}
                        <div>
                            <div class="d-flex flex-wrap align-items-center gap-2 mb-1">
                                <h6 class="fw-bold mb-0 text-dark font-heading">${m.name}</h6>
                                ${m.featured ? '<span class="badge bg-primary text-white rounded-pill px-2" style="font-size:0.65rem;">Featured</span>' : ''}
                                <span class="badge bg-light text-dark border" style="font-size:0.65rem;">Order ${m.order || '-'}</span>
                            </div>
                            <p class="mb-0 text-muted small">${m.designation || 'Coordinator'} &bull; ${m.role || ''}</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editPlacementTeamMember('${m.id}')" title="Edit Team Member"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deletePlacementTeamMember('${m.id}')" title="Delete Team Member"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                    list.appendChild(div);
                });
            }

            async function savePlacementTeamMember(e) {
                e.preventDefault();
                const editId = document.getElementById('editPlacementTeamId').value;
                const name = document.getElementById('teamMemberName').value.trim();
                const designation = document.getElementById('teamMemberDesignation').value.trim();
                const role = document.getElementById('teamMemberRole').value.trim();
                const description = document.getElementById('teamMemberDescription').value.trim();
                const phone = document.getElementById('teamMemberPhone').value.trim();
                const email = document.getElementById('teamMemberEmail').value.trim();
                const order = document.getElementById('teamMemberOrder').value.trim();
                const featured = document.getElementById('teamMemberIsFeatured').checked;
                const fileInput = document.getElementById('teamMemberPhoto');

                if (!name || !designation || !role || !description || !order) {
                    alert('Please fill the required fields.');
                    return;
                }

                let photo = editId ? (PortalDB.getPlacementTeamMember(editId)?.photo || '') : '';
                if (fileInput && fileInput.files.length > 0) {
                    try {
                        photo = await getBase64(fileInput.files[0]);
                    } catch (error) {
                        alert('Error reading team photo file.');
                        return;
                    }
                }

                const memberData = { name, designation, role, description, phone, email, order: Number(order), featured, photo };

                if (editId) {
                    PortalDB.updatePlacementTeamMember(editId, memberData);
                    alert('Placement team member updated successfully!');
                } else {
                    PortalDB.addPlacementTeamMember(memberData);
                    alert('Placement team member added successfully!');
                }

                cancelEditPlacementTeamMember();
                renderPlacementTeamList();
                renderReports();
            }

            function previewPlacementTeamImage(input) {
                const preview = document.getElementById('teamMemberImagePreview');
                const hint = document.getElementById('teamMemberUploadHint');
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                        if (hint) hint.style.display = 'none';
                    };
                    reader.readAsDataURL(input.files[0]);
                } else {
                    preview.src = '';
                    preview.style.display = 'none';
                    if (hint) hint.style.display = 'block';
                }
            }

            function editPlacementTeamMember(id) {
                const m = PortalDB.getPlacementTeamMember(id);
                if (!m) return;
                document.getElementById('editPlacementTeamId').value = m.id;
                document.getElementById('teamMemberName').value = m.name || '';
                document.getElementById('teamMemberDesignation').value = m.designation || '';
                document.getElementById('teamMemberRole').value = m.role || '';
                document.getElementById('teamMemberDescription').value = m.description || '';
                document.getElementById('teamMemberPhone').value = m.phone || '';
                document.getElementById('teamMemberEmail').value = m.email || '';
                document.getElementById('teamMemberOrder').value = m.order || '';
                document.getElementById('teamMemberIsFeatured').checked = !!m.featured;
                const preview = document.getElementById('teamMemberImagePreview');
                const hint = document.getElementById('teamMemberUploadHint');
                if (m.photo) {
                    preview.src = resolveImageSrc(m.photo);
                    preview.style.display = 'block';
                    if (hint) hint.style.display = 'none';
                } else {
                    preview.src = '';
                    preview.style.display = 'none';
                    if (hint) hint.style.display = 'block';
                }
                document.getElementById('placementTeamFormTitle').textContent = 'Edit Team Member';
                document.getElementById('placementTeamSubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
                document.getElementById('placementTeamCancelBtn').style.display = 'block';
                document.getElementById('placementTeamForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
            }

            function cancelEditPlacementTeamMember() {
                document.getElementById('editPlacementTeamId').value = '';
                document.getElementById('placementTeamForm').reset();
                document.getElementById('placementTeamFormTitle').textContent = 'Add Team Member';
                document.getElementById('placementTeamSubmitBtn').innerHTML = '<i class="fa-solid fa-plus me-1"></i> Add Team Member';
                document.getElementById('placementTeamCancelBtn').style.display = 'none';
                const preview = document.getElementById('teamMemberImagePreview');
                const hint = document.getElementById('teamMemberUploadHint');
                if (preview) {
                    preview.src = '';
                    preview.style.display = 'none';
                }
                if (hint) hint.style.display = 'block';
            }

            function deletePlacementTeamMember(id) {
                if (confirm('Are you sure you want to delete this placement team member?')) {
                    PortalDB.deletePlacementTeamMember(id);
                    renderPlacementTeamList();
                    renderReports();
                }
            }

            // 7c. Placed Students Management
            function renderPlacedStudentsList() {
                const students = PortalDB.getPlacedStudents();
                const list = document.getElementById('adminPlacedStudentsList');
                const countBadge = document.getElementById('placedStudentCountBadge');
                if (countBadge) countBadge.textContent = `${students.length} students`;
                if (!list) return;
                list.innerHTML = '';

                if (students.length === 0) {
                    list.innerHTML = `<p class="text-center text-muted small py-4">No placed students added yet.</p>`;
                    return;
                }

                students.forEach(s => {
                    const div = document.createElement('div');
                    div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                    const avatarHtml = s.studentPhoto
                        ? `<img src="${s.studentPhoto}" style="width:46px;height:58px;object-fit:cover;border-radius:8px;" class="me-3 border bg-white">`
                        : `<span class="me-3" style="width:46px;height:58px;border-radius:8px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-user text-muted"></i></span>`;

                    div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width:72%;">
                        ${avatarHtml}
                        <div>
                            <div class="d-flex flex-wrap align-items-center gap-2 mb-1">
                                <h6 class="fw-bold mb-0 text-dark font-heading">${s.name}</h6>
                                <span class="badge bg-light text-dark border" style="font-size:0.68rem;">${s.year || 'N/A'}</span>
                                <span class="badge bg-success-subtle text-success border border-success-subtle" style="font-size:0.68rem;">${s.type || 'student'}</span>
                            </div>
                            <p class="mb-0 text-muted small">${s.dept || 'N/A'} &bull; ${s.company || 'N/A'}</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editPlacedStudent('${s.id}')" title="Edit Student"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deletePlacedStudent('${s.id}')" title="Delete Student"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                    list.appendChild(div);
                });
            }

            async function savePlacedStudent(e) {
                e.preventDefault();
                const editId = document.getElementById('editPlacedStudentId').value;
                const name = document.getElementById('placedStudentName').value.trim();
                const dept = document.getElementById('placedStudentDept').value.trim();
                const company = document.getElementById('placedStudentCompany').value.trim();
                const type = document.getElementById('placedStudentType').value;
                const year = document.getElementById('placedStudentYear').value;
                const fileInput = document.getElementById('placedStudentPhoto');

                if (!name || !dept || !company || !type || !year) return;

                let studentPhoto = editId ? (PortalDB.getPlacedStudent(editId)?.studentPhoto || '') : '';
                if (fileInput && fileInput.files.length > 0) {
                    try {
                        studentPhoto = await getBase64(fileInput.files[0]);
                    } catch (error) {
                        alert('Error reading student photo file.');
                        return;
                    }
                }

                const studentData = { name, dept, company, type, year, studentPhoto };

                if (editId) {
                    PortalDB.updatePlacedStudent(editId, studentData);
                    alert('Placed student updated successfully!');
                } else {
                    PortalDB.addPlacedStudent(studentData);
                    alert('Placed student published successfully!');
                }

                cancelEditPlacedStudent();
                renderPlacedStudentsList();
                renderReports();
            }

            function previewPlacedStudentImage(input) {
                const preview = document.getElementById('placedStudentImagePreview');
                const hint = document.getElementById('placedStudentUploadHint');
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                        if (hint) hint.style.display = 'none';
                    };
                    reader.readAsDataURL(input.files[0]);
                } else {
                    preview.src = '';
                    preview.style.display = 'none';
                    if (hint) hint.style.display = 'block';
                }
            }

            function editPlacedStudent(id) {
                const s = PortalDB.getPlacedStudent(id);
                if (!s) return;
                document.getElementById('editPlacedStudentId').value = s.id;
                document.getElementById('placedStudentName').value = s.name || '';
                document.getElementById('placedStudentDept').value = s.dept || '';
                document.getElementById('placedStudentCompany').value = s.company || '';
                document.getElementById('placedStudentType').value = s.type || 'computer';
                document.getElementById('placedStudentYear').value = s.year || '2023-24';
                const preview = document.getElementById('placedStudentImagePreview');
                const hint = document.getElementById('placedStudentUploadHint');
                if (s.studentPhoto) {
                    preview.src = s.studentPhoto;
                    preview.style.display = 'block';
                    if (hint) hint.style.display = 'none';
                } else {
                    preview.src = '';
                    preview.style.display = 'none';
                    if (hint) hint.style.display = 'block';
                }
                document.getElementById('placedStudentFormTitle').textContent = 'Edit Placed Student';
                document.getElementById('placedStudentSubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
                document.getElementById('placedStudentCancelBtn').style.display = 'block';
                document.getElementById('placedStudentForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
            }

            function cancelEditPlacedStudent() {
                document.getElementById('editPlacedStudentId').value = '';
                document.getElementById('placedStudentForm').reset();
                document.getElementById('placedStudentFormTitle').textContent = 'Add Placed Student';
                document.getElementById('placedStudentSubmitBtn').innerHTML = '<i class="fa-solid fa-cloud-arrow-up me-1"></i> Publish Student Card';
                document.getElementById('placedStudentCancelBtn').style.display = 'none';
                const preview = document.getElementById('placedStudentImagePreview');
                const hint = document.getElementById('placedStudentUploadHint');
                if (preview) {
                    preview.src = '';
                    preview.style.display = 'none';
                }
                if (hint) hint.style.display = 'block';
            }

            function deletePlacedStudent(id) {
                if (confirm('Are you sure you want to delete this placed student card?')) {
                    PortalDB.deletePlacedStudent(id);
                    renderPlacedStudentsList();
                    renderReports();
                }
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
                const users = PortalDB.getUsers();
                const drives = PortalDB.getDrives();
                const applications = PortalDB.getApplications();
                const students = users.filter(u => u.role === 'student');

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
                    // Find matching drives & placed students for this company
                    const companyDrives = drives.filter(d =>
                        d.companyName.toLowerCase().includes(c.name.toLowerCase()) ||
                        c.name.toLowerCase().includes(d.companyName.toLowerCase())
                    );
                    const driveIds = companyDrives.map(d => d.id);

                    const placedApps = applications.filter(a =>
                        a.status === 'Selected' && (driveIds.includes(a.driveId) || (a.companyName && a.companyName.toLowerCase().includes(c.name.toLowerCase())))
                    );
                    const placedCount = placedApps.length;

                    // Check if company is registered user account
                    const linkedUser = users.find(u => u.username === c.linkedUsername || (u.role === 'company' && u.name.toLowerCase() === c.name.toLowerCase()));
                    const regBadge = linkedUser ? `<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill font-monospace ms-2" style="font-size:0.65rem;"><i class="fa-solid fa-circle-check me-1"></i>Registered</span>` : '';
                    const activitySource = linkedUser || {
                        username: c.linkedUsername || c.name,
                        role: 'company',
                        lastLoginAt: c.lastLoginAt,
                        lastLogoutAt: c.lastLogoutAt,
                        currentSessionStartedAt: c.currentSessionStartedAt,
                        lastSessionDurationMs: c.lastSessionDurationMs
                    };
                    const activity = getActivitySummary(activitySource);

                    const div = document.createElement('div');
                    div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                    const logoHtml = c.logoBase64 ? `<img src="${c.logoBase64}" alt="${c.name}" style="height: 38px; width: 38px; object-fit: contain;" class="me-3 rounded border bg-white p-1">` : `<span class="me-3" style="width:38px;height:38px;border-radius:6px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-building text-muted"></i></span>`;

                    div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 70%;">
                        ${logoHtml}
                        <div>
                            <div class="d-flex align-items-center">
                                <h6 class="fw-bold mb-0 text-dark font-heading me-1">${c.name}</h6>
                                ${regBadge}
                            </div>
                            <p class="mb-0 text-muted small mt-1">
                                <i class="fa-solid fa-location-dot me-1"></i>${c.location || '-'} &bull; 
                                <span class="fw-semibold text-dark">${c.packageRange || 'N/A'}</span> &bull; 
                                <span class="text-success fw-bold"><i class="fa-solid fa-user-check me-1"></i>${placedCount} Placed</span>
                            </p>
                            <div class="d-flex flex-wrap align-items-center gap-2 mt-2">
                                <span class="badge rounded-pill ${activity.isOnline ? 'bg-success-subtle text-success border border-success-subtle' : 'bg-light text-muted border'}" style="font-size:0.68rem;">
                                    ${activity.isOnline ? 'Online' : 'Offline'}
                                </span>
                                <span class="text-muted small"><i class="fa-regular fa-clock me-1"></i>Last login: ${formatAdminDateTime(activity.lastLoginAt)}</span>
                                <span class="text-muted small"><i class="fa-solid fa-hourglass-half me-1"></i>${activity.isOnline ? `Live session: ${activity.durationText}` : `Last session: ${activity.durationText}`}</span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-info btn-sm border-0" onclick="viewCompanyStats('${c.id}')" title="View Full Profile & Placements"><i class="fa-solid fa-id-card me-1"></i> Profile &amp; Stats</button>
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editCompany('${c.id}')" title="Edit Company"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn-outline-danger btn-sm btn border-0" onclick="deleteCompany('${c.id}')" title="Delete Company"><i class="fa-regular fa-trash-can"></i></button>
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

            // View Company Full Profile & Placed Students Stats in Admin Panel
            function viewCompanyStats(companyId) {
                const company = PortalDB.getCompanies().find(c => c.id === companyId);
                if (!company) return;

                const users = PortalDB.getUsers();
                const drives = PortalDB.getDrives();
                const applications = PortalDB.getApplications();

                // Find matching user account if registered
                const linkedUser = users.find(u => u.username === company.linkedUsername || (u.role === 'company' && u.name.toLowerCase() === company.name.toLowerCase()));

                // Find drives for this company
                const companyDrives = drives.filter(d =>
                    d.companyName.toLowerCase().includes(company.name.toLowerCase()) ||
                    company.name.toLowerCase().includes(d.companyName.toLowerCase())
                );
                const driveIds = companyDrives.map(d => d.id);

                // Find all applicants and placed students
                const companyApps = applications.filter(a => driveIds.includes(a.driveId) || (a.companyName && a.companyName.toLowerCase().includes(company.name.toLowerCase())));
                const placedApps = companyApps.filter(a => a.status === 'Selected');

                const modalBody = document.getElementById('companyStatsModalBody');
                const logoHtml = company.logoBase64 ? `<img src="${company.logoBase64}" style="max-height:80px; max-width:140px; object-fit:contain;" class="border p-2 rounded bg-white">` : `<div class="bg-rku-red text-white fw-bold rounded p-3 d-inline-block fs-3">${company.name.slice(0, 2).toUpperCase()}</div>`;

                let placedRowsHtml = '';
                if (placedApps.length === 0) {
                    placedRowsHtml = `<tr><td colspan="5" class="text-center text-muted small py-4">No students placed in ${company.name} yet.</td></tr>`;
                } else {
                    placedApps.forEach(app => {
                        const student = users.find(u => u.enrollment === app.studentEnrollment || u.username === app.studentEnrollment) || { name: 'Student (' + app.studentEnrollment + ')', branch: 'N/A', cgpa: 'N/A' };
                        const drive = companyDrives.find(d => d.id === app.driveId) || { role: 'Software Engineer', package: company.packageRange || '4.5 LPA' };

                        placedRowsHtml += `
                        <tr>
                            <td>
                                <div class="fw-bold font-heading text-dark">${student.name}</div>
                                <div class="text-muted small font-monospace">${app.studentEnrollment}</div>
                            </td>
                            <td><span class="badge bg-light text-dark border">${student.branch || 'Engineering'}</span></td>
                            <td><span class="fw-semibold text-dark">${drive.role}</span></td>
                            <td><span class="badge bg-success font-heading text-white px-2 py-1">${drive.package || company.packageRange || 'N/A'}</span></td>
                            <td><span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill"><i class="fa-solid fa-circle-check me-1"></i>Selected &amp; Placed</span></td>
                        </tr>
                    `;
                    });
                }

                modalBody.innerHTML = `
                <div class="row g-4 mb-4">
                    <div class="col-md-4 text-center border-end">
                        <div class="mb-3">${logoHtml}</div>
                        <h4 class="fw-bold font-heading text-dark mb-1">${company.name}</h4>
                        <div class="badge bg-primary-subtle text-primary mb-2">${(company.industry || 'IT').toUpperCase()}</div>
                        <div class="text-muted small mb-1"><i class="fa-solid fa-location-dot me-1 text-rku-red"></i>${company.location || 'N/A'}</div>
                        ${company.website ? `<a href="${company.website}" target="_blank" class="text-rku-red small text-decoration-none"><i class="fa-solid fa-globe me-1"></i>${company.website}</a>` : ''}
                    </div>
                    <div class="col-md-8">
                        <h6 class="fw-bold font-heading text-dark border-bottom pb-2 mb-3"><i class="fa-solid fa-building-user me-2 text-rku-red"></i>Company Profile &amp; Contact Details</h6>
                        <div class="row g-3 small mb-3">
                            <div class="col-6">
                                <span class="text-muted d-block">HR Contact Person:</span>
                                <span class="fw-bold text-dark">${linkedUser ? (linkedUser.enrollment || linkedUser.name) : (company.hrName || 'HR Team')}</span>
                            </div>
                            <div class="col-6">
                                <span class="text-muted d-block">Contact Email:</span>
                                <span class="fw-bold text-dark">${linkedUser ? linkedUser.email : (company.email || 'hr@' + company.name.toLowerCase().replace(/[^a-z]/g, '') + '.com')}</span>
                            </div>
                            <div class="col-6">
                                <span class="text-muted d-block">Contact Mobile:</span>
                                <span class="fw-bold text-dark">${linkedUser ? (linkedUser.mobile || '+91 98250 11000') : '+91 98250 11000'}</span>
                            </div>
                            <div class="col-6">
                                <span class="text-muted d-block">Portal Account Username:</span>
                                <span class="fw-bold font-monospace text-rku-red">${linkedUser ? linkedUser.username : (company.linkedUsername || 'Not Registered')}</span>
                            </div>
                        </div>
                        <div class="bg-light p-3 rounded mb-3">
                            <span class="fw-bold text-dark d-block mb-1 small">Tagline &amp; About:</span>
                            <p class="text-muted small mb-0">${company.tagline ? '<em>"' + company.tagline + '"</em> &bull; ' : ''}${company.description || 'No description provided.'}</p>
                        </div>
                    </div>
                </div>

                <!-- Summary Metrics Cards -->
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <div class="p-3 bg-success-subtle border border-success-subtle rounded text-center">
                            <div class="fs-2 fw-bold text-success font-heading">${placedApps.length}</div>
                            <div class="text-success small fw-semibold"><i class="fa-solid fa-user-graduate me-1"></i>Students Placed</div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 bg-primary-subtle border border-primary-subtle rounded text-center">
                            <div class="fs-2 fw-bold text-primary font-heading">${company.packageRange || '4.5 LPA'}</div>
                            <div class="text-primary small fw-semibold"><i class="fa-solid fa-money-bill-wave me-1"></i>Salary Package Offered</div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 bg-warning-subtle border border-warning-subtle rounded text-center">
                            <div class="fs-2 fw-bold text-dark font-heading">${companyDrives.length}</div>
                            <div class="text-dark small fw-semibold"><i class="fa-regular fa-building me-1"></i>Campus Drives Conducted</div>
                        </div>
                    </div>
                </div>

                <!-- Placed Students Table -->
                <h6 class="fw-bold font-heading text-dark border-bottom pb-2 mb-3">
                    <i class="fa-solid fa-list-check me-2 text-rku-red"></i>Placed Students List (${placedApps.length})
                </h6>
                <div class="table-responsive">
                    <table class="table table-hover align-middle table-sm small">
                        <thead class="table-light">
                            <tr>
                                <th>Student Details</th>
                                <th>Branch</th>
                                <th>Placed Job Role</th>
                                <th>Package Offered</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${placedRowsHtml}
                        </tbody>
                    </table>
                </div>
            `;

                const modal = new bootstrap.Modal(document.getElementById('companyStatsModal'));
                modal.show();
            }

            // 10. Logout
            function handleLogout() {
                if (confirm('Are you sure you want to sign out?')) {
                    PortalDB.logout();
                    window.location.href = 'Login.aspx';
                }
            }

            // ══════════════════════════════════════════════
            // 11. GLOBAL SEARCH FUNCTIONALITY
            // ══════════════════════════════════════════════
            function handleGlobalSearch(query) {
                const dropdown = document.getElementById('searchResultsDropdown');
                query = query.trim().toLowerCase();

                if (query.length < 2) {
                    dropdown.classList.remove('active');
                    dropdown.innerHTML = '';
                    return;
                }

                const students = PortalDB.getUsers().filter(u => u.role === 'student');
                const drives = PortalDB.getDrives();
                const announcements = PortalDB.getAnnouncements();

                const matchedStudents = students.filter(s =>
                    (s.name || '').toLowerCase().includes(query) ||
                    (s.enrollment || '').toLowerCase().includes(query) ||
                    (s.email || '').toLowerCase().includes(query) ||
                    (s.branch || '').toLowerCase().includes(query)
                ).slice(0, 5);

                const matchedDrives = drives.filter(d =>
                    (d.companyName || '').toLowerCase().includes(query) ||
                    (d.role || '').toLowerCase().includes(query) ||
                    (d.package || '').toLowerCase().includes(query)
                ).slice(0, 4);

                const matchedAnn = announcements.filter(a =>
                    (a.title || '').toLowerCase().includes(query) ||
                    (a.message || '').toLowerCase().includes(query)
                ).slice(0, 3);

                let html = '';

                if (matchedStudents.length === 0 && matchedDrives.length === 0 && matchedAnn.length === 0) {
                    html = `<div class="search-no-results"><i class="fa-solid fa-face-frown-open me-2 text-muted"></i>No results found for "<strong>${query}</strong>"</div>`;
                }

                if (matchedStudents.length > 0) {
                    html += `<div class="search-result-category"><i class="fa-solid fa-users me-1"></i>Students</div>`;
                    matchedStudents.forEach(s => {
                        const initials = (s.name || 'SP').split(' ').map(p => p[0]).join('').substring(0, 2).toUpperCase();
                        const avatarHtml = s.photoBase64
                            ? `<img src="${s.photoBase64}" style="width:30px;height:30px;border-radius:50%;object-fit:cover;">`
                            : `<span style="width:30px;height:30px;border-radius:50%;background:rgba(163,15,20,0.1);color:var(--rku-maroon);font-size:0.7rem;font-weight:700;display:inline-flex;align-items:center;justify-content:center;">${initials}</span>`;
                        html += `<div class="search-result-item" onclick="goToStudentFromSearch('${s.username}')">
                        <div class="result-icon" style="padding:0;overflow:hidden;border-radius:50%;">${avatarHtml}</div>
                        <div>
                            <div class="result-title">${s.name}</div>
                            <div class="result-sub">${s.enrollment} &bull; ${s.branch || 'N/A'} &bull; CGPA: ${parseFloat(s.cgpa || 0).toFixed(2)}</div>
                        </div>
                    </div>`;
                    });
                }

                if (matchedDrives.length > 0) {
                    html += `<div class="search-result-category"><i class="fa-regular fa-building me-1"></i>Campus Drives</div>`;
                    matchedDrives.forEach(d => {
                        const statusColor = d.status === 'Open' ? '#28a745' : '#6c757d';
                        html += `<div class="search-result-item" onclick="goToDriveFromSearch()">
                        <div class="result-icon" style="background:rgba(23,162,184,0.1);color:#17a2b8;">
                            <i class="fa-regular fa-building"></i>
                        </div>
                        <div>
                            <div class="result-title">${d.companyName} &mdash; ${d.role}</div>
                            <div class="result-sub">${d.package} &bull; CGPA &ge; ${d.minCgpa} &bull; <span style="color:${statusColor};font-weight:600;">${d.status}</span></div>
                        </div>
                    </div>`;
                    });
                }

                if (matchedAnn.length > 0) {
                    html += `<div class="search-result-category"><i class="fa-regular fa-bell me-1"></i>Broadcasts</div>`;
                    matchedAnn.forEach(a => {
                        html += `<div class="search-result-item" onclick="goToTab('tab-notifications')">
                        <div class="result-icon" style="background:rgba(255,193,7,0.1);color:#ffc107;">
                            <i class="fa-regular fa-bell"></i>
                        </div>
                        <div>
                            <div class="result-title">${a.title}</div>
                            <div class="result-sub">${a.date}</div>
                        </div>
                    </div>`;
                    });
                }

                dropdown.innerHTML = html;
                dropdown.classList.add('active');
            }

            function goToStudentFromSearch(username) {
                document.getElementById('searchResultsDropdown').classList.remove('active');
                document.getElementById('globalSearchInput').value = '';
                goToTab('tab-student-directory');
                setTimeout(() => {
                    const input = document.getElementById('studentSearchInput');
                    if (input) {
                        const user = PortalDB.getUser(username);
                        if (user) { input.value = user.enrollment; filterStudentTable(); }
                    }
                }, 200);
            }

            function goToDriveFromSearch() {
                document.getElementById('searchResultsDropdown').classList.remove('active');
                document.getElementById('globalSearchInput').value = '';
                goToTab('tab-manage-drives');
            }

            function goToTab(tabId) {
                const menuItems = document.querySelectorAll('.sidebar-item');
                const tabPanes = document.querySelectorAll('.tab-pane-content');
                menuItems.forEach(m => m.classList.remove('active'));
                tabPanes.forEach(p => p.classList.remove('active'));
                const targetPane = document.getElementById(tabId);
                if (targetPane) targetPane.classList.add('active');
                const targetItem = document.querySelector(`.sidebar-item[data-tab="${tabId}"]`);
                if (targetItem) targetItem.classList.add('active');
                const panelTitle = document.getElementById('panelTitle');
                if (targetItem && panelTitle) panelTitle.innerText = targetItem.innerText.trim();
            }

            // ══════════════════════════════════════════════
            // 12. REPORTS & ANALYTICS
            // ══════════════════════════════════════════════
            let rptBranchChart = null;
            let rptStatusChart = null;

            function renderReports() {
                const students = PortalDB.getUsers().filter(u => u.role === 'student');
                const drives = PortalDB.getDrives();
                const applications = PortalDB.getApplications();

                // ─── KPI Cards ───
                const totalStudents = students.length;
                const totalDrives = drives.length;
                const totalApps = applications.length;
                const placedEnrollments = [...new Set(applications.filter(a => a.status === 'Selected').map(a => a.studentEnrollment))];
                const totalPlaced = placedEnrollments.length;
                const placementRate = totalStudents > 0 ? Math.round((totalPlaced / totalStudents) * 100) : 0;

                // Avg package from placed drives
                let avgPkg = '—';
                const placedDriveIds = [...new Set(applications.filter(a => a.status === 'Selected').map(a => a.driveId))];
                const pkgNumbers = placedDriveIds.map(id => {
                    const drive = drives.find(d => d.id === id);
                    if (!drive || !drive.package) return null;
                    const match = drive.package.match(/([\d.]+)/);
                    return match ? parseFloat(match[1]) : null;
                }).filter(v => v !== null);
                if (pkgNumbers.length > 0) {
                    const avg = (pkgNumbers.reduce((a, b) => a + b, 0) / pkgNumbers.length).toFixed(1);
                    avgPkg = avg + ' LPA';
                }

                document.getElementById('rpt-total-students').innerText = totalStudents;
                document.getElementById('rpt-total-drives').innerText = totalDrives;
                document.getElementById('rpt-total-apps').innerText = totalApps;
                document.getElementById('rpt-placed').innerText = totalPlaced;
                document.getElementById('rpt-rate').innerText = placementRate + '%';
                document.getElementById('rpt-avg-pkg').innerText = avgPkg;

                // ─── Department-wise Placement Table ───
                const branches = {};
                students.forEach(s => {
                    const br = s.branch || 'Others';
                    if (!branches[br]) branches[br] = { total: 0, placed: 0 };
                    branches[br].total++;
                    if (placedEnrollments.includes(s.enrollment)) branches[br].placed++;
                });

                const deptTbody = document.getElementById('rptDeptTableBody');
                deptTbody.innerHTML = '';
                if (Object.keys(branches).length === 0) {
                    deptTbody.innerHTML = `<tr><td colspan="4" class="text-center text-muted small py-4">No student data available.</td></tr>`;
                } else {
                    Object.entries(branches).sort((a, b) => b[1].placed - a[1].placed).forEach(([br, data]) => {
                        const rate = data.total > 0 ? Math.round((data.placed / data.total) * 100) : 0;
                        const barColor = rate >= 80 ? '#28a745' : rate >= 50 ? '#ffc107' : '#dc3545';
                        const tr = document.createElement('tr');
                        tr.setAttribute('data-search-text', br.toLowerCase());
                        tr.innerHTML = `
                        <td><span class="fw-bold font-heading text-dark">${br}</span></td>
                        <td class="text-center">${data.total}</td>
                        <td class="text-center"><span class="fw-bold text-success">${data.placed}</span></td>
                        <td class="text-center">
                            <div class="d-flex align-items-center justify-content-center gap-2">
                                <div style="width:80px;height:8px;background:#eee;border-radius:50px;overflow:hidden;">
                                    <div style="width:${rate}%;height:100%;background:${barColor};border-radius:50px;"></div>
                                </div>
                                <span class="fw-bold" style="color:${barColor};font-size:0.8rem;">${rate}%</span>
                            </div>
                        </td>
                    `;
                        deptTbody.appendChild(tr);
                    });
                }

                // ─── Drive-wise Summary Table ───
                const driveTbody = document.getElementById('rptDriveTableBody');
                driveTbody.innerHTML = '';
                if (drives.length === 0) {
                    driveTbody.innerHTML = `<tr><td colspan="6" class="text-center text-muted small py-4">No drives posted yet.</td></tr>`;
                } else {
                    drives.forEach(d => {
                        const driveApps = applications.filter(a => a.driveId === d.id);
                        const drivePlaced = driveApps.filter(a => a.status === 'Selected').length;
                        const successRate = driveApps.length > 0 ? Math.round((drivePlaced / driveApps.length) * 100) : 0;
                        const statusBadge = d.status === 'Open'
                            ? `<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill" style="font-size:0.68rem;">Open</span>`
                            : `<span class="badge bg-secondary-subtle text-secondary border rounded-pill" style="font-size:0.68rem;">Closed</span>`;
                        const tr = document.createElement('tr');
                        tr.setAttribute('data-search-text', (d.companyName + ' ' + d.role).toLowerCase());
                        tr.innerHTML = `
                        <td>
                            <div class="d-flex align-items-center gap-2">
                                ${statusBadge}
                                <span class="fw-bold font-heading text-dark">${d.companyName}</span>
                            </div>
                        </td>
                        <td class="text-muted small">${d.role}</td>
                        <td class="text-center"><span class="badge bg-rku-maroon text-white font-monospace" style="font-size:0.72rem;">${d.package}</span></td>
                        <td class="text-center fw-bold">${driveApps.length}</td>
                        <td class="text-center"><span class="fw-bold text-success">${drivePlaced}</span></td>
                        <td class="text-center">
                            <span class="fw-bold" style="color:${successRate >= 50 ? '#28a745' : '#dc3545'};">${successRate}%</span>
                        </td>
                    `;
                        driveTbody.appendChild(tr);
                    });
                }

                // ─── Placed Students Full List ───
                renderPlacedStudentsTable(students, drives, applications, placedEnrollments);

                // ─── Charts ───
                renderReportCharts(branches, applications);
            }

            function renderPlacedStudentsTable(students, drives, applications, placedEnrollments) {
                const tbody = document.getElementById('rptPlacedTableBody');
                tbody.innerHTML = '';
                const placedApps = applications.filter(a => a.status === 'Selected');

                if (placedApps.length === 0) {
                    tbody.innerHTML = `<tr><td colspan="8" class="text-center text-muted small py-4"><i class="fa-solid fa-inbox me-2"></i>No placed students yet.</td></tr>`;
                    return;
                }

                placedApps.forEach(app => {
                    const student = students.find(s => s.enrollment === app.studentEnrollment) || { name: 'Unknown', branch: 'N/A', cgpa: 'N/A', enrollment: app.studentEnrollment };
                    const drive = drives.find(d => d.id === app.driveId) || { companyName: app.companyName || 'N/A', role: 'N/A', package: 'N/A' };
                    const tr = document.createElement('tr');
                    tr.setAttribute('data-search-text', ((student.name || '') + ' ' + (student.enrollment || '')).toLowerCase());
                    tr.setAttribute('data-branch', student.branch || '');
                    tr.innerHTML = `
                    <td class="font-monospace small fw-bold">${student.enrollment}</td>
                    <td>
                        <span class="fw-bold font-heading text-dark">${student.name}</span>
                    </td>
                    <td><span class="badge bg-light text-dark border" style="font-size:0.72rem;">${student.branch || 'N/A'}</span></td>
                    <td class="fw-bold text-center">${parseFloat(student.cgpa || 0).toFixed(2)}</td>
                    <td class="fw-bold font-heading text-dark">${drive.companyName}</td>
                    <td class="text-muted small">${drive.role}</td>
                    <td><span class="badge bg-success text-white font-monospace" style="font-size:0.72rem;">${drive.package}</span></td>
                    <td class="text-center"><span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill" style="font-size:0.68rem;"><i class="fa-solid fa-circle-check me-1"></i>Placed</span></td>
                `;
                    tbody.appendChild(tr);
                });
            }

            function filterReportTable(tbodyId, searchInputId) {
                const query = document.getElementById(searchInputId).value.toLowerCase();
                const rows = document.querySelectorAll(`#${tbodyId} tr`);
                rows.forEach(row => {
                    const text = row.getAttribute('data-search-text') || '';
                    row.style.display = text.includes(query) ? '' : 'none';
                });
            }

            function filterPlacedTable() {
                const query = document.getElementById('rptPlacedSearch').value.toLowerCase();
                const branch = document.getElementById('rptPlacedBranchFilter').value;
                const rows = document.querySelectorAll('#rptPlacedTableBody tr');
                rows.forEach(row => {
                    const text = row.getAttribute('data-search-text') || '';
                    const rowBranch = row.getAttribute('data-branch') || '';
                    const matchSearch = text.includes(query);
                    const matchBranch = branch === 'all' || rowBranch === branch;
                    row.style.display = (matchSearch && matchBranch) ? '' : 'none';
                });
            }

            function renderReportCharts(branches, applications) {
                // Bar chart: Placement % by branch
                const branchLabels = Object.keys(branches);
                const branchRates = branchLabels.map(br => {
                    const d = branches[br];
                    return d.total > 0 ? Math.round((d.placed / d.total) * 100) : 0;
                });

                const ctxBranch = document.getElementById('rptChartBranch');
                if (ctxBranch) {
                    if (rptBranchChart) rptBranchChart.destroy();
                    rptBranchChart = new Chart(ctxBranch, {
                        type: 'bar',
                        data: {
                            labels: branchLabels.length > 0 ? branchLabels : ['CE', 'IT', 'Mech', 'Civil', 'MBA'],
                            datasets: [{
                                label: 'Placement %',
                                data: branchRates.length > 0 ? branchRates : [72, 65, 48, 55, 80],
                                backgroundColor: ['rgba(163,15,20,0.75)', 'rgba(239,55,36,0.75)', 'rgba(253,126,20,0.75)', 'rgba(23,162,184,0.75)', 'rgba(40,167,69,0.75)'],
                                borderRadius: 6,
                                borderSkipped: false
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: { legend: { display: false } },
                            scales: {
                                y: { beginAtZero: true, max: 100, ticks: { callback: v => v + '%', font: { size: 10 } } },
                                x: { ticks: { font: { size: 9 } } }
                            }
                        }
                    });
                }

                // Pie chart: Application status
                const statusCounts = { Applied: 0, Shortlisted: 0, Selected: 0, Rejected: 0 };
                applications.forEach(a => {
                    if (statusCounts[a.status] !== undefined) statusCounts[a.status]++;
                    else statusCounts['Applied']++;
                });

                const ctxStatus = document.getElementById('rptChartStatus');
                if (ctxStatus) {
                    if (rptStatusChart) rptStatusChart.destroy();
                    rptStatusChart = new Chart(ctxStatus, {
                        type: 'doughnut',
                        data: {
                            labels: ['Applied', 'Shortlisted', 'Selected (Placed)', 'Rejected'],
                            datasets: [{
                                data: applications.length > 0
                                    ? [statusCounts.Applied, statusCounts.Shortlisted, statusCounts.Selected, statusCounts.Rejected]
                                    : [5, 3, 2, 1],
                                backgroundColor: ['#17a2b8', '#ffc107', '#28a745', '#dc3545'],
                                borderWidth: 2,
                                borderColor: '#fff'
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            cutout: '62%',
                            plugins: { legend: { position: 'bottom', labels: { boxWidth: 10, font: { size: 9 } } } }
                        }
                    });
                }
            }

            function exportPlacedStudentsCSV() {
                const students = PortalDB.getUsers().filter(u => u.role === 'student');
                const drives = PortalDB.getDrives();
                const applications = PortalDB.getApplications().filter(a => a.status === 'Selected');

                if (applications.length === 0) {
                    alert('No placed students data to export.');
                    return;
                }

                const headers = ['Enrollment No', 'Student Name', 'Branch', 'CGPA', 'Backlogs', 'Company', 'Job Role', 'Package', 'Applied Date', 'Stage'];
                const rows = applications.map(app => {
                    const student = students.find(s => s.enrollment === app.studentEnrollment) || {};
                    const drive = drives.find(d => d.id === app.driveId) || {};
                    return [
                        app.studentEnrollment,
                        (student.name || 'N/A').replace(/,/g, ' '),
                        (student.branch || 'N/A').replace(/,/g, ' '),
                        student.cgpa || 'N/A',
                        student.backlogs || 0,
                        (drive.companyName || app.companyName || 'N/A').replace(/,/g, ' '),
                        (drive.role || 'N/A').replace(/,/g, ' '),
                        (drive.package || 'N/A').replace(/,/g, ' '),
                        app.appliedDate || 'N/A',
                        app.stage || 'Selected'
                    ].join(',');
                });

                const csvContent = [headers.join(','), ...rows].join('\n');
                const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
                const url = URL.createObjectURL(blob);
                const link = document.createElement('a');
                link.href = url;
                link.download = `RKU_Placed_Students_${new Date().toISOString().slice(0, 10)}.csv`;
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
                URL.revokeObjectURL(url);
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

        <!-- ─── COMPANY PROFILE & PLACEMENT STATS MODAL (ADMIN) ─── -->
        <div class="modal fade" id="companyStatsModal" tabindex="-1" aria-labelledby="companyStatsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title font-heading fw-bold" id="companyStatsModalLabel"><i class="fa-solid fa-building me-2 text-rku-red"></i>Company Profile &amp; Placement Record</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body p-4" id="companyStatsModalBody">
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

        <!-- Code injected by live-server -->
        <script>
            // <![CDATA[  < --For SVG support
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
    </body>
</html>
</asp:Content>


