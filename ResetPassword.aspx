<%@ Page Title="Reset Password | RKU Placement Portal" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Meta Tags for SEO -->
    <meta name="description" content="Reset your RK University Placement Portal password securely.">
    <meta name="keywords" content="RK University reset password, change password, placement portal">

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
            margin-bottom: 1.5rem;
        }

            .brand-row img {
                height: 80px;
                width: auto;
                object-fit: contain;
                filter: brightness(0) invert(1);
            }

        .fp-title {
            font-family: var(--font-heading);
            font-size: clamp(2rem, 3vw, 3rem);
            font-weight: 800;
            line-height: 1.05;
            margin-bottom: 1rem;
        }

            .fp-title span {
                color: #ffe7e4;
            }

        .fp-lead {
            font-size: 0.95rem;
            line-height: 1.65;
            opacity: 0.95;
            max-width: 26rem;
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
            font-size: 0.95rem;
            line-height: 1.65;
            margin-bottom: 1.4rem;
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
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            cursor: pointer;
        }

            .btn-rku:hover {
                transform: translateY(-1px);
                box-shadow: 0 12px 28px rgba(239, 55, 36, 0.22);
                color: #fff;
            }

        .btn-soft {
            min-height: 54px;
            border-radius: 16px;
            border: 1px solid var(--rku-border);
            background: #fff;
            color: var(--rku-dark);
            font-weight: 700;
            width: 100%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.2s ease;
            cursor: pointer;
        }

            .btn-soft:hover {
                background: #f8fafc;
                color: var(--rku-dark);
            }

        .footer-link {
            color: var(--rku-red);
            font-weight: 700;
            text-decoration: none;
        }

            .footer-link:hover {
                text-decoration: underline;
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
                        </div>
                        <div class="mb-3">
                            <i class="fa-solid fa-lock-open fa-3x text-white" style="opacity:0.88;"></i>
                        </div>
                        <h3 class="fp-title">Secure <span>Reset</span></h3>
                        <p class="fp-lead">
                            Set up a new, strong password to regain full access to your placement drives, interviews, and applications.
                        </p>
                    </section>
                </div>

                <div class="col-lg-7">
                    <section class="fp-form-panel">
                        <div class="eyebrow">Password Reset</div>
                        <h2 class="panel-title">Create New Password</h2>
                        <p class="panel-subtitle">
                            Setting new password for: <strong class="text-dark"><asp:Literal ID="litTargetEmail" runat="server"></asp:Literal></strong>
                        </p>

                        <!-- Server Msg Alert -->
                        <asp:Label ID="lblResetMsg" runat="server" CssClass="text-danger fw-bold d-block mb-3 text-center"></asp:Label>

                        <asp:Panel ID="divResetForm" runat="server">
                            <div class="input-wrap">
                                <i class="fa-solid fa-lock input-icon"></i>
                                <asp:TextBox ID="fpNewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="New Password"></asp:TextBox>
                            </div>

                            <div class="input-wrap">
                                <i class="fa-solid fa-shield-halved input-icon"></i>
                                <asp:TextBox ID="fpConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm New Password"></asp:TextBox>
                            </div>

                            <div class="p-2 mb-3 rounded bg-light border border-light-subtle small text-muted d-flex align-items-center gap-2">
                                <i class="fa-solid fa-circle-info text-primary"></i>
                                <span>Must be at least 6 characters and include letters &amp; numbers.</span>
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <asp:Button ID="fpResetPasswordBtn" runat="server" CssClass="btn-rku" Text="Update Password" OnClick="fpResetPasswordBtn_Click" />
                                <a href="Login.aspx" class="btn-soft text-decoration-none d-flex align-items-center justify-content-center">Cancel &amp; Back to Login</a>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="divResetSuccess" runat="server" Visible="false" CssClass="text-center py-4">
                            <div class="mb-3">
                                <span id="step3Circle" runat="server" style="display:inline-flex; align-items:center; justify-content:center; width:64px; height:64px; border-radius:50%; background:#10b981; color:#ffffff; font-size:1.8rem;">
                                    <i class="fa-solid fa-check"></i>
                                </span>
                            </div>
                            <h3 class="fw-bold text-dark mb-2">Password Changed Successfully!</h3>
                            <p class="text-muted mb-4">Your account password has been updated in the database. You can now log in with your new password.</p>
                            <a href="Login.aspx" class="btn btn-rku px-4 py-2 text-decoration-none d-inline-block">Back to Sign In <i class="fa-solid fa-arrow-right ms-2"></i></a>
                        </asp:Panel>

                        <div class="mt-4 pt-3 border-top">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/portal-db.js"></script>
    <script src="js/main.js"></script>
</asp:Content>
