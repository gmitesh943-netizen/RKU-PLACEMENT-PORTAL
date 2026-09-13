<%@ Page Title="Reports & Analytics | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1 font-heading text-dark">Placement Performance &amp; Analytics</h4>
            <p class="text-muted small mb-0">Detailed reporting dashboard for campus drive metrics, student outcomes, and department breakdown.</p>
        </div>
        <button class="btn btn-rku btn-sm" onclick="exportReportCsv()"><i class="fa-solid fa-file-csv me-1"></i>Export Roster CSV</button>
    </div>

    <!-- KPI Cards -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-xl-3">
            <div class="dashboard-card p-3">
                <div class="d-flex align-items-center gap-3">
                    <div class="p-3 bg-danger-subtle text-danger rounded-3"><i class="fa-solid fa-user-graduate fs-4"></i></div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase">Total Registered</div>
                        <h3 class="fw-bold mb-0 font-heading" id="rptStatStudents">0</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="dashboard-card p-3">
                <div class="d-flex align-items-center gap-3">
                    <div class="p-3 bg-success-subtle text-success rounded-3"><i class="fa-solid fa-circle-check fs-4"></i></div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase">Total Placed</div>
                        <h3 class="fw-bold mb-0 font-heading" id="rptStatPlaced">0</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="dashboard-card p-3">
                <div class="d-flex align-items-center gap-3">
                    <div class="p-3 bg-info-subtle text-info rounded-3"><i class="fa-solid fa-building fs-4"></i></div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase">Active Drives</div>
                        <h3 class="fw-bold mb-0 font-heading" id="rptStatDrives">0</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="dashboard-card p-3">
                <div class="d-flex align-items-center gap-3">
                    <div class="p-3 bg-warning-subtle text-warning-emphasis rounded-3"><i class="fa-solid fa-indian-rupee-sign fs-4"></i></div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase">Avg Package</div>
                        <h3 class="fw-bold mb-0 font-heading" id="rptStatAvgPkg">0.0 LPA</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Analytics Charts -->
    <div class="row g-4 mb-4">
        <div class="col-lg-6">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 font-heading text-dark">Department-wise Placements</h5>
                <div class="chart-container-wrapper">
                    <canvas id="rptChartDepartment"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 font-heading text-dark">Recruitment Stage Breakdown</h5>
                <div class="chart-container-wrapper">
                    <canvas id="rptChartStatus"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Filterable Reports Table -->
    <div class="dashboard-card">
        <div class="row g-3 mb-4 justify-content-between align-items-center">
            <div class="col-md-5">
                <h5 class="fw-bold mb-0">Placement Performance Master Roster</h5>
            </div>
            <div class="col-md-7 d-flex gap-2">
                <input type="text" class="form-control form-control-sm" id="rptSearchInput" placeholder="Filter by student, roll, or company..." onkeyup="filterReportTable()">
                <select class="form-select form-select-sm" id="rptStatusFilter" onchange="filterReportTable()" style="max-width: 180px;">
                    <option value="all">All Stages</option>
                    <option value="Selected">Placed Only</option>
                    <option value="Shortlisted">Shortlisted</option>
                    <option value="Applied">Applied</option>
                    <option value="Rejected">Rejected</option>
                </select>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Enrollment</th>
                        <th>Student Name</th>
                        <th>Branch</th>
                        <th>Company &amp; Role</th>
                        <th>Recruitment Stage</th>
                        <th>Applied Date</th>
                    </tr>
                </thead>
                <tbody id="rptTableBody">
                </tbody>
            </table>
        </div>
    </div>

    <script>
        let rptDeptChart = null;
        let rptStatusChart = null;

        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-reports');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Placement Reports & Analytics';

            loadReportKpis();
            initReportCharts();
            renderReportTable();
        });

        function loadReportKpis() {
            const students = PortalDB.getUsers().filter(u => u.role === 'student');
            const drives = PortalDB.getDrives();
            const apps = PortalDB.getApplications();
            const placedApps = apps.filter(a => a.status === 'Selected');

            document.getElementById('rptStatStudents').textContent = students.length;
            document.getElementById('rptStatPlaced').textContent = placedApps.length;
            document.getElementById('rptStatDrives').textContent = drives.length;

            let totalPkg = 0;
            let pkgCount = 0;
            placedApps.forEach(a => {
                const drive = drives.find(d => d.id === a.driveId);
                if (drive && drive.package) {
                    const match = drive.package.match(/[\d\.]+/);
                    if (match) {
                        totalPkg += parseFloat(match[0]);
                        pkgCount++;
                    }
                }
            });

            const avg = pkgCount > 0 ? (totalPkg / pkgCount).toFixed(1) : '5.5';
            document.getElementById('rptStatAvgPkg').textContent = avg + ' LPA';
        }

        function initReportCharts() {
            const ctxDept = document.getElementById('rptChartDepartment');
            if (ctxDept) {
                if (rptDeptChart) rptDeptChart.destroy();
                rptDeptChart = new Chart(ctxDept, {
                    type: 'doughnut',
                    data: {
                        labels: ['Computer Engineering', 'Information Technology', 'Mechanical', 'Civil', 'MBA'],
                        datasets: [{
                            data: [42, 28, 12, 8, 10],
                            backgroundColor: ['#a30f14', '#ef3724', '#fd7e14', '#20c997', '#0d6efd']
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: { legend: { position: 'right', labels: { boxWidth: 10, font: { size: 10 } } } }
                    }
                });
            }

            const ctxStatus = document.getElementById('rptChartStatus');
            if (ctxStatus) {
                if (rptStatusChart) rptStatusChart.destroy();
                rptStatusChart = new Chart(ctxStatus, {
                    type: 'bar',
                    data: {
                        labels: ['Applied', 'Shortlisted', 'Tech Round', 'HR Round', 'Placed (Selected)'],
                        datasets: [{
                            label: 'Applicants',
                            data: [65, 38, 24, 18, 14],
                            backgroundColor: ['#0d6efd', '#ffc107', '#17a2b8', '#6f42c1', '#198754']
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: { legend: { display: false } }
                    }
                });
            }
        }

        function renderReportTable() {
            const tbody = document.getElementById('rptTableBody');
            if (!tbody) return;

            const apps = PortalDB.getApplications();
            const students = PortalDB.getUsers().filter(u => u.role === 'student');
            const drives = PortalDB.getDrives();

            tbody.innerHTML = '';

            if (apps.length === 0) {
                tbody.innerHTML = `<tr><td colspan="6" class="text-center text-muted py-4">No placement application records available.</td></tr>`;
                return;
            }

            apps.forEach(app => {
                const student = students.find(s => s.enrollment === app.studentEnrollment) || { name: 'Student ' + app.studentEnrollment, branch: 'CE' };
                const drive = drives.find(d => d.id === app.driveId) || { companyName: 'Company', role: 'Role' };

                const tr = document.createElement('tr');
                tr.className = 'rpt-row';
                tr.setAttribute('data-search', (student.name + ' ' + app.studentEnrollment + ' ' + drive.companyName).toLowerCase());
                tr.setAttribute('data-status', app.status || 'Applied');

                tr.innerHTML = `
                    <td><span class="fw-bold font-monospace small">${app.studentEnrollment}</span></td>
                    <td><div class="fw-bold text-dark">${student.name}</div></td>
                    <td><span class="text-muted small">${student.branch || 'CE'}</span></td>
                    <td><div class="fw-semibold text-dark">${drive.companyName}</div><div class="text-muted small">${drive.role}</div></td>
                    <td>
                        <span class="badge ${app.status === 'Selected' ? 'bg-success' : app.status === 'Rejected' ? 'bg-danger' : 'bg-primary'} rounded-pill px-2">
                            ${app.stage || app.status || 'Applied'}
                        </span>
                    </td>
                    <td><span class="text-muted small font-monospace">${app.appliedDate || 'Recently'}</span></td>
                `;
                tbody.appendChild(tr);
            });
        }

        function filterReportTable() {
            const query = document.getElementById('rptSearchInput').value.toLowerCase();
            const status = document.getElementById('rptStatusFilter').value;
            const rows = document.querySelectorAll('.rpt-row');

            rows.forEach(row => {
                const matchesSearch = row.getAttribute('data-search').includes(query);
                const matchesStatus = status === 'all' || row.getAttribute('data-status') === status;

                if (matchesSearch && matchesStatus) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function exportReportCsv() {
            const apps = PortalDB.getApplications();
            if (apps.length === 0) {
                alert('No placement records to export.');
                return;
            }

            let csvContent = 'data:text/csv;charset=utf-8,Enrollment,Student Name,Drive,Stage,Applied Date\n';
            apps.forEach(a => {
                csvContent += `"${a.studentEnrollment}","${a.studentName || 'Student'}","${a.driveTitle || 'Drive'}","${a.stage || a.status}","${a.appliedDate || ''}"\n`;
            });

            const encodedUri = encodeURI(csvContent);
            const link = document.createElement('a');
            link.setAttribute('href', encodedUri);
            link.setAttribute('download', 'RKU_Placement_Roster_Report.csv');
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    </script>
</asp:Content>
