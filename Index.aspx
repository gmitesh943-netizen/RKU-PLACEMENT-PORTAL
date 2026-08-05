<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Placement Portal | RK University</title>

                    <!-- Meta Tags for SEO -->
                    <meta name="description" content="RK University Placement Portal - Connecting talent with opportunities. Empowering students with industry-ready careers, internships, and campus placements.">
                    <meta name="keywords" content="RK University, Placement Portal, University Placements, Rajkot College, Gujarat Placements, Job Portal, Student Internships, Top Recruiters">
                    <meta name="author" content="RK University">

                    <!-- Bootstrap 5 CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                    <!-- FontAwesome Icons -->
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

                    <!-- Custom CSS -->
                    <link href="css/style.css" rel="stylesheet">
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
         1. HEADER / NAVBAR
         ========================================== -->
                    <nav class="navbar navbar-expand-lg sticky-top">
                        <div class="container-fluid px-lg-5">
                            <!-- Brand Logo -->
                            <a class="navbar-brand d-flex align-items-center" href="#" id="navbarBrandLink">
                            <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;"> </a>&nbsp;<!-- Mobile Toggle -->
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


