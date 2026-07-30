<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Companies | RK University Placement Portal</title>
        <meta name="description" content="Explore top recruiting companies visiting RK University campus. Browse company profiles, job openings, packages, and apply for your dream job.">
        <meta name="keywords" content="RK University Companies, Campus Recruiters, Top MNCs, Job Openings, Placement Companies Rajkot">
        <meta name="author" content="RK University">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <style>
            /* ─── HERO ─── */
            .companies-hero {
                position: relative;
                min-height: 84vh;
                padding: 5.5rem 0 5rem;
                color: #fff;
                z-index: 1;
                overflow: hidden;
                display: flex;
                align-items: center;
            }

                .companies-hero::before {
                    content: '';
                    position: absolute;
                    inset: 0;
                    background: linear-gradient(90deg, rgba(6,6,6,0.94) 0%, rgba(6,6,6,0.90) 28%, rgba(6,6,6,0.58) 54%, rgba(6,6,6,0.18) 78%, rgba(6,6,6,0.30) 100%);
                    z-index: -1;
                }

            .companies-hero-slides {
                position: absolute;
                inset: 0;
                z-index: -2;
            }

            .companies-hero-slide {
                position: absolute;
                inset: 0;
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
                opacity: 0;
                transform: scale(1.02);
                transition: opacity 1.1s ease-in-out;
            }

                .companies-hero-slide.active {
                    opacity: 1;
                }

            .companies-hero-slide-dots {
                position: absolute;
                bottom: 1.5rem;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
                gap: 8px;
                z-index: 6;
            }

            .companies-hero-dot {
                width: 8px;
                height: 8px;
                border-radius: 999px;
                border: none;
                background: rgba(255,255,255,0.45);
                cursor: pointer;
                transition: all 0.3s ease;
            }

                .companies-hero-dot.active {
                    width: 22px;
                    background: var(--rku-red);
                }

            .companies-hero .container {
                position: relative;
                z-index: 2;
            }

            .hero-search-box {
                background: rgba(255,255,255,0.06);
                border: 1px solid rgba(255,255,255,0.12);
                border-radius: 14px;
                padding: 0.5rem;
                display: flex;
                gap: 0.5rem;
                backdrop-filter: blur(8px);
                max-width: 700px;
                margin: 1.4rem auto 0;
            }

            .hero-search-input {
                flex: 1;
                background: transparent;
                border: none;
                outline: none;
                color: #fff;
                padding: 0.6rem 1rem;
                font-size: 0.95rem;
            }

                .hero-search-input::placeholder {
                    color: rgba(255,255,255,0.45);
                }

            .hero-search-select {
                background: rgba(255,255,255,0.08);
                border: 1px solid rgba(255,255,255,0.15);
                color: rgba(255,255,255,0.75);
                border-radius: 8px;
                padding: 0.5rem 1rem;
                font-size: 0.85rem;
                outline: none;
                cursor: pointer;
            }

                .hero-search-select option {
                    background: #1a1a2e;
                    color: #fff;
                }

            /* ─── FLOATING SEARCH PANEL ─── */
            .filter-panel {
                background: #fff;
                border-radius: 16px;
                padding: 1.5rem 2rem;
                box-shadow: 0 15px 50px rgba(0,0,0,0.08);
                border: 1px solid #eef0f3;
                margin-top: -4rem;
                position: relative;
                z-index: 10;
            }

            .filter-select {
                border: 1px solid #eef0f3;
                border-radius: 10px;
                padding: 0.65rem 1rem;
                font-size: 0.88rem;
                color: #555;
                outline: none;
                width: 100%;
                background: #f8f9fa;
                transition: all 0.2s;
                cursor: pointer;
            }

                .filter-select:focus {
                    border-color: var(--rku-red);
                    background: #fff;
                    box-shadow: 0 0 0 3px rgba(239,55,36,0.08);
                }

            .filter-label {
                font-size: 0.75rem;
                font-weight: 700;
                color: #888;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 0.4rem;
            }

            /* ─── STATS STRIP ─── */
            .company-stats-strip {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0;
                padding: 0;
                flex-wrap: wrap;
            }

            .company-stats-card {
                background: #fff;
                border: 1px solid #eef0f3;
                border-radius: 18px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.07);
                padding: 1.5rem 1rem;
                margin-top: -2.2rem;
                position: relative;
                z-index: 11;
            }

            .cstat-item {
                text-align: center;
                flex: 1 1 0;
                min-width: 150px;
                padding: 0.25rem 1.25rem;
            }

            .cstat-num {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: clamp(1.8rem, 2.6vw, 2.15rem);
                color: var(--rku-dark);
                line-height: 1;
                margin-bottom: 0.35rem;
            }

            .cstat-lbl {
                font-size: 0.78rem;
                color: #7b7b7b;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.08em;
            }

            .company-stat-divider {
                width: 1px;
                align-self: stretch;
                background: #eef0f3;
                margin: 0 0.25rem;
            }

            /* ─── FEATURED COMPANIES ─── */
            .featured-company-card {
                background: #fff;
                border: 1px solid #eef0f3;
                border-radius: 16px;
                padding: 2rem;
                transition: all 0.28s ease;
                box-shadow: 0 4px 16px rgba(0,0,0,0.03);
                height: 100%;
                position: relative;
                overflow: hidden;
            }

                .featured-company-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 4px;
                    background: linear-gradient(90deg, var(--rku-maroon), var(--rku-red));
                    border-radius: 16px 16px 0 0;
                    transform: scaleX(0);
                    transform-origin: left;
                    transition: transform 0.3s ease;
                }

                .featured-company-card:hover::before {
                    transform: scaleX(1);
                }

                .featured-company-card:hover {
                    transform: translateY(-6px);
                    box-shadow: 0 20px 45px rgba(163,15,20,0.09);
                    border-color: rgba(239,55,36,0.18);
                }

            .company-logo-wrap {
                width: 70px;
                height: 70px;
                border-radius: 14px;
                background: #f8f9fa;
                border: 1px solid #eef0f3;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 1.25rem;
                overflow: hidden;
            }

                .company-logo-wrap svg {
                    width: 80%;
                    height: 80%;
                }

            .company-type-badge {
                display: inline-flex;
                align-items: center;
                gap: 0.3rem;
                padding: 0.25rem 0.7rem;
                border-radius: 50px;
                font-size: 0.72rem;
                font-weight: 700;
                margin-bottom: 0.75rem;
            }

            .badge-it {
                background: #eff6ff;
                color: #1d4ed8;
            }

            .badge-mnc {
                background: #f0fdf4;
                color: #15803d;
            }

            .badge-fin {
                background: #fff7ed;
                color: #c2410c;
            }

            .badge-mfg {
                background: #faf5ff;
                color: #7e22ce;
            }

            .badge-consult {
                background: #fef3c7;
                color: #92400e;
            }

            .badge-fmcg {
                background: #f0fdfa;
                color: #0f766e;
            }

            .badge-pharma {
                background: #fdf2f8;
                color: #be185d;
            }

            .badge-auto {
                background: #f0f9ff;
                color: #0369a1;
            }

            .company-name {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.15rem;
                color: var(--rku-dark);
                margin-bottom: 0.4rem;
            }

            .company-tagline {
                font-size: 0.82rem;
                color: #888;
                font-weight: 500;
                margin-bottom: 1rem;
            }

            .company-desc {
                font-size: 0.85rem;
                color: #666;
                line-height: 1.6;
                margin-bottom: 1.25rem;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .company-meta-row {
                display: flex;
                gap: 1.25rem;
                margin-bottom: 1.25rem;
                flex-wrap: wrap;
            }

            .cmeta {
                font-size: 0.78rem;
                color: #777;
                display: flex;
                align-items: center;
                gap: 0.35rem;
            }

                .cmeta i {
                    color: var(--rku-red);
                    font-size: 0.72rem;
                }

            .pkg-range {
                background: linear-gradient(135deg, #fef2f2, #fff5f5);
                border: 1px solid rgba(163,15,20,0.12);
                border-radius: 10px;
                padding: 0.6rem 1rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 1.25rem;
            }

            .pkg-label {
                font-size: 0.72rem;
                font-weight: 700;
                color: #888;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .pkg-value {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1rem;
                color: var(--rku-maroon);
            }

            .company-tags {
                display: flex;
                flex-wrap: wrap;
                gap: 0.4rem;
                margin-bottom: 1.25rem;
            }

            .ctag {
                background: #f8f9fa;
                color: #555;
                border: 1px solid #eef0f3;
                border-radius: 6px;
                padding: 0.2rem 0.55rem;
                font-size: 0.72rem;
                font-weight: 600;
            }

            .company-card-actions {
                display: flex;
                gap: 0.6rem;
            }

            .btn-view-profile {
                flex: 1;
                padding: 0.55rem 1rem;
                border: 1.5px solid var(--rku-maroon);
                border-radius: 8px;
                color: var(--rku-maroon);
                font-weight: 700;
                font-size: 0.82rem;
                background: transparent;
                text-align: center;
                text-decoration: none;
                transition: all 0.2s;
                cursor: pointer;
            }

                .btn-view-profile:hover {
                    background: var(--rku-maroon);
                    color: #fff;
                }

            .btn-apply-now {
                flex: 1;
                padding: 0.55rem 1rem;
                border-radius: 8px;
                font-weight: 700;
                font-size: 0.82rem;
                background: var(--rku-red);
                color: #fff;
                border: none;
                text-align: center;
                text-decoration: none;
                transition: all 0.2s;
                cursor: pointer;
            }

                .btn-apply-now:hover {
                    background: var(--rku-maroon);
                    color: #fff;
                }

            /* ─── OPEN POSITIONS BADGE ─── */
            .openings-badge {
                position: absolute;
                top: 1.2rem;
                right: 1.2rem;
                background: #f0fdf4;
                color: #15803d;
                border: 1px solid #bbf7d0;
                border-radius: 50px;
                padding: 0.25rem 0.7rem;
                font-size: 0.72rem;
                font-weight: 700;
                display: flex;
                align-items: center;
                gap: 0.3rem;
            }

            .openings-dot {
                width: 7px;
                height: 7px;
                border-radius: 50%;
                background: #22c55e;
                animation: pulse 1.8s infinite;
            }

            @keyframes pulse {
                0%, 100% {
                    opacity: 1;
                }

                50% {
                    opacity: 0.4;
                }
            }

            /* ─── INDUSTRY TABS ─── */
            .industry-tabs {
                display: flex;
                gap: 0.5rem;
                flex-wrap: wrap;
            }

            .itab {
                padding: 0.45rem 1.1rem;
                border-radius: 50px;
                font-size: 0.82rem;
                font-weight: 700;
                border: 1.5px solid #eef0f3;
                color: #555;
                background: #fff;
                cursor: pointer;
                transition: all 0.2s;
            }

                .itab:hover {
                    border-color: var(--rku-red);
                    color: var(--rku-red);
                }

                .itab.active {
                    background: var(--rku-maroon);
                    color: #fff;
                    border-color: var(--rku-maroon);
                }

            /* ─── COMPANY DETAIL MODAL ─── */
            .modal-company-header {
                background: linear-gradient(135deg, #111 0%, #1a1a2e 100%);
                padding: 2rem;
                display: flex;
                align-items: center;
                gap: 1.5rem;
                border-radius: 16px 16px 0 0;
            }

            .modal-logo {
                width: 80px;
                height: 80px;
                border-radius: 14px;
                background: rgba(255,255,255,0.1);
                border: 1px solid rgba(255,255,255,0.15);
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
            }

                .modal-logo svg {
                    width: 75%;
                    height: 75%;
                }

            .info-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 1rem;
            }

            .info-item {
                padding: 1rem;
                background: #f8f9fa;
                border-radius: 10px;
                border: 1px solid #eef0f3;
            }

            .info-item-label {
                font-size: 0.72rem;
                font-weight: 700;
                color: #888;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 0.3rem;
            }

            .info-item-value {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.92rem;
                color: var(--rku-dark);
            }

            .job-role-card {
                border: 1px solid #eef0f3;
                border-radius: 10px;
                padding: 1.1rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
                transition: all 0.2s;
            }

                .job-role-card:hover {
                    border-color: rgba(239,55,36,0.2);
                    background: #fffaf9;
                }

            .job-role-title {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.9rem;
                color: var(--rku-dark);
            }

            .job-role-dept {
                font-size: 0.78rem;
                color: #888;
                margin-top: 0.2rem;
            }

            .job-pkg-badge {
                background: #fef2f2;
                color: var(--rku-maroon);
                border-radius: 6px;
                padding: 0.3rem 0.7rem;
                font-weight: 700;
                font-size: 0.8rem;
                white-space: nowrap;
            }

            /* ─── PAGINATION ─── */
            .custom-pagination {
                display: flex;
                gap: 0.4rem;
                justify-content: center;
            }

            .page-pill {
                width: 38px;
                height: 38px;
                border-radius: 8px;
                border: 1.5px solid #eef0f3;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 0.88rem;
                color: #555;
                cursor: pointer;
                transition: all 0.2s;
                background: #fff;
                text-decoration: none;
            }

                .page-pill:hover {
                    border-color: var(--rku-red);
                    color: var(--rku-red);
                }

                .page-pill.active {
                    background: var(--rku-maroon);
                    color: #fff;
                    border-color: var(--rku-maroon);
                }

                .page-pill.disabled {
                    opacity: 0.35;
                    pointer-events: none;
                }

            @media (max-width: 991px) {
                .filter-panel {
                    margin: -2rem 1rem 0;
                }

                .company-stats-strip {
                    gap: 1.5rem;
                }

                .info-grid {
                    grid-template-columns: 1fr;
                }

                .company-stats-card {
                    margin-top: -1.5rem;
                    padding: 1rem;
                }

                .company-stat-divider {
                    display: none;
                }

                .cstat-item {
                    flex: 1 1 calc(50% - 1rem);
                    min-width: 140px;
                    padding: 0.8rem 0.75rem;
                }
            }

            @media (max-width: 575px) {
                .companies-hero {
                    min-height: auto;
                    padding: 4.5rem 0 4rem;
                }

                .cstat-item {
                    flex-basis: 100%;
                    min-width: 0;
                }
            }
        </style>
    </head>
    <body>

        <!-- ================================================
     NAVBAR
     ================================================ -->
        <nav class="navbar navbar-expand-lg sticky-top">
            <div class="container-fluid px-lg-5">
                <a class="navbar-brand d-flex align-items-center" href="Index.aspx" id="navbarBrandLink">
                    <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" id="navbarToggleButton">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="Index.aspx" id="navHome">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="About.aspx" id="navAbout">About Us</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-placement-btn dropdown-toggle" href="#" data-bs-toggle="dropdown">Placement <i class="fa-solid fa-chevron-down placement-caret"></i>
                            </a>
                            <ul class="dropdown-menu nav-placement-dropdown">
                            <li><a class="dropdown-item" href="PlacementAbout.aspx">About Us</a></li>
                                <li><a class="dropdown-item" href="PlacementCampusDrives.aspx">Campus Drives</a></li>
                                <li><a class="dropdown-item" href="PlacementStudentSelection.aspx">Student Selection</a></li>
                                <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx">Liaison Officers</a></li>
                                <li><a class="dropdown-item" href="PlacmentProminentRecruiters.aspx">Prominent Recruiters</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link active" href="Companies.aspx" id="navCompanies">Companies</a></li>

                        <li class="nav-item"><a class="nav-link" href="SuccessStories.aspx" id="navStories">Success Stories</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx" id="navContact">Contact</a></li>
                    </ul>
                    <div class="navbar-actions d-flex align-items-center">
                        <a href="#" class="icon-btn" title="Search" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></a>
                        <a href="#" class="icon-btn position-relative" id="btnNotifications">
                            <i class="fa-regular fa-bell"></i>
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-rku-red border border-light rounded-circle"></span>
                        </a>
                        <a href="Login.aspx" class="btn btn-login" id="btnLogin">Login</a>
                        <a href="Register.aspx" class="btn btn-register" id="btnRegister">Register</a>
                    </div>
                </div>
            </div>
        </nav>
</asp:Content>


<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">

    <!-- ================================================
     FOOTER
     ================================================ -->
    <footer class="footer pt-5" id="siteFooter">
        <div class="container px-lg-5">
            <div class="row g-4 pb-5">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-logo d-flex align-items-center mb-3">
                        <img src="assets/images/RKU LOGO.png" alt="RK University" class="me-2" style="height: 36px; width: auto; max-width: 220px; object-fit: contain;">
                    </div>
                    <p class="mb-4">Empowering students by bridging the gap between academia and corporate world.</p>
                    <div class="footer-social-links">
                        <a href="#" title="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" title="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="#" title="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                        <a href="#" title="Instagram"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="PlacementCampusDrives.aspx">Placement Drives</a></li>
                        <li><a href="Companies.aspx">Companies</a></li>

                        <li><a href="Contact.aspx">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5>Students</h5>
                    <ul class="footer-links">
                        <li><a href="Register.aspx">Student Registration</a></li>
                        <li><a href="#">Student Login</a></li>
                        <li><a href="#">Available Jobs</a></li>
                        <li><a href="#">Interview Schedule</a></li>
                        <li><a href="#">Resume Builder</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5>Placement Cell</h5>
                    <div class="footer-contact-info">
                        <p><i class="fa-solid fa-location-dot"></i><span>RK University, Rajkot – 360020, Gujarat, India</span></p>
                        <p><i class="fa-solid fa-phone"></i><span>+91 97124 89122</span></p>
                        <p><i class="fa-solid fa-envelope"></i><a href="mailto:placement@rku.ac.in" class="text-white-50">placement@rku.ac.in</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container px-lg-5">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start mb-2 mb-md-0">
                        <p class="mb-0">&copy; 2026 RK University Placement Portal. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="d-inline-flex gap-3">
                            <a href="#" class="text-white-50" style="font-size: 0.8rem;">Privacy Policy</a>
                            <span class="text-white-50">|</span>
                            <a href="#" class="text-white-50" style="font-size: 0.8rem;">Terms of Service</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/portal-db.js"></script>
    <script src="js/main.js"></script>
    <script>
        /* ─── INDUSTRY TAB FILTER ─── */
        const tabs = document.querySelectorAll('.itab');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
                const filter = tab.dataset.tab;
                const cards = document.querySelectorAll('#companyGrid > .col-lg-4');
                cards.forEach(card => {
                    const industry = card.dataset.industry;
                    if (filter === 'all' || industry === filter) {
                        card.style.display = '';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });

        /* ─── COMPANY RENDERING ─── */
        const indClassMap = {
            'it': 'badge-it', 'mnc': 'badge-mnc', 'consulting': 'badge-consult',
            'finance': 'badge-fin', 'fmcg': 'badge-fmcg', 'manufacturing': 'badge-mfg'
        };

        function renderCompaniesGrid() {
            const allCompanies = PortalDB.getCompanies();
            const grid = document.getElementById('companyGrid');
            grid.innerHTML = '';

            if (allCompanies.length === 0) {
                grid.innerHTML = '<div class="col-12 text-center py-5 text-muted">No companies listed yet.</div>';
                return;
            }

            // Sort: registered companies (with linkedUsername) first
            const sorted = [...allCompanies].sort((a, b) => {
                if (a.linkedUsername && !b.linkedUsername) return -1;
                if (!a.linkedUsername && b.linkedUsername) return 1;
                return 0;
            });

            sorted.forEach(c => {
                const bClass = indClassMap[c.industry] || 'badge-it';
                const logoSvg = c.logoBase64 ? `<img src="${c.logoBase64}" alt="${c.name}" style="width:100%;height:100%;object-fit:contain;">` : `<i class="fa-solid fa-building fa-2x text-muted"></i>`;
                const tagsHtml = Array.isArray(c.tags) ? c.tags.map(t => `<span class="ctag">${t}</span>`).join('') : (c.tags ? c.tags.split(',').map(t => `<span class="ctag">${t.trim()}</span>`).join('') : '');
                const registeredBadge = c.linkedUsername ? `<span style="font-size:0.65rem;background:linear-gradient(135deg,#16a34a,#15803d);color:#fff;border-radius:20px;padding:0.2rem 0.6rem;font-weight:700;position:absolute;top:10px;left:10px;z-index:2;"><i class="fa-solid fa-circle-check me-1"></i>Registered Partner</span>` : '';

                const div = document.createElement('div');
                div.className = 'col-lg-4 col-md-6';
                div.dataset.industry = c.industry === 'manufacturing' ? 'mfg' : (c.industry === 'finance' ? 'fin' : (c.industry === 'consulting' ? 'consult' : c.industry));
                div.innerHTML = `
                <div class="featured-company-card" onclick="openCompanyModal('${c.id}')" style="cursor:pointer;position:relative;">
                    ${registeredBadge}
                    <div class="openings-badge"><div class="openings-dot"></div> ${c.openRoles || 'N/A'}</div>
                    <div class="company-logo-wrap">
                        ${logoSvg}
                    </div>
                    <div><span class="company-type-badge ${bClass}"><i class="fa-solid fa-circle-dot" style="font-size:0.6rem;"></i> ${(c.industry || 'IT').toUpperCase()}</span></div>
                    <h3 class="company-name">${c.name}</h3>
                    <p class="company-tagline">${c.tagline || ''}</p>
                    <p class="company-desc">${c.description || ''}</p>
                    <div class="company-meta-row">
                        <span class="cmeta"><i class="fa-solid fa-location-dot"></i> ${c.location || 'N/A'}</span>
                    </div>
                    <div class="pkg-range">
                        <div><div class="pkg-label">Package Range</div><div class="pkg-value">${c.packageRange || 'N/A'}</div></div>
                        <div><div class="pkg-label">Hiring For</div><div style="font-size:0.82rem;font-weight:700;color:#555;">Various</div></div>
                    </div>
                    <div class="company-tags">
                        ${tagsHtml}
                    </div>
                    <div class="company-card-actions">
                        <button class="btn-view-profile" onclick="event.stopPropagation();openCompanyModal('${c.id}')">View Profile</button>
                        <button class="btn-apply-now" onclick="event.stopPropagation();window.location.href='Login.aspx'">Apply Now</button>
                    </div>
                </div>
            `;
                grid.appendChild(div);
            });
        }


        function openCompanyModal(id) {
            const companies = PortalDB.getCompanies();
            const data = companies.find(c => c.id === id);
            if (!data) return;
            document.getElementById('modalCompanyName').textContent = data.name;
            document.getElementById('modalTagline').textContent = data.tagline || '';
            document.getElementById('modalDesc').textContent = data.description || '';

            const bClass = indClassMap[data.industry] || 'badge-it';
            document.getElementById('modalBadge').innerHTML = `<span class="company-type-badge ${bClass}">${data.industry.toUpperCase()}</span>`;
            document.getElementById('modalPkgRange').textContent = data.packageRange || 'N/A';

            const logoSvg = data.logoBase64 ? `<img src="${data.logoBase64}" alt="${data.name}" style="width:75%;height:75%;object-fit:contain;border-radius:8px;">` : `<i class="fa-solid fa-building fa-2x text-white"></i>`;
            document.getElementById('modalLogo').innerHTML = logoSvg;

            document.getElementById('modalInfoGrid').innerHTML = `
            <div class="info-item"><div class="info-item-label">Industry</div><div class="info-item-value">${data.industry.toUpperCase()}</div></div>
            <div class="info-item"><div class="info-item-label">Location</div><div class="info-item-value">${data.location || 'N/A'}</div></div>
            <div class="info-item"><div class="info-item-label">Website</div><div class="info-item-value"><a href="${data.website || '#'}" style="color:var(--rku-red);" target="_blank">${data.website || 'N/A'}</a></div></div>
        `;
            const modal = new bootstrap.Modal(document.getElementById('companyModal'));
            modal.show();
        }

        /* ─── SEARCH FILTER ─── */
        document.getElementById('heroSearchBtn').addEventListener('click', () => {
            const q = document.getElementById('heroSearchInput').value.toLowerCase();
            const ind = document.getElementById('heroSearchIndustry').value;

            document.querySelectorAll('#companyGrid > .col-lg-4').forEach(card => {
                const name = card.querySelector('.company-name')?.textContent.toLowerCase() || '';
                const desc = card.querySelector('.company-desc')?.textContent.toLowerCase() || '';
                const industry = card.dataset.industry;

                let indMatch = true;
                if (ind) {
                    let searchInd = ind === 'manufacturing' ? 'mfg' : (ind === 'finance' ? 'fin' : (ind === 'consulting' ? 'consult' : ind));
                    indMatch = (industry === searchInd);
                }

                card.style.display = ((name.includes(q) || desc.includes(q)) && indMatch) ? '' : 'none';
            });
            document.getElementById('companyGridSection').scrollIntoView({ behavior: 'smooth' });
        });

        /* ─── PAGINATION ─── */
        document.querySelectorAll('.page-pill:not(.disabled)').forEach(pill => {
            pill.addEventListener('click', (e) => {
                e.preventDefault();
                document.querySelectorAll('.page-pill').forEach(p => p.classList.remove('active'));
                pill.classList.add('active');
            });
        });

        /* HERO IMAGE SLIDER */
        (function () {
            const slides = document.querySelectorAll('.companies-hero-slide');
            const dots = document.querySelectorAll('.companies-hero-dot');
            if (!slides.length || !dots.length) return;

            let current = 0;
            const total = slides.length;

            function goTo(index) {
                slides[current].classList.remove('active');
                dots[current].classList.remove('active');
                current = (index + total) % total;
                slides[current].classList.add('active');
                dots[current].classList.add('active');
            }

            let timer = setInterval(() => goTo(current + 1), 3000);

            dots.forEach((dot, i) => {
                dot.addEventListener('click', () => {
                    clearInterval(timer);
                    goTo(i);
                    timer = setInterval(() => goTo(current + 1), 3000);
                });
            });
        })();

        // Initialize
        document.addEventListener('DOMContentLoaded', () => {
            renderCompaniesGrid();
        });
    </script>
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
    </body>
</html>

</asp:Content>



<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <!-- ================================================
     HERO
     ================================================ -->
    <section class="companies-hero" id="companiesHeroSection">
        <div class="companies-hero-slides" id="companiesHeroSlides">
            <div class="companies-hero-slide active" style="background-image: url('assets/images/company-visit-1.jpeg');"></div>
            <div class="companies-hero-slide" style="background-image: url('assets/images/company-visit-2.jpeg');"></div>
            <div class="companies-hero-slide" style="background-image: url('assets/images/company-visit-3.jpeg');"></div>
            <div class="companies-hero-slide" style="background-image: url('assets/images/company-visit-4.jpeg');"></div>
            <div class="companies-hero-slide" style="background-image: url('assets/images/company-visit-5jpeg.jpeg');"></div>
            <div class="companies-hero-slide" style="background-image: url('assets/images/1000579955.jpg');"></div>
            <div class="companies-hero-slide" style="background-image: url('assets/images/1000579957.jpg');"></div>
        </div>

        <div class="companies-hero-slide-dots" id="companiesHeroDots">
            <button class="companies-hero-dot active" type="button" data-slide="0" aria-label="Slide 1"></button>
            <button class="companies-hero-dot" type="button" data-slide="1" aria-label="Slide 2"></button>
            <button class="companies-hero-dot" type="button" data-slide="2" aria-label="Slide 3"></button>
            <button class="companies-hero-dot" type="button" data-slide="3" aria-label="Slide 4"></button>
            <button class="companies-hero-dot" type="button" data-slide="4" aria-label="Slide 5"></button>
            <button class="companies-hero-dot" type="button" data-slide="5" aria-label="Slide 6"></button>
            <button class="companies-hero-dot" type="button" data-slide="6" aria-label="Slide 7"></button>
        </div>

        <div class="container px-lg-5 text-start">
            <p style="font-size: 0.78rem; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; color: var(--rku-red); margin-bottom: 1rem;">
                <i class="fa-solid fa-building me-2"></i>Company Directory
            </p>
            <h1 style="font-family: var(--font-heading); font-weight: 800; font-size: 3.2rem; color: #fff; line-height: 1.15; max-width: 760px;" id="companiesHeroTitle">Explore <span style="color: var(--rku-red);">300+ Companies</span><br>
                Hiring at RK University
            </h1>
            <p style="color: rgba(255,255,255,0.7); font-size: 1.05rem; max-width: 550px; margin: 1.2rem 0 0;">
                Browse top MNCs, startups, and government organisations that actively recruit from our campus.
            </p>

            <!-- Hero Search -->
            <div class="hero-search-box mt-4" style="margin-left: 0;">
                <i class="fa-solid fa-magnifying-glass text-white-50 ps-2 align-self-center"></i>
                <input type="text" class="hero-search-input" placeholder="Search company name, role, or industry..." id="heroSearchInput">
                <select class="hero-search-select" id="heroSearchIndustry">
                    <option value="">All Industries</option>
                    <option value="it">IT / Software</option>
                    <option value="mnc">MNC</option>
                    <option value="consulting">Consulting</option>
                    <option value="finance">Finance</option>
                    <option value="fmcg">FMCG</option>
                    <option value="manufacturing">Manufacturing</option>
                </select>
                <button class="btn btn-rku" style="white-space: nowrap;" id="heroSearchBtn">Search</button>
            </div>
        </div>
    </section>

    <!-- ================================================
     STATS STRIP
     ================================================ -->
    <section class="py-4 bg-white border-bottom" id="companyStatsSection">
        <div class="container px-lg-5">
            <div class="company-stats-card">
                <div class="company-stats-strip">
                    <div class="cstat-item">
                        <div class="cstat-num">300+</div>
                        <div class="cstat-lbl">Total Companies</div>
                    </div>
                    <div class="company-stat-divider"></div>
                    <div class="cstat-item">
                        <div class="cstat-num">1,200+</div>
                        <div class="cstat-lbl">Job Openings</div>
                    </div>
                    <div class="company-stat-divider"></div>
                    <div class="cstat-item">
                        <div class="cstat-num">20 LPA</div>
                        <div class="cstat-lbl">Highest Package</div>
                    </div>
                    <div class="company-stat-divider"></div>
                    <div class="cstat-item">
                        <div class="cstat-num">40+</div>
                        <div class="cstat-lbl">Fortune 500 Firms</div>
                    </div>
                    <div class="company-stat-divider"></div>
                    <div class="cstat-item">
                        <div class="cstat-num">18</div>
                        <div class="cstat-lbl">Countries Represented</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================================================
     INDUSTRY TABS + COMPANY GRID
     ================================================ -->
    <section class="py-5" style="background: var(--rku-bg-light);" id="companyGridSection">
        <div class="container px-lg-5">

            <!-- Header + Tabs -->
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
                <div>
                    <p style="font-size: 0.78rem; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; color: var(--rku-red); margin-bottom: 0.25rem;">Browse by Category</p>
                    <h2 style="font-family: var(--font-heading); font-weight: 800; font-size: 1.8rem; color: var(--rku-dark); margin: 0;">Top Recruiting Companies</h2>
                </div>
                <div class="industry-tabs" id="industryTabs">
                    <button class="itab active" data-tab="all" id="tabAll">All</button>
                    <button class="itab" data-tab="it" id="tabIT">IT / Software</button>
                    <button class="itab" data-tab="consult" id="tabConsult">Consulting</button>
                    <button class="itab" data-tab="fin" id="tabFin">Finance</button>
                    <button class="itab" data-tab="fmcg" id="tabFMCG">FMCG</button>
                    <button class="itab" data-tab="mfg" id="tabMfg">Manufacturing</button>
                </div>
            </div>

            <div class="row g-4" id="companyGrid">
                <!-- Loaded dynamically from PortalDB -->
            </div>
            <!-- /row -->

            <!-- Pagination -->
            <div class="mt-5 d-flex justify-content-between align-items-center flex-wrap gap-3">
                <p class="text-muted mb-0" style="font-size: 0.85rem;">Showing <strong>12</strong> of <strong>300+</strong> companies</p>
                <div class="custom-pagination">
                    <a href="#" class="page-pill disabled" id="pagePrev"><i class="fa-solid fa-chevron-left"></i></a>
                    <a href="#" class="page-pill active" id="page1">1</a>
                    <a href="#" class="page-pill" id="page2">2</a>
                    <a href="#" class="page-pill" id="page3">3</a>
                    <a href="#" class="page-pill" id="page4">4</a>
                    <span class="page-pill disabled">…</span>
                    <a href="#" class="page-pill" id="page25">25</a>
                    <a href="#" class="page-pill" id="pageNext"><i class="fa-solid fa-chevron-right"></i></a>
                </div>
            </div>

        </div>
    </section>

    <!-- ================================================
     COMPANY DETAIL MODAL
     ================================================ -->
    <div class="modal fade" id="companyModal" tabindex="-1" aria-labelledby="companyModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content" style="border-radius: 16px; overflow: hidden; border: none;">

                <!-- Modal Header -->
                <div class="modal-company-header" id="modalCompanyHeader">
                    <div class="modal-logo" id="modalLogo">
                        <svg viewBox="0 0 100 60" width="60">
                            <text x="8" y="40" font-size="28" font-weight="900" fill="#fff">TCS</text></svg>
                    </div>
                    <div class="flex-grow-1">
                        <div id="modalBadge" style="margin-bottom: 0.5rem;"><span class="company-type-badge badge-it">IT / MNC</span></div>
                        <h2 id="modalCompanyName" style="font-family: var(--font-heading); font-weight: 800; font-size: 1.8rem; color: #fff; margin: 0 0 0.3rem;">Tata Consultancy Services</h2>
                        <p id="modalTagline" style="color: rgba(255,255,255,0.65); margin: 0; font-size: 0.9rem;">Building on belief — India's largest IT services company</p>
                    </div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" id="btnCloseModal"></button>
                </div>

                <div class="modal-body p-0">
                    <div class="p-4">
                        <div class="row g-4">

                            <!-- Left Col -->
                            <div class="col-lg-8">
                                <!-- About -->
                                <h5 style="font-family: var(--font-heading); font-weight: 700; margin-bottom: 0.75rem;">About the Company</h5>
                                <p id="modalDesc" style="font-size: 0.9rem; color: #555; line-height: 1.7; margin-bottom: 1.5rem;">
                                    TCS is a leading global IT services, consulting, and business solutions organization. With 600,000+ associates and operations in 55 countries, TCS is consistently ranked among the most valuable IT services brands globally. TCS has been recognized by various bodies for its contribution to innovation, sustainability, and inclusion.
                                </p>

                                <!-- Info Grid -->
                                <div class="info-grid mb-4" id="modalInfoGrid">
                                    <div class="info-item">
                                        <div class="info-item-label">Founded</div>
                                        <div class="info-item-value">1968</div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-item-label">Headquarters</div>
                                        <div class="info-item-value">Mumbai, India</div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-item-label">Employees</div>
                                        <div class="info-item-value">600,000+</div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-item-label">Revenue</div>
                                        <div class="info-item-value">₹2,28,000+ Cr</div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-item-label">Countries</div>
                                        <div class="info-item-value">55 Countries</div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-item-label">Website</div>
                                        <div class="info-item-value"><a href="#" style="color: var(--rku-red);">www.tcs.com</a></div>
                                    </div>
                                </div>

                                <!-- Job Openings -->
                                <h5 style="font-family: var(--font-heading); font-weight: 700; margin-bottom: 0.75rem;">Open Positions at RKU</h5>
                                <div class="d-flex flex-column gap-2" id="modalJobRoles">
                                    <div class="job-role-card">
                                        <div>
                                            <div class="job-role-title">Software Engineer</div>
                                            <div class="job-role-dept">Engineering · Full-Time</div>
                                        </div>
                                        <div><span class="job-pkg-badge">₹ 3.5 LPA</span></div>
                                        <button class="btn-apply-now" style="padding: 0.4rem 1rem; font-size: 0.8rem; flex: none;">Apply</button>
                                    </div>
                                    <div class="job-role-card">
                                        <div>
                                            <div class="job-role-title">Data Analyst</div>
                                            <div class="job-role-dept">Analytics · Full-Time</div>
                                        </div>
                                        <div><span class="job-pkg-badge">₹ 6 LPA</span></div>
                                        <button class="btn-apply-now" style="padding: 0.4rem 1rem; font-size: 0.8rem; flex: none;">Apply</button>
                                    </div>
                                    <div class="job-role-card">
                                        <div>
                                            <div class="job-role-title">Cloud Engineer</div>
                                            <div class="job-role-dept">Cloud Services · Full-Time</div>
                                        </div>
                                        <div><span class="job-pkg-badge">₹ 8 LPA</span></div>
                                        <button class="btn-apply-now" style="padding: 0.4rem 1rem; font-size: 0.8rem; flex: none;">Apply</button>
                                    </div>
                                    <div class="job-role-card">
                                        <div>
                                            <div class="job-role-title">Business Analyst</div>
                                            <div class="job-role-dept">Consulting · Full-Time</div>
                                        </div>
                                        <div><span class="job-pkg-badge">₹ 7 LPA</span></div>
                                        <button class="btn-apply-now" style="padding: 0.4rem 1rem; font-size: 0.8rem; flex: none;">Apply</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Col -->
                            <div class="col-lg-4">
                                <!-- Package Card -->
                                <div style="background: linear-gradient(135deg,#fef2f2,#fff5f5); border: 1px solid rgba(163,15,20,0.12); border-radius: 14px; padding: 1.5rem; margin-bottom: 1.25rem;">
                                    <p style="font-size: 0.72rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.5rem;">Package Range at RKU</p>
                                    <div style="font-family: var(--font-heading); font-weight: 800; font-size: 2rem; color: var(--rku-maroon);" id="modalPkgRange">₹ 3.5 – 12 LPA</div>
                                    <p style="font-size: 0.78rem; color: #888; margin-top: 0.5rem; margin-bottom: 0;">Varies by role &amp; experience</p>
                                </div>
                                <!-- Eligible Courses -->
                                <div style="background: #f8f9fa; border: 1px solid #eef0f3; border-radius: 14px; padding: 1.5rem; margin-bottom: 1.25rem;">
                                    <p style="font-size: 0.72rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.75rem;">Eligible Programmes</p>
                                    <div style="display: flex; flex-wrap: wrap; gap: 0.5rem;" id="modalEligible">
                                        <span class="ctag">B.Tech (CS/IT/EC)</span>
                                        <span class="ctag">MCA</span>
                                        <span class="ctag">BCA</span>
                                        <span class="ctag">MBA</span>
                                        <span class="ctag">B.Sc (IT)</span>
                                    </div>
                                </div>
                                <!-- Selection Process -->
                                <div style="background: #f8f9fa; border: 1px solid #eef0f3; border-radius: 14px; padding: 1.5rem;">
                                    <p style="font-size: 0.72rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.75rem;">Selection Process</p>
                                    <div class="d-flex flex-column gap-2" id="modalProcess">
                                        <div style="display: flex; align-items: center; gap: 0.7rem; font-size: 0.82rem;"><span style="width: 22px; height: 22px; border-radius: 50%; background: var(--rku-maroon); color: #fff; display: flex; align-items: center; justify-content: center; font-size: 0.7rem; font-weight: 700; flex-shrink: 0;">1</span> Online Aptitude Test</div>
                                        <div style="display: flex; align-items: center; gap: 0.7rem; font-size: 0.82rem;"><span style="width: 22px; height: 22px; border-radius: 50%; background: var(--rku-maroon); color: #fff; display: flex; align-items: center; justify-content: center; font-size: 0.7rem; font-weight: 700; flex-shrink: 0;">2</span> Technical Interview</div>
                                        <div style="display: flex; align-items: center; gap: 0.7rem; font-size: 0.82rem;"><span style="width: 22px; height: 22px; border-radius: 50%; background: var(--rku-maroon); color: #fff; display: flex; align-items: center; justify-content: center; font-size: 0.7rem; font-weight: 700; flex-shrink: 0;">3</span> Managerial Interview</div>
                                        <div style="display: flex; align-items: center; gap: 0.7rem; font-size: 0.82rem;"><span style="width: 22px; height: 22px; border-radius: 50%; background: var(--rku-red); color: #fff; display: flex; align-items: center; justify-content: center; font-size: 0.7rem; font-weight: 700; flex-shrink: 0;">4</span> HR Interview</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="modal-footer border-0 p-3 pb-4 justify-content-center gap-3">
                    <button type="button" class="btn-view-profile" style="width: 180px;" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn-apply-now" style="width: 220px;" id="btnModalApply">Apply for This Company</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>




