<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="PlacmentProminentRecruiters.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.PlacmentProminentRecruiters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Meta Tags for SEO -->
    <meta name="description" content="View the prominent recruiters at RK University across engineering, diploma studies, management, science, and pharmacy schools.">
    <meta name="keywords" content="RK University Recruiters, Prominent Recruiters, Placement Partners, TCS, Infosys, L&T, Jio, Amul, Zydus">
        <style>
            /* Sidebar Navigation Menu */
            .placement-sidebar {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                border: 1px solid #eef0f3;
                overflow: hidden;
                position: sticky;
                top: 100px;
            }

            .placement-sidebar-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .placement-sidebar-item a {
                display: flex;
                align-items: center;
                padding: 1rem 1.25rem;
                color: #495057;
                font-family: var(--font-heading);
                font-weight: 600;
                font-size: 0.95rem;
                border-bottom: 1px solid #f1f3f5;
                transition: all 0.25s ease;
                text-decoration: none;
            }

            .placement-sidebar-item:last-child a {
                border-bottom: none;
            }

            .placement-sidebar-item a i {
                margin-right: 0.75rem;
                width: 20px;
                text-align: center;
                font-size: 1.1rem;
                color: #6c757d;
                transition: color 0.25s ease;
            }

            .placement-sidebar-item.active a {
                background-color: var(--rku-maroon);
                color: #fff !important;
            }

                .placement-sidebar-item.active a i {
                    color: #fff !important;
                }

            .placement-sidebar-item a:hover:not(.active) {
                background-color: #fff5f5;
                color: var(--rku-maroon);
                padding-left: 1.5rem;
            }

                .placement-sidebar-item a:hover:not(.active) i {
                    color: var(--rku-maroon);
                }

            /* Content Title */
            .page-content-title {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.4rem;
                color: var(--rku-dark);
                text-transform: uppercase;
                margin-bottom: 2.5rem;
                position: relative;
                padding-bottom: 0.5rem;
            }

                .page-content-title::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 50px;
                    height: 3px;
                    background-color: var(--rku-red);
                }

            /* School Sub-headers */
            .school-header {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 1.15rem;
                color: #2c2c2c;
                display: flex;
                align-items: center;
                gap: 0.75rem;
                margin-top: 2rem;
                margin-bottom: 1.5rem;
            }

                .school-header i {
                    color: var(--rku-red);
                    font-size: 1.25rem;
                    background-color: #fff5f5;
                    width: 38px;
                    height: 38px;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

            /* Recruiter Logo Grid */
            .recruiter-grid-box {
                background-color: #fff;
                border: 1px solid #eef0f3;
                border-radius: 6px;
                height: 80px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0.8rem;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.01);
                transition: all 0.25s ease;
            }

                .recruiter-grid-box:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 22px rgba(163, 15, 20, 0.06);
                    border-color: rgba(239, 55, 36, 0.12);
                }

                .recruiter-grid-box svg,
                .recruiter-grid-box img {
                    max-width: 100%;
                    max-height: 100%;
                    object-fit: contain;
                }
        </style>
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- ==========================================
         1. HEADER TOPBAR & NAVBAR
         ========================================== -->
    <!-- RKU Header Topbar -->
    <div class="rku-header-topbar d-none d-lg-block" style="background:#ffffff; border-bottom:1px solid #edf2f7; font-size:0.84rem; color:#334155; position:relative; z-index:1031;">
        <div class="container-fluid px-lg-5">
            <div class="d-flex justify-content-between align-items-center py-2">
                <!-- Left: Tagline with Graduation Cap -->
                <div class="topbar-tagline d-flex align-items-center" style="font-weight:500; color:#334155;">
                    <i class="fa-solid fa-graduation-cap topbar-icon me-2" style="color:#e03627; font-size:0.95rem;"></i>
                    <span>Empowering Students. Connecting Companies. Building Careers.</span>
                </div>
                <!-- Right: Contact info & Social Media Icons -->
                <div class="topbar-contact d-flex align-items-center gap-3">
                    <a href="tel:+919876543210" class="topbar-link" style="color:#334155; text-decoration:none; display:inline-flex; align-items:center;">
                        <i class="fa-solid fa-phone topbar-icon me-1.5" style="color:#e03627; font-size:0.85rem;"></i> <span style="color:#334155;">+91 98765 43210</span>
                    </a>
                    <span class="topbar-divider" style="color:#cbd5e1;">|</span>
                    <a href="mailto:placement@rku.ac.in" class="topbar-link" style="color:#334155; text-decoration:none; display:inline-flex; align-items:center;">
                        <i class="fa-solid fa-envelope topbar-icon me-1.5" style="color:#e03627; font-size:0.85rem;"></i> <span style="color:#334155;">placement@rku.ac.in</span>
                    </a>
                    <div class="topbar-socials d-flex align-items-center gap-1.5 ms-2">
                        <a href="https://facebook.com" target="_blank" class="social-circle-btn" title="Facebook" style="width:26px; height:26px; min-width:26px; border-radius:50%; background:linear-gradient(135deg, #e03627, #c5281b); color:#ffffff !important; display:inline-flex; align-items:center; justify-content:center; text-decoration:none; box-shadow:0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-facebook-f" style="color:#ffffff !important; font-size:0.72rem;"></i></a>
                        <a href="https://linkedin.com" target="_blank" class="social-circle-btn" title="LinkedIn" style="width:26px; height:26px; min-width:26px; border-radius:50%; background:linear-gradient(135deg, #e03627, #c5281b); color:#ffffff !important; display:inline-flex; align-items:center; justify-content:center; text-decoration:none; box-shadow:0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-linkedin-in" style="color:#ffffff !important; font-size:0.72rem;"></i></a>
                        <a href="https://instagram.com" target="_blank" class="social-circle-btn" title="Instagram" style="width:26px; height:26px; min-width:26px; border-radius:50%; background:linear-gradient(135deg, #e03627, #c5281b); color:#ffffff !important; display:inline-flex; align-items:center; justify-content:center; text-decoration:none; box-shadow:0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-instagram" style="color:#ffffff !important; font-size:0.72rem;"></i></a>
                        <a href="https://youtube.com" target="_blank" class="social-circle-btn" title="YouTube" style="width:26px; height:26px; min-width:26px; border-radius:50%; background:linear-gradient(135deg, #e03627, #c5281b); color:#ffffff !important; display:inline-flex; align-items:center; justify-content:center; text-decoration:none; box-shadow:0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-youtube" style="color:#ffffff !important; font-size:0.72rem;"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-fluid px-lg-5">
            <!-- Brand Logo -->
            <a class="navbar-brand d-flex align-items-center" href="Index.aspx" id="navbarBrandLink">
                <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;">
            </a>

            <!-- Mobile Toggle -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation" id="navbarToggleButton">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links -->
            <div class="collapse navbar-collapse" id="mainNavbar">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="Index.aspx" id="navHome">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.aspx" id="navAbout">About Us</a>
                    </li>

                    <li class="nav-item dropdown" id="navItemPlacement">
                        <a class="nav-link nav-placement-btn dropdown-toggle active" href="#" id="navDrives" data-bs-toggle="dropdown" aria-expanded="false">
                            Placement <i class="fa-solid fa-chevron-down placement-caret"></i>
                        </a>
                        <ul class="dropdown-menu nav-placement-dropdown" aria-labelledby="navDrives">
                            <li><a class="dropdown-item" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
                            <li><a class="dropdown-item" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
                            <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                            <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
                            <li><a class="dropdown-item active" href="PlacmentProminentRecruiters.aspx" id="navPlacementRecruiters">Prominent Recruiters</a></li>
                            <li><a class="dropdown-item" href="PlacementPolicy.aspx" id="navPlacementPolicy">Placement Policy</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Companies.aspx" id="navCompanies">Companies</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="SuccessStories.aspx" id="navStories">Success Stories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Contact.aspx" id="navContact">Contact</a>
                    </li>
                </ul>

                <!-- User Actions -->
                <div class="navbar-actions d-flex align-items-center">
                    <!-- Search Button & Flyout -->
                    <div class="dropdown d-inline-block">
                        <a href="#" class="icon-btn border-0" role="button" id="btnSearch" data-bs-toggle="dropdown" aria-expanded="false" title="Search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end p-3 shadow-lg border-0" aria-labelledby="btnSearch" style="min-width: 320px; border-radius: 12px;">
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                                <input type="text" class="form-control border-start-0 ps-0" id="headerSearchInput" placeholder="Search companies, drives..." onkeyup="if(event.key === 'Enter') { window.location.href = 'Companies.aspx?search=' + encodeURIComponent(this.value); }">
                                <button class="btn btn-sm text-white px-3" style="background-color: var(--rku-maroon);" type="button" onclick="const val = document.getElementById('headerSearchInput').value; if(val) window.location.href = 'Companies.aspx?search=' + encodeURIComponent(val);">Go</button>
                            </div>
                            <div class="mt-2 pt-2 border-top">
                                <span class="text-muted small fw-semibold">Quick links:</span>
                                <div class="d-flex flex-wrap gap-1 mt-1">
                                    <a href="PlacementCampusDrives.aspx" class="badge bg-light text-dark text-decoration-none">Latest Drives</a>
                                    <a href="Companies.aspx" class="badge bg-light text-dark text-decoration-none">Top Recruiters</a>
                                    <a href="SuccessStories.aspx" class="badge bg-light text-dark text-decoration-none">Placements</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notifications with Red Dot Badge -->
                    <div class="dropdown d-inline-block">
                        <a href="#" class="icon-btn position-relative border-0" role="button" id="btnNotifications" data-bs-toggle="dropdown" aria-expanded="false" title="Notifications">
                            <i class="fa-regular fa-bell"></i>
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-rku-red border border-light rounded-circle"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end p-0 shadow-lg border-0" aria-labelledby="btnNotifications" style="width: 340px; border-radius: 12px; overflow: hidden;">
                            <div class="p-3 border-bottom d-flex justify-content-between align-items-center" style="background: #fafafa;">
                                <span class="fw-bold text-dark"><i class="fa-regular fa-bell me-2 text-rku-maroon"></i>Placement Alerts</span>
                                <span class="badge bg-rku-red text-white">1 New</span>
                            </div>
                            <div class="p-2" style="max-height: 280px; overflow-y: auto;">
                                <a href="PlacementCampusDrives.aspx" class="dropdown-item p-2 rounded d-flex gap-3 align-items-start text-wrap">
                                    <div class="rounded-circle p-2 mt-1" style="background: #fff0f0; color: #a30f14;">
                                        <i class="fa-solid fa-bullhorn"></i>
                                    </div>
                                    <div>
                                        <div class="fw-semibold text-dark small">TCS Campus Drive 2026 Batch</div>
                                        <div class="text-muted" style="font-size: 0.78rem;">Registration is open for final year B.Tech/BCA students.</div>
                                        <div class="text-muted mt-1" style="font-size: 0.72rem;"><i class="fa-regular fa-clock me-1"></i>Just now</div>
                                    </div>
                                </a>
                            </div>
                            <div class="p-2 border-top text-center bg-light">
                                <a href="PlacementCampusDrives.aspx" class="text-rku-maroon fw-semibold small text-decoration-none">View All Drives <i class="fa-solid fa-arrow-right ms-1"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- User Actions: Login & Register Buttons -->
                    <a href="Login.aspx" class="btn btn-login" id="btnLogin">Login</a>
                    <a href="Register.aspx" class="btn btn-register" id="btnRegister">Register</a>
                </div>
            </div>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ==========================================
         2. BREADCRUMBS & HERO SECTION
         ========================================== -->
    <section class="about-hero" style="background-image: url('assets/images/Rq-rku-comony.png');" id="aboutHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="aboutBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="#">Placement</a>
                        <span>/</span>
                        <a href="PlacmentProminentRecruiters.aspx" class="active">Prominent Recruiters</a>
                    </div>

                    <h1 class="hero-title" id="aboutHeroTitle">Prominent Recruiters</h1>
                    <p class="hero-subtitle mb-0" id="aboutHeroSubtitle">Home &rsaquo; Placement &rsaquo; Prominent Recruiters</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         3. MAIN LAYOUT (SIDEBAR + CONTENT)
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light);" id="mainLayoutSection">
        <div class="container px-lg-5">
            <div class="row g-4">

                <!-- Left Sidebar -->
                <div class="col-lg-3">
                    <div class="placement-sidebar">
                        <ul class="placement-sidebar-list">
                            <li class="placement-sidebar-item">
                            <a href="PlacementAbout.aspx"><i class="fa-solid fa-building-columns"></i>About RKU</a>
                            </li>
                            <li class="placement-sidebar-item">
                                <a href="PlacementCampusDrives.aspx"><i class="fa-regular fa-calendar-days"></i>Campus Drives</a>
                            </li>
                            <li class="placement-sidebar-item">
                                <a href="PlacementStudentSelection.aspx"><i class="fa-solid fa-user-check"></i>Student Selection</a>
                            </li>
                            <li class="placement-sidebar-item">
                                <a href="PlacementLiaisonOfficers.aspx"><i class="fa-solid fa-user-tie"></i>Liaison Officers</a>
                            </li>
                            <li class="placement-sidebar-item active">
                                <a href="PlacmentProminentRecruiters.aspx"><i class="fa-solid fa-briefcase"></i>Prominent Recruiters</a>
                            </li>
                            <li class="placement-sidebar-item">
                                <a href="PlacementPolicy.aspx"><i class="fa-solid fa-gavel"></i>Placement Policy</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Right Main Content -->
                <div class="col-lg-9">

                    <!-- Content Title -->
                    <h2 class="page-content-title">PROMINENT RECRUITERS</h2>

                    <!-- Live Registered Corporate Partners -->
                    <div class="school-header text-danger">
                        <i class="fa-regular fa-building"></i>Registered Hiring Partners (Live on Portal)
                    </div>
                    <div class="row g-3 mb-4">
                        <asp:Repeater ID="rptLivePartners" runat="server">
                            <ItemTemplate>
                                <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                                    <div class="recruiter-grid-box p-2 text-center" title='<%# Eval("compName") %>'>
                                        <%# GetRecruiterLogoHtml(Eval("compLogo"), Eval("compName")) %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- 1. School of Engineering -->
                    <div class="school-header">
                        <i class="fa-solid fa-graduation-cap"></i>School Of Engineering / School Of Diploma Studies
                    </div>

                    <div class="row g-3">
                        <!-- Row 1 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#0056b3">L&amp;T</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#1b3f8b">AMW</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="16" fill="#ef3724">ABB</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="12" fill="#a21caf">accenture</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#1b5e20">KPIT</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#004d40">Atos</text></svg>
                            </div>
                        </div>

                        <!-- Row 2 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#1b3f8b">CMC Limited</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="18" fill="#1b3f8b">IBM</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#0284c7">Infosys</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#0f172a">TATA</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#2563eb">ZENSAR</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#4f46e5">GlobalLogic</text></svg>
                            </div>
                        </div>

                        <!-- Row 3 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#0ea5e9">Capgemini</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#ea580c">HEXAWARE</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#e11d48">ESSAR</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#059669">SYNNTEL</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="10" fill="#000">L&amp;T Infotech</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="16" fill="#dc2626">AIS</text></svg>
                            </div>
                        </div>

                        <!-- Row 4 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#dc2626">vodafone</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#f97316">amazon</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#ef3724">POLYCAB</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#b45309">OBO</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="12" fill="#2563eb">TatvaSoft</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#16a34a">hexa</text></svg>
                            </div>
                        </div>

                        <!-- Row 5 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#1e293b">TATA POWER</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#1e3a8a">HDFC BANK</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#3b82f6">HCL</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#000">Directi</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="18" fill="#e11d48">G</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#0369a1">HAREL</text></svg>
                            </div>
                        </div>

                        <!-- Row 6 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <rect x="10" y="5" width="30" height="30" fill="#a30f14" rx="3" />
                                    <text x="25" y="25" fill="#fff" font-size="14" text-anchor="middle">C</text><text x="45" y="25" font-size="10" font-weight="bold">Collab</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#ea580c">PMC</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#0284c7">DECATHLON</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#0891b2">nielsen</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="9" fill="#0f172a">FORBES MARSHALL</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <circle cx="20" cy="20" r="12" fill="#ca8a04" />
                                    <text x="40" y="25" font-size="11" font-weight="bold">Group</text></svg>
                            </div>
                        </div>
                    </div>

                    <!-- 2. School of Management -->
                    <div class="school-header">
                        <i class="fa-solid fa-graduation-cap"></i>School Of Management
                    </div>

                    <div class="row g-3">
                        <!-- Row 1 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#0284c7">FEDERAL BANK</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#1e3a8a">HDFC BANK</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#e11d48">kotak</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#0369a1">IDBI BANK</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#ef3724">pnb</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#2563eb">PEPSICO</text></svg>
                            </div>
                        </div>

                        <!-- Row 2 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#0284c7">RELIANCE</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#ef3724">airtel</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="18" fill="#1e3a8a">Jio</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#4f46e5">Berger</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#16a34a">DMart</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="13" fill="#ea580c">Saffron</text></svg>
                            </div>
                        </div>

                        <!-- Row 3 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#1e3b8b">BAJAJ FINSERV</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#b45309">RAJSHREE</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#0284c7">Justdial</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="18" fill="#dc2626">TOI</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#a21caf">AXIS BANK</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#ea580c">ING Vysya</text></svg>
                            </div>
                        </div>

                        <!-- Row 4 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="10" fill="#b45309">ADITYA BIRLA</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#1e3b8b">BAJAJ FINSERV</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#78350f">Cafe Coffee Day</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#0284c7">VISTARA</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#16a34a">adani wilmar</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#dc2626">Amul</text></svg>
                            </div>
                        </div>

                        <!-- Row 5 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#16a34a">BAJAJ CORP</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#dc2626">Coca-Cola</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#d97706">Birla Sun Life</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#1e293b">SHRIRAM</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#be123c">KOTAK SEC</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#0284c7">RELIANCE IND</text></svg>
                            </div>
                        </div>

                        <!-- Row 6 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#be123c">AXIS SECURITIES</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="800" font-size="9" fill="#047857">Standard Chartered</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#ef3724">ASTRAL PIPES</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#a30f14">SRK</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#d97706">Utkarsh</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="10" fill="#0891b2">Club Mahindra</text></svg>
                            </div>
                        </div>
                    </div>

                    <!-- 3. School of Science & Pharmacy -->
                    <div class="school-header">
                        <i class="fa-solid fa-graduation-cap"></i>School Of Science / School Of Pharmacy
                    </div>

                    <div class="row g-3">
                        <!-- Row 1 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#0d9488">Laurus Labs</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#ef3724">NIRMAF</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <circle cx="20" cy="20" r="10" fill="#a30f14" />
                                    <text x="40" y="25" font-size="12" font-weight="bold">Wockhardt</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#dc2626">ARISTO</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#0284c7">Alembic</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="13" fill="#0369a1">Cadila</text></svg>
                            </div>
                        </div>

                        <!-- Row 2 -->
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#ef3724">g glenmark</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#0284c7">INTAS</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="11" fill="#ea580c">SUN PHARMA</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#db2777">Lufe</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#4f46e5">Zydus Cadila</text></svg>
                            </div>
                        </div>
                        <div class="col-6 col-sm-4 col-md-2">
                            <div class="recruiter-grid-box">
                                <svg viewBox="0 0 100 40" width="80" height="30">
                                    <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#64748b">veeda</text></svg>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </section>

