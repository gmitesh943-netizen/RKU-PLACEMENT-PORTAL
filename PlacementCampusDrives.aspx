<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="PlacementCampusDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.PlacementCampusDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Campus Drives | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="View historical and active campus drives at RK University. Filter placement drives by year, department, or company name.">
        <meta name="keywords" content="RK University, Campus Drives, Placement Drives, TPO Rajkot, TCS, Wipro, Infosys, Deloitte Drives">
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
                margin-bottom: 1.5rem;
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

            /* Filter Controls */
            .filter-container {
                background-color: #fff;
                border-radius: 8px;
                padding: 1.25rem;
                border: 1px solid #eef0f3;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.02);
                margin-bottom: 1.5rem;
            }

            .filter-select {
                border: 1.5px solid #e8eaed;
                border-radius: 6px;
                padding: 0.55rem 1rem;
                font-size: 0.88rem;
                font-family: var(--font-heading);
                font-weight: 600;
                color: #495057;
                background-color: #fafbfc;
                width: 100%;
                cursor: pointer;
                transition: all 0.25s ease;
            }

                .filter-select:focus {
                    border-color: var(--rku-red);
                    outline: none;
                    background-color: #fff;
                }

            .btn-search {
                background-color: #0c1a30;
                color: #fff;
                font-family: var(--font-heading);
                font-weight: 700;
                padding: 0.55rem 1.8rem;
                border-radius: 6px;
                border: none;
                width: 100%;
                font-size: 0.88rem;
                transition: all 0.25s ease;
                letter-spacing: 0.5px;
            }

                .btn-search:hover {
                    background-color: var(--rku-maroon);
                    color: #fff;
                    transform: translateY(-1px);
                }

            /* Campus Drives Table */
            .drives-table-container {
                background-color: #fff;
                border-radius: 8px;
                border: 1px solid #eef0f3;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
                overflow-x: auto;
            }

            .drives-table {
                width: 100%;
                border-collapse: collapse;
                font-size: 0.88rem;
                min-width: 650px;
            }

                .drives-table thead th {
                    background-color: #fcfdfe;
                    font-family: var(--font-heading);
                    font-weight: 700;
                    color: var(--rku-dark);
                    padding: 0.9rem 1.25rem;
                    border-bottom: 2px solid #eef0f3;
                    font-size: 0.82rem;
                    text-transform: uppercase;
                    letter-spacing: 0.3px;
                }

                .drives-table tbody td {
                    padding: 0.9rem 1.25rem;
                    border-bottom: 1px solid #f1f3f5;
                    vertical-align: middle;
                    color: #555;
                    font-weight: 500;
                }

                .drives-table tbody tr:last-child td {
                    border-bottom: none;
                }

                .drives-table tbody tr:hover td {
                    background-color: #fefcfc;
                }

                .drives-table td a {
                    color: var(--rku-red);
                    font-weight: 600;
                    text-decoration: none;
                    transition: color 0.25s ease;
                }

                    .drives-table td a:hover {
                        color: var(--rku-maroon);
                        text-decoration: underline;
                    }

            /* Pagination & Info */
            .pagination-container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-top: 1.5rem;
                flex-wrap: wrap;
                gap: 1rem;
            }

            .info-text {
                font-size: 0.88rem;
                color: #6c757d;
                font-weight: 500;
            }

            .custom-pagination {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 0;
                border-radius: 6px;
                overflow: hidden;
                border: 1px solid #ddd;
            }

            .custom-page-item {
                border-right: 1px solid #ddd;
            }

                .custom-page-item:last-child {
                    border-right: none;
                }

            .custom-page-link {
                display: block;
                padding: 0.45rem 0.85rem;
                color: #555;
                text-decoration: none;
                font-size: 0.85rem;
                font-family: var(--font-heading);
                font-weight: 600;
                background-color: #fff;
                transition: all 0.2s ease;
            }

            .custom-page-item.active .custom-page-link {
                background-color: var(--rku-red);
                color: #fff;
            }

            .custom-page-link:hover:not(.active) {
                background-color: #f8f9fa;
                color: var(--rku-maroon);
            }

            .custom-page-item.disabled .custom-page-link {
                color: #ccc;
                pointer-events: none;
                background-color: #fafafa;
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
                                <li><a class="dropdown-item active" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
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
                        <a href="Register.aspx" class="btn btn-register" id="btnRegister">Register</a>
                    </div>
                </div>
            </div>
        </nav>
</asp:Content>



<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
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

    <!-- drives JS moved into ContentPlaceHolder2 (after the table) -->
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





<asp:Content ID="Content8" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <!-- ==========================================
         2. BREADCRUMBS & HERO SECTION
         ========================================== -->
    <section class="about-hero" style="background-image: url('assets/images/placment -2 galary.jpeg');" id="aboutHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="aboutBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="#">Placement</a>
                        <span>/</span>
                        <a href="PlacementCampusDrives.aspx" class="active">Campus Drives</a>
                    </div>

                    <h1 class="hero-title" id="aboutHeroTitle">Campus Drives</h1>
                    <p class="hero-subtitle mb-0" id="aboutHeroSubtitle">Home › Placement › Campus Drives</p>
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
                            <li class="placement-sidebar-item active">
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
                        </ul>
                    </div>
                </div>

                <!-- Right Main Content -->
                <div class="col-lg-9">

                    <!-- Title -->
                    <h2 class="page-content-title mb-4">CAMPUS DRIVES</h2>

                    <!-- Filter Bar -->
                    <div class="filter-container">
                        <form id="filterForm">
                            <div class="row g-3 align-items-center">
                                <div class="col-md-5">
                                    <select class="filter-select" id="filterDept">
                                        <option value="all">SELECT ALL DEPARTMENTS</option>
                                        <option value="computer">Computer Engineering &amp; IT</option>
                                        <option value="management">Management &amp; Commerce</option>
                                        <option value="civil">Civil Engineering</option>
                                        <option value="physio">Physiotherapy</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="filter-select" id="filterYear">
                                        <option value="2023-24">2023-24</option>
                                        <option value="2022-23">2022-23</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn-search">SEARCH</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Table Container -->
                    <div class="drives-table-container">
                        <table class="drives-table">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">Sr. No.</th>
                                    <th style="width: 15%;">Month</th>
                                    <th style="width: 15%;">Year</th>
                                    <th style="width: 45%;">Title</th>
                                    <th style="width: 15%;">Status</th>
                                </tr>
                            </thead>
                            <tbody id="drivesTableBody">
                                <!-- Data rows will be populated by JavaScript -->
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="pagination-container">
                        <div class="info-text" id="paginationInfo">Loading...</div>
                        <ul class="custom-pagination" id="paginationList"></ul>
                    </div>

                    <!-- Campus Drives JS: placed HERE (after table) so getElementById finds all elements -->
                    <script>
                    (function () {
                        var allDrives = [];
                        var months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
                        var year24_data = [
                            { title: 'TCS NQT 2024 (Digital)',                 month: 'May',      dept: 'computer' },
                            { title: 'Wipro ELITE NTH',                        month: 'May',      dept: 'computer' },
                            { title: 'Infy Springboard - Internship Program',  month: 'March',    dept: 'computer' },
                            { title: 'HCL Grant Software Developer 4.0',       month: 'April',    dept: 'computer' },
                            { title: 'IBM SkillsBuild',                        month: 'April',    dept: 'computer' },
                            { title: 'Capgemini Engineering',                  month: 'April',    dept: 'computer' },
                            { title: 'D.E. Shaw India Off Campus Drive',       month: 'April',    dept: 'computer' },
                            { title: 'L&T EduTech Hiring 2024',                month: 'April',    dept: 'computer' },
                            { title: 'Accenture',                             month: 'April',    dept: 'computer' },
                            { title: 'Virtusa Hiring',                        month: 'April',    dept: 'computer' },
                            { title: 'DXC Technology',                        month: 'April',    dept: 'computer' },
                            { title: 'Tech Mahindra Rise Digital Graduate',    month: 'April',    dept: 'computer' },
                            { title: 'ZS Intern',                             month: 'April',    dept: 'management' },
                            { title: 'Jio Platforms',                         month: 'April',    dept: 'computer' },
                            { title: "BYJU'S Off Campus Hiring",              month: 'April',    dept: 'management' },
                            { title: 'Tata Communications Hiring',            month: 'April',    dept: 'computer' },
                            { title: 'Cognizant GenC Next 2024',              month: 'April',    dept: 'computer' },
                            { title: 'Amazon CSR',                            month: 'April',    dept: 'management' },
                            { title: 'Intel India',                           month: 'April',    dept: 'computer' },
                            { title: 'L&T Off Campus Engineering 2024',        month: 'April',    dept: 'civil' },
                            { title: 'ACME Off Campus Drive',                 month: 'March',    dept: 'management' },
                            { title: 'UST Global Bengal Off 2024',            month: 'March',    dept: 'computer' },
                            { title: 'Mindtree (LTIMindtree) Hiring 2024',    month: 'March',    dept: 'computer' },
                            { title: 'Puga Fresher Hiring Drive',             month: 'March',    dept: 'computer' },
                            { title: 'Mphasis Associate Trainee',             month: 'March',    dept: 'computer' },
                            { title: 'WMS Fresher Hiring FY 2024-25',         month: 'March',    dept: 'management' },
                            { title: 'HDB Financial Services Ltd',            month: 'February', dept: 'management' },
                            { title: 'Axis Bank',                             month: 'February', dept: 'management' },
                            { title: 'TCS Ninja/Prime Off Campus Drive',      month: 'February', dept: 'computer' },
                            { title: 'Deloitte Off Campus Drive 2024',        month: 'February', dept: 'computer' }
                        ];
                        var companies = ['TCS','Wipro','Infosys','Deloitte','Zensar','Hexaware','Capgemini','Accenture','L&T','Tech Mahindra','Cognizant','Mindtree','Jio','HCL','IBM','UST Global','Zydus','Axis Bank','HDFC Bank','ICICI Bank','NIIT Technologies'];

                        for (var i = 0; i < year24_data.length; i++) {
                            allDrives.push({ srNo: i+1, month: year24_data[i].month, year: '2024', title: year24_data[i].title, status: 'Yes', dept: year24_data[i].dept });
                        }
                        for (var i = 31; i <= 180; i++) {
                            var t = companies[i % companies.length] + ' Off Campus Drive';
                            if (i===178) t='Zensar Off Campus Drive';
                            if (i===179) t='NIIT Technologies Off Campus';
                            if (i===180) t='Hexaware Off Campus Drive';
                            allDrives.push({ srNo: i, month: months[i % months.length], year: '2023', title: t, status: 'Yes', dept: (i%3===0?'computer':i%3===1?'management':'civil') });
                        }

                        var filtered = allDrives.slice();
                        var PER_PAGE = 30;
                        var page = 1;

                        var tbody   = document.getElementById('drivesTableBody');
                        var pgList  = document.getElementById('paginationList');
                        var pgInfo  = document.getElementById('paginationInfo');
                        var form    = document.getElementById('filterForm');

                        function render() {
                            var dept = document.getElementById('filterDept').value;
                            var yr   = document.getElementById('filterYear').value;
                            var yearMap = { 'all':null, '2023-24':'2024', '2022-23':'2023', '2021-22':'2022' };
                            var ty   = yearMap[yr];

                            filtered = allDrives.filter(function(d) {
                                return (dept==='all' || d.dept===dept) && (!ty || d.year===ty);
                            });

                            var start = (page-1)*PER_PAGE;
                            var end   = Math.min(start+PER_PAGE, filtered.length);
                            tbody.innerHTML = '';

                            if (!filtered.length) {
                                tbody.innerHTML = '<tr><td colspan="5" class="text-center py-4">No campus drives found.</td></tr>';
                                pgInfo.textContent = 'Showing 0 entries';
                                pgList.innerHTML = '';
                                return;
                            }

                            for (var j = start; j < end; j++) {
                                var r = filtered[j];
                                var tr = document.createElement('tr');
                                tr.innerHTML = '<td>'+r.srNo+'</td><td>'+r.month+'</td><td>'+r.year+'</td>' +
                                    '<td><a href="#">'+r.title+'</a></td>' +
                                    '<td><span class="text-success fw-bold">'+r.status+'</span></td>';
                                tbody.appendChild(tr);
                            }
                            pgInfo.textContent = 'Showing '+(start+1)+' to '+end+' of '+filtered.length+' entries';
                            renderPg(filtered.length);
                        }

                        function renderPg(total) {
                            var pages = Math.ceil(total/PER_PAGE);
                            pgList.innerHTML = '';
                            function btn(lbl, pg, dis, act) {
                                var li=document.createElement('li'); li.className='custom-page-item'+(dis?' disabled':'')+(act?' active':'');
                                var a=document.createElement('a'); a.className='custom-page-link'; a.href='#'; a.innerHTML=lbl;
                                if (!dis && pg!==null) { (function(p){ a.onclick=function(e){e.preventDefault();page=p;render();}; })(pg); }
                                li.appendChild(a); pgList.appendChild(li);
                            }
                            btn('<i class="fa-solid fa-angles-left"></i>',1,page===1,false);
                            btn('<i class="fa-solid fa-angle-left"></i>',page-1,page===1,false);
                            var s=Math.max(1,page-2), e2=Math.min(pages,s+4);
                            if(e2-s<4) s=Math.max(1,e2-4);
                            for(var p=s;p<=e2;p++) btn(p,p,false,page===p);
                            if(e2<pages){btn('...',null,true,false);btn(pages,pages,false,page===pages);}
                            btn('<i class="fa-solid fa-angle-right"></i>',page+1,page===pages,false);
                            btn('<i class="fa-solid fa-angles-right"></i>',pages,page===pages,false);
                        }

                        form.addEventListener('submit',function(e){e.preventDefault();page=1;render();});
                        render(); // run immediately — DOM is ready since script is after the table
                    })();
                    </script>

                </div>

            </div>
        </div>
    </section>
</asp:Content>






