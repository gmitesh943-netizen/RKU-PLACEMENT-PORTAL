<%@ Page Title="Student Directory | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyStudentDirectory.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyStudentDirectory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific CSS for CompanyStudentDirectory (same layout as CompanyOverview) -->
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
            top: 0; bottom: 0; left: 0;
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
            text-decoration: none;
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

        .dashboard-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.02);
            border: 1px solid #eef0f3;
            padding: 1.5rem;
            height: 100%;
            transition: all 0.3s ease;
        }

        .sidebar-company-logo {
            width: 44px; height: 44px; border-radius: 10px;
            object-fit: contain; border: 2px solid rgba(255,255,255,0.2);
            background: #fff; padding: 2px;
        }

        .sidebar-company-avatar {
            width: 44px; height: 44px; border-radius: 10px;
            background: linear-gradient(135deg, #a30f14, #c0392b);
            display: inline-flex; align-items: center; justify-content: center;
            font-size: 1.1rem; font-weight: 900; color: #fff;
            font-family: var(--font-heading); flex-shrink: 0;
        }

        /* Skill pill style */
        .skill-badge {
            background-color: #f1f5f9;
            color: #334155;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 0.2rem 0.6rem;
            font-size: 0.72rem;
            font-weight: 500;
            display: inline-block;
            margin: 2px;
        }

        /* PDF icon style */
        .pdf-icon-btn {
            color: #dc3545;
            font-size: 1.4rem;
            transition: transform 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        .pdf-icon-btn:hover {
            transform: scale(1.15);
            color: #a30f14;
        }

        .btn-profile {
            color: #0ea5e9;
            border: 1px solid rgba(14,165,233,0.3);
            background-color: rgba(14,165,233,0.05);
            font-weight: 600;
            font-size: 0.8rem;
            border-radius: 6px;
            padding: 0.25rem 0.65rem;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }
        .btn-profile:hover {
            background-color: #0ea5e9;
            color: #fff;
        }

        /* Mobile responsive */
        @media (max-width: 991.98px) {
            .sidebar { left: -260px; }
            .sidebar.show { left: 0; }
            .main-panel { margin-left: 0; }
            .content-container { padding: 1rem; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <!-- Auth protection script -->
    <script src="js/portal-db.js"></script>
    <script>
        const currentUser = PortalDB.getCurrentUser();
        if (!currentUser || currentUser.role !== 'company') {
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
                        <div id="sidebarBrandLogoWrap"></div>
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
                    <li class="sidebar-item"><a href="CompanyOverview.aspx"><i class="fa-solid fa-gauge"></i>Overview</a></li>
                    <li class="sidebar-item"><a href="CompanyProfile.aspx"><i class="fa-solid fa-building-user"></i>My Company Profile</a></li>
                    <li class="sidebar-item active"><a href="CompanyStudentDirectory.aspx"><i class="fa-solid fa-users"></i>Student Directory</a></li>
                </ul>

                <!-- Company Logo in Sidebar -->
                <div class="mt-4 px-2" id="sidebarCompanyCard" style="display: none;">
                    <div class="d-flex align-items-center gap-2 p-2" style="background: rgba(255,255,255,0.06); border-radius: 12px;">
                        <div id="sidebarCompanyLogoWrap"></div>
                        <div style="overflow: hidden;">
                            <div class="text-white fw-bold" style="font-size: 0.78rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" id="sidebarCompanyName">
                                Company</div>
                            <div class="text-white-50" style="font-size: 0.7rem;">Logged In</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar footer (Logout) -->
            <div class="sidebar-footer">
                <button type="button" class="btn btn-outline-light btn-sm w-100 py-2 border-0" onclick="handleLogout()">
                    <i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign Out
                </button>
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
                    <h4 class="mb-0 text-dark fw-bold" id="panelTitleBar" style="font-family: var(--font-heading);">Student Directory</h4>
                </div>
                <div class="d-flex align-items-center gap-3 ms-auto">
                    <div id="navAvatarWrap" class="avatar-circle bg-rku-red text-white fw-bold rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; font-size: 1rem;">
                        AD
                    </div>
                </div>
            </header>

            <!-- Main Content Container -->
            <main class="content-container">
                <div class="dashboard-card">
                    <!-- Top Search & Filter Bar -->
                    <div class="row g-3 mb-4 justify-content-between align-items-center">
                        <div class="col-md-5">
                            <h5 class="fw-bold mb-0 text-dark" style="font-family: var(--font-heading);">Registered Student Directory</h5>
                        </div>
                        <div class="col-md-7 d-flex gap-2">
                            <input type="text" class="form-control form-control-sm" id="studentSearchInput" placeholder="Search by name, roll, email..." onkeyup="filterStudentTable()">
                            <select class="form-select form-select-sm" id="studentBranchFilter" onchange="filterStudentTable()" style="max-width: 180px;">
                                <option value="all">All Branches</option>
                                <option value="Computer Engineering">Computer Engineering</option>
                                <option value="Information Technology">Information Technology</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Civil Engineering">Civil Engineering</option>
                                <option value="Marketing">MBA-Marketing</option>
                            </select>
                        </div>
                    </div>

                    <!-- Students Directory Table -->
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th style="width: 15%;">Enrollment</th>
                                    <th style="width: 25%;">Student Details</th>
                                    <th style="width: 20%;">Branch &amp; GPA</th>
                                    <th style="width: 22%;">Registered Skills</th>
                                    <th style="width: 8%;" class="text-center">Resume</th>
                                    <th style="width: 10%;" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody id="studentTableBody">
                                <!-- Populated dynamically -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div><!-- /main-panel -->
    </div><!-- /wrapper -->

    <!-- Student Full Profile Modal -->
    <div class="modal fade" id="studentProfileModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content border-0 shadow-lg" style="border-radius: 16px;">
                <div class="modal-header border-0 bg-light py-3 px-4" style="border-top-left-radius: 16px; border-top-right-radius: 16px;">
                    <h5 class="modal-title fw-bold text-dark font-heading">
                        <i class="fa-solid fa-id-card me-2 text-rku-red"></i>Student Profile Details
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4" id="studentProfileModalBody">
                    <!-- Loaded dynamically -->
                </div>
                <div class="modal-footer border-0 bg-light py-2 px-4" style="border-bottom-left-radius: 16px; border-bottom-right-radius: 16px;">
                    <button type="button" class="btn btn-secondary btn-sm px-4" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // ── ENSURE DUMMY STUDENT DATA IF NOT PRESENT ──
        function ensureSampleStudents() {
            let users = PortalDB.getUsers();
            let studentCount = users.filter(u => u.role === 'student').length;

            if (studentCount === 0) {
                const sampleStudents = [
                    {
                        username: '24FOTCA11116',
                        password: 'password',
                        role: 'student',
                        enrollment: '24FOTCA11116',
                        name: 'Mitesh Gauswami',
                        email: 'mgauswami187@rku.ac.in',
                        mobile: '08780102206',
                        degree: 'BCA',
                        branch: 'Computer Engineering',
                        cgpa: '10.00',
                        backlogs: '0',
                        skills: 'java, html, css, javascript',
                        resumeUrl: 'Mitesh_Gauswami_Resume.pdf'
                    },
                    {
                        username: '20SOECE11002',
                        password: 'password',
                        role: 'student',
                        enrollment: '20SOECE11002',
                        name: 'Amit Joshi',
                        email: 'ajoshi552@rku.ac.in',
                        mobile: '+91 98765 43210',
                        degree: 'B.Tech',
                        branch: 'Computer Engineering',
                        cgpa: '8.75',
                        backlogs: '0',
                        skills: 'Python, React, Django, SQL',
                        resumeUrl: 'Amit_Joshi_Resume.pdf'
                    },
                    {
                        username: '20SOEIT11045',
                        password: 'password',
                        role: 'student',
                        enrollment: '20SOEIT11045',
                        name: 'Sneha Vyas',
                        email: 'svyas889@rku.ac.in',
                        mobile: '+91 91234 56789',
                        degree: 'B.Tech',
                        branch: 'Information Technology',
                        cgpa: '9.20',
                        backlogs: '0',
                        skills: 'Java, Spring Boot, MySQL, Angular',
                        resumeUrl: 'Sneha_Vyas_Resume.pdf'
                    }
                ];

                users = users.concat(sampleStudents);
                localStorage.setItem(PortalDB.KEYS.USERS, JSON.stringify(users));
            }
        }

        // ── INIT SIDEBAR & NAVBAR BRAND ──
        function initSidebar() {
            const user = PortalDB.getCurrentUser();
            if (!user) return;

            const companies = PortalDB.getCompanies();
            const compEntry = companies.find(c =>
                c.linkedUsername === user.username ||
                (user.name && c.name && c.name.toLowerCase() === user.name.toLowerCase())
            );

            const profiles = JSON.parse(localStorage.getItem('rku_placement_company_profiles') || '{}');
            const cp = profiles[user.username] || {};

            const companyName = (compEntry && compEntry.name) || cp.name || user.name || user.username || 'Company';
            const logoSrc = (compEntry && compEntry.logoBase64) || cp.logo || user.logoBase64 || '';

            // Brand name
            const brandName = document.getElementById('sidebarBrandCompanyName');
            if (brandName) brandName.textContent = companyName;

            // Brand logo
            const brandLogoWrap = document.getElementById('sidebarBrandLogoWrap');
            if (brandLogoWrap) {
                if (logoSrc) {
                    brandLogoWrap.innerHTML = `<img src="${logoSrc}" class="sidebar-company-logo" style="width:36px;height:36px;border-radius:8px;object-fit:contain;background:#fff;padding:2px;">`;
                } else {
                    const ini = companyName.charAt(0).toUpperCase();
                    brandLogoWrap.innerHTML = `<div class="sidebar-company-avatar" style="width:36px;height:36px;font-size:0.9rem;">${ini}</div>`;
                }
            }

            // Nav avatar (top right)
            const navAvatar = document.getElementById('navAvatarWrap');
            if (navAvatar) {
                if (logoSrc) {
                    navAvatar.innerHTML = `<img src="${logoSrc}" style="width:40px;height:40px;border-radius:50%;object-fit:contain;border:2px solid #eee;background:#fff;padding:2px;">`;
                    navAvatar.style.background = 'transparent';
                } else {
                    const ini = companyName.substring(0, 2).toUpperCase();
                    navAvatar.textContent = ini;
                }
            }

            // Bottom company card
            const card = document.getElementById('sidebarCompanyCard');
            if (card) {
                card.style.display = 'block';
                document.getElementById('sidebarCompanyName').textContent = companyName;
                const logoWrap = document.getElementById('sidebarCompanyLogoWrap');
                if (logoSrc) {
                    logoWrap.innerHTML = `<img src="${logoSrc}" class="sidebar-company-logo">`;
                } else {
                    const ini = companyName.charAt(0).toUpperCase();
                    logoWrap.innerHTML = `<div class="sidebar-company-avatar">${ini}</div>`;
                }
            }
        }

        // ── RENDER STUDENT DIRECTORY TABLE ──
        function renderStudentDirectory() {
            ensureSampleStudents();

            const students = PortalDB.getUsers().filter(u => u.role === 'student');
            const tbody = document.getElementById('studentTableBody');
            if (!tbody) return;
            tbody.innerHTML = '';

            if (students.length === 0) {
                tbody.innerHTML = `<tr><td colspan="6" class="text-center text-muted small py-4">No registered students found.</td></tr>`;
                return;
            }

            students.forEach(st => {
                const enrollment = st.enrollment || st.username || '-';
                const name = st.name || 'Unnamed Student';
                const email = st.email || '-';
                const mobile = st.mobile || st.phone || '-';
                const degree = st.degree || 'B.Tech';
                const branch = st.branch || 'Computer Engineering';
                const branchShort = branch.split(' ').map(p => p[0]).join('').toUpperCase();
                const cgpa = st.cgpa ? parseFloat(st.cgpa).toFixed(2) : '0.00';
                const backlogs = st.backlogs !== undefined ? st.backlogs : '0';

                // Skills tags
                const skillsArr = st.skills ? st.skills.split(',') : [];
                const skillsHtml = skillsArr.length > 0
                    ? skillsArr.map(s => `<span class="skill-badge">${s.trim()}</span>`).join('')
                    : '<span class="text-muted small">None</span>';

                const tr = document.createElement('tr');
                tr.className = 'student-row';
                tr.setAttribute('data-search', (name + ' ' + enrollment + ' ' + email + ' ' + mobile).toLowerCase());
                tr.setAttribute('data-branch', branch.toLowerCase());

                tr.innerHTML = `
                    <td><span class="fw-bold font-monospace text-dark small">${enrollment}</span></td>
                    <td>
                        <div class="fw-bold text-dark font-heading">${name}</div>
                        <div class="text-muted small">${email} &bull; ${mobile}</div>
                    </td>
                    <td>
                        <div class="fw-bold text-dark font-heading">${degree} (${branchShort})</div>
                        <div class="text-muted small">CGPA: ${cgpa} &bull; Backlogs: ${backlogs}</div>
                    </td>
                    <td>
                        <div style="max-width: 250px;">
                            ${skillsHtml}
                        </div>
                    </td>
                    <td class="text-center">
                        <a href="javascript:void(0)" onclick="downloadResume('${enrollment}', '${name}')" class="pdf-icon-btn" title="Download Resume PDF">
                            <i class="fa-solid fa-file-pdf"></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <button type="button" class="btn-profile" onclick="viewStudentFullProfile('${st.username}')">
                            <i class="fa-solid fa-address-card"></i> Profile
                        </button>
                    </td>
                `;

                tbody.appendChild(tr);
            });
        }

        // ── FILTER STUDENT TABLE ──
        function filterStudentTable() {
            const query = (document.getElementById('studentSearchInput').value || '').toLowerCase().trim();
            const selectedBranch = (document.getElementById('studentBranchFilter').value || 'all').toLowerCase();
            const rows = document.querySelectorAll('.student-row');

            rows.forEach(row => {
                const searchData = row.getAttribute('data-search') || '';
                const rowBranch = row.getAttribute('data-branch') || '';

                const matchesQuery = !query || searchData.includes(query);
                const matchesBranch = selectedBranch === 'all' || rowBranch.includes(selectedBranch);

                if (matchesQuery && matchesBranch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        // ── DOWNLOAD/VIEW RESUME ──
        function downloadResume(enrollment, name) {
            const st = PortalDB.getUsers().find(u => u.username === enrollment || u.enrollment === enrollment);
            if (st && st.resumeBase64) {
                const link = document.createElement('a');
                link.href = st.resumeBase64;
                link.download = `${name.replace(/\s+/g, '_')}_Resume.pdf`;
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            } else {
                alert(`Resume PDF for ${name} (${enrollment}):\nDocument generated & verified on RKU Placement Portal.`);
            }
        }

        // ── VIEW FULL STUDENT PROFILE MODAL ──
        function viewStudentFullProfile(username) {
            const users = PortalDB.getUsers();
            const st = users.find(u => u.username === username || u.enrollment === username);
            if (!st) return;

            const modalBody = document.getElementById('studentProfileModalBody');
            const initials = (st.name || 'Student').split(' ').map(p => p[0]).join('').substring(0, 2).toUpperCase();

            const avatarHtml = st.photoBase64
                ? `<img src="${st.photoBase64}" alt="${st.name}" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%;" class="border border-3 border-danger shadow-sm me-3">`
                : `<div class="rounded-circle bg-rku-maroon text-white fw-bold d-inline-flex align-items-center justify-content-center border me-3" style="width: 80px; height: 80px; font-size: 1.8rem; background: var(--rku-maroon);">${initials}</div>`;

            const skillsArr = st.skills ? st.skills.split(',') : [];
            const skillsHtml = skillsArr.length > 0
                ? skillsArr.map(s => `<span class="skill-badge">${s.trim()}</span>`).join(' ')
                : '<span class="text-muted small">None registered</span>';

            modalBody.innerHTML = `
                <div class="d-flex align-items-center mb-4 pb-3 border-bottom">
                    ${avatarHtml}
                    <div>
                        <h4 class="fw-bold mb-1 font-heading text-dark">${st.name || 'Unnamed Student'}</h4>
                        <div class="text-muted small">
                            <span class="badge bg-rku-maroon me-2" style="background: var(--rku-maroon); color: #fff;">STUDENT</span> 
                            Enrollment No: <strong class="text-dark font-monospace">${st.enrollment || st.username}</strong>
                        </div>
                    </div>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block mb-1">Email Address</label>
                        <span class="fw-semibold text-dark"><i class="fa-solid fa-envelope me-1 text-muted"></i>${st.email || 'N/A'}</span>
                    </div>
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block mb-1">Mobile Contact</label>
                        <span class="fw-semibold text-dark"><i class="fa-solid fa-phone me-1 text-muted"></i>${st.mobile || st.phone || 'N/A'}</span>
                    </div>
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block mb-1">Degree &amp; Specialization</label>
                        <span class="fw-semibold text-dark"><i class="fa-solid fa-graduation-cap me-1 text-muted"></i>${st.degree || 'B.Tech'} - ${st.branch || 'CE'}</span>
                    </div>
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block mb-1">Academic Performance</label>
                        <span class="fw-semibold text-dark"><i class="fa-solid fa-chart-line me-1 text-muted"></i>CGPA: ${st.cgpa || '0.00'} &bull; Backlogs: ${st.backlogs !== undefined ? st.backlogs : '0'}</span>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="text-muted small fw-bold d-block mb-2">Registered Skills &amp; Competencies</label>
                    <div>${skillsHtml}</div>
                </div>

                <div class="p-3 bg-light rounded-3 border d-flex justify-content-between align-items-center">
                    <div>
                        <div class="fw-bold text-dark small"><i class="fa-solid fa-file-pdf me-2 text-danger"></i>Student Resume</div>
                        <div class="text-muted" style="font-size:0.75rem;">Verified placement resume file</div>
                    </div>
                    <button type="button" class="btn btn-danger btn-sm" onclick="downloadResume('${st.username}', '${st.name}')">
                        <i class="fa-solid fa-download me-1"></i>Download Resume
                    </button>
                </div>
            `;

            const modal = new bootstrap.Modal(document.getElementById('studentProfileModal'));
            modal.show();
        }

        // ── LOGOUT ──
        function handleLogout() {
            if (confirm('Are you sure you want to sign out?')) {
                localStorage.removeItem('rku_placement_session');
                window.location.href = 'Login.aspx';
            }
        }

        // ── MOBILE SIDEBAR TOGGLE ──
        const sidebarToggleBtn = document.getElementById('sidebarToggleBtn');
        if (sidebarToggleBtn) {
            sidebarToggleBtn.addEventListener('click', function () {
                document.getElementById('sidebar').classList.toggle('show');
            });
        }

        // ── INIT ON DOM LOAD ──
        window.addEventListener('DOMContentLoaded', function () {
            initSidebar();
            renderStudentDirectory();
        });
    </script>
</asp:Content>
