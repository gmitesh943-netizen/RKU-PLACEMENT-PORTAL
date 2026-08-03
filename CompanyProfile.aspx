<%@ Page Title="My Company Profile | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific CSS for CompanyProfile (same as CompanyOverview) -->
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

                        /* RKU color utilities */
                        .bg-rku-red {
                            background-color: var(--rku-red) !important;
                            color: #fff !important;
                        }

                        .bg-rku-maroon {
                            background-color: var(--rku-maroon) !important;
                            color: #fff !important;
                        }

                        .text-rku-red { color: var(--rku-red) !important; }
                        .text-rku-maroon { color: var(--rku-maroon) !important; }

                        /* ─── BUTTON ─── */
                        .btn-rku {
                            background-color: var(--rku-red);
                            color: #fff;
                            border: none;
                            font-family: var(--font-heading);
                            font-weight: 600;
                            border-radius: 8px;
                            transition: all 0.2s ease;
                        }
                        .btn-rku:hover { background-color: var(--rku-maroon); color: #fff; }

                        /* ─── COMPANY PROFILE TAB STYLES ─── */
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
                            width: 100px; height: 100px;
                            object-fit: contain; border-radius: 12px;
                            border: 1px solid #eee; background: #fff; padding: 6px;
                        }

                        .company-logo-placeholder {
                            width: 100px; height: 100px;
                            border-radius: 12px;
                            background: linear-gradient(135deg, #a30f14, #c0392b);
                            display: inline-flex; align-items: center; justify-content: center;
                            font-size: 2rem; font-weight: 900; color: #fff;
                            font-family: var(--font-heading);
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

                        /* Profile preview stat pills */
                        .stat-pill {
                            background: #f8f9fb; border-radius: 10px;
                            padding: 0.65rem 1rem; flex: 1; text-align: center;
                            border: 1px solid #eef0f3;
                        }
                        .stat-pill .val { font-size: 1rem; font-weight: 700; color: #111; font-family: var(--font-heading); }
                        .stat-pill .lbl { font-size: 0.7rem; color: #94a3b8; margin-top: 2px; }

                        /* Skill tag */
                        .skill-tag {
                            display: inline-block;
                            background: rgba(239,55,36,0.08); color: var(--rku-maroon);
                            border-radius: 20px; padding: 3px 11px;
                            font-size: 0.75rem; font-weight: 600; margin: 2px;
                        }

                        /* ─── MOBILE RESPONSIVE ─── */
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
                        // Check session
                        const currentUser = PortalDB.getCurrentUser();
                        if (!currentUser) {
                            window.location.href = 'Login.aspx';
                        } else if (currentUser.role !== 'company') {
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
                                    <li class="sidebar-item" data-tab="tab-overview"><a href="CompanyOverview.aspx"><i class="fa-solid fa-gauge"></i>Overview</a> </li>
                                    <li class="sidebar-item active" data-tab="tab-my-profile"><a href="CompanyProfile.aspx"><i class="fa-solid fa-building-user"></i>My Company Profile</a> </li>
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
                                    <h4 class="mb-0 text-dark fw-bold" id="panelTitleBar" style="font-family: var(--font-heading);">My Company Profile</h4>
                                </div>
                                <div class="d-flex align-items-center gap-3 ms-auto">
                                    <div id="navAvatarWrap" class="avatar-circle bg-rku-red text-white fw-bold rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; font-size: 1rem;">
                                        AD
                                    </div>
                                </div>
                            </header>

                            <!-- Main Content -->
                            <main class="content-container">
                                <div class="row g-4">

                                    <!-- ── LEFT: Company Preview Card ── -->
                                    <div class="col-lg-4">
                                        <div class="dashboard-card text-center">

                                            <!-- Logo / Avatar -->
                                            <div class="mb-3" id="previewLogoWrap">
                                                <div class="company-logo-placeholder" id="previewAvatar">?</div>
                                            </div>

                                            <h5 class="fw-bold mb-0" id="previewName" style="font-family: var(--font-heading);">Company Name</h5>
                                            <div class="text-muted small mb-1" id="previewIndustry">Industry</div>
                                            <div class="text-muted small mb-3">
                                                <i class="fa-solid fa-location-dot me-1" style="color: var(--rku-red);"></i>
                                                <span id="previewLocation">Location</span>
                                            </div>

                                            <hr class="my-3">

                                            <div class="d-flex gap-2 mb-3">
                                                <div class="stat-pill">
                                                    <div class="val" id="previewPackage">-</div>
                                                    <div class="lbl">Package Range</div>
                                                </div>
                                                <div class="stat-pill">
                                                    <div class="val" id="previewRoles">-</div>
                                                    <div class="lbl">Open Roles</div>
                                                </div>
                                            </div>

                                            <div id="previewTagsWrap" class="text-start" style="display:none;">
                                                <div class="text-muted mb-1" style="font-size: 0.75rem; font-weight: 700;">Hiring Skills</div>
                                                <div id="previewTags"></div>
                                            </div>

                                            <div class="mt-3" id="previewWebsiteWrap" style="display:none;">
                                                <a href="#" id="previewWebsite" target="_blank" class="btn btn-sm btn-outline-secondary w-100">
                                                    <i class="fa-solid fa-globe me-1"></i>Visit Website
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ── RIGHT: Edit Form ── -->
                                    <div class="col-lg-8">
                                        <div class="dashboard-card">
                                            <h5 class="fw-bold mb-4" style="font-family: var(--font-heading);">
                                                <i class="fa-solid fa-pen-to-square me-2 text-rku-red"></i>Edit Company Profile
                                            </h5>

                                            <div id="companyProfileForm">

                                                <!-- Logo Upload -->
                                                <div class="mb-4">
                                                    <label class="form-label text-muted small fw-bold">Company Logo</label>
                                                    <div class="company-logo-upload-zone" id="logoUploadZone" onclick="document.getElementById('companyLogoInput').click()">
                                                        <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2"></i>
                                                        <p class="text-muted small mb-0">Click to upload company logo<br><span style="font-size: 0.75rem;">PNG, JPG, SVG (max 1MB)</span></p>
                                                    </div>
                                                    <input type="file" id="companyLogoInput" accept="image/*" class="d-none" onchange="handleLogoUpload(event)">
                                                    <input type="hidden" id="companyLogoBase64">
                                                </div>

                                                <!-- Company Name -->
                                                <div class="mb-3">
                                                    <label class="form-label text-muted small fw-bold">Company Name *</label>
                                                    <input type="text" class="form-control" id="cpName" placeholder="e.g. Tata Consultancy Services" required>
                                                </div>

                                                <!-- Tagline -->
                                                <div class="mb-3">
                                                    <label class="form-label text-muted small fw-bold">Tagline / Motto</label>
                                                    <input type="text" class="form-control" id="cpTagline" placeholder='e.g. "Building on Belief"'>
                                                </div>

                                                <!-- Description -->
                                                <div class="mb-3">
                                                    <label class="form-label text-muted small fw-bold">Company Description</label>
                                                    <textarea class="form-control" id="cpDescription" rows="3" placeholder="Briefly describe what your company does..."></textarea>
                                                </div>

                                                <!-- Industry + Location -->
                                                <div class="row g-3 mb-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label text-muted small fw-bold">Industry</label>
                                                        <select class="form-select" id="cpIndustry">
                                                            <option value="IT / Software">IT / Software</option>
                                                            <option value="MNC">MNC</option>
                                                            <option value="Consulting">Consulting</option>
                                                            <option value="Finance / Banking">Finance / Banking</option>
                                                            <option value="FMCG">FMCG</option>
                                                            <option value="Manufacturing">Manufacturing</option>
                                                            <option value="Healthcare">Healthcare</option>
                                                            <option value="E-Commerce">E-Commerce</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label text-muted small fw-bold">Location (HQ)</label>
                                                        <input type="text" class="form-control" id="cpLocation" placeholder="e.g. Mumbai, India">
                                                    </div>
                                                </div>

                                                <!-- Package + Open Roles -->
                                                <div class="row g-3 mb-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label text-muted small fw-bold">Package Range</label>
                                                        <input type="text" class="form-control" id="cpPackageRange" placeholder="e.g. 3.5 LPA - 50 LPA">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label text-muted small fw-bold">No. of Open Roles</label>
                                                        <input type="text" class="form-control" id="cpOpenRoles" placeholder="e.g. 10 Open Roles">
                                                    </div>
                                                </div>

                                                <!-- Website -->
                                                <div class="mb-3">
                                                    <label class="form-label text-muted small fw-bold">Website URL</label>
                                                    <input type="url" class="form-control" id="cpWebsite" placeholder="https://www.yourcompany.com">
                                                </div>

                                                <!-- Skills / Tags -->
                                                <div class="mb-4">
                                                    <label class="form-label text-muted small fw-bold">Hiring Skills / Tags <span class="fw-normal">(comma-separated)</span></label>
                                                    <input type="text" class="form-control" id="cpTags" placeholder="e.g. Java, C / C++, Python, SQL / .NET (C#)">
                                                    <div class="form-text text-muted mt-1">These tags appear on your company card in the Companies page.</div>
                                                </div>

                                                <!-- Actions -->
                                                <div class="d-flex gap-2">
                                                    <button type="button" class="btn btn-rku px-4" onclick="saveProfile(event)">
                                                        <i class="fa-solid fa-floppy-disk me-1"></i>Save Profile
                                                    </button>
                                                    <button type="button" class="btn btn-outline-secondary px-3" onclick="loadProfileData()">
                                                        <i class="fa-solid fa-rotate-left me-1"></i>Reset
                                                    </button>
                                                </div>

                                                <div id="formAlertArea" class="mt-3"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- /row -->
                            </main>
                        </div><!-- /main-panel -->
                    </div><!-- /wrapper -->

                    <script>
                        const CP_KEY = 'rku_placement_company_profiles';

                        // ── GET LINKED COMPANY FROM PORTALDB ──
                        function getCompanyFromDb(user) {
                            if (!user) return null;
                            const companies = PortalDB.getCompanies();
                            return companies.find(c =>
                                (c.linkedUsername && c.linkedUsername === user.username) ||
                                (user.name && c.name && c.name.toLowerCase() === user.name.toLowerCase()) ||
                                (c.name && user.username && c.name.toLowerCase().includes(user.username.toLowerCase()))
                            ) || null;
                        }

                        // ── SIDEBAR & NAVBAR INIT ──
                        function initSidebar() {
                            const user = PortalDB.getCurrentUser();
                            if (!user) return;
                            const compEntry = getCompanyFromDb(user);
                            const profiles = JSON.parse(localStorage.getItem(CP_KEY) || '{}');
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

                        // ── LOAD PROFILE DATA INTO FORM ──
                        function loadProfileData() {
                            const user = PortalDB.getCurrentUser();
                            if (!user) return;
                            const compEntry = getCompanyFromDb(user);
                            const profiles = JSON.parse(localStorage.getItem(CP_KEY) || '{}');
                            const cp = profiles[user.username] || {};

                            const name = (compEntry && compEntry.name) || cp.name || user.name || '';
                            const tagline = (compEntry && compEntry.tagline) || cp.tagline || '';
                            const description = (compEntry && compEntry.description) || cp.description || '';
                            const industry = (compEntry && compEntry.industry) || cp.industry || 'IT / Software';
                            const location = (compEntry && compEntry.location) || cp.location || '';
                            const pkg = (compEntry && compEntry.packageRange) || cp.packageRange || '';
                            const roles = (compEntry && compEntry.openRoles) || cp.openRoles || '';
                            const website = (compEntry && compEntry.website) || cp.website || '';
                            const tags = (compEntry && compEntry.tags) || cp.tags || '';
                            const logo = (compEntry && compEntry.logoBase64) || cp.logo || user.logoBase64 || '';

                            document.getElementById('cpName').value = name;
                            document.getElementById('cpTagline').value = tagline;
                            document.getElementById('cpDescription').value = description;
                            document.getElementById('cpLocation').value = location;
                            document.getElementById('cpPackageRange').value = pkg;
                            document.getElementById('cpOpenRoles').value = roles;
                            document.getElementById('cpWebsite').value = website;
                            document.getElementById('cpTags').value = tags;
                            document.getElementById('companyLogoBase64').value = logo;

                            // Industry select
                            const indEl = document.getElementById('cpIndustry');
                            if (industry) {
                                let found = false;
                                const indLower = industry.toLowerCase();
                                for (let i = 0; i < indEl.options.length; i++) {
                                    const valLower = indEl.options[i].value.toLowerCase();
                                    if (valLower === indLower || (indLower === 'it' && valLower.includes('it')) || (indLower.includes('consulting') && valLower.includes('consulting')) || (indLower.includes('mnc') && valLower.includes('mnc'))) {
                                        indEl.selectedIndex = i;
                                        found = true;
                                        break;
                                    }
                                }
                                if (!found) indEl.selectedIndex = 0;
                            }

                            // Logo zone preview
                            const zone = document.getElementById('logoUploadZone');
                            if (logo) {
                                zone.innerHTML = `<img src="${logo}" style="max-height:80px;max-width:180px;object-fit:contain;border-radius:8px;" class="mb-1"><br><span class="text-muted small">Click to change logo</span>`;
                            } else {
                                zone.innerHTML = `<i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2"></i><p class="text-muted small mb-0">Click to upload company logo<br><span style="font-size:0.75rem;">PNG, JPG, SVG (max 1MB)</span></p>`;
                            }

                            updatePreview();
                            initSidebar();
                        }

                        // ── LIVE PREVIEW ──
                        function updatePreview() {
                            const name = document.getElementById('cpName').value || 'Company Name';
                            const industry = document.getElementById('cpIndustry').value || 'Industry';
                            const location = document.getElementById('cpLocation').value || 'Location';
                            const pkg = document.getElementById('cpPackageRange').value || '-';
                            const roles = document.getElementById('cpOpenRoles').value || '-';
                            const tags = document.getElementById('cpTags').value || '';
                            const website = document.getElementById('cpWebsite').value || '';
                            const logo = document.getElementById('companyLogoBase64').value || '';

                            document.getElementById('previewName').textContent = name;
                            document.getElementById('previewIndustry').textContent = industry;
                            document.getElementById('previewLocation').textContent = location || 'Location';
                            document.getElementById('previewPackage').textContent = pkg || '-';
                            document.getElementById('previewRoles').textContent = roles || '-';

                            // Logo/Avatar
                            const wrap = document.getElementById('previewLogoWrap');
                            if (logo) {
                                wrap.innerHTML = `<img src="${logo}" class="company-logo-preview">`;
                            } else {
                                wrap.innerHTML = `<div class="company-logo-placeholder">${name.charAt(0).toUpperCase()}</div>`;
                            }

                            // Tags
                            const tagsWrap = document.getElementById('previewTagsWrap');
                            const tagsEl = document.getElementById('previewTags');
                            if (tags.trim()) {
                                tagsEl.innerHTML = tags.split(',').map(t => t.trim() ? `<span class="skill-tag">${t.trim()}</span>` : '').join('');
                                tagsWrap.style.display = 'block';
                            } else {
                                tagsEl.innerHTML = '';
                                tagsWrap.style.display = 'none';
                            }

                            // Website
                            const webWrap = document.getElementById('previewWebsiteWrap');
                            if (website.trim()) {
                                webWrap.style.display = 'block';
                                document.getElementById('previewWebsite').href = website;
                            } else {
                                webWrap.style.display = 'none';
                            }
                        }

                        // ── LOGO UPLOAD ──
                        function handleLogoUpload(event) {
                            const file = event.target.files[0];
                            if (!file) return;
                            if (file.size > 1048576) { alert('Logo must be under 1MB.'); return; }
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                const b64 = e.target.result;
                                document.getElementById('companyLogoBase64').value = b64;
                                document.getElementById('logoUploadZone').innerHTML =
                                    `<img src="${b64}" style="max-height:80px;max-width:180px;object-fit:contain;border-radius:8px;" class="mb-1"><br><span class="text-muted small">Click to change logo</span>`;
                                updatePreview();
                            };
                            reader.readAsDataURL(file);
                        }

                        // ── SAVE PROFILE (Syncs with Admin Panel & PortalDB) ──
                        function saveProfile(e) {
                            if (e && e.preventDefault) e.preventDefault();
                            const user = PortalDB.getCurrentUser();
                            if (!user) return;

                            const name = document.getElementById('cpName').value.trim();
                            const tagline = document.getElementById('cpTagline').value.trim();
                            const description = document.getElementById('cpDescription').value.trim();
                            const industry = document.getElementById('cpIndustry').value;
                            const location = document.getElementById('cpLocation').value.trim();
                            const packageRange = document.getElementById('cpPackageRange').value.trim();
                            const openRoles = document.getElementById('cpOpenRoles').value.trim();
                            const website = document.getElementById('cpWebsite').value.trim();
                            const tags = document.getElementById('cpTags').value.trim();
                            const logoBase64 = document.getElementById('companyLogoBase64').value;

                            if (!name) {
                                showAlert('<i class="fa-solid fa-circle-exclamation me-2"></i>Please enter Company Name.', 'danger');
                                return;
                            }

                            // 1. Sync to PortalDB.KEYS.COMPANIES (used by Admin Panel & Companies page)
                            const allCompanies = PortalDB.getCompanies();
                            let compIdx = allCompanies.findIndex(c =>
                                (c.linkedUsername && c.linkedUsername === user.username) ||
                                (user.name && c.name && c.name.toLowerCase() === user.name.toLowerCase()) ||
                                (c.name && c.name.toLowerCase() === name.toLowerCase())
                            );

                            const updatedCompanyObj = {
                                linkedUsername: user.username,
                                name: name || user.name || user.username,
                                tagline: tagline,
                                description: description,
                                industry: industry,
                                location: location,
                                packageRange: packageRange,
                                openRoles: openRoles,
                                website: website,
                                tags: tags,
                                logoBase64: logoBase64
                            };

                            if (compIdx !== -1) {
                                allCompanies[compIdx] = { ...allCompanies[compIdx], ...updatedCompanyObj };
                            } else {
                                updatedCompanyObj.id = 'c_' + Date.now();
                                allCompanies.push(updatedCompanyObj);
                            }
                            localStorage.setItem(PortalDB.KEYS.COMPANIES, JSON.stringify(allCompanies));

                            // 2. Sync to User record & Current Session
                            const users = PortalDB.getUsers();
                            const uIdx = users.findIndex(u => u.username === user.username);
                            if (uIdx !== -1) {
                                users[uIdx].name = name;
                                users[uIdx].logoBase64 = logoBase64;
                                localStorage.setItem(PortalDB.KEYS.USERS, JSON.stringify(users));
                            }
                            user.name = name;
                            user.logoBase64 = logoBase64;
                            localStorage.setItem(PortalDB.KEYS.CURRENT_SESSION, JSON.stringify(user));

                            // 3. Save to local profiles cache for backup
                            const profiles = JSON.parse(localStorage.getItem(CP_KEY) || '{}');
                            profiles[user.username] = {
                                name, tagline, description, industry, location,
                                packageRange, openRoles, website, tags, logo: logoBase64,
                                updatedAt: new Date().toISOString()
                            };
                            localStorage.setItem(CP_KEY, JSON.stringify(profiles));

                            showAlert('<i class="fa-solid fa-circle-check me-2"></i>Company Profile saved successfully! Changes are now synced with Admin Panel.', 'success');
                            updatePreview();
                            initSidebar();
                        }

                        // ── ALERT ──
                        function showAlert(msg, type) {
                            const area = document.getElementById('formAlertArea');
                            if (!area) return;
                            area.innerHTML = `<div class="alert alert-${type} py-2 px-3 rounded-3 small mt-3">${msg}</div>`;
                            setTimeout(() => { if (area) area.innerHTML = ''; }, 4000);
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

                        // ── LIVE PREVIEW on input ──
                        ['cpName', 'cpTagline', 'cpIndustry', 'cpLocation', 'cpPackageRange', 'cpOpenRoles', 'cpWebsite', 'cpTags'].forEach(function (id) {
                            const el = document.getElementById(id);
                            if (!el) return;
                            el.addEventListener('input', updatePreview);
                            el.addEventListener('change', updatePreview);
                        });

                        // ── INIT ──
                        window.addEventListener('DOMContentLoaded', function () {
                            loadProfileData();
                        });
                    </script>

</asp:Content>
