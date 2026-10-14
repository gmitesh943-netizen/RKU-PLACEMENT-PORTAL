<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="RK University Placement Portal - Connecting talent with opportunities. Empowering students with industry-ready careers, internships, and campus placements.">
        <meta name="keywords" content="RK University, Placement Portal, University Placements, Rajkot College, Gujarat Placements, Job Portal, Student Internships, Top Recruiters">
        <meta name="author" content="RK University">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css?v=2" rel="stylesheet">
        <style>
            .home-stories-scroll {
                overflow: hidden;
            }

            .home-stories-track {
                display: flex;
                flex-wrap: nowrap;
                transition: transform 0.65s ease;
                will-change: transform;
            }

            .home-story-slide {
                flex: 0 0 100%;
                width: 100%;
                padding-right: 0;
            }

            .home-story-card {
                background: #fff;
                border-radius: 18px;
                box-shadow: 0 8px 26px rgba(0, 0, 0, 0.04);
                height: 100%;
                padding: 1rem;
                border: 1px solid #eef0f3;
                max-width: 420px;
                margin: 0 auto;
            }

            .home-story-img,
            .home-story-placeholder {
                width: 100%;
                height: 260px;
                object-fit: cover;
                object-position: top center;
                border-radius: 14px;
                margin-bottom: 1rem;
                display: block;
            }

            .home-story-placeholder {
                background: #f1f3f5;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #94a3b8;
            }

            .home-story-name {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.05rem;
                color: var(--rku-dark);
                margin: 0 0 0.25rem 0;
            }

            .home-story-course {
                font-size: 0.84rem;
                font-weight: 600;
                color: #6b7280;
                margin: 0;
            }

            .home-story-company {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 0.95rem;
                color: var(--rku-maroon);
                margin: 0.5rem 0 0.2rem 0;
            }

            .home-story-package {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.1rem;
                color: var(--rku-dark);
                margin: 0.15rem 0 0;
            }

            @media (max-width: 767.98px) {
                .home-story-card {
                    max-width: 100%;
                }

                .home-story-img,
                .home-story-placeholder {
                    height: 210px;
                }
            }
        </style>
    </head>
    <body>

        <!-- ==========================================
                         1. HEADER TOPBAR & NAVBAR
                         ========================================== -->
        <!-- RKU Header Topbar -->
        <div class="rku-header-topbar d-none d-lg-block" style="background: #ffffff; border-bottom: 1px solid #edf2f7; font-size: 0.84rem; color: #334155; position: relative; z-index: 1031;">
            <div class="container-fluid px-lg-5">
                <div class="d-flex justify-content-between align-items-center py-2">
                    <!-- Left: Tagline with Graduation Cap -->
                    <div class="topbar-tagline d-flex align-items-center" style="font-weight: 500; color: #334155;">
                        <i class="fa-solid fa-graduation-cap topbar-icon me-2" style="color: #e03627; font-size: 0.95rem;"></i>
                        <span>Empowering Students. Connecting Companies. Building Careers.</span>
                    </div>
                    <!-- Right: Contact info & Social Media Icons -->
                    <div class="topbar-contact d-flex align-items-center gap-3">
                        <a href="tel:+919876543210" class="topbar-link" style="color: #334155; text-decoration: none; display: inline-flex; align-items: center;">
                            <i class="fa-solid fa-phone topbar-icon me-1.5" style="color: #e03627; font-size: 0.85rem;"></i><span style="color: #334155;">+91 98765 43210</span>
                        </a>
                        <span class="topbar-divider" style="color: #cbd5e1;">|</span>
                        <a href="mailto:placement@rku.ac.in" class="topbar-link" style="color: #334155; text-decoration: none; display: inline-flex; align-items: center;">
                            <i class="fa-solid fa-envelope topbar-icon me-1.5" style="color: #e03627; font-size: 0.85rem;"></i><span style="color: #334155;">placement@rku.ac.in</span>
                        </a>
                        <div class="topbar-socials d-flex align-items-center gap-1.5 ms-2">
                            <a href="https://facebook.com" target="_blank" class="social-circle-btn" title="Facebook" style="width: 26px; height: 26px; min-width: 26px; border-radius: 50%; background: linear-gradient(135deg, #e03627, #c5281b); color: #ffffff !important; display: inline-flex; align-items: center; justify-content: center; text-decoration: none; box-shadow: 0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-facebook-f" style="color: #ffffff !important; font-size: 0.72rem;"></i></a>
                            <a href="https://linkedin.com" target="_blank" class="social-circle-btn" title="LinkedIn" style="width: 26px; height: 26px; min-width: 26px; border-radius: 50%; background: linear-gradient(135deg, #e03627, #c5281b); color: #ffffff !important; display: inline-flex; align-items: center; justify-content: center; text-decoration: none; box-shadow: 0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-linkedin-in" style="color: #ffffff !important; font-size: 0.72rem;"></i></a>
                            <a href="https://instagram.com" target="_blank" class="social-circle-btn" title="Instagram" style="width: 26px; height: 26px; min-width: 26px; border-radius: 50%; background: linear-gradient(135deg, #e03627, #c5281b); color: #ffffff !important; display: inline-flex; align-items: center; justify-content: center; text-decoration: none; box-shadow: 0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-instagram" style="color: #ffffff !important; font-size: 0.72rem;"></i></a>
                            <a href="https://youtube.com" target="_blank" class="social-circle-btn" title="YouTube" style="width: 26px; height: 26px; min-width: 26px; border-radius: 50%; background: linear-gradient(135deg, #e03627, #c5281b); color: #ffffff !important; display: inline-flex; align-items: center; justify-content: center; text-decoration: none; box-shadow: 0 2px 6px rgba(224,54,39,0.25);"><i class="fa-brands fa-youtube" style="color: #ffffff !important; font-size: 0.72rem;"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg sticky-top">
            <div class="container-fluid px-lg-5">
                <!-- Brand Logo -->
                <a class="navbar-brand d-flex align-items-center" href="#" id="navbarBrandLink">
                    <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;">
                </a>&nbsp;<!-- Mobile Toggle -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation" id="navbarToggleButton">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navigation Links -->
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="Index.aspx" id="navHome">Home</a> </li>
                        <li class="nav-item"><a class="nav-link" href="About.aspx" id="navAbout">About Us</a> </li>
                        <li class="nav-item dropdown" id="navItemPlacement"><a class="nav-link nav-placement-btn dropdown-toggle" href="#" id="navDrives" data-bs-toggle="dropdown" aria-expanded="false">Placement <i class="fa-solid fa-chevron-down placement-caret"></i></a>
                            <ul class="dropdown-menu nav-placement-dropdown" aria-labelledby="navDrives">
                                <li><a class="dropdown-item" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
                                <li><a class="dropdown-item" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
                                <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                                <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
                                <li><a class="dropdown-item" href="PlacmentProminentRecruiters.aspx" id="navPlacementRecruiters">Prominent Recruiters</a></li>
                                <li><a class="dropdown-item" href="PlacementPolicy.aspx" id="navPlacementPolicy">Placement Policy</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="Companies.aspx" id="navCompanies">Companies</a> </li>
                        <li class="nav-item"><a class="nav-link" href="SuccessStories.aspx" id="navStories">Success Stories</a> </li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx" id="navContact">Contact</a> </li>
                    </ul>

                    <!-- User Actions -->
                    <div class="navbar-actions d-flex align-items-center">
                        <a href="#" class="icon-btn" title="Search" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></a><a href="#" class="icon-btn position-relative" title="Notifications" id="btnNotifications"><i class="fa-regular fa-bell"></i><span class="position-absolute top-0 start-100 translate-middle p-1 bg-rku-red border border-light rounded-circle"></span></a><a href="Login.aspx" class="btn btn-login" id="btnLogin">Login</a> <a href="Register.aspx" class="btn btn-register" id="btnRegister">Register</a>
                    </div>
                </div>
            </div>
        </nav>
</asp:Content>


