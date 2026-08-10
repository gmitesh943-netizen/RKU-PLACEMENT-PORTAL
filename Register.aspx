<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Meta Tags for SEO -->
    <meta name="description" content="Create your account on the RK University Placement Portal. Join to access campus placement drives, training programs, and career resources.">
    <meta name="keywords" content="RK University Register, Student Registration, Placement Registration, RKU TPO Account">


    <style>
        :root {
            --rku-maroon: #a30f14;
            --rku-red: #ef3724;
            --rku-red-light: #fff5f5;
            --rku-dark: #111111;
            --font-heading: 'Outfit', sans-serif;
            --font-body: 'Inter', sans-serif;
        }

        body {
            font-family: var(--font-body);
            background-color: #f8fafc;
        }

        /* ─── REGISTER CONTAINER BOX ─── */
        .register-main-section {
            padding: 5rem 0;
            position: relative;
            overflow: hidden;
            background-color: #f8fafc;
        }

        .register-container-box {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.06);
            border: 1px solid #eef0f3;
            overflow: hidden;
            max-width: 1050px;
            margin: 0 auto;
            display: flex;
            position: relative;
            z-index: 2;
        }

        /* ─── LEFT COLUMN (WELCOME) ─── */
        .left-col {
            flex: 1;
            background-color: #fcfcfc;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 3.5rem 3rem 0 3rem;
            position: relative;
            overflow: hidden;
            border-right: 1px solid #f1f5f9;
        }

        /* Waves background decoration */
        .left-col-wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: auto;
            z-index: 1;
            pointer-events: none;
        }

        .welcome-section {
            text-align: center;
            margin-top: 1rem;
            position: relative;
            z-index: 2;
        }

        .welcome-title {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 2.3rem;
            color: var(--rku-dark);
            margin-bottom: 0.5rem;
            line-height: 1.2;
        }

            .welcome-title span {
                color: var(--rku-red);
            }

        .welcome-subtitle {
            font-size: 0.92rem;
            color: #64748b;
            margin-bottom: 1.2rem;
            line-height: 1.5;
            max-width: 320px;
            margin-left: auto;
            margin-right: auto;
        }

        .red-bar {
            width: 50px;
            height: 3px;
            background-color: var(--rku-red);
            margin: 0 auto 2rem auto;
            border-radius: 50px;
        }

        /* Stats Row */
        .stats-row {
            display: flex;
            justify-content: center;
            gap: 0.8rem;
            margin-bottom: 2rem;
            position: relative;
            z-index: 2;
        }

        .stat-box {
            background-color: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 1rem 0.6rem;
            flex: 1;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.01);
            transition: all 0.25s ease;
        }

            .stat-box:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.04);
                border-color: rgba(239, 55, 36, 0.15);
            }

        .stat-icon {
            font-size: 1.3rem;
            color: var(--rku-red);
            margin-bottom: 0.5rem;
        }

        .stat-number {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 1.1rem;
            color: var(--rku-dark);
            margin-bottom: 0.1rem;
            line-height: 1.2;
        }

        .stat-label {
            font-size: 0.68rem;
            color: #64748b;
            font-weight: 600;
        }

        /* Campus building vector illustration */
        .campus-illustration-container {
            width: 100%;
            max-width: 380px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        /* Dots pattern at top left */
        .dots-pattern-top-left {
            position: absolute;
            top: 2rem;
            left: 2rem;
            opacity: 0.35;
            z-index: 0;
            pointer-events: none;
        }

        /* ─── RIGHT COLUMN (FORM) ─── */
        .right-col {
            flex: 1.1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 3.5rem 3rem;
            position: relative;
            background-color: #fff;
        }

        .login-card-title {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 2.2rem;
            color: var(--rku-dark);
            margin-bottom: 0.3rem;
        }

        .login-card-subtitle {
            font-size: 0.88rem;
            color: #64748b;
            margin-bottom: 2rem;
        }

        .right-col .red-bar {
            margin: 0 0 1.25rem 0;
            width: 45px;
        }

        .input-group-custom {
            position: relative;
            margin-bottom: 1.25rem;
        }

            .input-group-custom input {
                width: 100%;
                padding: 0.85rem 1rem 0.85rem 2.8rem;
                border: 1px solid #cbd5e1;
                border-radius: 10px;
                font-size: 0.92rem;
                color: var(--rku-dark);
                outline: none;
                transition: all 0.2s;
            }

                .input-group-custom input:focus {
                    border-color: var(--rku-red);
                    box-shadow: 0 0 0 3px rgba(239, 55, 36, 0.08);
                }

            .input-group-custom .input-icon {
                position: absolute;
                left: 1.1rem;
                top: 50%;
                transform: translateY(-50%);
                color: #64748b;
                font-size: 1rem;
                pointer-events: none;
            }

            .input-group-custom .eye-toggle {
                position: absolute;
                right: 1.1rem;
                top: 50%;
                transform: translateY(-50%);
                color: #64748b;
                font-size: 1rem;
                cursor: pointer;
                transition: color 0.2s;
                background: none;
                border: none;
                padding: 0;
            }

        /* Checkbox & Policy row */
        .flex-row-options {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            font-size: 0.85rem;
        }

        .form-check-input {
            width: 1.15em;
            height: 1.15em;
            cursor: pointer;
            border-color: #cbd5e1;
        }

            .form-check-input:checked {
                background-color: var(--rku-red);
                border-color: var(--rku-red);
            }

        .form-check-label {
            cursor: pointer;
            color: #475569;
            font-weight: 500;
        }

            .form-check-label a {
                color: var(--rku-red);
                text-decoration: none;
                font-weight: 600;
            }

                .form-check-label a:hover {
                    text-decoration: underline;
                }

        /* Create Button */
        .btn-signin {
            width: 100%;
            background-color: var(--rku-red);
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 0.9rem;
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.6rem;
            transition: all 0.2s;
            box-shadow: 0 4px 15px rgba(239, 55, 36, 0.2);
            margin-bottom: 1.8rem;
        }

            .btn-signin:hover {
                background-color: var(--rku-maroon);
                transform: translateY(-1px);
                box-shadow: 0 6px 20px rgba(163, 15, 20, 0.25);
            }

        /* Divider */
        .divider-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.8rem;
            font-size: 0.78rem;
            color: #94a3b8;
            font-weight: 500;
        }

        .divider-line {
            flex: 1;
            height: 1px;
            background-color: #e2e8f0;
        }

        .divider-text {
            padding: 0 1rem;
        }

        /* Google button */
        .btn-google {
            width: 100%;
            background-color: #fff;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            padding: 0.85rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            color: #334155;
            font-weight: 600;
            font-size: 0.92rem;
            transition: all 0.2s;
            margin-bottom: 2rem;
        }

            .btn-google:hover {
                background-color: #f8fafc;
                border-color: #94a3b8;
            }

            .btn-google svg {
                width: 18px;
                height: 18px;
            }

        .register-footer-text {
            text-align: center;
            font-size: 0.88rem;
            color: #475569;
            font-weight: 500;
        }

            .register-footer-text a {
                color: var(--rku-red);
                text-decoration: none;
                font-weight: 700;
            }

                .register-footer-text a:hover {
                    color: var(--rku-maroon);
                    text-decoration: underline;
                }

        .register-role-tabs .nav-link {
            color: #475569;
            background-color: #f1f5f9;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.25s ease;
            border: 1px solid #e2e8f0;
        }

            .register-role-tabs .nav-link.active {
                background-color: var(--rku-red);
                color: #ffffff;
                border-color: var(--rku-red);
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
            }

        /* Dots pattern bottom right */
        .dots-pattern-bottom-right {
            position: absolute;
            bottom: 2rem;
            right: 2rem;
            opacity: 0.35;
            z-index: 0;
            pointer-events: none;
        }

        /* Circular background rings */
        .bg-rings {
            position: absolute;
            top: 5%;
            left: 5%;
            width: 350px;
            height: 350px;
            opacity: 0.25;
            pointer-events: none;
            z-index: 0;
        }

        @media (max-width: 991.98px) {
            .register-container-box {
                flex-direction: column;
                margin: 0 1rem;
            }

            .left-col {
                padding: 3rem 2rem 2rem 2rem;
                border-right: none;
                border-bottom: 1px solid #f1f5f9;
            }

            .right-col {
                padding: 3rem 2rem;
            }
        }
    </style>

    <!-- ==========================================
         1. NAVBAR
         ========================================== -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-fluid px-lg-5">
            <!-- Brand Logo -->
            <a class="navbar-brand d-flex align-items-center" href="Index.aspx" id="navbarBrandLink">
                <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;">
            </a>

            <!-- Mobile Toggle -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" id="navbarToggleButton">
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
                    <a href="Register.aspx" class="btn btn-register active" id="btnRegister">Register</a>
                </div>
            </div>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ==========================================
         2. MAIN REGISTER CONTAINER SECTION
         ========================================== -->
    <section class="register-main-section" id="registerMainSection">
        <!-- Decorative circular rings in background of center/top -->
        <svg class="bg-rings" viewBox="0 0 100 100" fill="none">
            <circle cx="50" cy="50" r="48" stroke="#fcd34d" stroke-width="0.3" stroke-dasharray="1 2" />
            <circle cx="50" cy="50" r="38" stroke="#ef3724" stroke-width="0.15" />
            <circle cx="20" cy="80" r="15" stroke="#a30f14" stroke-width="0.1" />
        </svg>

        <div class="container">
            <div class="register-container-box">

                <!-- ==========================================
                     LEFT COLUMN (WELCOME + ILLUSTRATION)
                     ========================================== -->
                <div class="left-col">
                    <!-- Decorative dots grid top left -->
                    <svg class="dots-pattern-top-left" width="60" height="60" viewBox="0 0 60 60">
                        <pattern id="dots" width="12" height="12" patternUnits="userSpaceOnUse">
                            <circle cx="3" cy="3" r="1.5" fill="#cbd5e1" />
                        </pattern>
                        <rect width="60" height="60" fill="url(#dots)" />
                    </svg>

                    <!-- Brand Logo at top -->
                    <div class="text-center pt-2">
                        <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" style="width: min(320px, 100%); height: auto; object-fit: contain;">
                    </div>

                    <!-- Welcome Text -->
                    <div class="welcome-section">
                        <h1 class="welcome-title">Create Your <span>Account!</span></h1>
                        <p class="welcome-subtitle">Join the RK University Placement Portal and unlock opportunities.</p>
                        <div class="red-bar"></div>
                    </div>

                    <!-- Stats Row -->
                    <div class="stats-row">
                        <!-- Stat 1 -->
                        <div class="stat-box">
                            <div class="stat-icon"><i class="fa-solid fa-users"></i></div>
                            <div class="stat-number">5000+</div>
                            <div class="stat-label">Students Placed</div>
                        </div>
                        <!-- Stat 2 -->
                        <div class="stat-box">
                            <div class="stat-icon"><i class="fa-regular fa-building"></i></div>
                            <div class="stat-number">300+</div>
                            <div class="stat-label">Recruiters</div>
                        </div>
                        <!-- Stat 3 -->
                        <div class="stat-box">
                            <div class="stat-icon"><i class="fa-solid fa-chart-line"></i></div>
                            <div class="stat-number">20 LPA</div>
                            <div class="stat-label">Highest Package</div>
                        </div>
                    </div>

                    <!-- Vector Line Art of Campus Building with Red Accents -->
                    <div class="campus-illustration-container">
                        <svg viewBox="0 0 400 220" width="100%" height="auto" fill="none">
                            <!-- Clouds -->
                            <path d="M50,110 C50,105 55,102 60,102 C63,102 66,104 68,106 C70,103 74,101 77,101 C83,101 87,105 87,110 Z" stroke="#cbd5e1" stroke-width="1.2" />
                            <path d="M280,105 C280,101 284,98 288,98 C291,98 293,100 295,102 C297,99 300,97 303,97 C308,97 312,101 312,105 Z" stroke="#cbd5e1" stroke-width="1.2" />

                            <!-- Birds -->
                            <path d="M125,98 Q129,94 133,98 Q137,94 141,98" stroke="#cbd5e1" stroke-width="1.2" />
                            <path d="M142,105 Q145,102 148,105 Q151,102 154,105" stroke="#cbd5e1" stroke-width="1.2" />

                            <!-- Ground line -->
                            <line x1="44" y1="180" x2="356" y2="180" stroke="#94a3b8" stroke-width="1.5" />

                            <!-- Road starting at gate -->
                            <path d="M164,180 L88,212" stroke="#94a3b8" stroke-width="1.5" />
                            <path d="M146,180 L44,180" stroke="#94a3b8" stroke-width="1.5" />
                            <path d="M44,180 L36,212" stroke="#94a3b8" stroke-width="1.5" />
                            <path d="M36,212 L356,212" stroke="#94a3b8" stroke-width="1.5" />

                            <!-- Building Structure -->
                            <rect x="78" y="148" width="22" height="32" fill="#fff" stroke="#94a3b8" stroke-width="1.5" />
                            <rect x="100" y="140" width="122" height="40" fill="#fff" stroke="#94a3b8" stroke-width="1.5" />
                            <rect x="222" y="148" width="24" height="32" fill="#fff" stroke="#94a3b8" stroke-width="1.5" />

                            <!-- Windows -->
                            <rect x="105" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="119" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="133" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="147" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="161" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="175" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="189" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="203" y="146" width="10" height="10" stroke="#cbd5e1" stroke-width="1.2" />

                            <rect x="105" y="162" width="10" height="14" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="119" y="162" width="10" height="14" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="133" y="162" width="10" height="14" stroke="#cbd5e1" stroke-width="1.2" />

                            <!-- Arched Gate -->
                            <path d="M149,180 L149,165 C149,161 163,161 163,165 L163,180 Z" fill="#f8fafc" stroke="#94a3b8" stroke-width="1.5" />

                            <rect x="175" y="162" width="10" height="14" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="189" y="162" width="10" height="14" stroke="#cbd5e1" stroke-width="1.2" />
                            <rect x="203" y="162" width="10" height="14" stroke="#cbd5e1" stroke-width="1.2" />

                            <rect x="83" y="152" width="5" height="10" stroke="#cbd5e1" stroke-width="1" />
                            <rect x="91" y="152" width="5" height="10" stroke="#cbd5e1" stroke-width="1" />
                            <rect x="83" y="166" width="5" height="10" stroke="#cbd5e1" stroke-width="1" />
                            <rect x="91" y="166" width="5" height="10" stroke="#cbd5e1" stroke-width="1" />

                            <rect x="227" y="152" width="6" height="10" stroke="#cbd5e1" stroke-width="1" />
                            <rect x="236" y="152" width="6" height="10" stroke="#cbd5e1" stroke-width="1" />
                            <rect x="227" y="166" width="6" height="10" stroke="#cbd5e1" stroke-width="1" />
                            <rect x="236" y="166" width="6" height="10" stroke="#cbd5e1" stroke-width="1" />

                            <!-- RK UNIVERSITY Red Block Nameplate -->
                            <rect x="126" y="132" width="47" height="8" rx="2" fill="#ef3724" />
                            <text x="149.5" y="138" font-family="'Outfit', sans-serif" font-weight="900" font-size="4" fill="#fff" text-anchor="middle" letter-spacing="0.2">RK UNIVERSITY</text>

                            <!-- Red Trees -->
                            <line x1="56" y1="180" x2="56" y2="160" stroke="#111" stroke-width="1.2" />
                            <circle cx="56" cy="153" r="8" fill="#fff" stroke="#ef3724" stroke-width="1.5" />
                            <line x1="56" y1="145" x2="56" y2="161" stroke="#ef3724" stroke-width="0.8" />

                            <line x1="93" y1="180" x2="93" y2="173" stroke="#111" stroke-width="1" />
                            <circle cx="93" cy="169" r="4" fill="#fff" stroke="#ef3724" stroke-width="1.2" />
                            <line x1="93" y1="165" x2="93" y2="173" stroke="#ef3724" stroke-width="0.6" />

                            <line x1="284" y1="180" x2="284" y2="173" stroke="#111" stroke-width="1" />
                            <circle cx="284" cy="169" r="4" fill="#fff" stroke="#ef3724" stroke-width="1.2" />
                            <line x1="284" y1="165" x2="284" y2="173" stroke="#ef3724" stroke-width="0.6" />

                            <line x1="314" y1="180" x2="314" y2="155" stroke="#111" stroke-width="1.5" />
                            <circle cx="314" cy="142" r="13" fill="#fff" stroke="#ef3724" stroke-width="1.8" />
                            <line x1="314" y1="129" x2="314" y2="155" stroke="#ef3724" stroke-width="0.8" />
                        </svg>
                    </div>

                    <!-- Footer curve/wave graphics at the bottom -->
                    <svg class="left-col-wave" viewBox="0 0 500 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M0,55 C150,90 280,25 390,65 L500,55 L500,80 L0,80 Z" fill="#a30f14" />
                        <path d="M0,60 C160,93 290,30 400,68 L500,60 L500,80 L0,80 Z" fill="#ef3724" opacity="0.9" />
                    </svg>
                </div>

                <!-- ==========================================
                     RIGHT COLUMN (REGISTER FORM CARD)
                     ========================================== -->
                <div class="right-col">
                    <h2 class="login-card-title">Register</h2>
                    <div class="red-bar"></div>
                    <p class="login-card-subtitle">Fill in the details to create your account</p>

                    <!-- Role Selection Tabs -->
                    <ul class="nav nav-pills nav-justified register-role-tabs mb-4 gap-2" id="registerTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="student-tab" data-bs-toggle="pill" data-bs-target="#student-form-pane" type="button" role="tab" aria-controls="student-form-pane" aria-selected="true" onclick="setRole('Student')">
                                <i class="fa-solid fa-user-graduate me-2"></i>Student Registration
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="company-tab" data-bs-toggle="pill" data-bs-target="#company-form-pane" type="button" role="tab" aria-controls="company-form-pane" aria-selected="false" onclick="setRole('Company')">
                                <i class="fa-solid fa-building me-2"></i>Company Registration
                            </button>
                        </li>
                    </ul>

                    <%-- HiddenField: stores current role (Student / Company) --%>
                    <asp:HiddenField ID="hfRole" runat="server" ClientIDMode="Static" Value="Student" OnValueChanged="hfRole_ValueChanged" />

                    <div class="tab-content" id="registerTabsContent">
                        <!-- ================= STUDENT FORM ================= -->
                        <div class="tab-pane fade show active" id="student-form-pane" role="tabpanel" aria-labelledby="student-tab">
                            <div id="studentRegisterForm">
                                <h5 class="fw-bold mb-3 text-dark"><i class="fa-solid fa-user-graduate text-danger me-2"></i>Student Registration</h5>

                                <!-- Full Name & Enrollment/Roll No. Row -->
                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <div class="input-group-custom m-0">
                                            <i class="fa-regular fa-user input-icon"></i>
                                            <asp:TextBox required ID="regFullName" placeholder="Full Name" runat="server" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group-custom m-0">
                                            <i class="fa-regular fa-address-card input-icon"></i>
                                            <asp:TextBox required ID="regRollNo" placeholder="Enrollment / Roll No." runat="server" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Email Address -->
                                <div class="input-group-custom">
                                    <i class="fa-regular fa-envelope input-icon"></i>
                                    <asp:TextBox required ID="regEmail" placeholder="Email Address" runat="server" ClientIDMode="Static"></asp:TextBox>
                                </div>

                                <!-- Mobile Number -->
                                <div class="input-group-custom">
                                    <i class="fa-solid fa-phone input-icon"></i>
                                    <asp:TextBox required ID="regMobile" placeholder="Mobile Number" runat="server" ClientIDMode="Static"></asp:TextBox>
                                </div>

                                <!-- Username -->
                                <div class="input-group-custom">
                                    <i class="fa-regular fa-user input-icon"></i>
                                    <asp:TextBox required ID="regUsername" placeholder="Username" runat="server" ClientIDMode="Static"></asp:TextBox>
                                </div>

                                <!-- Password -->
                                <div class="input-group-custom">
                                    <i class="fa-solid fa-lock input-icon"></i>
                                    <asp:TextBox required ID="regPassword" placeholder="Password" runat="server" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                                    <button type="button" class="eye-toggle" onclick="togglePassword('regPassword', 'eyeIcon1')" style="border: none; background: none;">
                                        <i class="fa-regular fa-eye-slash" id="eyeIcon1"></i>
                                    </button>
                                </div>

                                <!-- Confirm Password -->
                                <div class="input-group-custom">
                                    <i class="fa-solid fa-lock input-icon"></i>
                                    <asp:TextBox required ID="regConfirmPassword" placeholder="Confirm Password" runat="server" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                                    <button type="button" class="eye-toggle" onclick="togglePassword('regConfirmPassword', 'eyeIcon2')" style="border: none; background: none;">
                                        <i class="fa-regular fa-eye-slash" id="eyeIcon2"></i>
                                    </button>
                                </div>

                                <!-- I agree Terms -->
                                <div class="flex-row-options">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="agreeTermsStudent" checked required>
                                        <label class="form-check-label" for="agreeTermsStudent">
                                            I agree to the <a href="#">Terms &amp; Conditions</a> and <a href="#">Privacy Policy</a>
                                        </label>
                                    </div>
                                </div>

                                <!-- Create Student Account Button -->
                                <asp:Button
                                    ID="btnSubmitRegister"
                                    ClientIDMode="Static"
                                    class="btn-signin"
                                    runat="server"
                                    Text="Create Student Account"
                                    OnClick="Button1_Click1" />
                            </div>
                        </div>

                        <!-- ================= COMPANY FORM ================= -->
                        <div class="tab-pane fade" id="company-form-pane" role="tabpanel" aria-labelledby="company-tab">
                            <div id="companyRegisterForm">
                                <h5 class="fw-bold mb-3 text-dark"><i class="fa-solid fa-building text-danger me-2"></i>Company Registration</h5>

                                <!-- Company Name & Contact Person Row -->
                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <div class="input-group-custom m-0">
                                            <i class="fa-regular fa-building input-icon"></i>
                                            <asp:TextBox required ID="compName" placeholder="Company Name" runat="server" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group-custom m-0">
                                            <i class="fa-regular fa-user input-icon"></i>
                                            <asp:TextBox required ID="compHRName" placeholder="HR / Contact Person" runat="server" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Company Email -->
                                <div class="input-group-custom">
                                    <i class="fa-regular fa-envelope input-icon"></i>
                                    <asp:TextBox required ID="compEmail" placeholder="Official Company Email" runat="server" ClientIDMode="Static"></asp:TextBox>
                                </div>

                                <!-- Contact Number -->
                                <div class="input-group-custom">
                                    <i class="fa-solid fa-phone input-icon"></i>
                                    <asp:TextBox required ID="compMobile" placeholder="Company Contact Number" runat="server" ClientIDMode="Static"></asp:TextBox>
                                </div>

                                <!-- Username -->
                                <div class="input-group-custom">
                                    <i class="fa-regular fa-user input-icon"></i>
                                    <asp:TextBox required ID="compUsername" placeholder="Company Username" runat="server" ClientIDMode="Static"></asp:TextBox>
                                </div>

                                <!-- Password -->
                                <div class="input-group-custom">
                                    <i class="fa-solid fa-lock input-icon"></i>
                                    <asp:TextBox required ID="compPassword" placeholder="Password" runat="server" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                                    <button type="button" class="eye-toggle" onclick="togglePassword('compPassword', 'eyeIconComp1')" style="border: none; background: none;">
                                        <i class="fa-regular fa-eye-slash" id="eyeIconComp1"></i>
                                    </button>
                                </div>

                                <!-- Confirm Password -->
                                <div class="input-group-custom">
                                    <i class="fa-solid fa-lock input-icon"></i>
                                    <asp:TextBox required ID="compConfirmPassword" placeholder="Confirm Password" runat="server" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                                    <button type="button" class="eye-toggle" onclick="togglePassword('compConfirmPassword', 'eyeIconComp2')" style="border: none; background: none;">
                                        <i class="fa-regular fa-eye-slash" id="eyeIconComp2"></i>
                                    </button>
                                </div>

                                <!-- I agree Terms -->
                                <div class="flex-row-options">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="agreeTermsCompany" checked required>
                                        <label class="form-check-label" for="agreeTermsCompany">
                                            I agree to the <a href="#">Terms &amp; Conditions</a> and <a href="#">Privacy Policy</a>
                                        </label>
                                    </div>
                                </div>

                                <!-- Create Company Account Button -->
                                <asp:Button 
                                    ID="btnSubmitCompany"
                                    ClientIDMode="Static"
                                    class="btn-signin"
                                    runat="server"
                                    Text="Create Company Account"
                                    OnClick="btnSubmitCompany_Click" />
                            </div>
                        </div>
                    </div>

                    <%-- Divider --%>
                    <div class="divider-container">
                        <span class="divider-line"></span>
                        <span class="divider-text">or register with</span>
                        <span class="divider-line"></span>
                    </div>

                    <%-- Google Sign Up --%>
                    <button type="button" class="btn-google" id="btnGoogleRegister">
                        <svg viewBox="0 0 24 24" width="24" height="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4" />
                            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853" />
                            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z" fill="#FBBC05" />
                            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z" fill="#EA4335" />
                        </svg>
                        Sign up with Google
                    </button>

                    <%-- Footer link --%>
                    <div class="register-footer-text">
                        Already have an account? <a href="Login.aspx" id="linkLogin">Sign In</a>
                    </div>

                </div>
                <%-- end right-col --%>
            </div>
            <%-- end register-container-box --%>
        </div>
        <%-- end container --%>

        <%-- Decorative dots grid bottom right --%>
        <svg class="dots-pattern-bottom-right" width="60" height="60" viewBox="0 0 60 60">
            <rect width="60" height="60" fill="url(#dots)" />
        </svg>
    </section>
    <%-- end register-main-section --%>

    <%-- ==========================================
         GRIDVIEWS SECTION (below register card)
         ========================================== --%>
    <section style="padding: 2rem 0 3rem 0; background-color: #f8fafc;">
        <div class="container">

            <h4 class="fw-bold mb-3" style="color: #111;">Student GridView</h4>
            <div class="table-responsive mb-4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                    CssClass="table table-bordered table-hover table-sm align-middle"
                    HeaderStyle-BackColor="#ef3724" HeaderStyle-ForeColor="White">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("regFullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Enrollment">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("regRollNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("regEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("regMobile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("regUsername") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("regPassword") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ConfirmPassword">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("regConfirmPassword") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <h4 class="fw-bold mb-3" style="color: #111;">Company GridView</h4>
            <div class="table-responsive">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%"
                    CssClass="table table-bordered table-hover table-sm align-middle"
                    HeaderStyle-BackColor="#ef3724" HeaderStyle-ForeColor="White">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CompanyName">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("compName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HRName">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("compHRName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("compEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("compMobile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("compUsername") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("compPassword") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ConfirmPassword">
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("compConfirmPassword") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </section>

</asp:Content>


<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ==========================================
         3. FOOTER
         ========================================== -->
    <footer class="footer pt-5" id="siteFooter">
        <div class="container px-lg-5">
            <div class="row g-4 pb-5">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-logo d-flex align-items-center mb-3">
                        <img src="assets/images/RKU LOGO.png" alt="RK University" class="me-2" style="height: 36px; width: auto; max-width: 220px; object-fit: contain;">
                    </div>
                    <p class="mb-4">Empowering students by bridging the gap between academia and corporate world through quality training and dream placements.</p>
                    <div class="footer-social-links" id="footerSocials">
                        <a href="#" title="Facebook" id="socialFb"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" title="Twitter" id="socialTw"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="#" title="LinkedIn" id="socialLi"><i class="fa-brands fa-linkedin-in"></i></a>
                        <a href="#" title="Instagram" id="socialIg"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="PlacementCampusDrives.aspx">Placement Drives</a></li>
                        <li><a href="Companies.aspx">Companies</a></li>

                        <li><a href="Contact.aspx">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5>Students</h5>
                    <ul class="footer-links">
                        <li><a href="Register.aspx">Student Registration</a></li>
                        <li><a href="#">Student Login</a></li>
                        <li><a href="#">Available Jobs</a></li>
                        <li><a href="#">Interview Schedule</a></li>
                        <li><a href="#">Resume Builder</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5>Placement Cell</h5>
                    <div class="footer-contact-info">
                        <p><i class="fa-solid fa-location-dot"></i><span>RK University, Rajkot – 360020, Gujarat, India</span></p>
                        <p><i class="fa-solid fa-phone"></i><span>+91 97124 89122</span></p>
                        <p><i class="fa-solid fa-envelope"></i><a href="mailto:placement@rku.ac.in" class="text-white-50">placement@rku.ac.in</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container px-lg-5">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start mb-2 mb-md-0">
                        <p class="mb-0">&copy; 2026 RK University Placement Portal. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-links d-inline-flex gap-3 mb-0">
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

    <!-- Password visibility toggle script -->
    <script>
        function togglePassword(inputId, eyeIconId) {
            const passwordInput = document.getElementById(inputId);
            const eyeIcon = document.getElementById(eyeIconId);
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.classList.remove('fa-eye-slash');
                eyeIcon.classList.add('fa-eye');
            } else {
                passwordInput.type = 'password';
                eyeIcon.classList.remove('fa-eye');
                eyeIcon.classList.add('fa-eye-slash');
            }
        }

        // Set HiddenField role value and enable/disable tab controls dynamically
        // This is critical because browser validation blocks submit if hidden fields are empty and have 'required'
        function setRole(role) {
            var hf = document.getElementById('hfRole');
            if (hf) hf.value = role;

            const studentFields = ['regFullName', 'regRollNo', 'regEmail', 'regMobile', 'regUsername', 'regPassword', 'regConfirmPassword'];
            const companyFields = ['compName', 'compHRName', 'compEmail', 'compMobile', 'compUsername', 'compPassword', 'compConfirmPassword'];

            if (role === 'Student') {
                studentFields.forEach(id => {
                    const el = document.getElementById(id);
                    if (el) {
                        el.disabled = false;
                        el.setAttribute('required', 'required');
                    }
                });
                companyFields.forEach(id => {
                    const el = document.getElementById(id);
                    if (el) {
                        el.disabled = true;
                        el.removeAttribute('required');
                    }
                });
            } else if (role === 'Company') {
                studentFields.forEach(id => {
                    const el = document.getElementById(id);
                    if (el) {
                        el.disabled = true;
                        el.removeAttribute('required');
                    }
                });
                companyFields.forEach(id => {
                    const el = document.getElementById(id);
                    if (el) {
                        el.disabled = false;
                        el.setAttribute('required', 'required');
                    }
                });
            }
        }

        // Initialize state on page load
        document.addEventListener('DOMContentLoaded', () => {
            // Check which tab is currently active to set initial role
            const isCompanyActive = document.getElementById('company-tab') && document.getElementById('company-tab').classList.contains('active');
            setRole(isCompanyActive ? 'Company' : 'Student');
        });

        // Handle Student Registration Validation before ASP.NET PostBack
        const btnReg = document.getElementById('btnSubmitRegister');
        if (btnReg) {
            btnReg.addEventListener('click', function (e) {
                const password = document.getElementById('regPassword') ? document.getElementById('regPassword').value : '';
                const confirmPassword = document.getElementById('regConfirmPassword') ? document.getElementById('regConfirmPassword').value : '';

                const existingAlert = document.getElementById('registerAlert');
                if (existingAlert) existingAlert.remove();

                if (password !== confirmPassword) {
                    e.preventDefault();
                    showAlert('Student passwords do not match.', 'danger', 'studentRegisterForm');
                    return false;
                }
            });
        }

        // Handle Company Registration Validation before ASP.NET PostBack
        const btnComp = document.getElementById('btnSubmitCompany');
        if (btnComp) {
            btnComp.addEventListener('click', function (e) {
                const password = document.getElementById('compPassword') ? document.getElementById('compPassword').value : '';
                const confirmPassword = document.getElementById('compConfirmPassword') ? document.getElementById('compConfirmPassword').value : '';

                const existingAlert = document.getElementById('registerAlert');
                if (existingAlert) existingAlert.remove();

                if (password !== confirmPassword) {
                    e.preventDefault();
                    showAlert('Company passwords do not match.', 'danger', 'companyRegisterForm');
                    return false;
                }
            });
        }

        ['regFullName', 'regRollNo', 'regEmail', 'regMobile', 'regUsername', 'regPassword', 'regConfirmPassword'].forEach(id => {
            const input = document.getElementById(id);
            if (input) {
                input.addEventListener('keydown', function (e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        const btn = document.getElementById('btnSubmitRegister');
                        if (btn) btn.click();
                    }
                });
            }
        });

        function showAlert(message, type, targetFormId) {
            const alertDiv = document.createElement('div');
            alertDiv.id = 'registerAlert';
            alertDiv.className = `alert alert-${type} alert-dismissible fade show mt-3`;
            alertDiv.role = 'alert';
            alertDiv.innerHTML = `
                <div>${message}</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            `;
            const form = document.getElementById(targetFormId);
            if (form) {
                form.insertBefore(alertDiv, form.firstChild);
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

</asp:Content>
