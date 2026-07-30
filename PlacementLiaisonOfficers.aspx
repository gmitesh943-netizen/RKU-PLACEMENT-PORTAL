<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="PlacementLiaisonOfficers.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.PlacementLiaisonOfficers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liaison Officers | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="Meet the Training & Placement Liaison Officers at RK University. Contact university central placement cell team members.">
        <meta name="keywords" content="RK University, Liaison Officers, TPO Team, Placement Officer, Vishal Doshi, Bhargav Pandya">
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

            /* Section Subtitle */
            .liaison-subtitle {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 1.35rem;
                color: #0f1d3a;
                text-align: center;
                margin-bottom: 2.5rem;
                position: relative;
                padding-bottom: 0.75rem;
            }

                .liaison-subtitle::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 80px;
                    height: 3.5px;
                    background-color: var(--rku-red);
                }

            /* Liaison Officer Card Styling */
            .liaison-card {
                background-color: #fff;
                border: 1px solid #eef0f3;
                border-radius: 12px;
                padding: 1.8rem 1.5rem;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
                transition: all 0.25s ease;
                position: relative;
                height: 100%;
            }

                .liaison-card:hover {
                    transform: translateY(-4px);
                    box-shadow: 0 10px 25px rgba(163, 15, 20, 0.08);
                    border-color: rgba(239, 55, 36, 0.15);
                }

            .liaison-number-badge {
                width: 46px;
                height: 46px;
                border-radius: 50%;
                background-color: #fff5f5;
                color: var(--rku-red);
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.15rem;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
            }

            .liaison-officer-name {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.1rem;
                color: var(--rku-dark);
                margin-bottom: 0.35rem;
            }

            .liaison-officer-email {
                font-size: 0.88rem;
                color: var(--rku-red);
                text-decoration: none;
                display: inline-block;
                margin-bottom: 0.25rem;
                font-weight: 600;
            }

                .liaison-officer-email:hover {
                    color: var(--rku-maroon);
                    text-decoration: underline;
                }

            .liaison-officer-phone {
                font-size: 0.85rem;
                color: #555;
                font-weight: 500;
                margin-bottom: 1.2rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #f1f3f5;
            }

            .liaison-officer-desg {
                font-size: 0.82rem;
                color: #6c757d;
                font-weight: 600;
                margin-bottom: 0;
                text-transform: uppercase;
                letter-spacing: 0.3px;
            }

            /* Floating red circular chat bubble icon matching bottom right of screenshot */
            .chat-floating-bubble {
                position: fixed;
                bottom: 30px;
                right: 30px;
                width: 55px;
                height: 55px;
                border-radius: 50%;
                background-color: var(--rku-red);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                box-shadow: 0 4px 15px rgba(239, 55, 36, 0.3);
                cursor: pointer;
                z-index: 1000;
                transition: all 0.25s ease;
            }

                .chat-floating-bubble:hover {
                    transform: scale(1.1);
                    background-color: var(--rku-maroon);
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
                                <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                                <li><a class="dropdown-item active" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
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
    <section class="about-hero" style="background-image: url('assets/images/LIsion officer.jpeg');" id="aboutHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="aboutBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="#">Placement</a>
                        <span>/</span>
                        <a href="PlacementLiaisonOfficers.aspx" class="active">Liaison Officers</a>
                    </div>

                    <h1 class="hero-title" id="aboutHeroTitle">Liaison Officers</h1>
                    <p class="hero-subtitle mb-0" id="aboutHeroSubtitle">Home › Placement › Liaison Officers</p>
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
                            <li class="placement-sidebar-item active">
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

                    <!-- Content Title -->
                    <h2 class="page-content-title">LIAISON OFFICERS</h2>

                    <!-- Centered Subtitle -->
                    <h3 class="liaison-subtitle">University Central Team</h3>

                    <!-- Liaison Grid -->
                    <div class="row g-4 mt-2">

                        <!-- Officer 01 -->
                        <div class="col-md-6">
                            <div class="liaison-card d-flex align-items-start gap-4">
                                <div class="liaison-number-badge">01</div>
                                <div>
                                    <h4 class="liaison-officer-name">Dr. Vishal Doshi</h4>
                                    <a href="mailto:vishal.doshi@rku.ac.in" class="liaison-officer-email">vishal.doshi@rku.ac.in</a>
                                    <p class="liaison-officer-phone">+91 9428894700 | +91 7567413131</p>
                                    <p class="liaison-officer-desg">Associate Professor, Head TPO</p>
                                </div>
                            </div>
                        </div>

                        <!-- Officer 02 -->
                        <div class="col-md-6">
                            <div class="liaison-card d-flex align-items-start gap-4">
                                <div class="liaison-number-badge">02</div>
                                <div>
                                    <h4 class="liaison-officer-name">Prof. Bhargav Pandya</h4>
                                    <a href="mailto:bhargav.pandya@rku.ac.in" class="liaison-officer-email">bhargav.pandya@rku.ac.in</a>
                                    <p class="liaison-officer-phone">+91 7874216161</p>
                                    <p class="liaison-officer-desg">Assistant Professor - Training &amp; Placement Officer</p>
                                </div>
                            </div>
                        </div>

                        <!-- Officer 03 -->
                        <div class="col-md-6">
                            <div class="liaison-card d-flex align-items-start gap-4">
                                <div class="liaison-number-badge">03</div>
                                <div>
                                    <h4 class="liaison-officer-name">Prof. Osho Shah</h4>
                                    <a href="mailto:osho.shah@rku.ac.in" class="liaison-officer-email">osho.shah@rku.ac.in</a>
                                    <p class="liaison-officer-phone">+91 9409274800</p>
                                    <p class="liaison-officer-desg">Assistant Professor - Training &amp; Placement Officer</p>
                                </div>
                            </div>
                        </div>

                        <!-- Officer 04 -->
                        <div class="col-md-6">
                            <div class="liaison-card d-flex align-items-start gap-4">
                                <div class="liaison-number-badge">04</div>
                                <div>
                                    <h4 class="liaison-officer-name">Prof. Khushbu Rangpara</h4>
                                    <a href="mailto:khushbu.rangpara@rku.ac.in" class="liaison-officer-email">khushbu.rangpara@rku.ac.in</a>
                                    <p class="liaison-officer-phone">+91 8469513202</p>
                                    <p class="liaison-officer-desg">Assistant Professor - Training &amp; Placement Officer</p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </section>

    <!-- Floating Chat Icon -->
    <div class="chat-floating-bubble">
        <i class="fa-regular fa-comment-dots"></i>
    </div>

</asp:Content>


<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">
  
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
                            <span>RK University, Rajkot - 360020,<br>Gujarat, India</span>
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



