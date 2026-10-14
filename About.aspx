<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ==========================================
         12. FOOTER
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
                        <li><a href="Index.aspx">About Us</a></li>
                        <li><a href="#">Academics</a></li>
                        <li><a href="#">Placement Drives</a></li>
                        <li><a href="#">Companies</a></li>

                        <li><a href="#">Contact Us</a></li>
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
                            <span>+91 98765 43210</span>
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

    <!-- Database -->
    <script src="js/portal-db.js"></script>

    <!-- Bootstrap 5 Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="js/main.js"></script>

    <!-- Dynamic Data Loading -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            renderDynamicAboutData();
        });

        function renderDynamicAboutData() {
            const companies = PortalDB.getCompanies();
            const recruitersTrack = document.getElementById('aboutRecruitersTrack');
            // Placement team rendered via ASP.NET DataList control server-side

            if (recruitersTrack && companies.length > 0) {
                let trackHtml = '';
                const marqueeCompanies = companies.slice(0, 10);

                const createMarqueeItems = () => {
                    return marqueeCompanies.map(c => `
                        <div class="about-recruiter-logo-clean-item">
                            ${c.logoBase64
                            ? `<img src="${c.logoBase64}" alt="${c.name}">`
                            : `<span style="font-family: var(--font-heading, 'Outfit'); font-weight: 700; font-size: 1.15rem; color: #0f2942; text-align: center;">${c.name}</span>`
                        }
                        </div>
                    `).join('');
                };

                trackHtml = createMarqueeItems() + createMarqueeItems();
                recruitersTrack.innerHTML = trackHtml;
            }
        }

        function teamImageSrc(src) {
            if (!src) return 'assets/images/team_tpo_profile.png';
            if (src.startsWith('data:')) return src;
            return encodeURI(src);
        }

        function renderPlacementTeamSection() {
            const team = PortalDB.getPlacementTeam().slice().sort((a, b) => (Number(a.order) || 999) - (Number(b.order) || 999));
            const featuredHost = document.getElementById('teamFeaturedMember');
            const minisHost = document.getElementById('teamMiniMembers');

            if (!featuredHost || !minisHost) return;

            const featured = team.find(m => m.featured) || team[0];
            const others = team.filter(m => !featured || m.id !== featured.id).slice(0, 4);

            if (featured) {
                featuredHost.innerHTML = `
                    <article class="team-feature-card h-100">
                        <div class="team-feature-media">
                            <img src="${teamImageSrc(featured.photo)}" alt="${featured.name}" loading="lazy" decoding="async">
                        </div>
                        <div class="team-feature-body">
                            <span class="team-count-badge">${featured.designation || 'Coordinator'}</span>
                            <h4>${featured.name || ''}</h4>
                            <p class="team-feature-role">${featured.role || ''}</p>
                            <p class="team-feature-desc">${featured.description || ''}</p>
                            <div class="team-contact-list">
                                ${featured.phone ? `<div class="team-contact-item"><i class="fa-solid fa-phone"></i><span>${featured.phone}</span></div>` : ''}
                                ${featured.email ? `<div class="team-contact-item"><i class="fa-solid fa-envelope"></i><span>${featured.email}</span></div>` : ''}
                            </div>
                        </div>
                    </article>
                `;
            }

            minisHost.innerHTML = others.map(m => `
                <div class="col-md-6">
                    <article class="team-mini-card">
                        <div class="team-mini-photo">
                            <img src="${teamImageSrc(m.photo)}" alt="${m.name}" loading="lazy" decoding="async">
                        </div>
                        <div class="team-mini-content">
                            <h5>${m.name || ''}</h5>
                            <p class="team-mini-role">${m.designation || 'Coordinator'}</p>
                            <div class="team-mini-meta">
                                <div class="team-mini-meta-item">
                                    <i class="fa-solid fa-check"></i>
                                    <span>${m.role || ''}</span>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            `).join('');
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
    </body>
</html>


</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ==========================================
         2. BREADCRUMBS & ABOUT HERO SECTION
         ========================================== -->
    <section class="about-hero" id="aboutHeroSection">
        <video class="about-hero-video" autoplay muted loop playsinline aria-hidden="true">
            <source src="assets/images/ABOUT-VIDEO.mp4" type="video/mp4">
        </video>
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" id="aboutBreadcrumbs">
                        <a href="Index.aspx">Home</a>
                        <span>/</span>
                        <a href="About.aspx" class="active">About Us</a>
                    </div>

                    <h1 class="hero-title" id="aboutHeroTitle">About RK University <span class="text-rku-red">Placement Cell</span></h1>
                    <p class="hero-subtitle" id="aboutHeroSubtitle">Connecting talented students with leading recruiters and career opportunities across industries.</p>
                    <div class="d-flex flex-wrap gap-3">
                        <button class="btn btn-rku" id="btnAboutExplore">Explore Placement Drives <i class="fa-solid fa-arrow-right ms-2"></i></button>
                        <button class="hero-btn-outline" id="btnAboutContact"><i class="fa-solid fa-phone me-2"></i>Contact Placement Cell</button>
                    </div>

                    <!-- Bottom Features Row -->
                    <ul class="about-hero-features" id="aboutHeroFeatures">
                        <li class="about-hero-feature-item"><i class="fa-solid fa-circle-check"></i>Industry Collaborations</li>
                        <li class="about-hero-feature-item"><i class="fa-solid fa-circle-check"></i>Career Development</li>
                        <li class="about-hero-feature-item"><i class="fa-solid fa-circle-check"></i>Placement Assistance</li>
                        <li class="about-hero-feature-item"><i class="fa-solid fa-circle-check"></i>Global Opportunities</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         3. EMPOWERING CAREERS STATS CARD (FLOATING)
         ========================================== -->
    <section class="py-2" id="aboutStatsSection">
        <div class="container px-lg-5">
            <div class="about-stats-card" id="aboutStatsCard">
                <div class="row align-items-center text-center">
                    <!-- Stat 1 -->
                    <div class="col-lg-3 col-sm-6 about-stats-divider">
                        <div class="d-flex align-items-center justify-content-center gap-3">
                            <div class="fs-1 text-rku-red"><i class="fa-solid fa-user-graduate"></i></div>
                            <div class="text-start">
                                <h3 class="fw-bold mb-0 text-dark counter-value" data-target="5000">0</h3>
                                <p class="text-muted mb-0 fw-semibold" style="font-size: 0.9rem;">Students Placed</p>
                            </div>
                        </div>
                    </div>

                    <!-- Center Intro Text -->
                    <div class="col-lg-6 my-4 my-lg-0 about-stats-divider">
                        <div class="px-lg-4">
                            <h4 class="fw-bold text-dark mb-2" style="font-family: var(--font-heading);">Empowering Careers Since Day One</h4>
                            <p class="text-muted mb-0" style="font-size: 0.88rem; line-height: 1.5;">RK University Placement Cell works closely with industry partners to prepare students for successful careers through training, internships, and campus recruitment opportunities.</p>
                        </div>
                    </div>

                    <!-- Stat 2 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="d-flex align-items-center justify-content-center gap-3">
                            <div class="fs-1 text-rku-red"><i class="fa-solid fa-building"></i></div>
                            <div class="text-start">
                                <h3 class="fw-bold mb-0 text-dark counter-value" data-target="300">0</h3>
                                <p class="text-muted mb-0 fw-semibold" style="font-size: 0.9rem;">Recruiting Companies</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         4. OUR MISSION & VISION
         ========================================== -->
    <section class="py-5 bg-white position-relative" id="missionVisionSection">
        <style>
            #missionVisionSection {
                background: #ffffff !important;
                padding: 55px 0 45px 0 !important;
            }

            .mv-image-container {
                position: relative;
                display: inline-block;
                width: 100%;
                max-width: 520px;
                padding: 0 !important;
                margin: 0 !important;
            }
            /* Red L-shaped bracket in top-left */
            .mv-red-corner {
                position: absolute;
                top: -16px;
                left: -16px;
                width: 65px;
                height: 75px;
                border-top: 14px solid #ef3724;
                border-left: 14px solid #ef3724;
                z-index: 2;
                pointer-events: none;
            }

            .mv-main-img {
                width: 100%;
                height: auto;
                aspect-ratio: 4 / 3;
                object-fit: cover;
                border-radius: 4px;
                box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
                display: block;
                position: relative;
                z-index: 1;
            }

            .mv-eyebrow {
                color: #ef3724;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.82rem;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                margin-bottom: 0.75rem;
                display: block;
            }

            .mv-main-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: clamp(2rem, 3.2vw, 2.75rem);
                font-weight: 800;
                color: #0f2942;
                line-height: 1.18;
                margin-bottom: 2.2rem;
                letter-spacing: -0.5px;
            }

            .mv-sub-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.3rem;
                font-weight: 800;
                color: #0f2942;
                margin-bottom: 0.85rem;
            }

            .mv-sub-text {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.92rem;
                color: #64748b;
                line-height: 1.65;
                margin-bottom: 0;
            }

            .mv-split-divider {
                position: relative;
            }

            @media (min-width: 768px) {
                .mv-split-divider::before {
                    content: '';
                    position: absolute;
                    left: 0;
                    top: 5px;
                    bottom: 10px;
                    width: 1px;
                    background-color: #e2e8f0;
                }
            }
        </style>

        <div class="container px-3 px-md-4">
            <div class="row align-items-center g-4 g-lg-5">

                <!-- Left: Photo with red corner bracket -->
                <div class="col-lg-5 text-center text-lg-start">
                    <div class="mv-image-container" id="missionVisionImageWrapper">
                        <div class="mv-red-corner"></div>
                        <img src="assets/images/mission_library.jpg" alt="RK University Students Collaborating" id="imgMissionVision" class="mv-main-img">
                    </div>
                </div>

                <!-- Right: Content & 2-Col Mission/Vision Split -->
                <div class="col-lg-7 ps-lg-4">
                    <span class="mv-eyebrow">OUR MISSION &amp; VISION</span>
                    <h2 class="mv-main-title">Shaping Careers,<br>
                        Building Futures</h2>

                    <div class="row g-4 mt-1">
                        <!-- Col 1: Mission -->
                        <div class="col-md-6 pe-md-4" id="missionCard">
                            <h3 class="mv-sub-title">Our Mission</h3>
                            <p class="mv-sub-text">
                                To provide students with industry-relevant opportunities, skill development and placement support, enabling them to achieve their professional goals and contribute to society.
                            </p>
                        </div>

                        <!-- Col 2: Vision (with vertical divider) -->
                        <div class="col-md-6 ps-md-4 mv-split-divider" id="visionCard">
                            <h3 class="mv-sub-title">Our Vision</h3>
                            <p class="mv-sub-text">
                                To be a leading placement cell recognized for creating meaningful career opportunities and nurturing industry-ready talent for a better tomorrow.
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         5. WHAT WE OFFER
         ========================================== -->
    <section class="py-5 position-relative" id="offeringsSection" style="background: #f7f7f7;">
        <style>
            #offeringsSection {
                background: #f7f7f7 !important;
                padding-top: 4.5rem !important;
                padding-bottom: 4.5rem !important;
                padding-left: 0 !important;
                padding-right: 0 !important;
            }

                #offeringsSection .wwo-container {
                    max-width: 1400px;
                    margin: 0 auto;
                    padding-left: 0;
                    padding-right: 0;
                }

            @media (max-width: 768px) {
                #offeringsSection .wwo-container {
                    padding-left: 1rem;
                    padding-right: 1rem;
                }
            }

            .wwo-eyebrow {
                color: #ef3724;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.82rem;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                margin-bottom: 0.75rem;
                display: block;
            }

            .wwo-heading {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: clamp(2rem, 3.2vw, 2.75rem);
                font-weight: 800;
                color: #0f2942;
                line-height: 1.18;
                margin-bottom: 1.25rem;
                letter-spacing: -0.5px;
            }

            .wwo-desc {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.95rem;
                color: #64748b;
                line-height: 1.65;
                margin-bottom: 1.5rem;
                max-width: 380px;
            }

            .wwo-accent-bar {
                width: 42px;
                height: 3px;
                background-color: #ef3724;
                border-radius: 2px;
                margin-bottom: 2rem;
            }

            .wwo-btn {
                display: inline-flex;
                align-items: center;
                gap: 0.6rem;
                background-color: #ef3724;
                color: #ffffff !important;
                padding: 0.75rem 1.85rem;
                border-radius: 6px;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 700;
                font-size: 0.92rem;
                text-decoration: none;
                box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25);
                transition: all 0.25s ease;
            }

                .wwo-btn:hover {
                    background-color: #d62828;
                    color: #ffffff !important;
                    transform: translateY(-2px);
                    box-shadow: 0 8px 20px rgba(239, 55, 36, 0.35);
                }

            .wwo-item {
                display: flex;
                align-items: flex-start;
                margin-bottom: 2.2rem;
            }

            .wwo-num-wrap {
                display: flex;
                flex-direction: column;
                align-items: center;
                min-width: 34px;
                flex-shrink: 0;
            }

            .wwo-num {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.25rem;
                font-weight: 800;
                color: #ef3724;
                line-height: 1;
            }

            .wwo-num-dash {
                width: 14px;
                height: 2px;
                background-color: #ef3724;
                border-radius: 1px;
                margin-top: 6px;
            }

            .wwo-v-line {
                width: 1px;
                height: 38px;
                background-color: #e2e8f0;
                margin: 0 1.25rem 0 1rem;
                flex-shrink: 0;
            }

            .wwo-item-content {
                flex: 1;
            }

            .wwo-item-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.15rem;
                font-weight: 800;
                color: #0f2942;
                margin-bottom: 0.4rem;
                line-height: 1.25;
            }

            .wwo-item-desc {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.88rem;
                color: #64748b;
                line-height: 1.55;
                margin-bottom: 0;
            }
        </style>

        <div class="wwo-container">
            <div class="row align-items-start g-4 g-lg-5 mx-0">

                <!-- Left: Title, Description & CTA Button -->
                <div class="col-lg-4 ps-0 pe-lg-3">
                    <span class="wwo-eyebrow">WHAT WE OFFER</span>
                    <h2 class="wwo-heading">More Than Just Placements</h2>
                    <p class="wwo-desc">
                        We go beyond placements. Our holistic approach focuses on career readiness, skill development and long-term growth.
                    </p>
                    <div class="wwo-accent-bar"></div>
                    <div>
                        <a href="StudentDrives.aspx" class="wwo-btn" id="btnExploreAllServices">Explore All Services <i class="fa-solid fa-arrow-right-long ms-2"></i>
                        </a>
                    </div>
                </div>

                <!-- Right: 2 Sub-Columns with 6 Items -->
                <div class="col-lg-8 pe-0">
                    <div class="row g-4">

                        <!-- Col 1: Items 01, 02, 03 -->
                        <div class="col-md-6 pe-md-3">

                            <!-- Item 01 -->
                            <div class="wwo-item" id="offerCard1">
                                <div class="wwo-num-wrap">
                                    <span class="wwo-num">01</span>
                                    <span class="wwo-num-dash"></span>
                                </div>
                                <div class="wwo-v-line"></div>
                                <div class="wwo-item-content">
                                    <h3 class="wwo-item-title">Career Guidance &amp; Counseling</h3>
                                    <p class="wwo-item-desc">Personalized guidance to help students choose the right career path.</p>
                                </div>
                            </div>

                            <!-- Item 02 -->
                            <div class="wwo-item" id="offerCard2">
                                <div class="wwo-num-wrap">
                                    <span class="wwo-num">02</span>
                                    <span class="wwo-num-dash"></span>
                                </div>
                                <div class="wwo-v-line"></div>
                                <div class="wwo-item-content">
                                    <h3 class="wwo-item-title">Industry Connect</h3>
                                    <p class="wwo-item-desc">Regular interactions with top recruiters and industry experts.</p>
                                </div>
                            </div>

                            <!-- Item 03 -->
                            <div class="wwo-item" id="offerCard3">
                                <div class="wwo-num-wrap">
                                    <span class="wwo-num">03</span>
                                    <span class="wwo-num-dash"></span>
                                </div>
                                <div class="wwo-v-line"></div>
                                <div class="wwo-item-content">
                                    <h3 class="wwo-item-title">Skill Development</h3>
                                    <p class="wwo-item-desc">Workshops, training sessions and certification programs.</p>
                                </div>
                            </div>

                        </div>

                        <!-- Col 2: Items 04, 05, 06 -->
                        <div class="col-md-6 ps-md-3">

                            <!-- Item 04 -->
                            <div class="wwo-item" id="offerCard4">
                                <div class="wwo-num-wrap">
                                    <span class="wwo-num">04</span>
                                    <span class="wwo-num-dash"></span>
                                </div>
                                <div class="wwo-v-line"></div>
                                <div class="wwo-item-content">
                                    <h3 class="wwo-item-title">Placement Support</h3>
                                    <p class="wwo-item-desc">Resume building, interview preparation and placement drives.</p>
                                </div>
                            </div>

                            <!-- Item 05 -->
                            <div class="wwo-item" id="offerCard5">
                                <div class="wwo-num-wrap">
                                    <span class="wwo-num">05</span>
                                    <span class="wwo-num-dash"></span>
                                </div>
                                <div class="wwo-v-line"></div>
                                <div class="wwo-item-content">
                                    <h3 class="wwo-item-title">Internship Opportunities</h3>
                                    <p class="wwo-item-desc">Real-world exposure with leading companies.</p>
                                </div>
                            </div>

                            <!-- Item 06 -->
                            <div class="wwo-item" id="offerCard6">
                                <div class="wwo-num-wrap">
                                    <span class="wwo-num">06</span>
                                    <span class="wwo-num-dash"></span>
                                </div>
                                <div class="wwo-v-line"></div>
                                <div class="wwo-item-content">
                                    <h3 class="wwo-item-title">Alumni Network</h3>
                                    <p class="wwo-item-desc">Strong network for mentorship and referrals.</p>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         6. PLACEMENT SUCCESS STORIES
         ========================================== -->
    <section class="py-5 bg-white position-relative" id="placementSuccessSection">
        <style>
            #placementSuccessSection {
                background: #ffffff !important;
                padding: 55px 0 45px 0 !important;
            }

            .pss-eyebrow {
                color: #ef3724;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.82rem;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                margin-bottom: 0.5rem;
                display: block;
            }

            .pss-main-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: clamp(2rem, 3.2vw, 2.75rem);
                font-weight: 800;
                color: #0f2942;
                line-height: 1.18;
                margin-bottom: 0.6rem;
                letter-spacing: -0.5px;
            }

            .pss-main-subtitle {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.95rem;
                color: #64748b;
                line-height: 1.55;
                margin-bottom: 0;
                max-width: 650px;
            }

            .pss-view-all-link {
                color: #ef3724 !important;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 700;
                font-size: 0.95rem;
                text-decoration: none !important;
                display: inline-flex;
                align-items: center;
                gap: 0.4rem;
                transition: transform 0.2s ease, color 0.2s ease;
            }

                .pss-view-all-link:hover {
                    color: #d62828 !important;
                    transform: translateX(4px);
                }

            .pss-datalist-table {
                width: 100% !important;
                border-collapse: separate !important;
                border-spacing: 1.5rem 0px !important;
                margin-top: 2.2rem !important;
                height: 100% !important;
            }

                .pss-datalist-table > tbody {
                    height: 100% !important;
                }

                    .pss-datalist-table > tbody > tr {
                        height: 100% !important;
                    }

                        .pss-datalist-table > tbody > tr > td {
                            width: 33.333% !important;
                            vertical-align: top !important;
                            padding: 0 !important;
                            height: 100% !important;
                        }

            .pss-card-box {
                background: #ffffff !important;
                border: 1px solid #edf2f7 !important;
                border-radius: 14px !important;
                box-shadow: 0 4px 18px rgba(15, 23, 42, 0.04) !important;
                padding: 1.5rem !important;
                display: flex !important;
                flex-direction: column !important;
                height: 100% !important;
                min-height: 100% !important;
                transition: transform 0.25s ease, box-shadow 0.25s ease, border-color 0.25s ease !important;
                box-sizing: border-box !important;
            }

                .pss-card-box:hover {
                    transform: translateY(-4px) !important;
                    box-shadow: 0 12px 30px rgba(15, 23, 42, 0.08) !important;
                    border-color: #e2e8f0 !important;
                }

            .pss-card-top {
                display: flex !important;
                align-items: flex-start !important;
                gap: 1.15rem !important;
            }

            .pss-card-photo {
                width: 105px !important;
                height: 105px !important;
                border-radius: 10px !important;
                object-fit: cover !important;
                flex-shrink: 0 !important;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.07) !important;
                background-color: #f1f5f9;
            }

            .pss-card-details {
                flex: 1 !important;
                min-width: 0 !important;
            }

            .pss-card-recruiter {
                font-family: var(--font-heading, 'Outfit', sans-serif) !important;
                font-weight: 800 !important;
                font-size: 1.25rem !important;
                color: #ef3724 !important;
                line-height: 1.15 !important;
                margin-bottom: 0.35rem !important;
            }

            .pss-card-name {
                font-family: var(--font-heading, 'Outfit', sans-serif) !important;
                font-weight: 800 !important;
                font-size: 1.1rem !important;
                color: #0f2942 !important;
                margin-bottom: 0.15rem !important;
                line-height: 1.2 !important;
            }

            .pss-card-branch {
                font-family: var(--font-body, 'Inter', sans-serif) !important;
                font-size: 0.8rem !important;
                color: #64748b !important;
                font-weight: 500 !important;
                margin-bottom: 0.35rem !important;
            }

            .pss-card-placed {
                font-family: var(--font-body, 'Inter', sans-serif) !important;
                font-size: 0.82rem !important;
                color: #64748b !important;
                margin-bottom: 0.15rem !important;
            }

            .pss-card-pkg {
                font-family: var(--font-heading, 'Outfit', sans-serif) !important;
                font-size: 0.85rem !important;
                color: #0f2942 !important;
                font-weight: 700 !important;
            }

            .pss-card-quote {
                font-family: var(--font-body, 'Inter', sans-serif) !important;
                font-size: 0.84rem !important;
                color: #64748b !important;
                line-height: 1.6 !important;
                font-style: italic !important;
                margin-top: auto !important;
                margin-bottom: 0 !important;
                padding-top: 0.85rem !important;
                border-top: 1px solid #f1f5f9 !important;
                flex-grow: 1 !important;
            }

            @media (max-width: 991.98px) {
                .pss-datalist-table,
                .pss-datalist-table > tbody,
                .pss-datalist-table > tbody > tr,
                .pss-datalist-table > tbody > tr > td {
                    display: block !important;
                    width: 100% !important;
                    height: auto !important;
                    margin-bottom: 1.25rem !important;
                }
            }
        </style>

        <div class="container px-3 px-md-4">
            <!-- Header Row -->
            <div class="row align-items-end justify-content-between g-3">
                <div class="col-lg-8">
                    <span class="pss-eyebrow">SUCCESS STORIES</span>
                    <h2 class="pss-main-title">Real People. Real Success.</h2>
                    <p class="pss-main-subtitle">
                        Hear from our students who turned their dreams into reality with the support of RK University Placement Cell.
                    </p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a href="SuccessStories.aspx" class="pss-view-all-link" id="linkViewAllStories">View All Stories <i class="fa-solid fa-arrow-right-long ms-1"></i>
                    </a>
                </div>
            </div>

            <!-- Placement Success Stories Horizontal 3-Column DataList -->
            <asp:DataList ID="DataListSuccess" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" RepeatLayout="Table" Width="100%" CssClass="pss-datalist-table">
                <ItemTemplate>
                    <div class="pss-card-box">
                        <!-- Top Row: Photo + Details -->
                        <div class="pss-card-top">
                            <img src='<%# ResolveUrl(Eval("StudentPhoto").ToString()) %>' alt='<%# Eval("StudentName") %>' class="pss-card-photo" onerror="this.src='assets/images/team_tpo_profile.png';" />
                            <div class="pss-card-details">
                                <div class="pss-card-recruiter"><%# Eval("Recruiter") %></div>
                                <h4 class="pss-card-name"><%# Eval("StudentName") %></h4>
                                <div class="pss-card-branch"><%# Eval("DegreeBranch") %></div>
                                <div class="pss-card-placed">Placed at <%# Eval("Recruiter") %></div>
                                <div class="pss-card-pkg">Package: <%# Eval("Package") %></div>
                            </div>
                        </div>

                        <!-- Bottom: Quote / Testimonial -->
                        <p class="pss-card-quote">
                            "<%# !string.IsNullOrEmpty(Eval("Testimonial") as string) && Eval("Testimonial").ToString().Trim() != "" ? Eval("Testimonial") : "The placement cell guided me at every step, from resume building to final interview. I'm grateful for their constant support." %>"
                        </p>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </section>



    <!-- ==========================================
         7. OUR PLACEMENT PROCESS
         ========================================== -->
    <section class="py-5 position-relative" id="processSection" style="background: #f8fafb;">
        <style>
            #processSection {
                background: #f8fafb !important;
                padding-top: 4.5rem !important;
                padding-bottom: 4.5rem !important;
                padding-left: 0 !important;
                padding-right: 0 !important;
            }

                #processSection .opp-container {
                    max-width: 1400px;
                    margin: 0 auto;
                    padding-left: 0;
                    padding-right: 0;
                }

            @media (max-width: 768px) {
                #processSection .opp-container {
                    padding-left: 1rem;
                    padding-right: 1rem;
                }
            }

            .opp-eyebrow {
                color: #ef3724;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.82rem;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                margin-bottom: 0.5rem;
                display: block;
            }

            .opp-main-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: clamp(2rem, 3.2vw, 2.75rem);
                font-weight: 800;
                color: #0f2942;
                line-height: 1.18;
                margin-bottom: 3.5rem;
                letter-spacing: -0.5px;
            }

            .opp-stepper-wrap {
                display: flex;
                align-items: flex-start;
                justify-content: space-between;
                width: 100%;
            }

            .opp-step-item {
                flex: 1;
                position: relative;
                padding-right: 1.25rem;
            }

                .opp-step-item:last-child {
                    flex: 0 0 170px;
                    padding-right: 0;
                }

            .opp-step-header {
                display: flex;
                align-items: center;
                gap: 0.85rem;
            }

            .opp-num {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.45rem;
                font-weight: 800;
                color: #ef3724;
                line-height: 1;
                flex-shrink: 0;
            }

            .opp-line {
                flex: 1;
                height: 1px;
                background-color: #cbd5e1;
            }

            .opp-step-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 1.12rem;
                font-weight: 800;
                color: #0f2942;
                margin-top: 1.1rem;
                margin-bottom: 0.35rem;
                line-height: 1.25;
            }

            .opp-step-desc {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.86rem;
                color: #64748b;
                line-height: 1.45;
                margin-bottom: 0;
            }

            @media (max-width: 991.98px) {
                .opp-stepper-wrap {
                    flex-wrap: wrap;
                    gap: 2.2rem 1.5rem;
                }

                .opp-step-item {
                    flex: 0 0 calc(50% - 1rem) !important;
                    padding-right: 0 !important;
                }

                    .opp-step-item:last-child {
                        flex: 0 0 calc(50% - 1rem) !important;
                    }

                .opp-line {
                    display: none;
                }
            }

            @media (max-width: 575.98px) {
                .opp-step-item,
                .opp-step-item:last-child {
                    flex: 0 0 100% !important;
                }
            }
        </style>

        <div class="opp-container">
            <!-- Header -->
            <div class="mb-4">
                <span class="opp-eyebrow">THE PLACEMENT PROCESS</span>
                <h2 class="opp-main-title">Your Journey, Our Support</h2>
            </div>

            <!-- Stepper Container -->
            <div class="opp-stepper-wrap" id="aboutProcessTimeline">

                <!-- Step 01 -->
                <div class="opp-step-item">
                    <div class="opp-step-header">
                        <span class="opp-num">01</span>
                        <div class="opp-line"></div>
                    </div>
                    <h3 class="opp-step-title">Registration</h3>
                    <p class="opp-step-desc">Create your profile</p>
                </div>

                <!-- Step 02 -->
                <div class="opp-step-item">
                    <div class="opp-step-header">
                        <span class="opp-num">02</span>
                        <div class="opp-line"></div>
                    </div>
                    <h3 class="opp-step-title">Resume Submission</h3>
                    <p class="opp-step-desc">Get shortlisted</p>
                </div>

                <!-- Step 03 -->
                <div class="opp-step-item">
                    <div class="opp-step-header">
                        <span class="opp-num">03</span>
                        <div class="opp-line"></div>
                    </div>
                    <h3 class="opp-step-title">Apply for Drives</h3>
                    <p class="opp-step-desc">Show your skills</p>
                </div>

                <!-- Step 04 -->
                <div class="opp-step-item">
                    <div class="opp-step-header">
                        <span class="opp-num">04</span>
                        <div class="opp-line"></div>
                    </div>
                    <h3 class="opp-step-title">Interviews<br class="d-none d-md-block" />
                        (Tech / HR)</h3>
                    <p class="opp-step-desc">Face the company</p>
                </div>

                <!-- Step 05 -->
                <div class="opp-step-item">
                    <div class="opp-step-header">
                        <span class="opp-num">05</span>
                    </div>
                    <h3 class="opp-step-title">Offer</h3>
                    <p class="opp-step-desc">Join your dream<br class="d-none d-md-block" />
                        company</p>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         8. WHY RECRUITERS CHOOSE RK UNIVERSITY
         ========================================== -->
    <section class="py-5 bg-white position-relative" id="whyRecruitersSection">
        <style>
            #whyRecruitersSection {
                background: #ffffff !important;
                padding: 35px 0 30px 0 !important;
            }

            .wrc-eyebrow {
                color: #ef3724;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.82rem;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                margin-bottom: 0.75rem;
                display: block;
            }

            .wrc-heading {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: clamp(2rem, 3.2vw, 2.75rem);
                font-weight: 800;
                color: #0f2942;
                line-height: 1.18;
                margin-bottom: 1.25rem;
                letter-spacing: -0.5px;
            }

            .wrc-desc {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.95rem;
                color: #64748b;
                line-height: 1.65;
                margin-bottom: 2rem;
                max-width: 440px;
            }

            .wrc-btn {
                display: inline-flex;
                align-items: center;
                gap: 0.6rem;
                background-color: #ef3724;
                color: #ffffff !important;
                padding: 0.75rem 1.85rem;
                border-radius: 6px;
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-weight: 700;
                font-size: 0.92rem;
                text-decoration: none;
                box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25);
                transition: all 0.25s ease;
                border: none;
            }

                .wrc-btn:hover {
                    background-color: #d62828;
                    color: #ffffff !important;
                    transform: translateY(-2px);
                    box-shadow: 0 8px 20px rgba(239, 55, 36, 0.35);
                }

            .wrc-stats-col {
                border-left: 1px solid #edf2f7;
                padding-left: 2.25rem;
            }

            @media (max-width: 991.98px) {
                .wrc-stats-col {
                    border-left: none;
                    border-top: 1px solid #edf2f7;
                    padding-left: 0;
                    padding-top: 2rem;
                }
            }

            .wrc-stat-box {
                margin-bottom: 1.25rem;
            }

            .wrc-stat-num {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: clamp(1.75rem, 2.2vw, 2.1rem);
                font-weight: 800;
                color: #ef3724;
                line-height: 1;
                margin-bottom: 0.25rem;
            }

            .wrc-stat-title {
                font-family: var(--font-heading, 'Outfit', sans-serif);
                font-size: 0.84rem;
                font-weight: 700;
                color: #0f2942;
                line-height: 1.25;
                margin-bottom: 0.1rem;
            }

            .wrc-stat-sub {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                font-size: 0.76rem;
                color: #64748b;
                line-height: 1.25;
            }

            .wrc-img-wrapper {
                position: relative;
                display: block;
                width: 100%;
                max-width: 330px;
                margin-left: auto;
            }

            .wrc-red-corner {
                position: absolute;
                bottom: -10px;
                right: -10px;
                width: 44px;
                height: 52px;
                border-bottom: 10px solid #ef3724;
                border-right: 10px solid #ef3724;
                z-index: 2;
                pointer-events: none;
            }

            .wrc-img {
                width: 100%;
                height: 240px;
                object-fit: cover;
                border-radius: 6px;
                box-shadow: 0 8px 24px rgba(15, 23, 42, 0.08);
                display: block;
                position: relative;
                z-index: 1;
            }
        </style>

        <div class="container px-3 px-md-4">
            <div class="row align-items-center g-4 g-xl-5">

                <!-- Left: Title, Description & Button -->
                <div class="col-lg-5 pe-lg-3">
                    <span class="wrc-eyebrow">WHY RECRUITERS CHOOSE RK UNIVERSITY</span>
                    <h2 class="wrc-heading">A Talent Pool<br>
                        That Delivers</h2>
                    <p class="wrc-desc">
                        From strong academic foundation to industry-ready skills, <strong>RK University</strong> offers everything recruiters look for in future professionals.
                    </p>
                    <div>
                        <a href="About.aspx" class="wrc-btn" id="btnPartnerWithUs">Why RK University <i class="fa-solid fa-arrow-right-long ms-2"></i>
                        </a>
                    </div>
                </div>

                <!-- Middle: Stats Grid (2x2) with left vertical divider -->
                <div class="col-lg-3 col-md-6 wrc-stats-col">
                    <div class="row g-3">
                        <!-- Stat 1: 85% -->
                        <div class="col-6">
                            <div class="wrc-stat-box">
                                <div class="wrc-stat-num counter-value" data-target="85">85%</div>
                                <div class="wrc-stat-title">Placement Rate</div>
                                <div class="wrc-stat-sub">(Last 3 Years)</div>
                            </div>
                        </div>

                        <!-- Stat 2: 20+ LPA -->
                        <div class="col-6">
                            <div class="wrc-stat-box">
                                <div class="wrc-stat-num counter-value" data-target="20">20+</div>
                                <div class="wrc-stat-title">LPA</div>
                                <div class="wrc-stat-sub">Highest Package</div>
                            </div>
                        </div>

                        <!-- Stat 3: 500+ -->
                        <div class="col-6">
                            <div class="wrc-stat-box mb-0">
                                <div class="wrc-stat-num counter-value" data-target="500">500+</div>
                                <div class="wrc-stat-title text-muted" style="font-weight: 500;">Recruiting Companies</div>
                            </div>
                        </div>

                        <!-- Stat 4: 10+ -->
                        <div class="col-6">
                            <div class="wrc-stat-box mb-0">
                                <div class="wrc-stat-num counter-value" data-target="10">10+</div>
                                <div class="wrc-stat-title text-muted" style="font-weight: 500;">Industry Sectors</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right: Campus Image with Red Corner Bracket -->
                <div class="col-lg-4 col-md-6">
                    <div class="wrc-img-wrapper" id="whyRecruitersImageWrap">
                        <div class="wrc-red-corner"></div>
                        <img src="assets/images/slider_1.jpg" alt="RK University Campus" class="wrc-img" id="imgWhyRecruiters">
                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         9. TOP RECRUITERS
         ========================================== -->
    <style>
        #aboutRecruitersMarquee {
            padding: 24px 0 !important;
            background: #f8fafb !important;
            border-top: 1px solid #edf2f7;
            border-bottom: 1px solid #edf2f7;
        }

        .about-recruiters-strip-container {
            border: none !important;
            background: transparent !important;
            padding: 0.25rem 0 !important;
            margin: 0 !important;
            overflow: hidden !important;
            position: relative !important;
        }

        .about-recruiters-strip-track {
            display: flex !important;
            width: max-content !important;
            animation: aboutRecruitersScroll 26s linear infinite !important;
        }

            .about-recruiters-strip-track:hover,
            .about-recruiter-logo-clean-item:hover {
                animation-play-state: running !important;
            }

        @keyframes aboutRecruitersScroll {
            0% {
                transform: translateX(0);
            }

            100% {
                transform: translateX(-50%);
            }
        }

        .about-recruiter-logo-clean-item {
            width: 210px !important;
            min-width: 210px !important;
            height: 72px !important;
            background: transparent !important;
            border: none !important;
            border-right: 1px solid #eef2f6 !important;
            border-radius: 0 !important;
            box-shadow: none !important;
            margin: 0 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            padding: 0.6rem 2.25rem !important;
            transition: transform 0.25s ease !important;
        }

            .about-recruiter-logo-clean-item:hover {
                transform: scale(1.05) !important;
                background: transparent !important;
            }

            .about-recruiter-logo-clean-item svg,
            .about-recruiter-logo-clean-item img {
                max-width: 140px !important;
                max-height: 44px !important;
                object-fit: contain !important;
                border: none !important;
            }
    </style>
    <section id="aboutRecruitersMarquee">
        <div class="container px-3 px-md-4">
            <!-- Recruiter Logo Strip with Dividers -->
            <div class="about-recruiters-strip-container">
                <div class="about-recruiters-strip-track" id="aboutRecruitersTrack">
                    <!-- 1. TCS -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 170 45" width="130" height="38">
                            <text x="2" y="32" font-family="'Outfit', sans-serif" font-weight="900" font-size="34" fill="#ef3724">tcs</text>
                            <text x="52" y="15" font-family="'Inter', sans-serif" font-weight="800" font-size="7.5" fill="#0f2942">TATA</text>
                            <text x="52" y="24" font-family="'Inter', sans-serif" font-weight="800" font-size="7.5" fill="#0f2942">CONSULTANCY</text>
                            <text x="52" y="33" font-family="'Inter', sans-serif" font-weight="800" font-size="7.5" fill="#0f2942">SERVICES</text>
                        </svg>
                    </div>
                    <!-- 2. Infosys -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="120" height="36">
                            <text x="12" y="32" font-family="'Outfit', sans-serif" font-weight="700" font-size="34" fill="#007cc3" letter-spacing="-0.5">Infosys</text>
                            <circle cx="126" cy="15" r="2.5" fill="#007cc3" />
                        </svg>
                    </div>
                    <!-- 3. Wipro -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="120" height="36">
                            <g transform="translate(25, 22) scale(0.65)">
                                <circle cx="0" cy="-22" r="3" fill="#0070ad" />
                                <circle cx="11" cy="-19" r="3" fill="#0096d6" />
                                <circle cx="19" cy="-11" r="3" fill="#2db34b" />
                                <circle cx="22" cy="0" r="3" fill="#8bc53f" />
                                <circle cx="19" cy="11" r="3" fill="#fdb913" />
                                <circle cx="11" cy="19" r="3" fill="#f37023" />
                                <circle cx="0" cy="22" r="3" fill="#ed1c24" />
                                <circle cx="-11" cy="19" r="3" fill="#b01f66" />
                                <circle cx="-19" cy="11" r="3" fill="#7d3f98" />
                                <circle cx="-22" cy="0" r="3" fill="#2e3192" />
                                <circle cx="-19" cy="-11" r="3" fill="#0054a6" />
                                <circle cx="-11" cy="-19" r="3" fill="#0072bc" />
                                <circle cx="0" cy="-14" r="2.5" fill="#0096d6" />
                                <circle cx="10" cy="-10" r="2.5" fill="#8bc53f" />
                                <circle cx="14" cy="0" r="2.5" fill="#fdb913" />
                                <circle cx="10" cy="10" r="2.5" fill="#ed1c24" />
                                <circle cx="0" cy="14" r="2.5" fill="#7d3f98" />
                                <circle cx="-10" cy="10" r="2.5" fill="#2e3192" />
                                <circle cx="-14" cy="0" r="2.5" fill="#0054a6" />
                                <circle cx="-10" cy="-10" r="2.5" fill="#0072bc" />
                            </g>
                            <text x="55" y="28" font-family="'Outfit', sans-serif" font-weight="700" font-size="24" fill="#253858">wipro</text>
                        </svg>
                    </div>
                    <!-- 4. Accenture -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="125" height="36">
                            <text x="5" y="28" font-family="'Inter', sans-serif" font-weight="700" font-size="22" fill="#000000">accenture</text>
                            <path d="M125,14 L134,22 L125,30 L121,26 L127,22 L121,18 Z" fill="#a100ff" />
                        </svg>
                    </div>
                    <!-- 5. HCL -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="115" height="36">
                            <text x="20" y="32" font-family="'Outfit', sans-serif" font-weight="900" font-size="36" fill="#005691" font-style="italic">HCL</text>
                        </svg>
                    </div>
                    <!-- 6. IBM -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="110" height="36">
                            <text x="25" y="32" font-family="'Outfit', sans-serif" font-weight="900" font-size="38" fill="#1f70c1" letter-spacing="1">IBM</text>
                            <rect x="20" y="6" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="11" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="16" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="21" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="26" width="100" height="2" fill="#ffffff" />
                        </svg>
                    </div>
                    <!-- 7. Tech Mahindra -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 170 45" width="135" height="36">
                            <text x="5" y="21" font-family="'Outfit', sans-serif" font-weight="800" font-size="16" fill="#e21a22">Tech</text>
                            <text x="5" y="35" font-family="'Outfit', sans-serif" font-weight="800" font-size="16" fill="#231f20">Mahindra</text>
                            <circle cx="105" cy="27" r="9" fill="#e21a22" />
                            <circle cx="105" cy="27" r="4.5" fill="#ffffff" />
                        </svg>
                    </div>
                    <!-- 8. L&T Infotech -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 170 45" width="130" height="36">
                            <circle cx="24" cy="22" r="14" fill="none" stroke="#ea580c" stroke-width="2.5" />
                            <path d="M18,15 L18,28 L27,28" fill="none" stroke="#ea580c" stroke-width="2.5" stroke-linecap="round" />
                            <path d="M22,19 L28,19" fill="none" stroke="#ea580c" stroke-width="2" stroke-linecap="round" />
                            <text x="44" y="23" font-family="'Outfit', sans-serif" font-weight="900" font-size="18" fill="#0f2942">L&amp;T</text>
                            <text x="44" y="34" font-family="'Inter', sans-serif" font-weight="700" font-size="10.5" fill="#64748b">Infotech</text>
                        </svg>
                    </div>

                    <!-- Repeat For Seamless Infinite Loop -->
                    <!-- 1. TCS -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 170 45" width="130" height="38">
                            <text x="2" y="32" font-family="'Outfit', sans-serif" font-weight="900" font-size="34" fill="#ef3724">tcs</text>
                            <text x="52" y="15" font-family="'Inter', sans-serif" font-weight="800" font-size="7.5" fill="#0f2942">TATA</text>
                            <text x="52" y="24" font-family="'Inter', sans-serif" font-weight="800" font-size="7.5" fill="#0f2942">CONSULTANCY</text>
                            <text x="52" y="33" font-family="'Inter', sans-serif" font-weight="800" font-size="7.5" fill="#0f2942">SERVICES</text>
                        </svg>
                    </div>
                    <!-- 2. Infosys -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="120" height="36">
                            <text x="12" y="32" font-family="'Outfit', sans-serif" font-weight="700" font-size="34" fill="#007cc3" letter-spacing="-0.5">Infosys</text>
                            <circle cx="126" cy="15" r="2.5" fill="#007cc3" />
                        </svg>
                    </div>
                    <!-- 3. Wipro -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="120" height="36">
                            <g transform="translate(25, 22) scale(0.65)">
                                <circle cx="0" cy="-22" r="3" fill="#0070ad" />
                                <circle cx="11" cy="-19" r="3" fill="#0096d6" />
                                <circle cx="19" cy="-11" r="3" fill="#2db34b" />
                                <circle cx="22" cy="0" r="3" fill="#8bc53f" />
                                <circle cx="19" cy="11" r="3" fill="#fdb913" />
                                <circle cx="11" cy="19" r="3" fill="#f37023" />
                                <circle cx="0" cy="22" r="3" fill="#ed1c24" />
                                <circle cx="-11" cy="19" r="3" fill="#b01f66" />
                                <circle cx="-19" cy="11" r="3" fill="#7d3f98" />
                                <circle cx="-22" cy="0" r="3" fill="#2e3192" />
                                <circle cx="-19" cy="-11" r="3" fill="#0054a6" />
                                <circle cx="-11" cy="-19" r="3" fill="#0072bc" />
                                <circle cx="0" cy="-14" r="2.5" fill="#0096d6" />
                                <circle cx="10" cy="-10" r="2.5" fill="#8bc53f" />
                                <circle cx="14" cy="0" r="2.5" fill="#fdb913" />
                                <circle cx="10" cy="10" r="2.5" fill="#ed1c24" />
                                <circle cx="0" cy="14" r="2.5" fill="#7d3f98" />
                                <circle cx="-10" cy="10" r="2.5" fill="#2e3192" />
                                <circle cx="-14" cy="0" r="2.5" fill="#0054a6" />
                                <circle cx="-10" cy="-10" r="2.5" fill="#0072bc" />
                            </g>
                            <text x="55" y="28" font-family="'Outfit', sans-serif" font-weight="700" font-size="24" fill="#253858">wipro</text>
                        </svg>
                    </div>
                    <!-- 4. Accenture -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="125" height="36">
                            <text x="5" y="28" font-family="'Inter', sans-serif" font-weight="700" font-size="22" fill="#000000">accenture</text>
                            <path d="M125,14 L134,22 L125,30 L121,26 L127,22 L121,18 Z" fill="#a100ff" />
                        </svg>
                    </div>
                    <!-- 5. HCL -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="115" height="36">
                            <text x="20" y="32" font-family="'Outfit', sans-serif" font-weight="900" font-size="36" fill="#005691" font-style="italic">HCL</text>
                        </svg>
                    </div>
                    <!-- 6. IBM -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 160 45" width="110" height="36">
                            <text x="25" y="32" font-family="'Outfit', sans-serif" font-weight="900" font-size="38" fill="#1f70c1" letter-spacing="1">IBM</text>
                            <rect x="20" y="6" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="11" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="16" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="21" width="100" height="2" fill="#ffffff" />
                            <rect x="20" y="26" width="100" height="2" fill="#ffffff" />
                        </svg>
                    </div>
                    <!-- 7. Tech Mahindra -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 170 45" width="135" height="36">
                            <text x="5" y="21" font-family="'Outfit', sans-serif" font-weight="800" font-size="16" fill="#e21a22">Tech</text>
                            <text x="5" y="35" font-family="'Outfit', sans-serif" font-weight="800" font-size="16" fill="#231f20">Mahindra</text>
                            <circle cx="105" cy="27" r="9" fill="#e21a22" />
                            <circle cx="105" cy="27" r="4.5" fill="#ffffff" />
                        </svg>
                    </div>
                    <!-- 8. L&T Infotech -->
                    <div class="about-recruiter-logo-clean-item">
                        <svg viewBox="0 0 170 45" width="130" height="36">
                            <circle cx="24" cy="22" r="14" fill="none" stroke="#ea580c" stroke-width="2.5" />
                            <path d="M18,15 L18,28 L27,28" fill="none" stroke="#ea580c" stroke-width="2.5" stroke-linecap="round" />
                            <path d="M22,19 L28,19" fill="none" stroke="#ea580c" stroke-width="2" stroke-linecap="round" />
                            <text x="44" y="23" font-family="'Outfit', sans-serif" font-weight="900" font-size="18" fill="#0f2942">L&amp;T</text>
                            <text x="44" y="34" font-family="'Inter', sans-serif" font-weight="700" font-size="10.5" fill="#64748b">Infotech</text>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         10. OUR PLACEMENT TEAM
         ========================================== -->
    <style>
        #placementTeamSection {
            background-color: #ffffff !important;
            padding: 65px 0 65px 0 !important;
        }

        .opt-header-wrapper {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            margin-bottom: 3rem;
            flex-wrap: wrap;
            gap: 1.25rem;
        }

        .opt-heading {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-size: clamp(2.2rem, 3.2vw, 2.75rem);
            font-weight: 800;
            color: #0f2942;
            line-height: 1.2;
            margin-bottom: 0.5rem;
            letter-spacing: -0.5px;
        }

        .opt-subtitle {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            font-size: 1rem;
            color: #64748b;
            line-height: 1.55;
            margin-bottom: 0;
        }

        .opt-link {
            color: #ef3724 !important;
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 700;
            font-size: 0.98rem;
            text-decoration: none !important;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: transform 0.2s ease, color 0.2s ease;
        }

            .opt-link:hover {
                color: #c51e2b !important;
                transform: translateX(4px);
            }

        #placementTeamBoard {
            margin-top: 0.5rem !important;
        }

            #placementTeamBoard > span,
            #placementTeamBoard > span > span {
                display: contents;
            }

            #placementTeamBoard .team-member-col,
            #placementTeamBoard .col-lg-4 {
                padding-left: 0.9rem !important;
                padding-right: 0.9rem !important;
                margin-bottom: 2rem !important;
                box-sizing: border-box;
            }

        .opt-card {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            gap: 1.25rem;
            width: 100%;
            height: 100%;
            padding: 0;
            box-sizing: border-box;
        }

        .opt-card-img {
            width: 135px;
            height: 160px;
            min-width: 135px;
            border-radius: 10px;
            object-fit: cover;
            object-position: center top;
            background-color: #f1f5f9;
            flex-shrink: 0;
            box-shadow: 0 4px 14px rgba(15, 23, 42, 0.08);
            transition: transform 0.25s ease;
        }

        .opt-card:hover .opt-card-img {
            transform: translateY(-2px);
        }

        .opt-card-body {
            flex: 1;
            min-width: 0;
            display: flex;
            flex-direction: column;
            padding-top: 0.15rem;
        }

        .opt-card-name {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-size: 1.18rem;
            font-weight: 800;
            color: #0f2942;
            margin-bottom: 0.25rem;
            line-height: 1.25;
        }

        .opt-card-role {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            font-size: 0.88rem;
            color: #64748b;
            font-weight: 600;
            margin-bottom: 0.55rem;
            line-height: 1.35;
        }

        .opt-card-desc {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            font-size: 0.86rem;
            color: #64748b;
            line-height: 1.55;
            margin-bottom: 0;
        }

        @media (max-width: 991.98px) {
            #placementTeamBoard .team-member-col,
            #placementTeamBoard .col-lg-4 {
                padding-left: 0.75rem !important;
                padding-right: 0.75rem !important;
                margin-bottom: 1.75rem !important;
            }
        }

        @media (max-width: 575.98px) {
            .opt-card {
                flex-direction: column;
                align-items: center;
                text-align: center;
                padding-right: 0;
            }

            .opt-card-img {
                width: 150px;
                height: 175px;
            }
        }
    </style>
    <section id="placementTeamSection">
        <div class="container px-3 px-md-4">
            <!-- Header Row -->
            <div class="opt-header-wrapper">
                <div>
                    <h2 class="opt-heading">Our Placement Team</h2>
                    <p class="opt-subtitle">Dedicated professionals working to create the best opportunities for our students.</p>
                </div>
            </div>

            <!-- Team Members Row -->
            <div class="row g-4 align-items-start" id="placementTeamBoard">
                <asp:DataList ID="DataListTeam" runat="server" RepeatLayout="Flow">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 team-member-col">
                            <article class="opt-card">
                                <img src='<%# ResolveUrl(Eval("MemberPhoto").ToString()) %>' alt='<%# Eval("MemberName") %>' class="opt-card-img" onerror="this.src='assets/images/team_tpo_profile.png';" loading="lazy" decoding="async" />
                                <div class="opt-card-body">
                                    <h4 class="opt-card-name"><%# Eval("MemberName") %></h4>
                                    <div class="opt-card-role"><%# Eval("MemberRole") %></div>
                                    <p class="opt-card-desc"><%# Eval("MemberDesc") %></p>
                                </div>
                            </article>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </section>


    <!-- ==========================================
         11. CONNECT WITH US / CONTACT US BANNER
         ========================================== -->
    <style>
        #connectSection {
            background-color: #f8fafb !important;
            padding-top: 55px !important;
            padding-bottom: 65px !important;
            padding-left: 0 !important;
            padding-right: 0 !important;
            border: none !important;
        }

        .cu-container {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
            padding-left: 0 !important;
            padding-right: 0 !important;
        }

        .cu-row {
            display: flex;
            align-items: center;
            margin: 0 !important;
            padding: 0 !important;
        }

        .cu-img-col {
            flex: 0 0 50%;
            max-width: 50%;
            padding-left: 0 !important;
            padding-right: 2rem !important;
        }

        .cu-campus-img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            border-radius: 0 !important;
            box-shadow: 0 6px 18px rgba(15, 23, 42, 0.08);
            display: block;
        }

        .cu-content-col {
            flex: 0 0 50%;
            max-width: 50%;
            padding-left: 1.5rem !important;
            padding-right: 0 !important;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .cu-title {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-size: clamp(1.85rem, 2.5vw, 2.25rem);
            font-weight: 800;
            color: #0f2942;
            margin-bottom: 0.35rem;
            line-height: 1.2;
        }

        .cu-subtitle {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            font-size: 0.95rem;
            color: #64748b;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }

        .cu-items-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .cu-item {
            display: flex;
            align-items: center;
            gap: 0.85rem;
        }

        .cu-icon-box {
            width: 34px;
            height: 34px;
            min-width: 34px;
            border-radius: 8px;
            background-color: #fef2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ef3724;
            font-size: 0.9rem;
        }

        .cu-item-text {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            font-size: 0.95rem;
            color: #334155;
            line-height: 1.4;
        }

        .cu-item-link {
            color: #334155 !important;
            text-decoration: none !important;
            transition: color 0.2s ease;
        }

            .cu-item-link:hover {
                color: #ef3724 !important;
            }

        .cu-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            background-color: #ef3724;
            color: #ffffff !important;
            padding: 0.85rem 2rem;
            border-radius: 6px;
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 700;
            font-size: 0.95rem;
            text-decoration: none !important;
            box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25);
            transition: all 0.25s ease;
            width: fit-content;
        }

            .cu-btn:hover {
                background-color: #d62828;
                color: #ffffff !important;
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(239, 55, 36, 0.35);
            }

        @media (max-width: 991.98px) {
            .cu-row {
                flex-direction: column;
            }

            .cu-img-col {
                flex: 0 0 100%;
                max-width: 100%;
                padding-right: 0 !important;
                margin-bottom: 2rem;
            }

            .cu-campus-img {
                height: 240px;
            }

            .cu-content-col {
                flex: 0 0 100%;
                max-width: 100%;
                padding-left: 0 !important;
            }
        }
    </style>
    <section id="connectSection">
        <div class="cu-container">
            <div class="cu-row">

                <!-- Left: 50% Campus Image -->
                <div class="cu-img-col">
                    <img src="assets/images/rku_campus_main_building.png" alt="RK University Campus" class="cu-campus-img" onerror="this.src='assets/images/slider_1.jpg';" loading="lazy" decoding="async" />
                </div>

                <!-- Right: 50% Content -->
                <div class="cu-content-col">
                    <h3 class="cu-title">Contact Us</h3>
                    <p class="cu-subtitle">We're here to help you with your career journey.</p>

                    <div class="cu-items-list" id="aboutContactDetails">
                        <div class="cu-item">
                            <div class="cu-icon-box"><i class="fa-solid fa-location-dot"></i></div>
                            <span class="cu-item-text">RK University, Rajkot - 360020, Gujarat, India</span>
                        </div>
                        <div class="cu-item">
                            <div class="cu-icon-box"><i class="fa-solid fa-phone"></i></div>
                            <a href="tel:+919876543210" class="cu-item-text cu-item-link">+91 98765 43210</a>
                        </div>
                        <div class="cu-item">
                            <div class="cu-icon-box"><i class="fa-regular fa-envelope"></i></div>
                            <a href="mailto:placement@rku.ac.in" class="cu-item-text cu-item-link">placement@rku.ac.in</a>
                        </div>
                    </div>

                    <div>
                        <a href="Contact.aspx" class="cu-btn" id="btnGetInTouch">Get in Touch <i class="fa-solid fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>


<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="About RK University Placement Cell - Connecting talented students with leading recruiters and career opportunities. Learn about our vision, mission, team, and placement processes.">
        <meta name="keywords" content="RK University, Placement Cell, Placement Team, University Mission, Career Counseling, Placement Process, Recruiters Partner">
        <meta name="author" content="RK University">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">
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
                            <a class="nav-link active" aria-current="page" href="About.aspx" id="navAbout">About Us</a>
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



