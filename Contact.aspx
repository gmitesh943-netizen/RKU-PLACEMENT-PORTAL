<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us | RK University Placement Portal</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="Contact RK University Placement Cell. Reach out to us for placement queries, internship information, and career guidance. We are here to help you!">
        <meta name="keywords" content="RK University Contact, Placement Cell Contact, RK University Rajkot, TPO Contact, Placement Office">
        <meta name="author" content="RK University">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            /* ===== Contact Page Specific Styles ===== */

            /* Hero */
            .contact-hero {
                position: relative;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                padding: 8rem 0 7rem 0;
                color: #fff;
                z-index: 1;
            }

                .contact-hero::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(135deg, rgba(17,17,17,0.92) 0%, rgba(17,17,17,0.55) 60%, rgba(17,17,17,0.85) 100%);
                    z-index: -1;
                }

                .contact-hero .hero-title {
                    font-size: 3rem;
                }

            /* Section title with red underline */
            .contact-section-title {
                font-size: 1.5rem;
                font-weight: 800;
                font-family: var(--font-heading);
                color: var(--rku-dark);
                position: relative;
                margin-bottom: 1.8rem;
                padding-bottom: 0.6rem;
            }

                .contact-section-title::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 50px;
                    height: 3px;
                    background-color: var(--rku-red);
                }

            /* Contact Info Cards */
            .contact-info-card {
                background-color: #fff;
                border-radius: 12px;
                border: 1px solid #eef0f3;
                box-shadow: 0 4px 20px rgba(0,0,0,0.04);
                padding: 1.25rem 1.5rem;
                display: flex;
                align-items: flex-start;
                gap: 1rem;
                margin-bottom: 1rem;
                transition: var(--rku-transition);
            }

                .contact-info-card:hover {
                    box-shadow: 0 8px 30px rgba(163,15,20,0.08);
                    border-color: rgba(239,55,36,0.15);
                    transform: translateX(4px);
                }

            .contact-icon-box {
                width: 44px;
                height: 44px;
                min-width: 44px;
                border-radius: 50%;
                background-color: #fff5f5;
                border: 1.5px solid rgba(239,55,36,0.15);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1rem;
                color: var(--rku-red);
            }

            .contact-info-label {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.9rem;
                color: var(--rku-dark);
                margin-bottom: 0.25rem;
            }

            .contact-info-text {
                font-size: 0.88rem;
                color: #6c757d;
                margin-bottom: 0;
                line-height: 1.55;
            }

                .contact-info-text a {
                    color: var(--rku-red);
                }

                    .contact-info-text a:hover {
                        color: var(--rku-maroon);
                    }

            /* Contact Form Card */
            .contact-form-card {
                background-color: #fff;
                border-radius: 14px;
                border: 1px solid #eef0f3;
                box-shadow: 0 8px 30px rgba(0,0,0,0.05);
                padding: 2rem;
            }

                .contact-form-card .form-control,
                .contact-form-card .form-select {
                    border: 1.5px solid #e8eaed;
                    border-radius: 8px;
                    padding: 0.6rem 1rem;
                    font-size: 0.9rem;
                    font-family: var(--font-body);
                    color: #495057;
                    background-color: #fcfcfd;
                    transition: var(--rku-transition);
                }

                    .contact-form-card .form-control:focus,
                    .contact-form-card .form-select:focus {
                        border-color: var(--rku-red);
                        box-shadow: 0 0 0 0.2rem rgba(239,55,36,0.1);
                        background-color: #fff;
                    }

                    .contact-form-card .form-control::placeholder {
                        color: #b0b8c4;
                        font-size: 0.88rem;
                    }

                .contact-form-card .input-group-text {
                    background-color: #f8f9fa;
                    border: 1.5px solid #e8eaed;
                    border-right: none;
                    color: #b0b8c4;
                    border-radius: 8px 0 0 8px;
                }

                .contact-form-card .input-group .form-control {
                    border-left: none;
                    border-radius: 0 8px 8px 0;
                }

                .contact-form-card .input-group .form-select {
                    border-left: none;
                    border-radius: 0 8px 8px 0;
                }

            .captcha-box {
                background: #f9f9f9;
                border: 1.5px solid #ddd;
                border-radius: 6px;
                padding: 0.75rem 1rem;
                display: flex;
                align-items: center;
                gap: 0.75rem;
            }

                .captcha-box .form-check-input {
                    width: 20px;
                    height: 20px;
                    border: 2px solid #aaa;
                    cursor: pointer;
                }

                .captcha-box label {
                    font-size: 0.88rem;
                    color: #333;
                    font-weight: 500;
                    cursor: pointer;
                }

            .captcha-brand {
                margin-left: auto;
                text-align: center;
            }

                .captcha-brand img {
                    height: 40px;
                }

            .captcha-brand-text {
                font-size: 0.62rem;
                color: #aaa;
                display: block;
            }

            .btn-send {
                background-color: var(--rku-red);
                color: #fff;
                font-family: var(--font-heading);
                font-weight: 600;
                padding: 0.65rem 1.6rem;
                border-radius: 8px;
                border: none;
                font-size: 0.9rem;
                transition: var(--rku-transition);
                letter-spacing: 0.3px;
            }

                .btn-send:hover {
                    background-color: var(--rku-maroon);
                    color: #fff;
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(239,55,36,0.3);
                }

            .btn-reset {
                background-color: #fff;
                color: #555;
                font-family: var(--font-heading);
                font-weight: 600;
                padding: 0.65rem 1.4rem;
                border-radius: 8px;
                border: 1.5px solid #ddd;
                font-size: 0.9rem;
                transition: var(--rku-transition);
            }

                .btn-reset:hover {
                    background-color: #f8f9fa;
                    color: var(--rku-dark);
                    border-color: #bbb;
                }

            /* Map Section */
            .map-section {
                background-color: var(--rku-bg-light);
                padding: 4rem 0;
            }

            .map-wrapper {
                border-radius: 14px;
                overflow: hidden;
                box-shadow: 0 8px 30px rgba(0,0,0,0.08);
                border: 1px solid #eef0f3;
            }

                .map-wrapper iframe {
                    display: block;
                    width: 100%;
                    height: 340px;
                    border: 0;
                }

            /* Important Contact Details */
            .contact-details-section {
                background-color: #fff;
                padding: 4rem 0;
                border-top: 1px solid #eef0f3;
            }

            .contact-tabs {
                display: flex;
                gap: 0;
                border-bottom: 2px solid #eaeaea;
                margin-bottom: 0;
            }

            .contact-tab-btn {
                font-family: var(--font-heading);
                font-weight: 600;
                font-size: 0.9rem;
                color: #666;
                background: none;
                border: none;
                padding: 0.75rem 1.5rem;
                cursor: pointer;
                border-bottom: 2px solid transparent;
                margin-bottom: -2px;
                transition: var(--rku-transition);
                white-space: nowrap;
            }

                .contact-tab-btn.active {
                    color: var(--rku-red);
                    border-bottom-color: var(--rku-red);
                }

                .contact-tab-btn:hover:not(.active) {
                    color: var(--rku-maroon);
                }

            .contact-tab-panel {
                display: none;
            }

                .contact-tab-panel.active {
                    display: block;
                }

            .contact-table-wrapper {
                border-radius: 10px;
                overflow: hidden;
                border: 1px solid #eef0f3;
                box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            }

            .contact-table-header {
                background-color: var(--rku-red);
                color: #fff;
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.95rem;
                text-align: center;
                padding: 0.8rem 1.5rem;
            }

            .contact-table {
                width: 100%;
                border-collapse: collapse;
                font-size: 0.88rem;
            }

                .contact-table thead th {
                    background-color: #f8f9fa;
                    font-family: var(--font-heading);
                    font-weight: 700;
                    color: var(--rku-dark);
                    padding: 0.85rem 1.25rem;
                    border-bottom: 2px solid #eef0f3;
                    font-size: 0.85rem;
                    text-transform: uppercase;
                    letter-spacing: 0.4px;
                }

                .contact-table tbody td {
                    padding: 0.85rem 1.25rem;
                    border-bottom: 1px solid #f1f3f5;
                    vertical-align: middle;
                    color: #555;
                }

                .contact-table tbody tr:last-child td {
                    border-bottom: none;
                }

                .contact-table tbody tr:hover td {
                    background-color: #fef9f9;
                }

                .contact-table td a {
                    color: var(--rku-red);
                    font-weight: 500;
                }

                    .contact-table td a:hover {
                        color: var(--rku-maroon);
                        text-decoration: underline;
                    }

            /* Immediate Assistance Banner */
            .assistance-banner {
                background: linear-gradient(135deg, var(--rku-red) 0%, var(--rku-maroon) 100%);
                padding: 3rem 0;
                position: relative;
                overflow: hidden;
            }

                .assistance-banner::before {
                    content: '';
                    position: absolute;
                    top: -60%;
                    left: -10%;
                    width: 300px;
                    height: 300px;
                    background: rgba(255,255,255,0.04);
                    border-radius: 50%;
                }

                .assistance-banner::after {
                    content: '';
                    position: absolute;
                    bottom: -80%;
                    right: 5%;
                    width: 400px;
                    height: 400px;
                    background: rgba(255,255,255,0.03);
                    border-radius: 50%;
                }

            .assistance-icon-wrap {
                width: 70px;
                height: 70px;
                border-radius: 50%;
                background-color: rgba(255,255,255,0.15);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2rem;
                color: #fff;
                margin-right: 1.5rem;
                flex-shrink: 0;
            }

            .assistance-action-btn {
                background-color: #fff;
                border-radius: 10px;
                padding: 1rem 1.5rem;
                display: flex;
                align-items: center;
                gap: 1rem;
                transition: var(--rku-transition);
                text-decoration: none;
            }

                .assistance-action-btn:hover {
                    background-color: rgba(255,255,255,0.92);
                    transform: translateY(-3px);
                    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
                }

            .assistance-action-icon {
                width: 44px;
                height: 44px;
                min-width: 44px;
                border-radius: 50%;
                background-color: #fff5f5;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
                color: var(--rku-red);
            }

            .assistance-action-label {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.95rem;
                color: var(--rku-dark);
                margin-bottom: 0.1rem;
            }

            .assistance-action-value {
                font-size: 0.8rem;
                color: #777;
                margin-bottom: 0;
            }

            /* Trust Badges Strip */
            .trust-strip {
                background-color: #fff;
                border-top: 1px solid #eef0f3;
                padding: 1.5rem 0;
            }

            .trust-item {
                display: flex;
                align-items: center;
                gap: 0.9rem;
                padding: 0.5rem 1rem;
            }

            .trust-icon-box {
                width: 44px;
                height: 44px;
                min-width: 44px;
                border-radius: 50%;
                background-color: #fff5f5;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1rem;
                color: var(--rku-red);
            }

            .trust-title {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.9rem;
                color: var(--rku-dark);
                margin-bottom: 0.1rem;
            }

            .trust-subtitle {
                font-size: 0.78rem;
                color: #888;
                margin-bottom: 0;
            }

            /* Nav active state for Contact */
            .nav-link-contact-active {
                color: var(--rku-red) !important;
            }

                .nav-link-contact-active::after {
                    left: 0.9rem !important;
                    width: calc(100% - 1.8rem) !important;
                }

            @media (max-width: 991.98px) {
                .contact-hero .hero-title {
                    font-size: 2.2rem;
                }

                .assistance-action-btn {
                    padding: 0.75rem 1rem;
                }

                .trust-item {
                    padding: 0.5rem 0.5rem;
                }
            }

            @media (max-width: 767.98px) {
                .contact-tab-btn {
                    padding: 0.6rem 0.9rem;
                    font-size: 0.82rem;
                }

                .contact-hero {
                    padding: 6rem 0 5rem 0;
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
                            <a class="nav-link nav-placement-btn dropdown-toggle" href="#" id="navDrives" data-bs-toggle="dropdown" aria-expanded="false">Placement <i class="fa-solid fa-chevron-down placement-caret"></i>
                            </a>
                            <ul class="dropdown-menu nav-placement-dropdown" aria-labelledby="navDrives">
                            <li><a class="dropdown-item" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
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
                            <a class="nav-link nav-link-contact-active active" aria-current="page" href="Contact.aspx" id="navContact">Contact</a>
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

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">


    <!-- ==========================================
         7. FOOTER
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
        // ===== Contact Tabs =====
        document.addEventListener('DOMContentLoaded', function () {
            const tabBtns = document.querySelectorAll('.contact-tab-btn');
            const tabPanels = document.querySelectorAll('.contact-tab-panel');

            tabBtns.forEach(function (btn) {
                btn.addEventListener('click', function () {
                    tabBtns.forEach(function (b) { b.classList.remove('active'); });
                    tabPanels.forEach(function (p) { p.classList.remove('active'); });

                    btn.classList.add('active');
                    var target = btn.getAttribute('data-tab');
                    document.getElementById('panel' + target.charAt(0).toUpperCase() + target.slice(1)).classList.add('active');
                });
            });

            // ===== Contact Form Submit =====
            var form = document.getElementById('contactForm');
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                var captcha = document.getElementById('captchaCheck');
                if (!captcha.checked) {
                    alert('Please verify that you are not a robot.');
                    return;
                }
                // Simulate success feedback
                var btn = document.getElementById('btnSendMessage');
                var originalText = btn.innerHTML;
                btn.innerHTML = '<i class="fa-solid fa-circle-check me-2"></i>Message Sent!';
                btn.style.backgroundColor = '#28a745';
                setTimeout(function () {
                    btn.innerHTML = originalText;
                    btn.style.backgroundColor = '';
                    form.reset();
                }, 3000);
            });
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

    <!-- ==========================================
         2. CONTACT HERO SECTION
         ========================================== -->
    <section class="contact-hero" style="background-image: url('assets/images/contact-form.png');" id="contactHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="contactBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="Contact.aspx" class="active">Contact Us</a>
                    </div>

                    <h1 class="hero-title" id="contactHeroTitle">Contact <span class="text-rku-red">Us</span></h1>
                    <p class="hero-subtitle" id="contactHeroSubtitle" style="font-size: 1.3rem; font-weight: 600; margin-bottom: 0.75rem;">We are here to help you!</p>
                    <p style="color: rgba(255,255,255,0.75); font-size: 0.95rem; max-width: 500px;">
                        Have questions? We're here to help.<br>
                        Reach out to the Placement Cell for any assistance.
                    </p>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         3. CONTACT INFO + FORM SECTION
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light);" id="contactMainSection">
        <div class="container px-lg-5">
            <div class="row g-4 align-items-start">

                <!-- Left: Contact Info Cards -->
                <div class="col-lg-5" id="contactInfoCol">

                    <!-- Main Campus -->
                    <div class="contact-info-card" id="infoCardMainCampus">
                        <div class="contact-icon-box">
                            <i class="fa-solid fa-location-dot"></i>
                        </div>
                        <div>
                            <p class="contact-info-label">Main Campus</p>
                            <p class="contact-info-text">
                                RK University, Bhavnagar Highway,<br>
                                Kasturbadham, Rajkot,<br>
                                Gujarat, India - 360020
                            </p>
                        </div>
                    </div>

                    <!-- City Campus -->
                    <div class="contact-info-card" id="infoCardCityCampus">
                        <div class="contact-icon-box">
                            <i class="fa-solid fa-location-dot"></i>
                        </div>
                        <div>
                            <p class="contact-info-label">City Campus</p>
                            <p class="contact-info-text">
                                New 150ft Ring Road, Mota Mawa,<br>
                                Kalawad Road, Rajkot,<br>
                                Gujarat, India - 360004
                            </p>
                        </div>
                    </div>

                    <!-- Contact Number -->
                    <div class="contact-info-card" id="infoCardPhone">
                        <div class="contact-icon-box">
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div>
                            <p class="contact-info-label">Contact Number</p>
                            <p class="contact-info-text">
                                <a href="tel:+919712489122">+91 97124 89122</a><br>
                                <a href="tel:+919925714450">+91 99257 14450</a>
                            </p>
                        </div>
                    </div>

                    <!-- Email Address -->
                    <div class="contact-info-card" id="infoCardEmail">
                        <div class="contact-icon-box">
                            <i class="fa-solid fa-envelope"></i>
                        </div>
                        <div>
                            <p class="contact-info-label">Email Address</p>
                            <p class="contact-info-text">
                                <a href="mailto:placement@rku.ac.in">placement@rku.ac.in</a>
                            </p>
                        </div>
                    </div>

                    <!-- Office Hours -->
                    <div class="contact-info-card" id="infoCardHours">
                        <div class="contact-icon-box">
                            <i class="fa-regular fa-clock"></i>
                        </div>
                        <div>
                            <p class="contact-info-label">Office Hours</p>
                            <p class="contact-info-text">
                                Monday - Saturday<br>
                                09:00 AM – 06:00 PM
                            </p>
                        </div>
                    </div>

                </div>

                <!-- Right: Contact Form -->
                <div class="col-lg-7" id="contactFormCol">
                    <div class="contact-form-card">
                        <h2 class="contact-section-title" id="contactFormTitle">Send Us a Message</h2>

                        <form id="contactForm" novalidate>
                            <div class="row g-3">

                                <!-- Full Name -->
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa-regular fa-user"></i></span>
                                        <input type="text" class="form-control" id="contactFullName" placeholder="Full Name" required>
                                    </div>
                                </div>

                                <!-- Email -->
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa-regular fa-envelope"></i></span>
                                        <input type="email" class="form-control" id="contactEmailAddr" placeholder="Email Address" required>
                                    </div>
                                </div>

                                <!-- Mobile Number -->
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa-solid fa-mobile-screen-button"></i></span>
                                        <input type="tel" class="form-control" id="contactMobile" placeholder="Mobile Number">
                                    </div>
                                </div>

                                <!-- Department -->
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa-regular fa-building"></i></span>
                                        <select class="form-select" id="contactDepartment">
                                            <option value="" selected disabled>Select Department</option>
                                            <option value="tpo">Central Training &amp; Placement Cell</option>
                                            <option value="admission">Admission Office</option>
                                            <option value="academic">Academic Affairs</option>
                                            <option value="exam">Controller of Examinations</option>
                                            <option value="hr">HR Department</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Subject -->
                                <div class="col-12">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fa-regular fa-file-lines"></i></span>
                                        <input type="text" class="form-control" id="contactSubject" placeholder="Subject">
                                    </div>
                                </div>

                                <!-- Message -->
                                <div class="col-12">
                                    <div class="input-group">
                                        <span class="input-group-text" style="align-items: flex-start; padding-top: 0.65rem;"><i class="fa-regular fa-pen-to-square"></i></span>
                                        <textarea class="form-control" id="contactMessage" placeholder="Message" rows="5" style="resize: vertical;"></textarea>
                                    </div>
                                </div>

                                <!-- Captcha -->
                                <div class="col-12">
                                    <div class="captcha-box">
                                        <div class="form-check mb-0">
                                            <input class="form-check-input" type="checkbox" id="captchaCheck">
                                        </div>
                                        <label for="captchaCheck" class="mb-0">I'm not a robot</label>
                                        <div class="captcha-brand ms-auto text-center">
                                            <!-- reCAPTCHA Logo SVG -->
                                            <svg width="34" height="34" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <circle cx="32" cy="32" r="32" fill="#4A90D9" />
                                                <path d="M32 12C21 12 12 21 12 32s9 20 20 20 20-9 20-20S43 12 32 12z" fill="#fff" opacity=".15" />
                                                <path d="M40 24H24l-6 8 6 8h16l6-8-6-8z" fill="#fff" opacity=".9" />
                                                <circle cx="32" cy="32" r="6" fill="#4A90D9" />
                                            </svg>
                                            <span class="captcha-brand-text">reCAPTCHA<br>
                                                Privacy - Terms</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Buttons -->
                                <div class="col-12 d-flex gap-3 flex-wrap">
                                    <button type="submit" class="btn-send" id="btnSendMessage">
                                        <i class="fa-solid fa-paper-plane me-2"></i>SEND YOUR MESSAGE
                                    </button>
                                    <button type="reset" class="btn-reset" id="btnResetForm">RESET</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         4. MAP SECTION
         ========================================== -->
    <section class="map-section" id="contactMapSection">
        <div class="container px-lg-5">
            <div class="row g-5 align-items-start">

                <!-- Map -->
                <div class="col-lg-6" id="mapCol">
                    <h2 class="contact-section-title" id="findMapTitle">Find Us On Map</h2>
                    <div class="map-wrapper">
                        <iframe
                            src="https://www.google.com/maps?q=RK%20University%20Main%20Campus%2C%20Bhavnagar%20Highway%2C%20Kasturbadham%2C%20Rajkot%2C%20Gujarat%20360020&output=embed"
                            allowfullscreen=""
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"
                            id="campusMap"
                            title="RK University Location Map"></iframe>
                    </div>
                    <!-- Map Caption -->
                    <div class="d-flex align-items-center gap-3 mt-3 p-3" style="background: #fff; border-radius: 10px; border: 1px solid #eef0f3; box-shadow: 0 2px 10px rgba(0,0,0,0.04);">
                        <div>
                            <p class="mb-0 fw-bold" style="font-family: var(--font-heading); font-size: 0.95rem; color: var(--rku-dark);">RK University Main Campus</p>
                            <p class="mb-0" style="font-size: 0.82rem; color: #888;">Bhavnagar Highway, Kasturbadham, Rajkot, Gujarat 360020</p>
                            <div class="d-flex align-items-center gap-1 mt-1">
                                <span style="font-size: 0.82rem; font-weight: 700; color: #333;">4.6</span>
                                <span style="color: #fbbc04; font-size: 0.75rem;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                <span style="font-size: 0.78rem; color: #888;">(1,208)</span>
                            </div>
                            <a href="https://maps.google.com/?q=RK+University+Main+Campus+Bhavnagar+Highway+Kasturbadham+Rajkot+Gujarat+360020" target="_blank" class="text-rku-red" style="font-size: 0.82rem; font-weight: 600;" id="viewLargerMap">View larger map</a>
                        </div>
                    </div>
                </div>

                <!-- Important Contact Details -->
                <div class="col-lg-6" id="importantContactCol">
                    <h2 class="contact-section-title" id="importantContactTitle">Important Contact Details</h2>

                    <!-- Tabs -->
                    <div class="contact-tabs" id="contactTabsNav">
                        <button class="contact-tab-btn active" data-tab="university" id="tabUniversity">University Office Contacts</button>
                        <button class="contact-tab-btn" data-tab="key" id="tabKey">Key Contacts</button>
                        <button class="contact-tab-btn" data-tab="school" id="tabSchool">School Level Contact</button>
                    </div>

                    <!-- University Office Contacts Tab -->
                    <div class="contact-tab-panel active pt-3" id="panelUniversity">
                        <div class="contact-table-wrapper">
                            <div class="contact-table-header">University Office Contacts</div>
                            <table class="contact-table">
                                <thead>
                                    <tr>
                                        <th>Department</th>
                                        <th>Email</th>
                                        <th>Contact Number</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Vice Chancellor</td>
                                        <td><a href="mailto:vc@rku.ac.in" id="emailVC">vc@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 103</td>
                                    </tr>
                                    <tr>
                                        <td>Registrar</td>
                                        <td><a href="mailto:registrar@rku.ac.in" id="emailRegistrar">registrar@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 184</td>
                                    </tr>
                                    <tr>
                                        <td>Doctoral Studies (Ph. D.)</td>
                                        <td><a href="mailto:fdr@rku.ac.in" id="emailDoctoral">fdr@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 301</td>
                                    </tr>
                                    <tr>
                                        <td>Central Training &amp; Placement Cell</td>
                                        <td><a href="mailto:tpo@rku.ac.in" id="emailTPO">tpo@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 157</td>
                                    </tr>
                                    <tr>
                                        <td>HR Department</td>
                                        <td><a href="mailto:hr@rku.ac.in" id="emailHR">hr@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 154</td>
                                    </tr>
                                    <tr>
                                        <td>Controller of Examinations</td>
                                        <td><a href="mailto:coe@rku.ac.in" id="emailCOE">coe@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 161</td>
                                    </tr>
                                    <tr>
                                        <td>Account Section</td>
                                        <td><a href="mailto:hitesh.popat@rku.ac.in" id="emailAccounts">hitesh.popat@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 148</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Key Contacts Tab -->
                    <div class="contact-tab-panel pt-3" id="panelKey">
                        <div class="contact-table-wrapper">
                            <div class="contact-table-header">Key Contacts</div>
                            <table class="contact-table">
                                <thead>
                                    <tr>
                                        <th>Department</th>
                                        <th>Email</th>
                                        <th>Contact Number</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Director of Placements</td>
                                        <td><a href="mailto:director.placement@rku.ac.in">director.placement@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 200</td>
                                    </tr>
                                    <tr>
                                        <td>Placement Coordinator</td>
                                        <td><a href="mailto:placement@rku.ac.in">placement@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 157</td>
                                    </tr>
                                    <tr>
                                        <td>Industry Relations</td>
                                        <td><a href="mailto:industry@rku.ac.in">industry@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 205</td>
                                    </tr>
                                    <tr>
                                        <td>Career Counselling</td>
                                        <td><a href="mailto:career@rku.ac.in">career@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 210</td>
                                    </tr>
                                    <tr>
                                        <td>Internship Cell</td>
                                        <td><a href="mailto:internship@rku.ac.in">internship@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 215</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- School Level Contact Tab -->
                    <div class="contact-tab-panel pt-3" id="panelSchool">
                        <div class="contact-table-wrapper">
                            <div class="contact-table-header">School Level Contact</div>
                            <table class="contact-table">
                                <thead>
                                    <tr>
                                        <th>School</th>
                                        <th>Email</th>
                                        <th>Contact Number</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>School of Engineering</td>
                                        <td><a href="mailto:eng@rku.ac.in">eng@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 301</td>
                                    </tr>
                                    <tr>
                                        <td>School of Management</td>
                                        <td><a href="mailto:management@rku.ac.in">management@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 305</td>
                                    </tr>
                                    <tr>
                                        <td>School of Science</td>
                                        <td><a href="mailto:science@rku.ac.in">science@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 309</td>
                                    </tr>
                                    <tr>
                                        <td>School of Law</td>
                                        <td><a href="mailto:law@rku.ac.in">law@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 313</td>
                                    </tr>
                                    <tr>
                                        <td>School of Commerce</td>
                                        <td><a href="mailto:commerce@rku.ac.in">commerce@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 317</td>
                                    </tr>
                                    <tr>
                                        <td>School of Computer Science</td>
                                        <td><a href="mailto:cs@rku.ac.in">cs@rku.ac.in</a></td>
                                        <td>Tel: 9900952030 - Ext: 321</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         5. NEED IMMEDIATE ASSISTANCE BANNER
         ========================================== -->
    <section class="assistance-banner" id="assistanceBanner">
        <div class="container px-lg-5">
            <div class="row align-items-center g-4">

                <!-- Left: Heading -->
                <div class="col-lg-5 col-md-6" id="assistanceHeadingCol">
                    <div class="d-flex align-items-center">
                        <div class="assistance-icon-wrap">
                            <i class="fa-solid fa-headset"></i>
                        </div>
                        <div>
                            <h3 class="text-white fw-bold mb-1" style="font-family: var(--font-heading); font-size: 1.4rem;">Need Immediate Assistance?</h3>
                            <p class="mb-0" style="color: rgba(255,255,255,0.8); font-size: 0.88rem;">Our Placement team is ready to help you<br>
                                with all your queries.</p>
                        </div>
                    </div>
                </div>

                <!-- Right: Action Buttons -->
                <div class="col-lg-7 col-md-6" id="assistanceActionsCol">
                    <div class="row g-3">

                        <!-- Call Us -->
                        <div class="col-sm-4">
                            <a href="tel:+919712489122" class="assistance-action-btn" id="btnAssistanceCall">
                                <div class="assistance-action-icon">
                                    <i class="fa-solid fa-phone"></i>
                                </div>
                                <div>
                                    <p class="assistance-action-label">Call Us</p>
                                    <p class="assistance-action-value">+91 97124 89122</p>
                                </div>
                            </a>
                        </div>

                        <!-- Email Us -->
                        <div class="col-sm-4">
                            <a href="mailto:placement@rku.ac.in" class="assistance-action-btn" id="btnAssistanceEmail">
                                <div class="assistance-action-icon">
                                    <i class="fa-regular fa-envelope"></i>
                                </div>
                                <div>
                                    <p class="assistance-action-label">Email Us</p>
                                    <p class="assistance-action-value">placement@rku.ac.in</p>
                                </div>
                            </a>
                        </div>

                        <!-- WhatsApp -->
                        <div class="col-sm-4">
                            <a href="https://wa.me/919712489122" target="_blank" class="assistance-action-btn" id="btnAssistanceWhatsapp">
                                <div class="assistance-action-icon" style="background-color: #e8f5e9;">
                                    <i class="fa-brands fa-whatsapp" style="color: #25d366; font-size: 1.3rem;"></i>
                                </div>
                                <div>
                                    <p class="assistance-action-label">WhatsApp</p>
                                    <p class="assistance-action-value">Chat with us</p>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         6. TRUST BADGES STRIP
         ========================================== -->
    <section class="trust-strip" id="trustBadgesStrip">
        <div class="container px-lg-5">
            <div class="row g-2 justify-content-center">

                <div class="col-6 col-md-3">
                    <div class="trust-item" id="trustItemSupport">
                        <div class="trust-icon-box">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>
                        <div>
                            <p class="trust-title">Trusted Support</p>
                            <p class="trust-subtitle">We're here to help</p>
                        </div>
                    </div>
                </div>

                <div class="col-6 col-md-3">
                    <div class="trust-item" id="trustItemResponse">
                        <div class="trust-icon-box">
                            <i class="fa-regular fa-clock"></i>
                        </div>
                        <div>
                            <p class="trust-title">Quick Response</p>
                            <p class="trust-subtitle">Within 24 Hours</p>
                        </div>
                    </div>
                </div>

                <div class="col-6 col-md-3">
                    <div class="trust-item" id="trustItemGuidance">
                        <div class="trust-icon-box">
                            <i class="fa-solid fa-user-tie"></i>
                        </div>
                        <div>
                            <p class="trust-title">Expert Guidance</p>
                            <p class="trust-subtitle">By Placement Team</p>
                        </div>
                    </div>
                </div>

                <div class="col-6 col-md-3">
                    <div class="trust-item" id="trustItemIndustry">
                        <div class="trust-icon-box">
                            <i class="fa-solid fa-globe"></i>
                        </div>
                        <div>
                            <p class="trust-title">Industry Connect</p>
                            <p class="trust-subtitle">Strong Recruiter Network</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>



