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

        <!-- ==========================================
             GET EXPERT CALL POPUP MODAL (RKU THEME)
             ========================================== -->
        <style>
            /* Modal Overlay Backdrop - NO BLUR (Page stays sharp) */
            .rku-modal-backdrop {
                position: fixed;
                inset: 0;
                width: 100vw;
                height: 100vh;
                background: rgba(0, 0, 0, 0.45);
                z-index: 999999;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 1rem;
                opacity: 0;
                visibility: hidden;
                transition: opacity 0.25s ease, visibility 0.25s ease;
            }

                .rku-modal-backdrop.rku-modal-active {
                    opacity: 1;
                    visibility: visible;
                }

            /* Modal Dialog Card - Exact Theme Color (#e7daca) */
            .rku-expert-modal-card {
                background: #e7daca;
                border-radius: 24px;
                width: 100%;
                max-width: 440px;
                padding: 1.85rem 1.65rem 1.5rem;
                position: relative;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.28);
                transform: translateY(-20px) scale(0.96);
                transition: transform 0.28s cubic-bezier(0.34, 1.4, 0.64, 1), opacity 0.25s ease;
                border: 1px solid rgba(255, 255, 255, 0.5);
                font-family: var(--font-body, 'Inter', sans-serif);
                max-height: 94vh;
                overflow-y: auto;
            }

            .rku-modal-backdrop.rku-modal-active .rku-expert-modal-card {
                transform: translateY(0) scale(1);
            }

            /* Close Button */
            .rku-modal-close-btn {
                position: absolute;
                top: 14px;
                right: 18px;
                background: transparent;
                border: none;
                font-size: 1.75rem;
                color: #8c827a;
                line-height: 1;
                cursor: pointer;
                transition: color 0.2s, transform 0.2s;
                padding: 0 4px;
            }

                .rku-modal-close-btn:hover {
                    color: #1e293b;
                    transform: scale(1.12);
                }

            /* Top Arch Curve */
            .rku-modal-top-arc {
                display: flex;
                justify-content: center;
                margin-bottom: 0.25rem;
            }

            /* Title & Subtitle */
            .rku-modal-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.65rem;
                font-weight: 800;
                color: #1e293b;
                margin-bottom: 0.3rem;
                letter-spacing: -0.3px;
                line-height: 1.2;
            }

            .rku-modal-subtitle {
                font-size: 0.92rem;
                color: #57534e;
                margin-bottom: 1.1rem;
                line-height: 1.4;
                font-weight: 450;
            }

            /* Inputs & Selects */
            .rku-modal-field {
                margin-bottom: 0.75rem;
            }

            .rku-modal-input,
            .rku-modal-select {
                width: 100%;
                padding: 11px 16px;
                background-color: #ffffff;
                border: 1.5px solid #ffffff;
                border-radius: 12px;
                font-size: 0.9rem;
                color: #1e293b;
                outline: none;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.02);
                font-family: inherit;
            }

                .rku-modal-input::placeholder {
                    color: #94a3b8;
                    font-weight: 400;
                }

                .rku-modal-input:focus,
                .rku-modal-select:focus {
                    border-color: #c5010f;
                    box-shadow: 0 0 0 3px rgba(197, 1, 15, 0.16);
                }

            .rku-modal-select {
                cursor: pointer;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%2364748b' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='m6 9 6 6 6-6'/%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 14px center;
                background-size: 14px;
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                padding-right: 36px;
            }

            /* Submit Button - Exact Theme Color (#c5010f) */
            .rku-modal-submit-wrap {
                margin-top: 1rem;
                margin-bottom: 0.9rem;
                text-align: center;
            }

            .rku-modal-submit-btn {
                background: #c5010f;
                color: #ffffff;
                border: none;
                border-radius: 50px;
                padding: 10.5px 44px;
                font-size: 1rem;
                font-weight: 700;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                cursor: pointer;
                transition: all 0.22s ease;
                box-shadow: 0 4px 14px rgba(197, 1, 15, 0.35);
                min-width: 140px;
                letter-spacing: 0.3px;
            }

                .rku-modal-submit-btn:hover {
                    background: #a8000c;
                    transform: translateY(-2px);
                    box-shadow: 0 6px 18px rgba(197, 1, 15, 0.45);
                }

                .rku-modal-submit-btn:active {
                    transform: translateY(0);
                }

            /* Footer Note */
            .rku-modal-note {
                font-size: 0.74rem;
                color: #78716c;
                line-height: 1.4;
                text-align: center;
                margin-bottom: 0;
            }

            @media (max-width: 480px) {
                .rku-expert-modal-card {
                    padding: 1.4rem 1.15rem 1.25rem;
                    border-radius: 18px;
                }

                .rku-modal-title {
                    font-size: 1.4rem;
                }
            }
        </style>

        <div id="expertCallModal" class="rku-modal-backdrop" style="display: none;">
            <div class="rku-expert-modal-card" role="dialog" aria-modal="true" aria-labelledby="expertModalTitle">
                <!-- Close Button (x) -->
                <button type="button" class="rku-modal-close-btn" id="closeExpertModal" aria-label="Close modal">&times;</button>

                <!-- Top Arc Badge -->
                <div class="rku-modal-top-arc">
                    <svg viewBox="0 0 110 24" width="90" height="20">
                        <path d="M 8 20 Q 55 -2 102 20" fill="none" stroke="#ffffff" stroke-width="7" stroke-linecap="round" />
                    </svg>
                </div>

                <!-- Modal Heading -->
                <div class="text-center">
                    <h2 id="expertModalTitle" class="rku-modal-title">Get Expert Call</h2>
                    <p class="rku-modal-subtitle">Submit your details, our expert will get back to you!</p>
                </div>

                <!-- Modal Form -->
                <form id="expertCallForm" onsubmit="handleExpertFormSubmit(event)">
                    <!-- Success Alert -->
                    <div id="expertFormSuccess" class="alert alert-success d-none py-2 px-3 mb-3 text-center" style="font-size: 0.88rem; border-radius: 10px; background-color: #ecfdf5; border-color: #a7f3d0; color: #065f46;">
                        <i class="fa-solid fa-circle-check me-1.5" style="color: #059669;"></i>
                        <strong>Thank you!</strong> Our expert will get back to you shortly.
                    </div>

                    <!-- 1. Name of Candidate -->
                    <div class="rku-modal-field">
                        <input type="text" id="candidateName" class="rku-modal-input" placeholder="Name of Candidate *" required />
                    </div>

                    <!-- 2. Email Address -->
                    <div class="rku-modal-field">
                        <input type="email" id="candidateEmail" class="rku-modal-input" placeholder="Email Address" />
                    </div>

                    <!-- 3. Select Gender -->
                    <div class="rku-modal-field">
                        <select id="candidateGender" class="rku-modal-select" required>
                            <option value="" disabled selected>Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <!-- 4. Country List -->
                    <div class="rku-modal-field">
                        <select id="candidateCountry" class="rku-modal-select" required>
                            <option value="India" selected>India</option>
                            <option value="United States">United States</option>
                            <option value="United Kingdom">United Kingdom</option>
                            <option value="Canada">Canada</option>
                            <option value="Australia">Australia</option>
                            <option value="United Arab Emirates">United Arab Emirates</option>
                            <option value="Saudi Arabia">Saudi Arabia</option>
                            <option value="Nepal">Nepal</option>
                            <option value="Bangladesh">Bangladesh</option>
                            <option value="Sri Lanka">Sri Lanka</option>
                            <option value="Bhutan">Bhutan</option>
                            <option value="Oman">Oman</option>
                            <option value="Qatar">Qatar</option>
                            <option value="Kuwait">Kuwait</option>
                            <option value="Singapore">Singapore</option>
                            <option value="Germany">Germany</option>
                            <option value="France">France</option>
                            <option value="Afghanistan">Afghanistan</option>
                            <option value="Argentina">Argentina</option>
                            <option value="Austria">Austria</option>
                            <option value="Bahrain">Bahrain</option>
                            <option value="Belgium">Belgium</option>
                            <option value="Brazil">Brazil</option>
                            <option value="China">China</option>
                            <option value="Denmark">Denmark</option>
                            <option value="Egypt">Egypt</option>
                            <option value="Finland">Finland</option>
                            <option value="Hong Kong">Hong Kong</option>
                            <option value="Indonesia">Indonesia</option>
                            <option value="Ireland">Ireland</option>
                            <option value="Italy">Italy</option>
                            <option value="Japan">Japan</option>
                            <option value="Kenya">Kenya</option>
                            <option value="Malaysia">Malaysia</option>
                            <option value="Maldives">Maldives</option>
                            <option value="Mauritius">Mauritius</option>
                            <option value="Mexico">Mexico</option>
                            <option value="Netherlands">Netherlands</option>
                            <option value="New Zealand">New Zealand</option>
                            <option value="Nigeria">Nigeria</option>
                            <option value="Norway">Norway</option>
                            <option value="Philippines">Philippines</option>
                            <option value="Poland">Poland</option>
                            <option value="Portugal">Portugal</option>
                            <option value="Russia">Russia</option>
                            <option value="South Africa">South Africa</option>
                            <option value="South Korea">South Korea</option>
                            <option value="Spain">Spain</option>
                            <option value="Sweden">Sweden</option>
                            <option value="Switzerland">Switzerland</option>
                            <option value="Thailand">Thailand</option>
                            <option value="Turkey">Turkey</option>
                            <option value="Vietnam">Vietnam</option>
                        </select>
                    </div>

                    <!-- 5. Enter Mobile Number -->
                    <div class="rku-modal-field">
                        <input type="tel" id="candidateMobile" class="rku-modal-input" placeholder="Enter Mobile Number *" pattern="[0-9]{10}" maxlength="10" title="Please enter a valid 10-digit mobile number" required />
                    </div>

                    <!-- 6. Select Course (Direct Line-by-Line Courses without Department Headings) -->
                    <div class="rku-modal-field">
                        <select id="candidateCourse" class="rku-modal-select" required>
                            <option value="" disabled selected>Select Course *</option>
                            <option value="B.Tech - Computer Engineering">B.Tech - Computer Engineering</option>
                            <option value="B.Tech - Information Technology">B.Tech - Information Technology</option>
                            <option value="B.Tech - Mechanical Engineering">B.Tech - Mechanical Engineering</option>
                            <option value="B.Tech - Civil Engineering">B.Tech - Civil Engineering</option>
                            <option value="B.Tech - Electrical Engineering">B.Tech - Electrical Engineering</option>
                            <option value="M.Tech - Computer Engineering">M.Tech - Computer Engineering</option>
                            <option value="Diploma - Computer Engineering">Diploma - Computer Engineering</option>
                            <option value="Diploma - Information Technology">Diploma - Information Technology</option>
                            <option value="Diploma - Mechanical Engineering">Diploma - Mechanical Engineering</option>
                            <option value="Diploma - Civil Engineering">Diploma - Civil Engineering</option>
                            <option value="Diploma - Electrical Engineering">Diploma - Electrical Engineering</option>
                            <option value="BCA - Bachelor of Computer Applications">BCA (Bachelor of Computer Applications)</option>
                            <option value="MCA - Master of Computer Applications">MCA (Master of Computer Applications)</option>
                            <option value="BBA - Bachelor of Business Administration">BBA (Bachelor of Business Administration)</option>
                            <option value="MBA - Master of Business Administration">MBA (Master of Business Administration)</option>
                            <option value="B.Pharm - Bachelor of Pharmacy">B.Pharm (Bachelor of Pharmacy)</option>
                            <option value="M.Pharm - Master of Pharmacy">M.Pharm (Master of Pharmacy)</option>
                            <option value="Pharm.D - Doctor of Pharmacy">Pharm.D (Doctor of Pharmacy)</option>
                            <option value="BPT - Bachelor of Physiotherapy">BPT (Bachelor of Physiotherapy)</option>
                            <option value="MPT - Master of Physiotherapy">MPT (Master of Physiotherapy)</option>
                            <option value="B.Sc. - Information Technology">B.Sc. (Information Technology)</option>
                            <option value="M.Sc. - Information Technology">M.Sc. (Information Technology)</option>
                            <option value="B.Sc. - Microbiology / Biotechnology">B.Sc. (Microbiology / Biotechnology)</option>
                            <option value="B.Sc. - Agriculture">B.Sc. (Agriculture)</option>
                            <option value="M.Sc. - Chemistry / Microbiology">M.Sc. (Chemistry / Microbiology)</option>
                            <option value="DMLT - Diploma in Medical Lab Technology">DMLT (Medical Lab Technology)</option>
                        </select>
                    </div>

                    <!-- Submit Button -->
                    <div class="rku-modal-submit-wrap">
                        <button type="submit" class="rku-modal-submit-btn" id="btnSubmitExpertCall">Submit</button>
                    </div>
                </form>

                <!-- Footer Note -->
                <p class="rku-modal-note">
                    Note: Fees must be paid only to the official RK University bank account
                </p>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var modal = document.getElementById('expertCallModal');
                var closeBtn = document.getElementById('closeExpertModal');

                if (!modal) return;

                // Open modal smoothly when visitor arrives on Home page
                setTimeout(function () {
                    modal.style.display = 'flex';
                    setTimeout(function () {
                        modal.classList.add('rku-modal-active');
                    }, 40);
                }, 700);

                function closeModal() {
                    modal.classList.remove('rku-modal-active');
                    setTimeout(function () {
                        modal.style.display = 'none';
                    }, 300);
                }

                if (closeBtn) {
                    closeBtn.addEventListener('click', closeModal);
                }

                modal.addEventListener('click', function (e) {
                    if (e.target === modal) {
                        closeModal();
                    }
                });

                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && modal.style.display !== 'none') {
                        closeModal();
                    }
                });
            });

            function handleExpertFormSubmit(e) {
                e.preventDefault();
                var btn = document.getElementById('btnSubmitExpertCall');
                var successBox = document.getElementById('expertFormSuccess');

                if (btn) {
                    btn.disabled = true;
                    btn.innerHTML = '<span class="spinner-border spinner-border-sm me-1.5" role="status" aria-hidden="true"></span> Submitting...';
                }

                setTimeout(function () {
                    if (successBox) {
                        successBox.classList.remove('d-none');
                    }
                    if (btn) {
                        btn.innerHTML = '<i class="fa-solid fa-check me-1"></i> Submitted!';
                        btn.style.background = '#15803d';
                    }

                    // Reset form and auto close modal after 2.3 seconds
                    setTimeout(function () {
                        var modal = document.getElementById('expertCallModal');
                        if (modal) {
                            modal.classList.remove('rku-modal-active');
                            setTimeout(function () {
                                modal.style.display = 'none';
                                document.getElementById('expertCallForm').reset();
                                if (successBox) successBox.classList.add('d-none');
                                if (btn) {
                                    btn.disabled = false;
                                    btn.innerHTML = 'Submit';
                                    btn.style.background = '';
                                }
                            }, 300);
                        }
                    }, 2300);
                }, 800);
            }
        </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- ==========================================
         RKU FOOTER (EXACT USER SCREENSHOT - #c5010f & WHITE)
         ========================================== -->
    <style>
        .footer {
            background-color: #ffffff !important;
            color: #4b5563 !important;
            font-size: 0.88rem !important;
            border-top: 4px solid #c5010f !important;
        }

            .footer h5 {
                color: #1e293b !important;
                font-family: var(--font-heading, 'Outfit', sans-serif) !important;
                font-size: 1.15rem !important;
                font-weight: 700 !important;
                margin-bottom: 1.5rem !important;
                position: relative !important;
                padding-bottom: 0.5rem !important;
            }

                .footer h5::after {
                    content: '' !important;
                    position: absolute !important;
                    bottom: 0 !important;
                    left: 0 !important;
                    width: 38px !important;
                    height: 3px !important;
                    background-color: #c5010f !important;
                    border-radius: 2px !important;
                }

        .footer-logo img {
            height: 42px !important;
            object-fit: contain !important;
            margin-bottom: 1rem !important;
        }

        .footer p {
            color: #4b5563 !important;
            line-height: 1.6 !important;
        }

        .footer-links {
            list-style: none !important;
            padding-left: 0 !important;
            margin-bottom: 0 !important;
        }

            .footer-links li {
                margin-bottom: 0.75rem !important;
            }

            .footer-links a {
                color: #4b5563 !important;
                text-decoration: none !important;
                transition: all 0.2s ease !important;
                display: inline-block !important;
            }

                .footer-links a:hover {
                    color: #c5010f !important;
                    transform: translateX(3px) !important;
                }

        .footer-contact-info p {
            margin-bottom: 0.85rem !important;
            display: flex !important;
            align-items: flex-start !important;
            color: #4b5563 !important;
        }

        .footer-contact-info i {
            color: #c5010f !important;
            margin-right: 0.85rem !important;
            margin-top: 0.25rem !important;
            font-size: 1.05rem !important;
        }

        .footer-contact-info a {
            color: #4b5563 !important;
            text-decoration: none !important;
            transition: color 0.2s ease !important;
        }

            .footer-contact-info a:hover {
                color: #c5010f !important;
            }

        .footer-social-links a {
            width: 38px !important;
            height: 38px !important;
            border-radius: 50% !important;
            background-color: #f1f5f9 !important;
            color: #c5010f !important;
            border: 1px solid #e2e8f0 !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            margin-right: 0.5rem !important;
            text-decoration: none !important;
            transition: all 0.25s ease !important;
        }

            .footer-social-links a:hover {
                background-color: #c5010f !important;
                color: #ffffff !important;
                border-color: #c5010f !important;
                transform: translateY(-3px) !important;
                box-shadow: 0 4px 12px rgba(197, 1, 15, 0.3) !important;
            }

        .footer-bottom {
            background-color: #c5010f !important;
            border-top: 1px solid rgba(255, 255, 255, 0.2) !important;
            padding: 1.5rem 0 !important;
        }

            .footer-bottom p {
                color: #ffffff !important;
            }

            .footer-bottom a {
                color: #ffffff !important;
                text-decoration: none !important;
                transition: color 0.2s ease !important;
            }

                .footer-bottom a:hover {
                    color: #ffffff !important;
                    opacity: 0.85 !important;
                    text-decoration: underline !important;
                }

            .footer-bottom span {
                color: rgba(255, 255, 255, 0.7) !important;
            }
    </style>

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
</asp:Content>
