<%@ Page Title="Company Profile | RK University Placement Portal" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .company-profile-page {
            background-color: #ffffff;
            min-height: 85vh;
            padding: 2rem 0 5rem;
        }

        /* ── Breadcrumb Bar ── */
        .breadcrumb-container {
            padding: 0.5rem 0 2rem;
        }

        .btn-back-companies {
            border: 1.5px solid #0c1c30;
            border-radius: 30px;
            font-weight: 700;
            color: #0c1c30;
            font-size: 0.8rem;
            padding: 0.45rem 1.4rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
            background: transparent;
        }

        .btn-back-companies:hover {
            background: #0c1c30;
            color: #ffffff;
            transform: translateX(-3px);
        }

        /* ── Left Kicker Text ── */
        .side-kicker-col {
            letter-spacing: 2.5px;
            font-size: 0.72rem;
            font-weight: 800;
            color: #94a3b8;
            text-transform: uppercase;
            line-height: 2.1;
        }

        .side-kicker-line {
            width: 36px;
            height: 3px;
            background-color: #c5221f;
            margin-top: 8px;
            border-radius: 2px;
        }

        /* ── Center Circular Logo ── */
        .company-circle-wrapper {
            width: 290px;
            height: 290px;
            max-width: 100%;
            border-radius: 50%;
            overflow: hidden;
            background: #ffffff;
            box-shadow: 0 4px 24px rgba(12, 28, 48, 0.06);
            border: 1.5px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            padding: 2.2rem;
            position: relative;
        }

        .company-circle-img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            transition: transform 0.4s ease;
        }

        .company-circle-wrapper:hover .company-circle-img {
            transform: scale(1.05);
        }

        /* ── Right Content ── */
        .company-info-column {
            border-left: 1px solid #edf2f7;
            padding-left: 2.8rem;
        }

        .company-badge-capsule {
            border-radius: 30px;
            padding: 0.4rem 1rem;
            font-size: 0.74rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .badge-reg-partner {
            background-color: #c5221f;
            color: #ffffff;
        }

        .badge-industry {
            background-color: #0c1c30;
            color: #ffffff;
        }

        .badge-location {
            background-color: #ffffff;
            color: #0c1c30;
            border: 1px solid #cbd5e1;
        }

        .company-heading-title {
            font-family: 'Outfit', sans-serif;
            font-size: 2.6rem;
            font-weight: 900;
            color: #0c1c30;
            letter-spacing: -0.5px;
            margin-bottom: 0.4rem;
        }

        .company-tagline-text {
            color: #c5221f;
            font-size: 1.15rem;
            font-weight: 700;
            margin-bottom: 1.25rem;
        }

        .company-desc-text {
            color: #4b5563;
            font-size: 0.95rem;
            line-height: 1.75;
            margin-bottom: 2rem;
        }

        .btn-learn-more {
            background-color: #0c1c30;
            color: #ffffff !important;
            padding: 0.75rem 2.2rem;
            border-radius: 30px;
            font-weight: 800;
            font-size: 0.8rem;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 14px rgba(12, 28, 48, 0.2);
            border: 2px solid #0c1c30;
        }

        .btn-learn-more:hover {
            background-color: #c5221f;
            border-color: #c5221f;
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(197, 34, 31, 0.3);
            color: #ffffff !important;
        }

        .btn-apply-job {
            background-color: #c5221f;
            color: #ffffff !important;
            padding: 0.75rem 2.2rem;
            border-radius: 30px;
            font-weight: 800;
            font-size: 0.8rem;
            letter-spacing: 1px;
            text-transform: uppercase;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            margin-left: 0.85rem;
            border: 2px solid #c5221f;
            box-shadow: 0 4px 14px rgba(197, 34, 31, 0.25);
        }

        .btn-apply-job:hover {
            background-color: #0c1c30;
            border-color: #0c1c30;
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(12, 28, 48, 0.3);
            color: #ffffff !important;
        }

        /* ── Bottom Slanted 3-Cards Strip ── */
        .slanted-cards-wrapper {
            display: flex;
            width: 100%;
            margin-top: 4rem;
            position: relative;
            box-shadow: 0 12px 36px rgba(0, 0, 0, 0.08);
            border-radius: 6px;
            overflow: hidden;
        }

        .scard {
            min-height: 280px;
            display: flex;
            flex-direction: column;
            padding: 2.6rem 2.4rem;
            position: relative;
        }

        .card-num-line {
            display: flex;
            align-items: center;
            gap: 8px;
            font-family: 'Outfit', sans-serif;
            font-size: 2.2rem;
            font-weight: 900;
            line-height: 1;
        }

        .card-dash {
            font-size: 1.8rem;
            font-weight: 400;
            letter-spacing: -2px;
            opacity: 0.8;
        }

        .scard-title {
            font-size: 1.25rem;
            font-weight: 800;
            margin-bottom: 0.75rem;
        }

        .scard-desc {
            font-size: 0.88rem;
            line-height: 1.65;
            margin-bottom: 1.5rem;
        }

        /* Card 01 - Red with RKU Campus Watermark */
        .scard-1 {
            background: linear-gradient(135deg, rgba(185, 28, 28, 0.92), rgba(197, 34, 31, 0.94)), url('assets/images/1000579953.jpg') center/cover no-repeat;
            color: #ffffff;
        }

        .scard-1 .card-num-line {
            color: #ffffff;
        }

        /* Card 02 - Pure White */
        .scard-2 {
            background-color: #ffffff;
            color: #0c1c30;
        }

        .scard-2 .card-num-line {
            color: #c5221f;
        }

        .scard-2 .scard-title {
            color: #0c1c30;
        }

        .scard-2 .scard-desc {
            color: #4b5563;
        }

        /* Card 03 - Dark Navy with RKU Campus Watermark */
        .scard-3 {
            background: linear-gradient(135deg, rgba(12, 28, 48, 0.93), rgba(8, 20, 36, 0.96)), url('assets/images/1000579960.jpg') center/cover no-repeat;
            color: #ffffff;
        }

        .scard-3 .card-num-line {
            color: #c5221f;
        }

        @media (min-width: 992px) {
            .scard-1 {
                flex: 1 1 35%;
                padding-right: 4.2rem;
                clip-path: polygon(0 0, 100% 0, 88% 100%, 0 100%);
                z-index: 1;
            }
            .scard-2 {
                flex: 1 1 36%;
                margin-left: -4.5%;
                margin-right: -4.5%;
                padding-left: 4.2rem;
                padding-right: 4.2rem;
                clip-path: polygon(12% 0, 100% 0, 88% 100%, 0% 100%);
                z-index: 2;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
            }
            .scard-3 {
                flex: 1 1 35%;
                padding-left: 4.2rem;
                clip-path: polygon(12% 0, 100% 0, 100% 100%, 0% 100%);
                z-index: 1;
            }
        }

        @media (max-width: 991px) {
            .company-info-column {
                border-left: none;
                padding-left: 0;
                margin-top: 2rem;
            }
            .slanted-cards-wrapper {
                flex-direction: column;
                gap: 1.25rem;
                box-shadow: none;
            }
            .scard {
                border-radius: 8px;
                clip-path: none !important;
                margin: 0 !important;
                box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            }
            .company-heading-title {
                font-size: 2.1rem;
            }
            .btn-apply-job {
                margin-left: 0;
                margin-top: 0.75rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- ==========================================
         EXACT HEADER (TOPBAR & NAVBAR) FROM INDEX.ASPX
         ========================================== -->
    <div class="rku-header-topbar d-none d-lg-block" style="background: #ffffff; border-bottom: 1px solid #edf2f7; font-size: 0.84rem; color: #334155; position: sticky; top: 0; z-index: 1035;">
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
            <a class="navbar-brand d-flex align-items-center" href="Index.aspx" id="navbarBrandLink">
                <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;">
            </a>&nbsp;<!-- Mobile Toggle -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation" id="navbarToggleButton">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links -->
            <div class="collapse navbar-collapse" id="mainNavbar">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="Index.aspx" id="navHome">Home</a> </li>
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
                    <li class="nav-item"><a class="nav-link active" href="Companies.aspx" id="navCompanies">Companies</a> </li>
                    <li class="nav-item"><a class="nav-link" href="SuccessStories.aspx" id="navStories">Success Stories</a> </li>
                    <li class="nav-item"><a class="nav-link" href="Contact.aspx" id="navContact">Contact</a> </li>
                </ul>

                <!-- User Actions -->
                <div class="navbar-actions d-flex align-items-center">
                    <a href="#" class="icon-btn" title="Search" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></a>
                    <a href="#" class="icon-btn position-relative" title="Notifications" id="btnNotifications"><i class="fa-regular fa-bell"></i><span class="position-absolute top-0 start-100 translate-middle p-1 bg-rku-red border border-light rounded-circle"></span></a>
                    <a href="Login.aspx" class="btn btn-login" id="btnLogin">Login</a>
                    <a href="Register.aspx" class="btn btn-register" id="btnRegister">Register</a>
                </div>
            </div>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ==========================================
         CONTENT: RENDERED VIA ASP.NET DATALIST
         ========================================== -->
    <div class="company-profile-page">
        <div class="container px-lg-5">
            
            <asp:DataList ID="DataList1" runat="server" Width="100%">
                <ItemTemplate>
                    
                    <!-- Breadcrumb Navigation Bar (Left: Breadcrumb, Right: Back Button) -->
                    <div class="breadcrumb-container d-flex justify-content-between align-items-center flex-wrap gap-2">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0" style="font-size: 0.9rem;">
                                <li class="breadcrumb-item"><a href="Index.aspx" class="text-decoration-none text-dark fw-semibold">Home</a></li>
                                <li class="breadcrumb-item"><a href="Companies.aspx" class="text-decoration-none text-dark fw-semibold">Companies</a></li>
                                <li class="breadcrumb-item active text-danger fw-bold" id="bcCompName" aria-current="page"><%# Eval("compName") %></li>
                            </ol>
                        </nav>
                        <a href="Companies.aspx" class="btn-back-companies">
                            <i class="fa-solid fa-arrow-left me-2"></i> Back to Companies
                        </a>
                    </div>

                    <!-- Top Section Container -->
                    <div class="row align-items-center g-4 g-xl-5">
                        
                        <!-- Left: Side Vertical Kicker Text + Circular Logo Frame -->
                        <div class="col-lg-5">
                            <div class="d-flex align-items-center justify-content-center">
                                
                                <!-- Vertical Kicker Text -->
                                <div class="side-kicker-col d-none d-xl-flex flex-column justify-content-center me-3 pe-2">
                                    <span>INNOVATION</span>
                                    <span>TECHNOLOGY</span>
                                    <span>PARTNERSHIP</span>
                                    <div class="side-kicker-line"></div>
                                </div>

                                <!-- Circular Logo Frame -->
                                <div class="company-circle-wrapper">
                                    <img id="compDetailImg" class="company-circle-img" 
                                         src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("compLogo"))) ? "assets/ProfilePhotos/Innovative Solutions by WEBPRO.jpeg" : (Convert.ToString(Eval("compLogo")).StartsWith("data:") ? Convert.ToString(Eval("compLogo")) : (Convert.ToString(Eval("compLogo")).Contains("/") ? Convert.ToString(Eval("compLogo")) : "CompanyUploads/" + Eval("compLogo"))) %>' 
                                         alt='<%# Eval("compName") %>' 
                                         onerror="this.src='assets/ProfilePhotos/Innovative Solutions by WEBPRO.jpeg';" />
                                </div>

                            </div>
                        </div>

                        <!-- Right: About Our Company Details -->
                        <div class="col-lg-7">
                            <div class="company-info-column">
                                
                                <!-- Badges Row -->
                                <div class="d-flex align-items-center gap-2 mb-3 flex-wrap">
                                    <span class="company-badge-capsule badge-reg-partner">
                                        <i class="fa-solid fa-shield-halved"></i> Registered Partner
                                    </span>
                                    <span class="company-badge-capsule badge-industry" id="compBadgeIndustry">
                                        <i class="fa-solid fa-code"></i> <%# string.IsNullOrEmpty(Convert.ToString(Eval("compIndustry"))) ? "IT / Software" : Eval("compIndustry") %>
                                    </span>
                                    <span class="company-badge-capsule badge-location" id="compBadgeLocation">
                                        <i class="fa-solid fa-location-dot text-danger"></i> <%# string.IsNullOrEmpty(Convert.ToString(Eval("compLocation"))) ? "Mumbai, India" : Eval("compLocation") %>
                                    </span>
                                </div>

                                <!-- Main Heading & Tagline -->
                                <h1 class="company-heading-title" id="compDetailName">About Our Company</h1>
                                <p class="company-tagline-text" id="compDetailTagline"><%# string.IsNullOrEmpty(Convert.ToString(Eval("compTagline"))) ? "Innovating the Future, Empowering Growth." : Eval("compTagline") %></p>
                                
                                <!-- Description -->
                                <div class="company-desc-text" id="compDetailDesc">
                                    <%# string.IsNullOrEmpty(Convert.ToString(Eval("compDescription"))) ? "We are a dynamic IT solutions provider dedicated to delivering cutting-edge software development, cloud computing, and digital transformation services. We build scalable, high-performance tech solutions that help businesses thrive in the modern digital economy." : Eval("compDescription") %>
                                </div>

                                <!-- Action Buttons -->
                                <div class="d-flex align-items-center flex-wrap">
                                    <a id="compDetailWebsite" href='<%# string.IsNullOrEmpty(Convert.ToString(Eval("compWebsite"))) ? "#" : Eval("compWebsite") %>' target="_blank" class="btn-learn-more">
                                        LEARN MORE <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                    <a href="Login.aspx" class="btn-apply-job">
                                        APPLY FOR DRIVES <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                </div>

                            </div>
                        </div>

                    </div>

                    <!-- Bottom Slanted 3-Cards Strip (01: Red, 02: White, 03: Dark Navy) -->
                    <div class="slanted-cards-wrapper">
                        
                        <!-- Card 01: Red with RKU Campus Watermark -->
                        <div class="scard scard-1">
                            <div class="card-num-line mb-2">
                                <span>01</span> <span class="card-dash">&mdash;&mdash;</span>
                            </div>
                            <h4 class="scard-title text-white">Package & Opportunities</h4>
                            <p class="scard-desc text-white" style="opacity: 0.9;">
                                Offers competitive compensation packages and comprehensive career growth pathways for graduating students.
                            </p>
                            <div class="row pt-2 mt-auto" style="border-top: 1px solid rgba(255,255,255,0.25);">
                                <div class="col-6">
                                    <span class="small d-block text-white" style="font-size: 0.75rem; opacity: 0.8;">Package Range:</span>
                                    <strong class="text-white fs-6" id="box1Pkg"><%# string.IsNullOrEmpty(Convert.ToString(Eval("compPackageRange"))) ? "4.0 LPA - 10.0 LPA" : Eval("compPackageRange") %></strong>
                                </div>
                                <div class="col-6">
                                    <span class="small d-block text-white" style="font-size: 0.75rem; opacity: 0.8;">Hiring For:</span>
                                    <strong class="text-white fs-6" id="box1Hiring">Various Roles</strong>
                                </div>
                            </div>
                        </div>

                        <!-- Card 02: Pure White -->
                        <div class="scard scard-2">
                            <div class="card-num-line mb-2">
                                <span>02</span> <span class="card-dash">&mdash;&mdash;</span>
                            </div>
                            <h4 class="scard-title">Key Skills & Technologies</h4>
                            <p class="scard-desc" id="box2Tags">
                                <%# string.IsNullOrEmpty(Convert.ToString(Eval("compTags"))) ? "Full Stack Development, Java, Python, React, SQL, DevOps, Cloud Computing" : Eval("compTags") %>
                            </p>
                            <div class="pt-2 mt-auto" style="border-top: 1px solid #e2e8f0;">
                                <div class="d-flex align-items-center" style="font-size: 0.82rem; color: #334155; font-weight: 600;">
                                    <i class="fa-solid fa-check text-danger me-2" style="font-size: 0.95rem;"></i> Open to B.Tech, BCA, MCA &amp; Allied disciplines.
                                </div>
                            </div>
                        </div>

                        <!-- Card 03: Dark Navy with RKU Campus Watermark -->
                        <div class="scard scard-3">
                            <div class="card-num-line mb-2">
                                <span>03</span> <span class="card-dash">&mdash;&mdash;</span>
                            </div>
                            <h4 class="scard-title text-white">Campus Drive & Culture</h4>
                            <p class="scard-desc text-white" style="opacity: 0.9;">
                                Multi-stage campus selection process comprising online aptitude evaluation, technical interviews, and HR discussion rounds.
                            </p>
                            <div class="pt-2 mt-auto" style="border-top: 1px solid rgba(255,255,255,0.25);">
                                <div class="d-flex align-items-center justify-content-between">
                                    <span class="small text-white" style="font-size: 0.8rem; opacity: 0.8;">Placement Venue:</span>
                                    <strong class="text-white" style="font-size: 0.88rem;">RKU Campus, Rajkot</strong>
                                </div>
                            </div>
                        </div>

                    </div>

                </ItemTemplate>
            </asp:DataList>

        </div>
    </div>

    <!-- Client-Side Hydration Script for PortalDB & URL Parameters (Fallback if mock id) -->
    <script>
        (function () {
            const urlParams = new URLSearchParams(window.location.search);
            const compId = urlParams.get('id') || urlParams.get('name');
            if (!compId || typeof PortalDB === 'undefined' || !PortalDB.getCompanies) return;

            const companies = PortalDB.getCompanies();
            const found = companies.find(c => c.id === compId || (c.name && c.name.toLowerCase() === compId.toLowerCase()));
            if (!found) return;

            if (found.name) {
                document.title = found.name + " - Profile | RK University Placement Portal";
                const bc = document.getElementById('bcCompName');
                if (bc) bc.textContent = found.name;
            }

            const nameEl = document.getElementById('compDetailName');
            if (nameEl) nameEl.textContent = "About " + found.name;

            const taglineEl = document.getElementById('compDetailTagline');
            if (taglineEl && found.tagline) taglineEl.textContent = found.tagline;

            const descEl = document.getElementById('compDetailDesc');
            if (descEl && found.description) descEl.textContent = found.description;

            const imgEl = document.getElementById('compDetailImg');
            if (imgEl && found.logoBase64) {
                imgEl.src = found.logoBase64;
                imgEl.style.objectFit = 'contain';
            }

            const websiteEl = document.getElementById('compDetailWebsite');
            if (websiteEl && found.website) {
                websiteEl.href = found.website;
            }

            const bIndustry = document.getElementById('compBadgeIndustry');
            if (bIndustry && found.industry) {
                bIndustry.innerHTML = `<i class="fa-solid fa-code me-1"></i> ${(found.industry || '').toUpperCase()}`;
            }

            const bLoc = document.getElementById('compBadgeLocation');
            if (bLoc && found.location) {
                bLoc.innerHTML = `<i class="fa-solid fa-location-dot text-danger me-1"></i> ${found.location}`;
            }

            const box1Pkg = document.getElementById('box1Pkg');
            if (box1Pkg && found.packageRange) box1Pkg.textContent = found.packageRange;

            const box2Tags = document.getElementById('box2Tags');
            if (box2Tags && found.tags) {
                box2Tags.textContent = Array.isArray(found.tags) ? found.tags.join(', ') : found.tags;
            }
        })();
    </script>
</asp:Content>
