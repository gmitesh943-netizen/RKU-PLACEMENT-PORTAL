<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="PlacementStudentSelection.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.PlacementStudentSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Selection | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="View successfully placed students from RK University. Search and filter student selections by department, company, and year.">
        <meta name="keywords" content="RK University, Student Selection, Placed Students, TPO Selections, RK University Placements">
        <meta name="author" content="RK University">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            /* Filter Section */
            .summary-filter-card {
                background-color: #fff;
                border-radius: 8px;
                padding: 1.5rem;
                border: 1px solid #eef0f3;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
                margin-bottom: 2rem;
            }

            .filter-label {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.82rem;
                color: #888;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 0.75rem;
                display: inline-block;
                position: relative;
                padding-bottom: 0.3rem;
            }

                .filter-label::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 25px;
                    height: 2px;
                    background-color: var(--rku-red);
                }

            .filter-select {
                border: 1.5px solid #e8eaed;
                border-radius: 6px;
                padding: 0.6rem 1rem;
                font-size: 0.88rem;
                font-family: var(--font-heading);
                font-weight: 600;
                color: #495057;
                background-color: #fafbfc;
                width: 100%;
                cursor: pointer;
                transition: all 0.25s ease;
            }

                .filter-select:focus {
                    border-color: var(--rku-red);
                    outline: none;
                    background-color: #fff;
                }

            .btn-search {
                background-color: #0c1a30;
                color: #fff;
                font-family: var(--font-heading);
                font-weight: 700;
                padding: 0.6rem 1.8rem;
                border-radius: 6px;
                border: none;
                width: 100%;
                font-size: 0.88rem;
                transition: all 0.25s ease;
                letter-spacing: 0.5px;
            }

                .btn-search:hover {
                    background-color: var(--rku-maroon);
                    color: #fff;
                    transform: translateY(-1px);
                }

            /* Stats Bar */
            .stats-bar-navy {
                background-color: #0f1d3a;
                color: #fff;
                padding: 2.2rem 1.5rem;
                border-radius: 8px;
                margin-bottom: 2.5rem;
            }

            .stat-bar-divider {
                border-right: 1px solid rgba(255, 255, 255, 0.15);
            }

            .stat-bar-item {
                text-align: center;
            }

            .stat-bar-icon-box {
                font-size: 1.5rem;
                color: var(--rku-red);
                margin-bottom: 0.75rem;
                display: inline-block;
            }

            .stat-bar-number {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 2.2rem;
                line-height: 1;
                margin-bottom: 0.4rem;
            }

            .stat-bar-lbl {
                font-size: 0.75rem;
                color: rgba(255, 255, 255, 0.75);
                font-weight: 700;
                letter-spacing: 0.5px;
                text-transform: uppercase;
            }

            /* Student Selection Card Grid */
            .student-profile-card {
                background-color: #fff;
                border: 1px solid #eef0f3;
                border-radius: 12px;
                padding: 0;
                overflow: hidden;
                height: 100%;
                transition: all 0.25s ease;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.02);
            }

                .student-profile-card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 12px 30px rgba(163, 15, 20, 0.08);
                    border-color: rgba(239, 55, 36, 0.15);
                }

            .student-profile-avatar {
                width: 100%;
                aspect-ratio: 3 / 4;
                border-radius: 12px;
                overflow: hidden;
                margin: 0;
                border: none;
                background-color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                filter: none;
                transition: all 0.25s ease;
            }

            .student-profile-card:hover .student-profile-avatar {
                filter: none;
            }

            .student-profile-avatar img {
                width: 100%;
                height: 100%;
                object-fit: contain;
                object-position: center center;
                background: #fff;
            }

            /* Our Recruiters Section */
            .recruiters-section-title {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.2rem;
                color: var(--rku-dark);
                text-transform: uppercase;
                margin-bottom: 2rem;
                position: relative;
                padding-bottom: 0.5rem;
                display: inline-block;
            }

                .recruiters-section-title::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 45px;
                    height: 3px;
                    background-color: var(--rku-red);
                }

            .recruiter-logo-box {
                background-color: #fff;
                border-radius: 8px;
                border: 1px solid #eef0f3;
                height: 75px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0.75rem;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.01);
                transition: all 0.25s ease;
            }

                .recruiter-logo-box:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 20px rgba(163, 15, 20, 0.06);
                    border-color: rgba(239, 55, 36, 0.12);
                }

                .recruiter-logo-box img {
                    max-width: 100%;
                    max-height: 100%;
                    object-fit: contain;
                }

            @media (max-width: 991.98px) {
                .stat-bar-divider {
                    border-right: none;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.15);
                    padding-bottom: 1.5rem;
                    margin-bottom: 1.5rem;
                }

                    .stat-bar-divider:last-child {
                        border-bottom: none;
                        padding-bottom: 0;
                        margin-bottom: 0;
                    }
            }
        </style>
    </head>
    <body>

        <!-- ==========================================
         1. HEADER / NAVBAR
         ========================================== -->
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
                            <a class="nav-link nav-placement-btn dropdown-toggle active" href="#" id="navDrives" data-bs-toggle="dropdown" aria-expanded="false">Placement <i class="fa-solid fa-chevron-down placement-caret"></i>
                            </a>
                            <ul class="dropdown-menu nav-placement-dropdown" aria-labelledby="navDrives">
                            <li><a class="dropdown-item" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
                                <li><a class="dropdown-item" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
                                <li><a class="dropdown-item active" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                                <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
                                <li><a class="dropdown-item" href="PlacmentProminentRecruiters.aspx" id="navPlacementRecruiters">Prominent Recruiters</a></li>
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
                        <a href="#" class="icon-btn" title="Search" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></a>
                        <a href="#" class="icon-btn position-relative" title="Notifications" id="btnNotifications">
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

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">


    <!-- ==========================================
         2. BREADCRUMBS & HERO SECTION
         ========================================== -->
    <section class="about-hero" style="background-image: url('assets/images/1000579964.png');" id="aboutHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="aboutBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="#">Placement</a>
                        <span>/</span>
                        <a href="PlacementStudentSelection.aspx" class="active">Student Selection</a>
                    </div>

                    <h1 class="hero-title" id="aboutHeroTitle">Student Selection</h1>
                    <p class="hero-subtitle mb-0" id="aboutHeroSubtitle">Home › Placement › Student Selection</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         3. MAIN LAYOUT & GRID
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light);" id="mainLayoutSection">
        <div class="container px-lg-5">

            <!-- Filters Card -->
            <div class="summary-filter-card">
                <p class="filter-label">Placement Summary</p>
                <form id="filterForm">
                    <div class="row g-3 align-items-center">
                        <div class="col-md-5">
                            <select class="filter-select" id="filterDept">
                                <option value="all">SELECT ALL DEPARTMENTS</option>
                                <option value="computer">Computer Engineering &amp; IT</option>
                                <option value="management">Management &amp; Commerce</option>
                                <option value="others">Other Departments</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="filter-select" id="filterYear">
                                <option value="2023-24">2023-2024</option>
                                <option value="2022-23">2022-2023</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn-search">SEARCH</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Stats Bar Navy -->
            <div class="stats-bar-navy shadow-sm">
                <div class="row align-items-center g-4">
                    <!-- Stat 1 -->
                    <div class="col-lg-3 col-md-6 stat-bar-divider">
                        <div class="stat-bar-item">
                            <div class="stat-bar-icon-box"><i class="fa-solid fa-users"></i></div>
                            <div class="stat-bar-number" id="statSelected">234</div>
                            <div class="stat-bar-lbl">Total Students Selected</div>
                        </div>
                    </div>
                    <!-- Stat 2 -->
                    <div class="col-lg-3 col-md-6 stat-bar-divider">
                        <div class="stat-bar-item">
                            <div class="stat-bar-icon-box"><i class="fa-solid fa-chart-line"></i></div>
                            <div class="stat-bar-number" id="statSuccess">92%</div>
                            <div class="stat-bar-lbl">Placement Success</div>
                        </div>
                    </div>
                    <!-- Stat 3 -->
                    <div class="col-lg-3 col-md-6 stat-bar-divider">
                        <div class="stat-bar-item">
                            <div class="stat-bar-icon-box"><i class="fa-solid fa-trophy"></i></div>
                            <div class="stat-bar-number" id="statPackage">9 Lakh</div>
                            <div class="stat-bar-lbl">Highest Package</div>
                        </div>
                    </div>
                    <!-- Stat 4 -->
                    <div class="col-lg-3 col-md-6">
                        <div class="stat-bar-item">
                            <div class="stat-bar-icon-box"><i class="fa-solid fa-building-columns"></i></div>
                            <div class="stat-bar-number" id="statCompanies">238</div>
                            <div class="stat-bar-lbl">Companies Visited</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Student Grid -->
            <div class="row g-4" id="studentSelectionGrid">
                <!-- Javascript will load 26 profiles dynamically matching the exact details -->
            </div>

            <!-- Our Recruiters section -->
            <div class="mt-5 pt-4 text-center">
                <h3 class="recruiters-section-title">Our Recruiters</h3>
                <div class="row g-3 justify-content-center mt-2">
                    <div class="col-6 col-sm-4 col-md-2">
                        <div class="recruiter-logo-box">
                            <svg viewBox="0 0 100 40" width="80" height="30">
                                <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="16" fill="#1b3f8b">IMPEL</text>
                            </svg>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2">
                        <div class="recruiter-logo-box">
                            <svg viewBox="0 0 100 40" width="80" height="30">
                                <circle cx="20" cy="20" r="10" fill="#ef3724" />
                                <text x="18" y="25" font-family="sans-serif" font-weight="900" font-size="15" fill="#fff" text-anchor="middle">P</text>
                                <text x="35" y="25" font-family="sans-serif" font-weight="800" font-size="12" fill="#ef3724">POLYCAB</text>
                            </svg>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2">
                        <div class="recruiter-logo-box">
                            <svg viewBox="0 0 100 40" width="80" height="30">
                                <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#a30f14">S.P.P.S</text>
                            </svg>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2">
                        <div class="recruiter-logo-box">
                            <svg viewBox="0 0 100 40" width="80" height="30">
                                <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#0056b3">TECHNOLOGIES</text>
                            </svg>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2">
                        <div class="recruiter-logo-box">
                            <svg viewBox="0 0 100 40" width="80" height="30">
                                <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="12" fill="#d97706">KENNAMETAL</text>
                            </svg>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-2">
                        <div class="recruiter-logo-box">
                            <svg viewBox="0 0 100 40" width="80" height="30">
                                <text x="10" y="25" font-family="sans-serif" font-weight="900" font-size="14" fill="#1e3a8a">Mphasis</text>
                            </svg>
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
    <script src="js/portal-db.js"></script>
    <script src="js/main.js"></script>

    <script>
        function getStudentsDb() {
            return PortalDB.getPlacedStudents();
        }

        const grid = document.getElementById("studentSelectionGrid");
        const filterForm = document.getElementById("filterForm");

        function renderGrid() {
            const studentsDb = getStudentsDb();
            const selectedDept = document.getElementById("filterDept").value;
            const selectedYear = document.getElementById("filterYear").value;

            // Apply filter logic
            const filtered = studentsDb.filter(student => {
                const matchDept = selectedDept === "all" || student.type === selectedDept;
                const matchYear = student.year === selectedYear;
                return matchDept && matchYear;
            });

            // Update stats dynamically
            document.getElementById("statSelected").innerText = filtered.length * 9; // simulate scaling factor
            document.getElementById("statSuccess").innerText = selectedDept === "all" ? "92%" : "96%";
            document.getElementById("statCompanies").innerText = Math.round(filtered.length * 8.2);

            grid.innerHTML = "";

            if (filtered.length === 0) {
                grid.innerHTML = `<div class="col-12 text-center py-5 text-muted"><p>No student selections match the criteria.</p></div>`;
                return;
            }

            filtered.forEach(student => {
                const col = document.createElement("div");
                col.className = "col-xl-3 col-lg-4 col-sm-6";
                col.innerHTML = `
                    <div class="student-profile-card">
                        <div class="student-profile-avatar">
                            ${student.studentPhoto
                        ? `<img src="${student.studentPhoto}" alt="${student.name}">`
                        : `<svg viewBox="0 0 100 100" width="80" height="80" fill="#bbb">
                                        <rect width="100" height="100" fill="#f1f3f5" />
                                        <circle cx="50" cy="38" r="18" fill="#d0d4dc" />
                                        <path d="M20,85 C20,68 32,60 50,60 C68,60 80,68 80,85 Z" fill="#d0d4dc" />
                                   </svg>`
                    }
                        </div>
                        <div class="p-3">
                            <div class="d-flex align-items-start justify-content-between gap-2 mb-2">
                                <div>
                                    <h6 class="mb-1 fw-bold text-dark" style="font-size: 0.98rem; line-height: 1.25;">${student.name}</h6>
                                    <div class="text-muted" style="font-size: 0.78rem;">${student.dept}</div>
                                </div>
                                <span class="badge rounded-pill text-bg-light border text-uppercase" style="font-size: 0.68rem;">${student.year}</span>
                            </div>
                            <div class="student-meta-card d-flex flex-column gap-1">
                                <div class="d-flex align-items-center justify-content-between">
                                    <span class="text-muted" style="font-size: 0.75rem;">Company</span>
                                    <span class="fw-semibold text-dark text-end" style="font-size: 0.78rem; line-height: 1.2;">${student.company}</span>
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <span class="text-muted" style="font-size: 0.75rem;">Stream</span>
                                    <span class="fw-semibold text-dark text-end" style="font-size: 0.78rem; line-height: 1.2;">${student.type}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                grid.appendChild(col);
            });
        }

        // Form search submit
        filterForm.addEventListener("submit", function (e) {
            e.preventDefault();
            renderGrid();
        });

        // Initialize grid on load
        renderGrid();
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



