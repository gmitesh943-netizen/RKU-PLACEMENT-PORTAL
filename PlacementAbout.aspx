<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="PlacementAbout.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.PlacementAbout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About RKU | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="About RK University Training & Placement Cell. Our objectives, team, coordinators, competency assessments, and skill-based workshops.">
        <meta name="keywords" content="RK University, Placement Cell, About RKU, TPO Rajkot, Placement Coordinators, Training objectives">
        <meta name="author" content="RK University">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">

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

            /* Section Heading */
            .page-content-title {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.4rem;
                color: var(--rku-dark);
                text-transform: uppercase;
                margin-bottom: 1.5rem;
            }

                .page-content-title span {
                    color: var(--rku-red);
                }

            .objectives-title {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 1.1rem;
                color: var(--rku-dark);
                margin-top: 1.8rem;
                margin-bottom: 1rem;
            }

            .objectives-list {
                list-style: none;
                padding-left: 0;
                margin-bottom: 2rem;
            }

                .objectives-list li {
                    position: relative;
                    padding-left: 1.5rem;
                    margin-bottom: 0.75rem;
                    font-size: 0.92rem;
                    color: #495057;
                    font-weight: 500;
                }

                    .objectives-list li::before {
                        content: "\f111";
                        font-family: "Font Awesome 6 Free";
                        font-weight: 900;
                        font-size: 0.5rem;
                        color: var(--rku-red);
                        position: absolute;
                        left: 0;
                        top: 0.55rem;
                    }

            /* Coordinator Cards Grid */
            .coordinator-grid-card {
                background-color: #fff;
                border: 1px solid #eef0f3;
                border-radius: 10px;
                padding: 1.25rem;
                height: 100%;
                transition: all 0.25s ease;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.02);
            }

                .coordinator-grid-card:hover {
                    transform: translateY(-4px);
                    box-shadow: 0 10px 25px rgba(163, 15, 20, 0.08);
                    border-color: rgba(239, 55, 36, 0.15);
                }

            .coordinator-avatar-wrapper {
                width: 80px;
                height: 100px;
                border-radius: 6px;
                overflow: hidden;
                background-color: #f1f3f5;
                flex-shrink: 0;
                filter: grayscale(100%);
                transition: filter 0.25s ease;
            }

            .coordinator-grid-card:hover .coordinator-avatar-wrapper {
                filter: grayscale(0%);
            }

            .coordinator-avatar-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .coordinator-info-box {
                flex-grow: 1;
            }

            .coordinator-card-name {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.95rem;
                color: var(--rku-dark);
                margin-bottom: 0.2rem;
            }

            .coordinator-card-dept {
                font-size: 0.8rem;
                color: #6c757d;
                margin-bottom: 0.4rem;
                line-height: 1.4;
            }

            .coordinator-card-contact {
                font-size: 0.78rem;
                color: #555;
                margin-bottom: 0.2rem;
            }

            .coordinator-card-pkg {
                font-size: 0.82rem;
                font-weight: 700;
                color: var(--rku-maroon);
                margin-bottom: 0;
            }

            /* Circular diagram image styling */
            .diagram-container {
                text-align: center;
                margin: 3rem 0;
            }

            .diagram-img {
                max-width: 100%;
                height: auto;
                width: 500px;
                margin: 0 auto;
            }

            /* Custom Accordion */
            .custom-accordion-item {
                border: 1px solid #eef0f3;
                border-radius: 6px;
                margin-bottom: 0.75rem;
                overflow: hidden;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.01);
            }

            .custom-accordion-header {
                background-color: #f8f9fa;
                padding: 0.9rem 1.25rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                cursor: pointer;
                user-select: none;
                transition: background-color 0.25s ease;
            }

                .custom-accordion-header.active {
                    background-color: #0c1a30;
                    color: #fff;
                }

                .custom-accordion-header h5 {
                    font-size: 0.9rem;
                    font-weight: 700;
                    font-family: var(--font-heading);
                    margin: 0;
                    color: inherit;
                    text-transform: uppercase;
                }

            .custom-accordion-icon {
                font-size: 0.95rem;
                transition: transform 0.25s ease;
            }

            .custom-accordion-content {
                padding: 1.25rem;
                font-size: 0.88rem;
                color: #495057;
                line-height: 1.6;
                display: none;
                border-top: 1px solid #eef0f3;
                background-color: #fff;
            }

            /* SVG Circular Diagram Styles */
            .circle-diagram-svg {
                display: block;
                margin: 2rem auto;
                max-width: 100%;
                height: auto;
            }

                .circle-diagram-svg text {
                    font-family: var(--font-heading);
                    font-weight: bold;
                    fill: #495057;
                    font-size: 11px;
                    text-anchor: middle;
                }

                .circle-diagram-svg .center-text {
                    fill: #ffffff;
                    font-size: 12px;
                    font-weight: 800;
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
                                <li><a class="dropdown-item active" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
                                <li><a class="dropdown-item" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
                                <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
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
    <section class="about-hero" style="background-image: url('assets/images/About-Plcment.jpg');" id="aboutHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="aboutBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="#">Placement</a>
                        <span>/</span>
                            <a href="PlacementAbout.aspx" class="active">About RKU</a>
                    </div>

                    <h1 class="hero-title" id="aboutHeroTitle">About RKU</h1>
                    <p class="hero-subtitle mb-0" id="aboutHeroSubtitle">Home › Placement › About RKU</p>
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
                            <li class="placement-sidebar-item active">
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
                            <li class="placement-sidebar-item">
                                <a href="PlacmentProminentRecruiters.aspx"><i class="fa-solid fa-briefcase"></i>Prominent Recruiters</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Right Main Content -->
                <div class="col-lg-9">

                    <!-- Text Content -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-4">
                        <h2 class="page-content-title">ABOUT TRAINING AND PLACEMENT CELL AT <span>RK UNIVERSITY</span></h2>
                        <p class="text-muted" style="font-size: 0.92rem; line-height: 1.6;">
                            The Training and Placement Cell is committed to empowering students and graduates to excel in the industry's most competitive environments. We create and nurture professional opportunities by connecting our students with leading recruiters and organizations. The cell works relentlessly for the overall development of students with sector-relevant training, placement assistance, and career guidance.
                        </p>
                        <p class="text-muted mb-0" style="font-size: 0.92rem; line-height: 1.6;">
                            We believe in building industry-ready professionals and provide platforms for students to showcase their skills, knowledge, and potential. Our consistent efforts have helped in maintaining a strong relationship with recruiters across different sectors.
                        </p>

                        <h3 class="objectives-title">Objectives of Training and Placement Cell:</h3>
                        <ul class="objectives-list">
                            <li>To enhance the employability skills of students by providing world-class training programs and workshops.</li>
                            <li>To facilitate placement of students across leading organizations.</li>
                            <li>To promote industry-institute interaction and networking.</li>
                            <li>To enhance and strengthen relationships with corporate and recruiting institutes.</li>
                        </ul>
                    </div>

                    <!-- Coordinator Cards Grid -->
                    <div class="row g-3 mb-5">

                        <!-- Card 1 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Vishal Subhedar</h4>
                                    <p class="coordinator-card-dept">
                                        B.Tech Computer Engineering<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 97251 18180</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 20 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 2 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Hrideshang Parikh</h4>
                                    <p class="coordinator-card-dept">
                                        B.Tech Information Engineering<br>
                                        (Co-coordinator TPO)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 90160 51240</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 40 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 3 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Adityarajsinh Parmar</h4>
                                    <p class="coordinator-card-dept">
                                        B.Tech Computer Engineering<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 97450 81240</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 20 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 4 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Vivek Makadiya</h4>
                                    <p class="coordinator-card-dept">
                                        B.Tech Computer Engineering<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 76142 57992</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 20 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 5 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Aghesh Vakariya</h4>
                                    <p class="coordinator-card-dept">
                                        B.Tech Information Technology<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 99790 28882</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 28 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 6 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Ritesh Mavani</h4>
                                    <p class="coordinator-card-dept">
                                        B.Tech Civil Engineering<br>
                                        (Assistant Professor - Civil)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 91538 56858</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 25 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 7 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Kalpesh Kathrot</h4>
                                    <p class="coordinator-card-dept">
                                        MBA<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 91045 42143</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 20 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 8 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Kunal Tanna</h4>
                                    <p class="coordinator-card-dept">
                                        MCA<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 63529 27119</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 28 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 9 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Rushikumar Dajera</h4>
                                    <p class="coordinator-card-dept">
                                        MBA<br>
                                        &nbsp;
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 70482 44927</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 28 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 10 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Pankaj Somaiya</h4>
                                    <p class="coordinator-card-dept">
                                        MBA<br>
                                        (Assistant Professor)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 90360 41445</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 28 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 11 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Dharmin Goriya</h4>
                                    <p class="coordinator-card-dept">
                                        MCA<br>
                                        (Senior UI/UX Developer)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 63250 55219</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 28 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 12 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Arjun Baradokia</h4>
                                    <p class="coordinator-card-dept">
                                        MCA<br>
                                        (Edu Connectivity Services Ltd.)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 74050 84543</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 25 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 13 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Mitesh Katadiya</h4>
                                    <p class="coordinator-card-dept">
                                        MCA<br>
                                        (WordPress Expert)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 63556 85496</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 20 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 14 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Final Madiya</h4>
                                    <p class="coordinator-card-dept">
                                        MPT<br>
                                        (Spin Motors Pvt. Ltd.)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 99251 10219</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 40 LPA</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card 15 -->
                        <div class="col-xl-4 col-md-6">
                            <div class="coordinator-grid-card d-flex gap-3 align-items-center">
                                <div class="coordinator-avatar-wrapper">
                                    <svg viewBox="0 0 100 120" width="80" height="100" fill="#bbb">
                                        <rect width="100" height="120" fill="#f1f3f5" />
                                        <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                        <path d="M15,100 C15,80 30,70 50,70 C70,70 85,80 85,100 Z" fill="#d0d4dc" />
                                    </svg>
                                </div>
                                <div class="coordinator-info-box">
                                    <h4 class="coordinator-card-name">Pooja Popat</h4>
                                    <p class="coordinator-card-dept">
                                        MPT<br>
                                        (HR Generalist)
                                    </p>
                                    <p class="coordinator-card-contact">Contact: 74050 84543</p>
                                    <p class="coordinator-card-pkg">Package: Rs. 20 LPA</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Diagram Section -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-5">
                        <p class="fw-semibold text-center mb-0" style="font-family: var(--font-heading); color: #495057; font-size: 0.95rem;">
                            Different services offered by Training and Placement Cell to enhance employability skills of the students are:
                        </p>

                        <!-- Inline SVG Circular Infographic Diagram -->
                        <svg class="circle-diagram-svg" width="550" height="350" viewBox="0 0 550 350">
                            <!-- Background elements -->
                            <rect width="550" height="350" fill="#ffffff" rx="10" />

                            <!-- Left outer arcs (grey layers) -->
                            <path d="M 190,175 A 110,110 0 0,1 250,65" fill="none" stroke="#e0e0e0" stroke-width="12" stroke-linecap="round" />
                            <path d="M 170,175 A 130,130 0 0,1 245,45" fill="none" stroke="#d0d0d0" stroke-width="12" stroke-linecap="round" />
                            <path d="M 150,175 A 150,150 0 0,1 240,25" fill="none" stroke="#b0b0b0" stroke-width="12" stroke-linecap="round" />

                            <!-- Right outer arcs (grey layers) -->
                            <path d="M 360,175 A 110,110 0 0,0 300,65" fill="none" stroke="#e0e0e0" stroke-width="12" stroke-linecap="round" />
                            <path d="M 380,175 A 130,130 0 0,0 305,45" fill="none" stroke="#d0d0d0" stroke-width="12" stroke-linecap="round" />
                            <path d="M 400,175 A 150,150 0 0,0 310,25" fill="none" stroke="#b0b0b0" stroke-width="12" stroke-linecap="round" />

                            <!-- Bottom curved outer arcs -->
                            <path d="M 190,175 A 110,110 0 0,0 260,285" fill="none" stroke="#e0e0e0" stroke-width="12" stroke-linecap="round" />
                            <path d="M 360,175 A 110,110 0 0,1 290,285" fill="none" stroke="#e0e0e0" stroke-width="12" stroke-linecap="round" />

                            <!-- Red active curved pill-like labels in the circle flow -->
                            <!-- Mock Interviews (top left) -->
                            <path d="M 200,105 A 100,100 0 0,1 250,75" fill="none" stroke="#ef3724" stroke-width="14" stroke-linecap="round" />
                            <text x="210" y="80" fill="#ffffff" font-size="9" transform="rotate(-15, 210, 80)">Mock Interviews</text>

                            <!-- Aptitude Training (top right) -->
                            <path d="M 300,75 A 100,100 0 0,1 350,105" fill="none" stroke="#ef3724" stroke-width="14" stroke-linecap="round" />
                            <text x="340" y="80" fill="#ffffff" font-size="9" transform="rotate(15, 340, 80)">Aptitude Training</text>

                            <!-- Soft Skills / Resume (bottom left) -->
                            <path d="M 200,245 A 100,100 0 0,0 250,275" fill="none" stroke="#ef3724" stroke-width="14" stroke-linecap="round" />

                            <!-- Skill Development (bottom right) -->
                            <path d="M 300,275 A 100,100 0 0,0 350,245" fill="none" stroke="#ef3724" stroke-width="14" stroke-linecap="round" />

                            <!-- Central Red Ring and Circle -->
                            <circle cx="275" cy="175" r="65" fill="#a30f14" stroke="#ffffff" stroke-width="4" shadow="0 4px 10px rgba(0,0,0,0.15)" />
                            <text x="275" y="165" class="center-text" font-size="12">Career</text>
                            <text x="275" y="180" class="center-text" font-size="12">Management</text>
                            <text x="275" y="195" class="center-text" font-size="12">Services</text>

                            <!-- Outer Text Labels with Lines -->
                            <!-- Mock Interviews Line -->
                            <line x1="210" y1="85" x2="160" y2="70" stroke="#ef3724" stroke-width="1.5" />
                            <circle cx="160" cy="70" r="3" fill="#ef3724" />
                            <text x="115" y="73" font-size="10" font-weight="700">Mock Interviews</text>

                            <!-- Aptitude Training Line -->
                            <line x1="340" y1="85" x2="390" y2="70" stroke="#ef3724" stroke-width="1.5" />
                            <circle cx="390" cy="70" r="3" fill="#ef3724" />
                            <text x="440" y="73" font-size="10" font-weight="700">Aptitude Training</text>

                            <!-- Technical Internships (Left side) -->
                            <line x1="170" y1="175" x2="120" y2="175" stroke="#888888" stroke-width="1.5" />
                            <circle cx="120" cy="175" r="3" fill="#888" />
                            <text x="70" y="179" font-size="10" font-weight="700">Technical Internships</text>

                            <!-- Skill Development (Right side) -->
                            <line x1="380" y1="175" x2="430" y2="175" stroke="#888888" stroke-width="1.5" />
                            <circle cx="430" cy="175" r="3" fill="#888" />
                            <text x="480" y="179" font-size="10" font-weight="700">Skill Development</text>

                            <!-- Soft Skills / Resume Building (Bottom Left Line) -->
                            <line x1="210" y1="265" x2="160" y2="280" stroke="#ef3724" stroke-width="1.5" />
                            <circle cx="160" cy="280" r="3" fill="#ef3724" />
                            <text x="110" y="295" font-size="10" font-weight="700">Soft Skills &amp;</text>
                            <text x="110" y="310" font-size="10" font-weight="700">Resume Building</text>

                            <!-- Placement / Facilities (Bottom Right Line) -->
                            <line x1="340" y1="265" x2="390" y2="280" stroke="#ef3724" stroke-width="1.5" />
                            <circle cx="390" cy="280" r="3" fill="#ef3724" />
                            <text x="440" y="295" font-size="10" font-weight="700">Placement &amp;</text>
                            <text x="440" y="310" font-size="10" font-weight="700">Facilities Info</text>
                        </svg>
                    </div>

                    <!-- Accordion Section -->
                    <div class="custom-accordion" id="placementAccordions">

                        <!-- Item 1 (Active) -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header active" onclick="toggleAccordion(this)">
                                <h5><i class="fa-solid fa-minus me-2"></i>Competency Assessment</h5>
                                <span class="custom-accordion-icon"><i class="fa-solid fa-chevron-up"></i></span>
                            </div>
                            <div class="custom-accordion-content" style="display: block;">
                                At regular intervals we are taking diagnostic and competency assessment tests of the students of pre final and final years. Tests &amp; analysis is essential &amp; significant feedback about their competencies in the area of quantitative ability, logical reasoning &amp; verbal and as per results initiatives are taken to improve their weak areas. We also conduct tests to assess readiness/acceptance like AON (Cocubes) and Aspiring Minds (AMCAT) to conduct assessment tests for our students.
                            </div>
                        </div>

                        <!-- Item 2 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="toggleAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2"></i>Skill Based Workshops</h5>
                                <span class="custom-accordion-icon"><i class="fa-solid fa-chevron-down"></i></span>
                            </div>
                            <div class="custom-accordion-content">
                                We regularly organize workshops on latest technologies like Web Development, Machine Learning, UI/UX, and cloud computing. These workshops are led by industry professionals to bridge the gap between classroom teaching and the current corporate demands.
                            </div>
                        </div>

                        <!-- Item 3 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="toggleAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2"></i>Internships</h5>
                                <span class="custom-accordion-icon"><i class="fa-solid fa-chevron-down"></i></span>
                            </div>
                            <div class="custom-accordion-content">
                                Our students get summer and winter internships in top organizations, giving them crucial real-world working experience. Many of these internships convert into permanent placement offers post graduation.
                            </div>
                        </div>

                        <!-- Item 4 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="toggleAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2"></i>Expert Lectures</h5>
                                <span class="custom-accordion-icon"><i class="fa-solid fa-chevron-down"></i></span>
                            </div>
                            <div class="custom-accordion-content">
                                Leaders from corporate sectors are regularly invited to interact with our students. These expert lectures keep the student community informed about industrial patterns and career prospects in different domains.
                            </div>
                        </div>

                        <!-- Item 5 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="toggleAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2"></i>Mock Interviews</h5>
                                <span class="custom-accordion-icon"><i class="fa-solid fa-chevron-down"></i></span>
                            </div>
                            <div class="custom-accordion-content">
                                Mock Interviews are conducted by senior faculty and industry mentors. They simulate actual placement rounds, including technical interviews, group discussions, and HR rounds, with immediate feedback for students.
                            </div>
                        </div>

                        <!-- Item 6 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="toggleAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2"></i>Placement / Facilities</h5>
                                <span class="custom-accordion-icon"><i class="fa-solid fa-chevron-down"></i></span>
                            </div>
                            <div class="custom-accordion-content">
                                RK University has state-of-the-art facilities for hosting recruiters. This includes air-conditioned presentation auditoriums, specialized GD chambers, dedicated interview cabins, and computing labs for placement test execution.
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

    <script>
        // Custom Accordion Toggle Function
        function toggleAccordion(headerElement) {
            const content = headerElement.nextElementSibling;
            const icon = headerElement.querySelector('.custom-accordion-icon i');
            const iconHeader = headerElement.querySelector('h5 i');

            // Check if active
            const isActive = headerElement.classList.contains('active');

            // Close all items
            const allHeaders = document.querySelectorAll('.custom-accordion-header');
            const allContents = document.querySelectorAll('.custom-accordion-content');

            allHeaders.forEach(h => {
                h.classList.remove('active');
                const hIcon = h.querySelector('.custom-accordion-icon i');
                const hHeaderIcon = h.querySelector('h5 i');
                hIcon.className = 'fa-solid fa-chevron-down';
                hHeaderIcon.className = 'fa-solid fa-plus me-2';
            });

            allContents.forEach(c => {
                c.style.display = 'none';
            });

            // Toggle clicked item
            if (!isActive) {
                headerElement.classList.add('active');
                content.style.display = 'block';
                icon.className = 'fa-solid fa-chevron-up';
                iconHeader.className = 'fa-solid fa-minus me-2';
            }
        }
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