</asp:Content>


<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ==========================================
         4. FOOTER
         ========================================== -->
    <footer class="footer pt-5" id="siteFooter">
        <div class="container px-lg-5">
            <div class="row g-4 pb-5">

                <!-- Column 1: About Info -->
                <div class="col-lg-3 col-md-6">
                    <div class="footer-logo d-flex align-items-center mb-3">
                        <img src="assets/images/RKU LOGO.png" alt="RK University" class="me-2" style="height: 36px; width: auto; max-width: 220px; object-fit: contain;">
                    </div>
                    <p class="mb-4">Empowering students by bridging the gap between academia and corporate world. Providing quality training and dream placements.</p>
                    <div class="footer-social-links" id="footerSocials">
                        <a href="#" title="Facebook" id="socialFb"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" title="Twitter" id="socialTw"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="#" title="LinkedIn" id="socialLi"><i class="fa-brands fa-linkedin-in"></i></a>
                        <a href="#" title="Instagram" id="socialIg"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>

                <!-- Column 2: Quick Links -->
                <div class="col-lg-3 col-md-6">
                    <h5>Quick Links</h5>
                    <ul class="footer-links" id="footerQuickLinks">
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="#">Placement Drives</a></li>
                        <li><a href="#">Companies</a></li>

                        <li><a href="Contact.aspx">Contact Us</a></li>
                    </ul>
                </div>

                <!-- Column 3: Students Links -->
                <div class="col-lg-3 col-md-6">
                    <h5>Students</h5>
                    <ul class="footer-links" id="footerStudentLinks">
                        <li><a href="Register.aspx">Student Registration</a></li>
                        <li><a href="#">Student Login</a></li>
                        <li><a href="#">Available Jobs</a></li>
                        <li><a href="#">Applied Jobs</a></li>
                        <li><a href="#">Interview Schedule</a></li>
                        <li><a href="#">Resume Builder</a></li>
                    </ul>
                </div>

                <!-- Column 4: Contact Placement Cell -->
                <div class="col-lg-3 col-md-6">
                    <h5>Placement Cell</h5>
                    <div class="footer-contact-info" id="footerContactInfo">
                        <p>
                            <i class="fa-solid fa-location-dot"></i>
                            <span>RK University, Rajkot - 360020,<br>
                                Gujarat, India</span>
                        </p>
                        <p>
                            <i class="fa-solid fa-phone"></i>
                            <span>+91 97124 89122</span>
                        </p>
                        <p>
                            <i class="fa-solid fa-envelope"></i>
                            <a href="mailto:placement@rku.ac.in" class="text-white-50" id="linkFooterEmail">placement@rku.ac.in</a>
                        </p>
                    </div>
                </div>

            </div>
        </div>

        <!-- Bottom Copyright -->
        <div class="footer-bottom">
            <div class="container px-lg-5">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start mb-2 mb-md-0">
                        <p class="mb-0" id="copyrightText">&copy; 2026 RK University Placement Portal. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-links d-inline-flex gap-3 mb-0" id="footerBottomLinks">
                            <a href="#" class="text-white-50" style="font-size: 0.8rem;">Privacy Policy</a>
                            <span class="text-white-50">|</span>
                            <a href="#" class="text-white-50" style="font-size: 0.8rem;">Terms of Service</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5 Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="js/main.js"></script>
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



