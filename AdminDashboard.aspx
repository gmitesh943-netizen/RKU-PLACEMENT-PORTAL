<%@ Page Title="Admin Dashboard | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="company-hero-card mb-4" style="background: linear-gradient(135deg, #ffffff 0%, #f9fafb 100%); border: 1px solid #eef0f3; border-radius: 18px; padding: 1.5rem 1.75rem;">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="text-uppercase fw-extrabold small text-rku-red mb-1" style="letter-spacing: 0.16em;">Placement Cell Control Center</div>
                <h2 class="fw-bold text-dark mb-1 font-heading">Admin Overview</h2>
                <p class="text-muted mb-0">Monitor placement statistics, active campus drives, and student recruitment performance across all departments.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <div class="d-inline-flex align-items-center gap-3">
                    <div class="text-lg-end d-none d-lg-block">
                        <div class="fw-semibold text-dark">TPO Officer</div>
                        <div class="text-muted small">RK University</div>
                    </div>
                    <div class="avatar-circle bg-rku-maroon text-white fw-bold rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; font-size: 1.1rem;">
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
                <div class="stat-widget-icon bg-icon-primary"><i class="fa-solid fa-users"></i></div>
                <div class="stat-widget-info">
                    <h3 id="admStatStudents">0</h3>
                    <span>Students Registered</span>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-info"><i class="fa-regular fa-building"></i></div>
                <div class="stat-widget-info">
                    <h3 id="admStatDrives">0</h3>
                    <span>Active Drives</span>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-success"><i class="fa-solid fa-circle-check"></i></div>
                <div class="stat-widget-info">
                    <h3 id="admStatPlaced">0</h3>
                    <span>Students Placed</span>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-warning"><i class="fa-solid fa-percent"></i></div>
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
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-overview');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Placement Cell Admin Overview';

            initAdminCharts();
            loadAdminOverviewStats();
            loadAdminActivityLogs();
        });

        function loadAdminOverviewStats() {
            const students = PortalDB.getUsers().filter(u => u.role === 'student');
            const drives = PortalDB.getDrives();
            const applications = PortalDB.getApplications();
            const placedApps = applications.filter(a => a.status === 'Selected');

            document.getElementById('admStatStudents').textContent = students.length;
            document.getElementById('admStatDrives').textContent = drives.length;
            document.getElementById('admStatPlaced').textContent = placedApps.length;

            const rate = students.length > 0 ? Math.round((placedApps.length / students.length) * 100) : 0;
            document.getElementById('admStatPercent').textContent = rate + '%';
        }

        let growthChartInstance = null;
        let deptChartInstance = null;

        function initAdminCharts() {
            const colorMaroon = '#a30f14';
            const colorRed = '#ef3724';
            const colorOrange = '#fd7e14';
            const colorGray = '#6c757d';

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

            const ctxDept = document.getElementById('admChartDepartment');
            if (ctxDept) {
                if (deptChartInstance) deptChartInstance.destroy();
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

        function loadAdminActivityLogs() {
            const tbody = document.getElementById('activityLogTableBody');
            if (!tbody) return;
            const apps = PortalDB.getApplications().slice(-5).reverse();

            if (apps.length === 0) {
                tbody.innerHTML = `<tr><td colspan="4" class="text-center text-muted py-3">No recent system activities logged.</td></tr>`;
                return;
            }

            tbody.innerHTML = apps.map(a => `
                <tr>
                    <td><i class="fa-solid fa-file-signature text-rku-maroon me-2"></i>Applied for drive: <strong>${a.driveTitle || 'Recruitment Drive'}</strong></td>
                    <td>Student ${a.studentEnrollment}</td>
                    <td>${a.appliedDate || 'Recently'}</td>
                    <td><span class="badge bg-primary-subtle text-primary border">${a.stage || 'Applied'}</span></td>
                </tr>
            `).join('');
        }
    </script>
</asp:Content>
