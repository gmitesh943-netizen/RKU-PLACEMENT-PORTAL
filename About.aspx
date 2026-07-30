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
            renderPlacementTeamSection();

            if (recruitersTrack && companies.length > 0) {
                let trackHtml = '';
                const marqueeCompanies = companies.slice(0, 10);

                const createMarqueeItems = () => {
                    return marqueeCompanies.map(c => `
                        <div class="recruiter-logo-card d-flex align-items-center justify-content-center" style="width:150px; height:80px; padding:10px;">
                            ${c.logoBase64
                            ? `<img src="${c.logoBase64}" alt="${c.name}" style="max-width:100%; max-height:100%; object-fit:contain;">`
                            : `<span style="font-family: var(--font-heading); font-weight:bold; font-size:1.2rem; color: var(--rku-dark); text-align:center;">${c.name}</span>`
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
    <section class="py-5" id="missionVisionSection" style="background: #f8f9fa;">
        <div class="container px-lg-5">

            <!-- Centered Title with red underline -->
            <div class="text-center mb-5">
                <h2 class="fw-bold" style="font-family: var(--font-heading); font-size: 1.9rem; color: var(--rku-dark);">Our Mission &amp; Vision</h2>
                <div style="width: 48px; height: 3px; background: var(--rku-red); border-radius: 2px; margin: 0.6rem auto 0;"></div>
            </div>

            <div class="row g-4 align-items-stretch">

                <!-- Col 1: Vision Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="mv-card text-center h-100" id="visionCard">
                        <!-- Eye Icon -->
                        <div class="mv-icon-circle mb-3 mx-auto">
                            <i class="fa-regular fa-eye"></i>
                        </div>
                        <h4 class="mv-card-title">Our Vision</h4>
                        <p class="mv-card-text">To become a leading university placement ecosystem that bridges academic excellence with industry requirements and creates globally competent professionals.</p>
                    </div>
                </div>

                <!-- Col 2: Mission Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="mv-card text-center h-100" id="missionCard">
                        <!-- Target Icon -->
                        <div class="mv-icon-circle mb-3 mx-auto">
                            <i class="fa-solid fa-bullseye"></i>
                        </div>
                        <h4 class="mv-card-title">Our Mission</h4>
                        <ul class="mv-mission-list text-start">
                            <li><span class="mv-dot"></span>Deliver industry-ready graduates</li>
                            <li><span class="mv-dot"></span>Build strong corporate partnerships</li>
                            <li><span class="mv-dot"></span>Provide skill-based training</li>
                            <li><span class="mv-dot"></span>Offer career guidance &amp; mentorship</li>
                            <li><span class="mv-dot"></span>Ensure placement assistance and continuous support</li>
                        </ul>
                    </div>
                </div>

                <!-- Col 3: Student Photo -->
                <div class="col-lg-4 col-md-12">
                    <div class="mv-photo-wrap h-100" id="missionVisionImageWrapper">
                        <img src="assets/images/mission_library.jpg" alt="RK University Students Collaborating" id="imgMissionVision">
                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- ==========================================
         5. WHAT WE OFFER
         ========================================== -->
    <section class="py-5 bg-white" id="offeringsSection">
        <div class="container px-lg-5">
            <h2 class="section-title text-center mb-5" style="display: table; margin: 0 auto;">What We Offer</h2>

            <div class="row g-3 mt-2 row-cols-xl-6 row-cols-lg-3 row-cols-md-2 row-cols-1">
                <!-- Card 1 -->
                <div class="col">
                    <div class="stat-card text-center py-4 h-100" id="offerCard1">
                        <div class="stat-card-icon-box mx-auto"><i class="fa-solid fa-graduation-cap"></i></div>
                        <h4 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 1rem;">Placement Drives</h4>
                        <p class="text-muted mb-0" style="font-size: 0.82rem;">Opportunities with top recruiters through campus drives.</p>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col">
                    <div class="stat-card text-center py-4 h-100" id="offerCard2">
                        <div class="stat-card-icon-box mx-auto"><i class="fa-solid fa-business-time"></i></div>
                        <h4 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 1rem;">Internship Programs</h4>
                        <p class="text-muted mb-0" style="font-size: 0.82rem;">Industry exposure before graduation to build real-world skills.</p>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="col">
                    <div class="stat-card text-center py-4 h-100" id="offerCard3">
                        <div class="stat-card-icon-box mx-auto"><i class="fa-solid fa-brain"></i></div>
                        <h4 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 1rem;">Aptitude Training</h4>
                        <p class="text-muted mb-0" style="font-size: 0.82rem;">Specialized training for competitive exams and assessments.</p>
                    </div>
                </div>
                <!-- Card 4 -->
                <div class="col">
                    <div class="stat-card text-center py-4 h-100" id="offerCard4">
                        <div class="stat-card-icon-box mx-auto"><i class="fa-regular fa-file-lines"></i></div>
                        <h4 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 1rem;">Resume Building</h4>
                        <p class="text-muted mb-0" style="font-size: 0.82rem;">Create impactful resumes that stand out to recruiters.</p>
                    </div>
                </div>
                <!-- Card 5 -->
                <div class="col">
                    <div class="stat-card text-center py-4 h-100" id="offerCard5">
                        <div class="stat-card-icon-box mx-auto"><i class="fa-solid fa-user-group"></i></div>
                        <h4 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 1rem;">Mock Interviews</h4>
                        <p class="text-muted mb-0" style="font-size: 0.82rem;">Practice sessions with experts to boost your confidence.</p>
                    </div>
                </div>
                <!-- Card 6 -->
                <div class="col">
                    <div class="stat-card text-center py-4 h-100" id="offerCard6">
                        <div class="stat-card-icon-box mx-auto"><i class="fa-solid fa-user-tie"></i></div>
                        <h4 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 1rem;">Career Counseling</h4>
                        <p class="text-muted mb-0" style="font-size: 0.82rem;">Personalized guidance to help you achieve your career goals.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         6. PLACEMENT SUCCESS STORIES
         ========================================== -->
    <section class="py-5" id="placementSuccessSection">
        <div class="container px-lg-5">
            <div class="pss-navy-box" id="successNavyBox">

                <!-- Header -->
                <div class="pss-header" id="pssHeader">
                    <h2 class="pss-title">Placement Success Stories</h2>
                    <a href="SuccessStories.aspx" class="pss-view-all" id="linkViewAllStoriesNavy">View All Stories <i class="fa-solid fa-arrow-right ms-1"></i>
                    </a>
                </div>

                <!-- 3 Cards Row -->
                <div class="row g-4 mt-1">

                    <!-- Student 1: Krish Patel -->
                    <div class="col-lg-4 col-md-6">
                        <div class="pss-card" id="studentCard1">
                            <!-- Photo -->
                            <div class="pss-photo-col">
                                <img src="assets/images/student_new_1.png" alt="Krishna" class="pss-photo">
                            </div>
                            <!-- Info -->
                            <div class="pss-info-col">
                                <div class="pss-name">Krishna</div>
                                <div class="pss-course">BCA</div>
                                <div class="pss-placed-label">Placed at</div>
                                <!-- TCS Logo SVG -->
                                <svg viewBox="0 0 220 55" class="pss-logo" aria-label="TCS">
                                    <text x="2" y="38" font-family="Arial,sans-serif" font-weight="900" font-size="38" fill="#ef3724">tcs</text>
                                    <text x="60" y="22" font-family="Arial,sans-serif" font-weight="700" font-size="8" fill="#fff" letter-spacing="1">TATA CONSULTANCY</text>
                                    <text x="60" y="33" font-family="Arial,sans-serif" font-weight="700" font-size="8" fill="#fff" letter-spacing="1">SERVICES</text>
                                </svg>
                            </div>
                            <!-- Red Footer -->
                            <div class="pss-pkg-footer">
                                <div class="pss-pkg-num">12 LPA</div>
                                <div class="pss-pkg-label">Package</div>
                            </div>
                        </div>
                    </div>

                    <!-- Student 2: Disha Shah -->
                    <div class="col-lg-4 col-md-6">
                        <div class="pss-card" id="studentCard2">
                            <!-- Photo -->
                            <div class="pss-photo-col">
                                <img src="assets/images/student_new_2.png" alt="Disha Shah" class="pss-photo">
                            </div>
                            <!-- Info -->
                            <div class="pss-info-col">
                                <div class="pss-name">Disha Shah</div>
                                <div class="pss-course">MCA</div>
                                <div class="pss-placed-label">Placed at</div>
                                <!-- Infosys Logo SVG -->
                                <svg viewBox="0 0 200 45" class="pss-logo" aria-label="Infosys">
                                    <text x="2" y="36" font-family="Arial,sans-serif" font-weight="800" font-size="34" fill="#fff" letter-spacing="-1">Infosys</text>
                                </svg>
                            </div>
                            <!-- Red Footer -->
                            <div class="pss-pkg-footer">
                                <div class="pss-pkg-num">9 LPA</div>
                                <div class="pss-pkg-label">Package</div>
                            </div>
                        </div>
                    </div>

                    <!-- Student 3: Harshil Mehta -->
                    <div class="col-lg-4 col-md-6">
                        <div class="pss-card" id="studentCard3">
                            <!-- Photo -->
                            <div class="pss-photo-col">
                                <img src="assets/images/student_new_3.png" alt="Harshil Mehta" class="pss-photo">
                            </div>
                            <!-- Info -->
                            <div class="pss-info-col">
                                <div class="pss-name">Harshil Mehta</div>
                                <div class="pss-course">B.Tech IT</div>
                                <div class="pss-placed-label">Placed at</div>
                                <!-- Wipro Logo SVG -->
                                <svg viewBox="0 0 180 45" class="pss-logo" aria-label="Wipro">
                                    <circle cx="14" cy="22" r="12" fill="none" stroke="#9b59b6" stroke-width="3" />
                                    <circle cx="14" cy="22" r="6" fill="#9b59b6" />
                                    <text x="30" y="32" font-family="Arial,sans-serif" font-weight="700" font-size="26" fill="#fff">wipro</text>
                                </svg>
                            </div>
                            <!-- Red Footer -->
                            <div class="pss-pkg-footer">
                                <div class="pss-pkg-num">8 LPA</div>
                                <div class="pss-pkg-label">Package</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>



    <section class="py-5 bg-white" id="processSection">
        <div class="container px-lg-5">

            <!-- Centered Header with Red Underline -->
            <div class="text-center mb-5">
                <h2 class="fw-bold" style="font-family: var(--font-heading); font-size: 1.9rem; color: var(--rku-dark);">Our Placement Process</h2>
                <div style="width: 48px; height: 3px; background: var(--rku-red); border-radius: 2px; margin: 0.6rem auto 0;"></div>
            </div>

            <div class="process-timeline mt-4" id="aboutProcessTimeline">
                <div class="row g-0 justify-content-between position-relative">

                    <!-- Step 1 -->
                    <div class="col" style="flex: 1; text-align: center; position: relative; z-index: 2;">
                        <div class="process-step">
                            <div class="process-dot" style="width: 50px; height: 50px; border-radius: 50%; border: 1.5px solid #cbd5e1; display: inline-flex; align-items: center; justify-content: center; background: #fff; margin-bottom: 0.75rem;">
                                <i class="fa-regular fa-clipboard" style="color: var(--rku-red); font-size: 1.1rem;"></i>
                            </div>
                            <div class="process-num" style="font-family: var(--font-heading); font-weight: 800; font-size: 0.85rem; color: var(--rku-dark); margin-bottom: 0.2rem;">01</div>
                            <div class="process-label" style="font-size: 0.7rem; font-weight: 600; color: #475569; line-height: 1.2;">Registration</div>
                        </div>
                    </div>

                    <!-- Step 2 -->
                    <div class="col" style="flex: 1; text-align: center; position: relative; z-index: 2;">
                        <div class="process-step">
                            <div class="process-dot" style="width: 50px; height: 50px; border-radius: 50%; border: 1.5px solid #cbd5e1; display: inline-flex; align-items: center; justify-content: center; background: #fff; margin-bottom: 0.75rem;">
                                <i class="fa-regular fa-id-card" style="color: var(--rku-red); font-size: 1.1rem;"></i>
                            </div>
                            <div class="process-num" style="font-family: var(--font-heading); font-weight: 800; font-size: 0.85rem; color: var(--rku-dark); margin-bottom: 0.2rem;">02</div>
                            <div class="process-label" style="font-size: 0.7rem; font-weight: 600; color: #475569; line-height: 1.2;">Profile Comp.</div>
                        </div>
                    </div>

                    <!-- Step 3 -->
                    <div class="col" style="flex: 1; text-align: center; position: relative; z-index: 2;">
                        <div class="process-step">
                            <div class="process-dot" style="width: 50px; height: 50px; border-radius: 50%; border: 1.5px solid #cbd5e1; display: inline-flex; align-items: center; justify-content: center; background: #fff; margin-bottom: 0.75rem;">
                                <i class="fa-solid fa-list-check" style="color: var(--rku-red); font-size: 1.1rem;"></i>
                            </div>
                            <div class="process-num" style="font-family: var(--font-heading); font-weight: 800; font-size: 0.85rem; color: var(--rku-dark); margin-bottom: 0.2rem;">03</div>
                            <div class="process-label" style="font-size: 0.7rem; font-weight: 600; color: #475569; line-height: 1.2;">Eligibility</div>
                        </div>
                    </div>

                    <!-- Step 4 -->
                    <div class="col" style="flex: 1; text-align: center; position: relative; z-index: 2;">
                        <div class="process-step">
                            <div class="process-dot" style="width: 50px; height: 50px; border-radius: 50%; border: 1.5px solid #cbd5e1; display: inline-flex; align-items: center; justify-content: center; background: #fff; margin-bottom: 0.75rem;">
                                <i class="fa-solid fa-paper-plane" style="color: var(--rku-red); font-size: 1.1rem;"></i>
                            </div>
                            <div class="process-num" style="font-family: var(--font-heading); font-weight: 800; font-size: 0.85rem; color: var(--rku-dark); margin-bottom: 0.2rem;">04</div>
                            <div class="process-label" style="font-size: 0.7rem; font-weight: 600; color: #475569; line-height: 1.2;">Apply</div>
                        </div>
                    </div>

                    <!-- Step 5 -->
                    <div class="col" style="flex: 1; text-align: center; position: relative; z-index: 2;">
                        <div class="process-step">
                            <div class="process-dot" style="width: 50px; height: 50px; border-radius: 50%; border: 1.5px solid #cbd5e1; display: inline-flex; align-items: center; justify-content: center; background: #fff; margin-bottom: 0.75rem;">
                                <i class="fa-regular fa-comments" style="color: var(--rku-red); font-size: 1.1rem;"></i>
                            </div>
                            <div class="process-num" style="font-family: var(--font-heading); font-weight: 800; font-size: 0.85rem; color: var(--rku-dark); margin-bottom: 0.2rem;">05</div>
                            <div class="process-label" style="font-size: 0.7rem; font-weight: 600; color: #475569; line-height: 1.2;">Interviews</div>
                        </div>
                    </div>

                    <!-- Step 6 -->
                    <div class="col" style="flex: 1; text-align: center; position: relative; z-index: 2;">
                        <div class="process-step">
                            <div class="process-dot" style="width: 50px; height: 50px; border-radius: 50%; border: 1.5px solid #cbd5e1; display: inline-flex; align-items: center; justify-content: center; background: #fff; margin-bottom: 0.75rem;">
                                <i class="fa-solid fa-award" style="color: var(--rku-red); font-size: 1.1rem;"></i>
                            </div>
                            <div class="process-num" style="font-family: var(--font-heading); font-weight: 800; font-size: 0.85rem; color: var(--rku-dark); margin-bottom: 0.2rem;">06</div>
                            <div class="process-label" style="font-size: 0.7rem; font-weight: 600; color: #475569; line-height: 1.2;">Selection</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>


    <section class="py-5 bg-white" id="whyRecruitersSection">
        <div class="container px-lg-5">
            <div class="row g-5 align-items-center">
                <!-- Left info -->
                <div class="col-lg-4">
                    <h2 class="fw-bold mb-3" style="font-family: var(--font-heading); font-size: 2.2rem; color: var(--rku-dark);">Why Recruiters Choose RK University?</h2>
                    <p class="text-muted mb-4" style="font-size: 0.95rem; line-height: 1.6;">Empowering students with industry-ready, skilled, and prepared to contribute from day one.</p>
                    <button class="btn btn-rku" id="btnPartnerWithUs">Partner With Us <i class="fa-solid fa-arrow-right ms-2"></i></button>
                </div>

                <!-- Middle stats grid -->
                <div class="col-lg-5">
                    <div class="row g-0" style="border-left: 1px solid #e2e8f0;">

                        <div class="col-6" style="border-bottom: 1px solid #e2e8f0; padding: 1.5rem;">
                            <h3 class="fw-bold mb-1 counter-value" data-target="5000" style="color: var(--rku-dark); font-family: var(--font-heading);">0</h3>
                            <div class="text-muted small fw-semibold">Students Placed</div>
                        </div>

                        <div class="col-6" style="border-bottom: 1px solid #e2e8f0; border-left: 1px solid #e2e8f0; padding: 1.5rem;">
                            <h3 class="fw-bold mb-1 counter-value" data-target="300" style="color: var(--rku-dark); font-family: var(--font-heading);">0</h3>
                            <div class="text-muted small fw-semibold">Recruiters</div>
                        </div>

                        <div class="col-6" style="border-bottom: 1px solid #e2e8f0; padding: 1.5rem;">
                            <h3 class="fw-bold mb-1 counter-value" data-target="85" data-target-type="percent" style="color: var(--rku-dark); font-family: var(--font-heading);">0</h3>
                            <div class="text-muted small fw-semibold">Placement Rate</div>
                        </div>

                        <div class="col-6" style="border-bottom: 1px solid #e2e8f0; border-left: 1px solid #e2e8f0; padding: 1.5rem;">
                            <h3 class="fw-bold mb-1 counter-value" data-target="20" data-target-type="currency" style="color: var(--rku-dark); font-family: var(--font-heading);">0</h3>
                            <div class="text-muted small fw-semibold">Highest Package</div>
                        </div>

                        <div class="col-6" style="padding: 1.5rem;">
                            <h3 class="fw-bold mb-1" style="font-size: 1.4rem; font-family: var(--font-heading); color: var(--rku-dark);">Industry Oriented</h3>
                            <div class="text-muted small fw-semibold">Curriculum</div>
                        </div>

                        <div class="col-6" style="border-left: 1px solid #e2e8f0; padding: 1.5rem;">
                            <h3 class="fw-bold mb-1" style="font-size: 1.4rem; font-family: var(--font-heading); color: var(--rku-dark);">Corporate Training</h3>
                            <div class="text-muted small fw-semibold">Programs</div>
                        </div>

                    </div>
                </div>

                <!-- Right image block -->
                <div class="col-lg-3 d-none d-lg-block">
                    <img src="assets/images/slider_1.jpg" alt="RK University Campus Placements Class" class="w-100 why-recruiters-img" style="border-radius: 12px; height: 100%; min-height: 250px; object-fit: cover; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);">
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         9. TOP RECRUITERS
         ========================================== -->
    <section class="py-5 bg-white" id="aboutRecruitersMarquee">
        <div class="container-fluid px-lg-5">
            <!-- Reuse marquee from home -->
            <div class="recruiters-marquee">
                <div class="recruiters-track" id="aboutRecruitersTrack">
                    <!-- TCS -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="120" height="40">
                            <path d="M20,15 L50,15 L50,25 L38,25 L38,65 L28,65 L28,25 L20,25 Z" fill="#1b365d" />
                            <path d="M70,15 C85,15 95,25 95,40 C95,55 85,65 70,65 C55,65 45,55 45,40 C45,25 55,15 70,15 Z M70,25 C60,25 56,31 56,40 C56,49 60,55 70,55 C80,55 84,49 84,40 C84,31 80,25 70,25 Z" fill="#1b365d" />
                            <path d="M100,50 L110,50 C112,56 117,60 124,60 C130,60 134,57 134,53 C134,49 131,47 121,45 C109,42 102,38 102,28 C102,18 111,13 124,13 C136,13 144,19 146,29 L136,29 C134,23 130,20 124,20 C118,20 114,23 114,27 C114,31 118,33 127,35 C139,38 146,41 146,51 C146,62 137,67 124,67 C111,67 102,61 100,50 Z" fill="#1b365d" />
                            <text x="25" y="76" font-family="sans-serif" font-weight="bold" font-size="8" fill="#ef3724" letter-spacing="3">TATA</text>
                        </svg>
                    </div>
                    <!-- Infosys -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="120" height="40">
                            <text x="10" y="55" font-family="'Outfit', sans-serif" font-weight="800" font-size="42" fill="#007cc3" letter-spacing="-1">Infosys</text>
                            <path d="M165,25 L180,25 L180,30 L165,30 Z" fill="#ef3724" />
                        </svg>
                    </div>
                    <!-- Wipro -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="120" height="40">
                            <circle cx="60" cy="40" r="25" fill="none" stroke="#253858" stroke-width="4" />
                            <text x="95" y="48" font-family="'Outfit', sans-serif" font-weight="700" font-size="28" fill="#253858">wipro</text>
                        </svg>
                    </div>
                    <!-- Capgemini -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="140" height="40">
                            <path d="M20,40 C20,30 30,20 40,20 C50,20 60,30 60,40 C60,50 50,60 40,60 C30,60 20,50 20,40 Z" fill="#0070ad" />
                            <text x="70" y="50" font-family="sans-serif" font-weight="bold" font-size="24" fill="#0070ad">Capgemini</text>
                        </svg>
                    </div>
                    <!-- Accenture -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="120" height="40">
                            <text x="20" y="50" font-family="sans-serif" font-weight="bold" font-size="32" fill="#000000">accenture</text>
                        </svg>
                    </div>
                    <!-- HCL -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="120" height="40">
                            <text x="40" y="55" font-family="sans-serif" font-weight="900" font-size="52" fill="#002d72" italic="true">HCL</text>
                        </svg>
                    </div>
                    <!-- Cognizant -->
                    <div class="recruiter-logo-card">
                        <svg viewBox="0 0 200 80" width="140" height="40">
                            <text x="20" y="50" font-family="sans-serif" font-weight="bold" font-size="24" fill="#003366">Cognizant</text>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         10. OUR PLACEMENT TEAM
         ========================================== -->
    <section class="py-5" id="placementTeamSection">
        <div class="container px-lg-5 placement-team-section">
            <div class="team-section-intro">
                <span class="team-pill"><i class="fa-solid fa-users"></i>Placement Team</span>
                <h2 class="section-title text-center mb-3" style="display: table; margin: 0 auto;">Our Placement Team</h2>
                <p class="mb-0">
                    Meet the dedicated team behind student preparation, recruiter coordination, and
                    placement support at RK University. The layout is designed to stay clean,
                    modern, and responsive on every screen.
                </p>
            </div>

            <div class="row g-4 align-items-start mt-2" id="placementTeamBoard">
                <div class="col-lg-4">
                    <div id="teamFeaturedMember"></div>
                </div>
                <div class="col-lg-8">
                    <div class="row g-3 g-xl-4" id="teamMiniMembers"></div>
                </div>
            </div>
        </div>
    </section>


    <!-- ==========================================
         11. CONNECT WITH US & HELP CARD
         ========================================== -->
    <section class="py-5 bg-white" id="connectSection">
        <div class="container px-lg-5">
            <div class="row g-5 align-items-center">

                <!-- Left: Contact Details -->
                <div class="col-lg-6">
                    <h2 class="fw-bold mb-4" style="font-family: var(--font-heading);">Connect With Us</h2>

                    <div class="d-flex flex-column gap-4" id="aboutContactDetails">
                        <!-- Visit Us -->
                        <div class="d-flex align-items-start gap-3">
                            <div class="text-rku-red fs-3 mt-1"><i class="fa-solid fa-location-dot"></i></div>
                            <div>
                                <h5 class="fw-bold mb-1" style="font-family: var(--font-heading);">Visit Us</h5>
                                <p class="text-muted mb-0" style="font-size: 0.95rem;">RK University, Rajkot - 360020, Gujarat, India</p>
                            </div>
                        </div>

                        <!-- Email Us -->
                        <div class="d-flex align-items-start gap-3">
                            <div class="text-rku-red fs-3 mt-1"><i class="fa-regular fa-envelope"></i></div>
                            <div>
                                <h5 class="fw-bold mb-1" style="font-family: var(--font-heading);">Email Us</h5>
                                <a href="mailto:placement@rku.ac.in" class="text-rku-maroon fw-semibold" style="font-size: 0.95rem;">placement@rku.ac.in</a>
                            </div>
                        </div>

                        <!-- Call Us -->
                        <div class="d-flex align-items-start gap-3">
                            <div class="text-rku-red fs-3 mt-1"><i class="fa-solid fa-phone"></i></div>
                            <div>
                                <h5 class="fw-bold mb-1" style="font-family: var(--font-heading);">Call Us</h5>
                                <p class="text-muted mb-0" style="font-size: 0.95rem;">
                                    +91 98765 43210<br>
                                    <span class="small">(Mon - Sat: 9:00 AM - 5:00 PM)</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right: Floating Help Box -->
                <div class="col-lg-6">
                    <div class="help-desk-banner" id="helpDeskBanner">
                        <div class="help-desk-info">
                            <h4 class="fw-bold text-dark mb-2" style="font-family: var(--font-heading);">We are here to help you!</h4>
                            <p class="text-muted mb-4" style="font-size: 0.88rem;">Our team is always ready to assist you with placements and career guidance.</p>
                            <button class="btn btn-rku" id="btnHelpContact">Contact Placement Office <i class="fa-solid fa-arrow-right ms-2"></i></button>
                        </div>
                        <img src="assets/images/hr_representative.png" alt="RKU HR representative" class="help-desk-avatar" id="imgHrRepresentative">
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



