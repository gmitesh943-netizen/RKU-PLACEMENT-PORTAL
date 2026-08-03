<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentApplications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Applications | RK University Placement Portal</title>
        <meta name="description" content="Track all placement applications and progress in the RK University Student Panel.">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/student-panel.css" rel="stylesheet">
    </head>
    <body data-student-page="applications">
        <script src="js/portal-db.js"></script>
        <div class="wrapper">
            <aside class="sidebar" id="sidebar">
                <div>
                    <div class="sidebar-brand d-flex align-items-center">
                        <img src="assets/images/white logo rku.png" alt="RK University" class="me-2" style="height: 150px; width: auto; max-width: 200px; object-fit: contain;">
                    </div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-item" data-page="overview"><a href="StudentDashboard.aspx"><i class="fa-solid fa-gauge"></i>Overview</a></li>
                        <li class="sidebar-item" data-page="profile"><a href="StudentProfile.aspx"><i class="fa-regular fa-user"></i>My Profile</a></li>
                        <li class="sidebar-item" data-page="drives"><a href="StudentDrives.aspx"><i class="fa-regular fa-building"></i>Campus Drives</a></li>
                        <li class="sidebar-item active" data-page="applications"><a href="StudentApplications.aspx"><i class="fa-solid fa-briefcase"></i>My Applications</a></li>
                        <li class="sidebar-item" data-page="training"><a href="StudentTraining.aspx"><i class="fa-solid fa-graduation-cap"></i>Training Hub</a></li>
                    </ul>
                </div>
                <div class="sidebar-footer">
                    <a href="#" class="btn btn-outline-light btn-sm w-100 py-2 border-0" onclick="handleLogout()"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign Out</a>
                </div>
            </aside>

            <div class="main-panel">
                <header class="top-navbar d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <button class="btn btn-sm d-lg-none me-3 fs-4 border-0" id="sidebarToggleBtn"><i class="fa-solid fa-bars"></i></button>
                        <h4 class="mb-0 text-dark fw-bold page-title" id="panelTitle">My Applications</h4>
                    </div>
                    <div class="d-flex align-items-center gap-3">
                        <div class="dropdown">
                            <button class="btn border-0 position-relative p-2" type="button" data-bs-toggle="dropdown">
                                <i class="fa-regular fa-bell fs-5"></i>
                                <span class="position-absolute top-0 start-100 translate-middle p-1 bg-rku-red border border-light rounded-circle d-none" id="notifBadge"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end p-2" id="notificationDropdownList" style="width: 320px;"></ul>
                        </div>
                        <span class="vertical-divider mx-2 d-none d-sm-block" style="border-left: 1px solid #cbd5e1; height: 24px;"></span>
                        <div class="d-flex align-items-center text-end">
                            <div class="d-none d-sm-block me-2">
                                <div class="fw-semibold text-dark" id="headerStudentName">Student Name</div>
                                <div class="text-muted small" id="headerStudentEnroll">Enrollment No</div>
                            </div>
                            <div class="avatar-circle bg-rku-maroon text-white fw-bold rounded-circle d-flex align-items-center justify-content-center" id="avatarBadge" style="width: 40px; height: 40px; font-size: 1rem;">SP</div>
                        </div>
                    </div>
                </header>

                <main class="content-container">
                    <div class="dashboard-card">
                        <h5 class="fw-bold mb-4">Track Application Status</h5>
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th style="font-family: var(--font-heading);">Drive Details</th>
                                        <th style="font-family: var(--font-heading);">Package</th>
                                        <th style="font-family: var(--font-heading);">Applied Date</th>
                                        <th style="font-family: var(--font-heading);">Status</th>
                                        <th style="font-family: var(--font-heading); text-align: center;">Actions / Progress</th>
                                    </tr>
                                </thead>
                                <tbody id="applicationsTableBody"></tbody>
                            </table>
                        </div>
                        <div id="emptyApplicationsState" class="text-center py-5 d-none">
                            <i class="fa-solid fa-folder-open text-muted mb-3" style="font-size: 3rem;"></i>
                            <h6 class="fw-bold text-dark">No Applications Yet</h6>
                            <p class="text-muted small">Go to the Campus Drives tab to apply for open job roles.</p>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <div class="modal fade" id="progressModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title fw-bold" id="progressModalTitle" style="font-family: var(--font-heading);">Application Tracker</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body py-4">
                        <div class="text-center mb-4">
                            <h4 class="fw-bold mb-1" id="trackCompany">Company</h4>
                            <p class="text-muted" id="trackRole">Software Engineer</p>
                        </div>
                        <div class="step-progress-container">
                            <div class="position-relative">
                                <div class="step-progress-bar-fill" id="modalProgressBarFill"></div>
                                <ul class="step-progress">
                                    <li class="step-progress-item" id="step-Applied">
                                        <div class="step-progress-dot">1</div>
                                        <div class="step-progress-label">Applied</div>
                                    </li>
                                    <li class="step-progress-item" id="step-Shortlisted">
                                        <div class="step-progress-dot">2</div>
                                        <div class="step-progress-label">Shortlisted</div>
                                    </li>
                                    <li class="step-progress-item" id="step-Technical">
                                        <div class="step-progress-dot">3</div>
                                        <div class="step-progress-label">Technical Round</div>
                                    </li>
                                    <li class="step-progress-item" id="step-HR">
                                        <div class="step-progress-dot">4</div>
                                        <div class="step-progress-label">HR Round</div>
                                    </li>
                                    <li class="step-progress-item" id="step-Final">
                                        <div class="step-progress-dot" id="finalDot"><i class="fa-solid fa-check"></i></div>
                                        <div class="step-progress-label" id="finalLabel">Offer Issued</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card bg-light border-0 mt-4">
                            <div class="card-body">
                                <h6 class="fw-bold mb-2 font-heading">Current Status Description</h6>
                                <p class="mb-0 small text-muted" id="modalStatusDetails">Loading status description...</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/student-panel.js"></script>
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

