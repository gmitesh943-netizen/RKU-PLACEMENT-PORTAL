<%@ Page Title="Placement Policy | Placement Portal | RK University" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="PlacementPolicy.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.PlacementPolicy" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Placement Policy | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="Official Training and Placement Policy of RK University. Rules for campus placement drives, One Student One Job policy, eligibility criteria, and student code of conduct.">
        <meta name="keywords" content="RK University Placement Policy, T&P Rules, One Student One Job Policy, TPO Rajkot, Campus Drive Guidelines, Student Eligibility, Code of Conduct">
        <meta name="author" content="RK University">

        <!-- Open Graph / Social Sharing Meta Tags -->
        <meta property="og:title" content="University Placement Policy & Guidelines | RK University">
        <meta property="og:description" content="Official Training & Placement Policy: One Student One Job rule, eligibility criteria, code of conduct, and recruitment guidelines.">
        <meta property="og:type" content="website">
        <meta property="og:image" content="assets/images/About-Plcment.jpg">

        <!-- Google Schema.org Structured Data (FAQPage) -->
        <script type="application/ld+json">
        {
          "@context": "https://schema.org",
          "@type": "FAQPage",
          "mainEntity": [
            {
              "@type": "Question",
              "name": "Can I participate in campus drives if I have a pending backlog?",
              "acceptedAnswer": {
                "@type": "Answer",
                "text": "Most visiting corporate recruiters require zero live backlogs at the time of the recruitment process. However, if any specific company allows students with active backlogs, it will be clearly mentioned in the drive circular."
              }
            },
            {
              "@type": "Question",
              "name": "If I receive a job offer, can I still sit for a Dream Company drive?",
              "acceptedAnswer": {
                "@type": "Answer",
                "text": "Yes. As per the RKU Placement Policy, if a pre-placed student gets an opportunity with a company offering at least 1.5 times their current package (and falling within Tier-2 Dream or Tier-3 Super Dream), they are permitted to register."
              }
            },
            {
              "@type": "Question",
              "name": "What happens if I miss a drive after registering?",
              "acceptedAnswer": {
                "@type": "Answer",
                "text": "Unexcused absence from any registered placement drive is classified as a No-Show and results in immediate debarment from the next 2 consecutive campus drives."
              }
            },
            {
              "@type": "Question",
              "name": "How soon do I have to confirm my offer on the portal?",
              "acceptedAnswer": {
                "@type": "Answer",
                "text": "Students must formally Accept or Reject their offer letters within 3 working days of notification through their Student Dashboard."
              }
            },
            {
              "@type": "Question",
              "name": "Is attendance in Pre-Placement Training mandatory?",
              "acceptedAnswer": {
                "@type": "Answer",
                "text": "Yes. A minimum of 75% attendance in T&P training modules, aptitude sessions, and technical brush-up workshops is mandatory."
              }
            }
          ]
        }
        </script>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            /* Sticky Sidebar Wrapper */
            .placement-sidebar-wrapper {
                position: sticky;
                top: 90px;
                z-index: 20;
            }

            /* Sidebar Navigation Menu */
            .placement-sidebar {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                border: 1px solid #eef0f3;
                overflow: hidden;
                margin-bottom: 1.25rem;
            }

            .placement-sidebar-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .placement-sidebar-item a {
                display: flex;
                align-items: center;
                padding: 0.9rem 1.25rem;
                color: #495057;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 600;
                font-size: 0.92rem;
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
                font-size: 1.05rem;
                color: #6c757d;
                transition: color 0.25s ease;
            }

            .placement-sidebar-item.active a {
                background-color: var(--rku-maroon, #a30f14);
                color: #fff !important;
            }

                .placement-sidebar-item.active a i {
                    color: #fff !important;
                }

            .placement-sidebar-item a:hover:not(.active) {
                background-color: #fff5f5;
                color: var(--rku-maroon, #a30f14);
                padding-left: 1.45rem;
            }

                .placement-sidebar-item a:hover:not(.active) i {
                    color: var(--rku-maroon, #a30f14);
                }

            /* Section Headings */
            .page-content-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 800;
                font-size: 1.35rem;
                color: var(--rku-dark, #111);
                text-transform: uppercase;
                margin-bottom: 1.35rem;
                position: relative;
                padding-bottom: 0.5rem;
                letter-spacing: -0.01em;
            }

                .page-content-title::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 48px;
                    height: 3px;
                    background-color: var(--rku-red, #ef3724);
                }

                .page-content-title span {
                    color: var(--rku-red, #ef3724);
                }

            .objectives-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 700;
                font-size: 1.05rem;
                color: var(--rku-dark, #111);
                margin-top: 1.5rem;
                margin-bottom: 0.85rem;
            }

            .objectives-list {
                list-style: none;
                padding-left: 0;
                margin-bottom: 1.25rem;
            }

                .objectives-list li {
                    position: relative;
                    padding-left: 1.8rem;
                    margin-bottom: 0.65rem;
                    font-size: 0.92rem;
                    color: #495057;
                    line-height: 1.6;
                }

                    .objectives-list li::before {
                        content: "\f058";
                        font-family: "Font Awesome 6 Free";
                        font-weight: 900;
                        position: absolute;
                        left: 0;
                        top: 2px;
                        color: var(--rku-red, #ef3724);
                        font-size: 1rem;
                    }

            /* Policy Highlight Banner */
            .policy-alert-box {
                background-color: #fff9f8;
                border: 1px solid #ffdcd7;
                border-left: 4px solid var(--rku-red, #ef3724);
                border-radius: 6px;
                padding: 1.1rem 1.35rem;
                margin-bottom: 1.5rem;
            }

            /* Policy Cards Grid */
            .policy-rule-card {
                background: #fff;
                border: 1px solid #eef0f3;
                border-radius: 8px;
                padding: 1.35rem;
                height: 100%;
                transition: all 0.25s ease;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
            }

                .policy-rule-card:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 8px 25px rgba(163, 15, 20, 0.08);
                    border-color: rgba(239, 55, 36, 0.25);
                }

            .policy-card-icon {
                width: 44px;
                height: 44px;
                border-radius: 8px;
                background-color: #fff5f5;
                color: var(--rku-red, #ef3724);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.25rem;
                margin-bottom: 0.85rem;
            }

            .policy-card-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 700;
                font-size: 1rem;
                color: var(--rku-dark, #111);
                margin-bottom: 0.45rem;
            }

            .policy-card-text {
                font-size: 0.87rem;
                color: #6c757d;
                line-height: 1.55;
                margin-bottom: 0;
            }

            /* Job Tier Box */
            .tier-box {
                background: #fff;
                border: 1.5px solid #eef0f3;
                border-radius: 8px;
                padding: 1.35rem;
                height: 100%;
                transition: all 0.25s ease;
            }

                .tier-box.tier-dream {
                    border-color: var(--rku-red, #ef3724);
                    background-color: #fffcfb;
                }

                .tier-box:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
                }

            .tier-badge {
                display: inline-block;
                padding: 0.28rem 0.75rem;
                border-radius: 4px;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 0.75rem;
            }

            .tier-badge.regular {
                background-color: #e9ecef;
                color: #495057;
            }

            .tier-badge.dream {
                background-color: var(--rku-red, #ef3724);
                color: #fff;
            }

            .tier-badge.super {
                background-color: var(--rku-maroon, #a30f14);
                color: #fff;
            }

            .tier-package {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.3rem;
                font-weight: 800;
                color: var(--rku-dark, #111);
                margin-bottom: 0.45rem;
            }

            /* Custom Accordion matching PlacementAbout.aspx */
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
                    background-color: var(--rku-maroon, #a30f14);
                    color: #fff;
                }

                .custom-accordion-header h5 {
                    font-size: 0.91rem;
                    font-weight: 700;
                    font-family: var(--font-heading, 'Outfit', sans-serif);
                    margin: 0;
                    color: inherit;
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

            /* Contact Support Widget */
            .tpo-help-card {
                background-color: #fff;
                border: 1px solid #eef0f3;
                border-radius: 8px;
                padding: 1.25rem;
                text-align: center;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            }

            .tpo-help-icon {
                width: 44px;
                height: 44px;
                border-radius: 50%;
                background-color: #fff5f5;
                color: var(--rku-red, #ef3724);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.15rem;
                margin: 0 auto 0.75rem;
            }

            @media (max-width: 991px) {
                .placement-sidebar-wrapper {
                    position: static;
                    margin-bottom: 2rem;
                }
            }
        </style>
    </head>
    <body>

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

        <!-- Navbar -->
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
                                <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                                <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
                                <li><a class="dropdown-item" href="PlacmentProminentRecruiters.aspx" id="navPlacementRecruiters">Prominent Recruiters</a></li>
                                <li><a class="dropdown-item active" href="PlacementPolicy.aspx" id="navPlacementPolicy">Placement Policy</a></li>
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
    <section class="about-hero" style="background-image: url('assets/images/About-Plcment.jpg');" id="policyHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="policyBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="PlacementAbout.aspx">Placement</a>
                        <span>/</span>
                        <a href="PlacementPolicy.aspx" class="active">Placement Policy</a>
                    </div>

                    <h1 class="hero-title" id="policyHeroTitle">Placement Policy</h1>
                    <p class="hero-subtitle mb-0" id="policyHeroSubtitle">Home &#8250; Placement &#8250; University Placement Policy &amp; Guidelines</p>

                    <!-- Feature Badges -->
                    <ul class="about-hero-features">
                        <li class="about-hero-feature-item">
                            <i class="fa-solid fa-circle-check"></i> One Student One Job
                        </li>
                        <li class="about-hero-feature-item">
                            <i class="fa-solid fa-circle-check"></i> 100% Equal Opportunity
                        </li>
                        <li class="about-hero-feature-item">
                            <i class="fa-solid fa-circle-check"></i> Dream Offer (&#8377;6.0 LPA+)
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         3. MAIN LAYOUT (SIDEBAR + CONTENT)
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light, #fcfcfc);" id="mainLayoutSection">
        <div class="container px-lg-5">
            <div class="row g-4">

                <!-- Left Sidebar -->
                <div class="col-lg-3">
                    <div class="placement-sidebar-wrapper">
                        <!-- Navigation Menu -->
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
                                <li class="placement-sidebar-item">
                                    <a href="PlacmentProminentRecruiters.aspx"><i class="fa-solid fa-briefcase"></i>Prominent Recruiters</a>
                                </li>
                                <li class="placement-sidebar-item active">
                                    <a href="PlacementPolicy.aspx"><i class="fa-solid fa-gavel"></i>Placement Policy</a>
                                </li>
                            </ul>
                        </div>

                        <!-- Left TPO Contact Card -->
                        <div class="tpo-help-card mb-3">
                            <div class="tpo-help-icon">
                                <i class="fa-solid fa-headset"></i>
                            </div>
                            <h6 class="fw-bold text-dark mb-1" style="font-family: var(--font-heading, 'Outfit', sans-serif); font-size: 0.95rem;">TPO Grievance Desk</h6>
                            <p class="text-muted mb-2.5" style="font-size: 0.82rem;">Questions regarding eligibility or drive rules?</p>
                            <a href="mailto:placement@rku.ac.in" class="btn btn-sm btn-rku-outline w-100 fw-semibold py-1.5" style="font-size: 0.82rem;">
                                <i class="fa-solid fa-envelope me-1"></i> placement@rku.ac.in
                            </a>
                        </div>

                        <!-- PDF Download Trigger Card -->
                        <div class="tpo-help-card">
                            <button type="button" class="btn btn-rku w-100 fw-semibold py-2" onclick="window.print();" style="font-size: 0.85rem;">
                                <i class="fa-solid fa-file-pdf me-1.5"></i> Print / Save PDF
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Right Main Content -->
                <div class="col-lg-9">

                    <!-- Section 1: Overview & Preamble -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-4">
                        <h2 class="page-content-title">UNIVERSITY PLACEMENT POLICY &amp; <span>CODE OF CONDUCT</span></h2>
                        <p class="text-muted" style="font-size: 0.92rem; line-height: 1.6;">
                            The Training and Placement Cell (T&amp;P Cell) at RK University is committed to ensuring a fair, transparent, and merit-based recruitment ecosystem for all graduating students. The Placement Policy serves as a definitive operational guideline governing company registrations, student eligibility, code of conduct, and job offer allocations.
                        </p>
                        <p class="text-muted mb-0" style="font-size: 0.92rem; line-height: 1.6;">
                            Compliance with these rules is mandatory for every student registered on the RKU Placement Portal. Adherence to these policies ensures that maximum students secure promising career beginnings while upholding the university's esteemed reputation with corporate partners.
                        </p>

                        <h3 class="objectives-title">Key Core Objectives of the Policy:</h3>
                        <ul class="objectives-list">
                            <li>To provide equal and transparent career opportunities across all engineering, pharmacy, management, and computer application departments.</li>
                            <li>To prevent offer hoarding through the systematic enforcement of the "One Student, One Job" protocol.</li>
                            <li>To cultivate professional corporate etiquette, punctuality, and interview discipline among candidates.</li>
                            <li>To maintain long-term, mutually beneficial recruitment relationships with 300+ leading recruiters.</li>
                        </ul>
                    </div>

                    <!-- Section 2: One Student One Job Policy & Dream Offer Matrix -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-4">
                        <h2 class="page-content-title">"ONE STUDENT, ONE JOB" <span>POLICY</span></h2>
                        
                        <div class="policy-alert-box">
                            <h6 class="fw-bold mb-1" style="color: var(--rku-maroon, #a30f14);"><i class="fa-solid fa-circle-info me-1.5"></i> Core Institutional Rule:</h6>
                            <p class="text-muted mb-0" style="font-size: 0.88rem;">
                                Once a student receives a formal job offer / Letter of Intent (LOI) from any visiting organization, their status on the portal will be frozen for further regular placement drives.
                            </p>
                        </div>

                        <h3 class="objectives-title" style="margin-top: 0;">Recruitment Tier Categorization:</h3>
                        <div class="row g-3 mb-3">
                            <!-- Regular Tier -->
                            <div class="col-12 col-md-4">
                                <div class="tier-box">
                                    <span class="tier-badge regular">Tier 1: Regular</span>
                                    <div class="tier-package">Up to &#8377;4.5 LPA</div>
                                    <p class="text-muted mb-2" style="font-size: 0.84rem; line-height: 1.5;">
                                        Standard entry-level opportunities across IT, Core Engineering, Management, and Pharma domains.
                                    </p>
                                    <span class="badge bg-light text-dark border">Single Job Freeze</span>
                                </div>
                            </div>

                            <!-- Dream Tier -->
                            <div class="col-12 col-md-4">
                                <div class="tier-box tier-dream">
                                    <span class="tier-badge dream">Tier 2: Dream Offer</span>
                                    <div class="tier-package" style="color: var(--rku-red, #ef3724);">&#8377;4.5 - &#8377;8.0 LPA</div>
                                    <p class="text-muted mb-2" style="font-size: 0.84rem; line-height: 1.5;">
                                        Tier-1 MNCs and product innovators offering elevated career pathways and compensation.
                                    </p>
                                    <span class="badge bg-danger-subtle text-danger border border-danger-subtle">1.5x Upgrade Allowed</span>
                                </div>
                            </div>

                            <!-- Super Dream Tier -->
                            <div class="col-12 col-md-4">
                                <div class="tier-box">
                                    <span class="tier-badge super">Tier 3: Super Dream</span>
                                    <div class="tier-package" style="color: var(--rku-maroon, #a30f14);">&#8377;8.0+ LPA</div>
                                    <p class="text-muted mb-2" style="font-size: 0.84rem; line-height: 1.5;">
                                        Elite tech giants, multinational consulting corporations, and research accelerators.
                                    </p>
                                    <span class="badge bg-success-subtle text-success border border-success-subtle">Open to All Placed</span>
                                </div>
                            </div>
                        </div>

                        <p class="text-muted mb-0" style="font-size: 0.86rem; line-height: 1.5;">
                            * <strong>Dream Upgrade Condition:</strong> A pre-placed student in Tier 1 is eligible to participate in a Dream Company drive only if the offering CTC is at least <strong>1.5 times higher</strong> than their current confirmed offer.
                        </p>
                    </div>

                    <!-- Section 3: Eligibility & Student Registration Rules -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-4">
                        <h2 class="page-content-title">ELIGIBILITY &amp; <span>ATTENDANCE RULES</span></h2>
                        
                        <div class="row g-3">
                            <div class="col-12 col-sm-6">
                                <div class="policy-rule-card">
                                    <div class="policy-card-icon">
                                        <i class="fa-solid fa-graduation-cap"></i>
                                    </div>
                                    <h4 class="policy-card-title">Academic Criteria</h4>
                                    <p class="policy-card-text">
                                        Minimum 6.0 CGPA / 60% aggregate without any live/active backlog at the time of drive. Dead backlogs must be fully cleared.
                                    </p>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6">
                                <div class="policy-rule-card">
                                    <div class="policy-card-icon">
                                        <i class="fa-solid fa-user-check"></i>
                                    </div>
                                    <h4 class="policy-card-title">75% T&amp;P Attendance</h4>
                                    <p class="policy-card-text">
                                        Mandatory 75% attendance in pre-placement training, aptitude classes, technical bootcamps, and mock interviews organized by the T&amp;P Cell.
                                    </p>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6">
                                <div class="policy-rule-card">
                                    <div class="policy-card-icon">
                                        <i class="fa-solid fa-file-invoice"></i>
                                    </div>
                                    <h4 class="policy-card-title">Profile &amp; Resume Verification</h4>
                                    <p class="policy-card-text">
                                        100% verified profile data on the RKU Placement Portal with university approved standard resume format and genuine academic records.
                                    </p>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6">
                                <div class="policy-rule-card">
                                    <div class="policy-card-icon">
                                        <i class="fa-solid fa-user-slash"></i>
                                    </div>
                                    <h4 class="policy-card-title">Strict "No-Show" Penalty</h4>
                                    <p class="policy-card-text">
                                        Applying for a drive and remaining absent without approved medical intimation leads to a suspension from the next <strong>2 consecutive drives</strong>.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Section 4: Code of Conduct & Interview Ethics -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-4">
                        <h2 class="page-content-title">CODE OF CONDUCT &amp; <span>INTERVIEW ETHICS</span></h2>
                        
                        <ul class="objectives-list">
                            <li><strong>Formal Dress Code:</strong> All candidates must attend Pre-Placement Talks (PPT), online tests, Group Discussions, and Personal Interviews in formal attire (RKU Blazer / Smart Formals with RKU ID Card).</li>
                            <li><strong>Punctuality:</strong> Candidates must report to the venue or login to virtual drive links at least 20 minutes before the scheduled time.</li>
                            <li><strong>Zero Malpractice Tolerance:</strong> Cheating during aptitude tests, submitting fabricated certificates, or impersonation will lead to permanent debarment from placement services and strict disciplinary action.</li>
                            <li><strong>Direct HR Communication:</strong> Students are strictly prohibited from contacting company HRs or executives directly on LinkedIn/WhatsApp without written consent from the TPO.</li>
                            <li><strong>Offer Acceptance Timeline:</strong> Placed students must submit their formal acceptance or rejection on the portal within <strong>3 working days</strong> of offer declaration.</li>
                        </ul>
                    </div>

                    <!-- Section 5: Frequently Asked Questions (Accordion) -->
                    <div class="bg-white p-4 rounded-3 border border-1 border-light-subtle shadow-sm mb-4">
                        <h2 class="page-content-title">FREQUENTLY ASKED <span>QUESTIONS (FAQs)</span></h2>

                        <!-- FAQ 1 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="togglePolicyAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2" id="icon-1"></i> Q1. Can I participate in campus drives if I have a pending backlog?</h5>
                                <i class="fa-solid fa-chevron-down custom-accordion-icon"></i>
                            </div>
                            <div class="custom-accordion-content">
                                Most visiting corporate recruiters require zero live backlogs at the time of the recruitment process. However, if any specific company allows students with active backlogs, it will be clearly mentioned in the drive circular. All backlogs must be cleared prior to graduation.
                            </div>
                        </div>

                        <!-- FAQ 2 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="togglePolicyAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2" id="icon-2"></i> Q2. If I receive a job offer, can I still sit for a Dream Company drive?</h5>
                                <i class="fa-solid fa-chevron-down custom-accordion-icon"></i>
                            </div>
                            <div class="custom-accordion-content">
                                Yes. As per the RKU Placement Policy, if a pre-placed student gets an opportunity with a company offering at least 1.5 times their current package (and falling within the Tier-2 Dream or Tier-3 Super Dream category), they are permitted to register.
                            </div>
                        </div>

                        <!-- FAQ 3 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="togglePolicyAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2" id="icon-3"></i> Q3. What happens if I miss a drive after registering?</h5>
                                <i class="fa-solid fa-chevron-down custom-accordion-icon"></i>
                            </div>
                            <div class="custom-accordion-content">
                                Unexcused absence from any registered placement drive is classified as a "No-Show" and results in immediate debarment from the next 2 consecutive campus drives. In case of a medical emergency, written proof must be submitted to the TPO at least 12 hours before the drive starts.
                            </div>
                        </div>

                        <!-- FAQ 4 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="togglePolicyAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2" id="icon-4"></i> Q4. How soon do I have to confirm my offer on the portal?</h5>
                                <i class="fa-solid fa-chevron-down custom-accordion-icon"></i>
                            </div>
                            <div class="custom-accordion-content">
                                Students must formally Accept or Reject their offer letters within 3 working days of notification through their Student Dashboard. Failure to respond within this window will be treated as an automatic acceptance.
                            </div>
                        </div>

                        <!-- FAQ 5 -->
                        <div class="custom-accordion-item">
                            <div class="custom-accordion-header" onclick="togglePolicyAccordion(this)">
                                <h5><i class="fa-solid fa-plus me-2" id="icon-5"></i> Q5. Is attendance in Pre-Placement Training mandatory?</h5>
                                <i class="fa-solid fa-chevron-down custom-accordion-icon"></i>
                            </div>
                            <div class="custom-accordion-content">
                                Yes. A minimum of 75% attendance in T&amp;P training modules, aptitude sessions, and technical brush-up workshops is mandatory to maintain portal activation and drive registration privileges.
                            </div>
                        </div>
                    </div>

                    <!-- Bottom CTA Banner -->
                    <div class="p-4 rounded-3 text-white d-flex flex-column flex-md-row justify-content-between align-items-center gap-3" style="background: linear-gradient(135deg, var(--rku-maroon, #a30f14) 0%, var(--rku-red, #ef3724) 100%);">
                        <div>
                            <h5 class="fw-bold mb-1" style="font-family: var(--font-heading, 'Outfit', sans-serif);">Need Further Clarifications?</h5>
                            <p class="mb-0 text-white-50" style="font-size: 0.88rem;">Contact the Training &amp; Placement Cell at RK University Main Campus.</p>
                        </div>
                        <a href="Contact.aspx" class="btn btn-light text-dark fw-bold px-4 py-2" style="white-space: nowrap;">
                            <i class="fa-solid fa-location-dot text-danger me-1"></i> Contact TPO Office
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <!-- Custom Accordion Script -->
    <script>
        function togglePolicyAccordion(headerElement) {
            const content = headerElement.nextElementSibling;
            const icon = headerElement.querySelector('.custom-accordion-icon');
            const iconHeader = headerElement.querySelector('h5 i');
            const isActive = headerElement.classList.contains('active');

            // Close all items
            const allHeaders = document.querySelectorAll('.custom-accordion-header');
            const allContents = document.querySelectorAll('.custom-accordion-content');

            allHeaders.forEach(h => {
                h.classList.remove('active');
                const hIcon = h.querySelector('.custom-accordion-icon');
                const hIconHeader = h.querySelector('h5 i');
                if (hIcon) hIcon.className = 'fa-solid fa-chevron-down custom-accordion-icon';
                if (hIconHeader) hIconHeader.className = 'fa-solid fa-plus me-2';
            });

            allContents.forEach(c => {
                c.style.display = 'none';
            });

            // Toggle clicked item
            if (!isActive) {
                headerElement.classList.add('active');
                content.style.display = 'block';
                icon.className = 'fa-solid fa-chevron-up custom-accordion-icon';
                iconHeader.className = 'fa-solid fa-minus me-2';
            }
        }
    </script>
    </body>
    </html>
</asp:Content>
