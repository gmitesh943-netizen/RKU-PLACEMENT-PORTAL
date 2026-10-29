<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Meta Tags for SEO -->
    <meta name="description" content="Reset your RK University Placement Portal password securely from one page.">
    <meta name="keywords" content="RK University forgot password, reset password, placement portal">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        .live-placement-ticker {
            display: none !important;
        }

        :root {
                --rku-maroon: #a30f14;
                --rku-red: #ef3724;
                --rku-red-light: #fff5f5;
                --rku-dark: #111111;
                --rku-text: #334155;
                --rku-border: #e5e7eb;
                --font-heading: 'Outfit', sans-serif;
                --font-body: 'Inter', sans-serif;
            }

            body {
                font-family: var(--font-body);
                background: radial-gradient(circle at top left, rgba(239, 55, 36, 0.08), transparent 28%), radial-gradient(circle at bottom right, rgba(163, 15, 20, 0.08), transparent 25%), #f8fafc;
                color: var(--rku-text);
            }

            .fp-shell {
                min-height: 100vh;
                display: flex;
                align-items: center;
                padding: 2rem 0;
            }

            .fp-card {
                background: rgba(255, 255, 255, 0.96);
                border: 1px solid rgba(229, 231, 235, 0.9);
                border-radius: 28px;
                box-shadow: 0 24px 80px rgba(15, 23, 42, 0.10);
                overflow: hidden;
                position: relative;
                max-width: 900px;
                margin: 0 auto;
            }

            .fp-hero {
                background: linear-gradient(135deg, rgba(163, 15, 20, 0.96), rgba(239, 55, 36, 0.95)), url('assets/images/contact-form.png') center/cover no-repeat;
                color: #fff;
                min-height: 100%;
                padding: 2.4rem;
                position: relative;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
            }

                .fp-hero::before {
                    content: '';
                    position: absolute;
                    inset: 0;
                    background: linear-gradient(180deg, rgba(0, 0, 0, 0.08), rgba(0, 0, 0, 0.28));
                }

                .fp-hero > * {
                    position: relative;
                    z-index: 1;
                }

            .brand-row {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.75rem;
                margin-bottom: 2rem;
            }

                .brand-row img {
                    height: 80px;
                    width: auto;
                    object-fit: contain;
                    filter: brightness(0) invert(1);
                }

            .brand-copy small {
                display: block;
                text-transform: uppercase;
                letter-spacing: 0.18em;
                font-size: 0.72rem;
                opacity: 0.84;
            }

            .brand-copy strong {
                font-size: 1rem;
                font-weight: 700;
            }

            .fp-title {
                font-family: var(--font-heading);
                font-size: clamp(2rem, 3vw, 3.3rem);
                font-weight: 800;
                line-height: 0.98;
                margin-bottom: 1rem;
            }

                .fp-title span {
                    color: #ffe7e4;
                }

            .fp-lead {
                font-size: 1rem;
                line-height: 1.7;
                opacity: 0.95;
                max-width: 28rem;
                margin-left: auto;
                margin-right: auto;
            }

            .fp-form-panel {
                padding: 2.4rem;
            }

            .eyebrow {
                color: var(--rku-red);
                font-weight: 800;
                text-transform: uppercase;
                letter-spacing: 0.18em;
                font-size: 0.75rem;
                margin-bottom: 0.55rem;
            }

            .panel-title {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: clamp(1.8rem, 2.4vw, 2.4rem);
                color: var(--rku-dark);
                margin-bottom: 0.5rem;
            }

            .panel-subtitle {
                color: #64748b;
                font-size: 0.98rem;
                line-height: 1.65;
                margin-bottom: 1.4rem;
            }

            .rku-alert {
                display: none;
                border-radius: 16px;
                padding: 0.95rem 1rem;
                margin-bottom: 1rem;
                border: 1px solid transparent;
                font-weight: 500;
            }

                .rku-alert.show {
                    display: block;
                }

                .rku-alert.success {
                    background: #f0fdf4;
                    color: #166534;
                    border-color: #bbf7d0;
                }

                .rku-alert.error {
                    background: #fef2f2;
                    color: #991b1b;
                    border-color: #fecaca;
                }

            .input-wrap {
                position: relative;
                margin-bottom: 1rem;
            }

                .input-wrap .form-control {
                    border-radius: 16px;
                    border: 1px solid var(--rku-border);
                    min-height: 56px;
                    padding-left: 3rem;
                    padding-right: 1rem;
                    box-shadow: none;
                }

                    .input-wrap .form-control:focus {
                        border-color: rgba(239, 55, 36, 0.45);
                        box-shadow: 0 0 0 0.2rem rgba(239, 55, 36, 0.08);
                    }

            .input-icon {
                position: absolute;
                left: 1rem;
                top: 50%;
                transform: translateY(-50%);
                color: #94a3b8;
                pointer-events: none;
            }

            .btn-rku {
                min-height: 56px;
                border-radius: 16px;
                border: none;
                background: linear-gradient(135deg, var(--rku-maroon), var(--rku-red));
                color: #fff;
                font-weight: 700;
                width: 100%;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

                .btn-rku:hover {
                    transform: translateY(-1px);
                    box-shadow: 0 12px 28px rgba(239, 55, 36, 0.22);
                }

            .btn-soft {
                min-height: 56px;
                border-radius: 16px;
                border: 1px solid var(--rku-border);
                background: #fff;
                color: var(--rku-dark);
                font-weight: 700;
                width: 100%;
            }

            .token-card {
                border: 1px solid #eef2f7;
                border-radius: 18px;
                background: #fff;
                padding: 1rem;
            }

            .small-label {
                font-size: 0.78rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.12em;
                color: #94a3b8;
            }

            .footer-link {
                color: var(--rku-red);
                font-weight: 700;
                text-decoration: none;
            }

                .footer-link:hover {
                    text-decoration: underline;
                }

            .mono-box {
                background: #0f172a;
                color: #e2e8f0;
                border-radius: 14px;
                padding: 0.9rem 1rem;
                font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
                font-size: 0.82rem;
                overflow-wrap: anywhere;
            }

            @media (max-width: 991.98px) {
                .fp-hero {
                    min-height: auto;
                }

                .fp-form-panel,
                .fp-hero {
                    padding: 1.6rem;
                }
            }
        </style>
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- ==========================================
         1. HEADER TOPBAR & NAVBAR
         ========================================== -->
    <header class="sticky-top" style="z-index: 1030;">
        <!-- RKU Header Topbar -->
    <div class="rku-header-topbar d-none d-lg-block" style="background:#ffffff; border-bottom:1px solid #edf2f7; font-size:0.84rem; color:#334155;">
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

    <nav class="navbar navbar-expand-lg">
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
                        <a class="nav-link nav-placement-btn dropdown-toggle" href="#" id="navDrives" data-bs-toggle="dropdown" aria-expanded="false">
                            Placement <i class="fa-solid fa-chevron-down placement-caret"></i>
                        </a>
                        <ul class="dropdown-menu nav-placement-dropdown" aria-labelledby="navDrives">
                            <li><a class="dropdown-item" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
                            <li><a class="dropdown-item" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
                            <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                            <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
                            <li><a class="dropdown-item" href="PlacmentProminentRecruiters.aspx" id="navPlacementRecruiters">Prominent Recruiters</a></li>
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
        </header>
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="fp-shell">
        <div class="container">
            <div class="row g-0 fp-card">
                <div class="col-lg-5">
                    <section class="fp-hero">
                        <div class="brand-row">
                            <img src="assets/images/RKU LOGO.png" alt="RK University">
                            <div class="brand-copy">
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-lg-7">
                    <section class="fp-form-panel">
                        <div class="eyebrow">Forgot Password</div>
                        <h2 class="panel-title" id="pageTitle">Request OTP</h2>
                        <p class="panel-subtitle" id="pageSubtitle">
                            Enter your enrollment number, username, or email address. We will generate a secure OTP for that account.
                        </p>

                        <div class="input-wrap">
                            <i class="fa-regular fa-user input-icon"></i>
                            <asp:TextBox ID="fpEmail" runat="server" CssClass="form-control" placeholder="Enrollment / Email / Username" autocomplete="off"></asp:TextBox>
                        </div>
                        <asp:Button ID="fpSendOtpBtn" runat="server" CssClass="btn-rku" Text="Send OTP" OnClick="fpSendOtpBtn_Click" />

                        <asp:Label ID="lblMsg" runat="server" CssClass="d-block mt-3 text-center fw-bold text-danger"></asp:Label>

                        <div class="mt-4 pt-2 border-top">
                            <a href="Login.aspx" class="footer-link"><i class="fa-solid fa-arrow-left me-1"></i>Return to Sign In</a>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
</asp:Content>


<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
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
                        <a href="https://facebook.com" target="_blank" title="Facebook" id="socialFb"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="https://twitter.com" target="_blank" title="X (Twitter)" id="socialTw"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="https://linkedin.com" target="_blank" title="LinkedIn" id="socialLi"><i class="fa-brands fa-linkedin-in"></i></a>
                        <a href="https://instagram.com" target="_blank" title="Instagram" id="socialIg"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>

                <!-- Column 2: Quick Links -->
                <div class="col-lg-3 col-md-6">
                    <h5>Quick Links</h5>
                    <ul class="footer-links" id="footerQuickLinks">
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="#">Academics</a></li>
                        <li><a href="PlacementCampusDrives.aspx">Placement Drives</a></li>
                        <li><a href="Companies.aspx">Companies</a></li>
                        <li><a href="Contact.aspx">Contact Us</a></li>
                    </ul>
                </div>

                <!-- Column 3: Students Links -->
                <div class="col-lg-3 col-md-6">
                    <h5>Students</h5>
                    <ul class="footer-links" id="footerStudentLinks">
                        <li><a href="Register.aspx">Student Registration</a></li>
                        <li><a href="Login.aspx">Student Login</a></li>
                        <li><a href="PlacementCampusDrives.aspx">Available Jobs</a></li>
                        <li><a href="StudentApplications.aspx">Applied Jobs</a></li>
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
                            <span>+91 98765 43210</span>
                        </p>
                        <p>
                            <i class="fa-solid fa-envelope"></i>
                            <a href="mailto:placement@rku.ac.in" id="linkFooterEmail">placement@rku.ac.in</a>
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
                            <a href="#" style="font-size: 0.8rem;">Privacy Policy</a>
                            <span style="color: rgba(255, 255, 255, 0.7);">|</span>
                            <a href="#" style="font-size: 0.8rem;">Terms of Service</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/portal-db.js"></script>
    <script src="js/main.js"></script>
</asp:Content>
