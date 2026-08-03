<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile | RK University Placement Portal</title>
        <meta name="description" content="Update academic, contact, certificates, and results details in the RK University Student Panel.">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/student-panel.css" rel="stylesheet">
    </head>
    <body data-student-page="profile">
        <script src="js/portal-db.js"></script>
        <div class="wrapper">
            <aside class="sidebar" id="sidebar">
                <div>
                    <div class="sidebar-brand d-flex align-items-center">
                        <img src="assets/images/white logo rku.png" alt="RK University" class="me-2" style="height: 150px; width: auto; max-width: 200px; object-fit: contain;">
                    </div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-item" data-page="overview"><a href="StudentDashboard.aspx"><i class="fa-solid fa-gauge"></i>Overview</a></li>
                        <li class="sidebar-item active" data-page="profile"><a href="StudentProfile.aspx"><i class="fa-regular fa-user"></i>My Profile</a></li>
                        <li class="sidebar-item" data-page="drives"><a href="StudentDrives.aspx"><i class="fa-regular fa-building"></i>Campus Drives</a></li>
                        <li class="sidebar-item" data-page="applications"><a href="StudentApplications.aspx"><i class="fa-solid fa-briefcase"></i>My Applications</a></li>
                        <li class="sidebar-item" data-page="training"><a href="StudentTraining.aspx"><i class="fa-solid fa-graduation-cap"></i>Training Hub</a></li>
                    </ul>
                </div>
                <div class="sidebar-footer">
                    <a href="#" class="btn btn-outline-light btn-sm w-100 py-2 border-0" onclick="handleLogout()">
                        <i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign Out
                    </a>
                </div>
            </aside>

            <div class="main-panel">
                <header class="top-navbar d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <button class="btn btn-sm d-lg-none me-3 fs-4 border-0" id="sidebarToggleBtn"><i class="fa-solid fa-bars"></i></button>
                        <h4 class="mb-0 text-dark fw-bold page-title" id="panelTitle">My Profile</h4>
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
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="dashboard-card">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h5 class="fw-bold mb-0">Update Academic &amp; Contact Details</h5>
                                    <button class="btn btn-rku btn-sm" onclick="saveStudentProfile()"><i class="fa-regular fa-floppy-disk me-1"></i>Save Changes</button>
                                </div>
                                <div id="studentProfileForm">
                                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2">Profile Photo &amp; Personal Info</h6>
                                    <div class="d-flex align-items-center gap-4 mb-4 p-3 bg-light rounded-3 border">
                                        <div class="position-relative">
                                            <div id="profPhotoContainer" class="rounded-circle overflow-hidden bg-rku-maroon text-white fw-bold d-flex align-items-center justify-content-center border border-2 border-white shadow-sm profile-photo-shell">
                                                <img id="profPhotoPreview" src="" alt="Profile" style="display: none;">
                                                <span id="profPhotoInitials">SP</span>
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="fw-bold mb-1">Profile Photo</h6>
                                            <p class="text-muted small mb-2">Upload your formal profile picture (JPG, PNG)</p>
                                            <div class="d-flex gap-2">
                                                <label for="profPhotoInput" class="btn btn-outline-primary btn-sm mb-0"><i class="fa-solid fa-camera me-1"></i>Choose Photo</label>
                                                <input type="file" id="profPhotoInput" class="d-none" accept="image/*" onchange="previewStudentPhoto(this)">
                                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="removeStudentPhoto()"><i class="fa-solid fa-trash-can"></i>Remove</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row g-3 mb-4">
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-bold">Full Name</label><input type="text" class="form-control" id="profName" required></div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-bold">Enrollment / Roll No.</label><input type="text" class="form-control" id="profEnroll" disabled></div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-bold">Email Address</label><input type="email" class="form-control" id="profEmail" required></div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-bold">Mobile Number</label><input type="tel" class="form-control" id="profMobile" required></div>
                                    </div>

                                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2">Academic Information</h6>
                                    <div class="row g-3 mb-4">
                                        <div class="col-md-4">
                                            <label class="form-label text-muted small fw-bold">Degree Program</label><select class="form-select" id="profDegree"><option value="B.Tech">B.Tech</option>
                                                <option value="M.Tech">M.Tech</option>
                                                <option value="BCA">BCA</option>
                                                <option value="MCA">MCA</option>
                                                <option value="MBA">MBA</option>
                                                <option value="B.Sc">B.Sc</option>
                                            </select></div>
                                        <div class="col-md-4">
                                            <label class="form-label text-muted small fw-bold">Branch / Specialization</label><select class="form-select" id="profBranch"><option value="Computer Engineering">Computer Engineering</option>
                                                <option value="Information Technology">Information Technology</option>
                                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                                <option value="Civil Engineering">Civil Engineering</option>
                                                <option value="Marketing">Marketing</option>
                                                <option value="Finance">Finance</option>
                                                <option value="Human Resources">Human Resources</option>
                                            </select></div>
                                        <div class="col-md-4">
                                            <label class="form-label text-muted small fw-bold">Current Semester</label><select class="form-select" id="profSemester"><option value="1st">1st Sem</option>
                                                <option value="2nd">2nd Sem</option>
                                                <option value="3rd">3rd Sem</option>
                                                <option value="4th">4th Sem</option>
                                                <option value="5th">5th Sem</option>
                                                <option value="6th">6th Sem</option>
                                                <option value="7th">7th Sem</option>
                                                <option value="8th">8th Sem</option>
                                            </select></div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-bold">Cumulative GPA (CGPA)</label><input type="number" step="0.01" min="0" max="10" class="form-control" id="profCgpa" required></div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-bold">Active Backlogs</label><input type="number" min="0" class="form-control" id="profBacklogs" required></div>
                                    </div>

                                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2">Skills &amp; Resume</h6>
                                    <div class="row g-3 mb-4">
                                        <div class="col-md-12">
                                            <label class="form-label text-muted small fw-bold">Skills (comma-separated, e.g. Java, HTML, SEO)</label><input type="text" class="form-control" id="profSkills" placeholder="Enter skills separated by commas"></div>
                                        <div class="col-md-12">
                                            <label class="form-label text-muted small fw-bold">Uploaded Resume PDF Name</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa-solid fa-file-pdf text-rku-red"></i></span>
                                                <input type="text" class="form-control" id="profResume" placeholder="Resume_Filename.pdf">
                                                <button class="btn btn-outline-secondary" type="button" onclick="mockResumeUpload()"><i class="fa-solid fa-upload"></i>Upload Mock PDF</button>
                                            </div>
                                            <div class="form-text">For template demonstration, type a dummy filename or click the upload mock button.</div>
                                        </div>
                                    </div>

                                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2 d-flex justify-content-between align-items-center">
                                        <span><i class="fa-solid fa-certificate me-2"></i>Certificates &amp; Achievements</span>
                                        <button type="button" class="btn btn-outline-primary btn-sm" onclick="toggleCertificateForm()"><i class="fa-solid fa-plus me-1"></i>Add Certificate</button>
                                    </h6>
                                    <div id="certFormContainer" class="p-3 bg-light rounded-3 border mb-4" style="display: none;">
                                        <h6 class="fw-bold small mb-3 text-dark">Add New Certificate</h6>
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label class="form-label text-muted small fw-bold">Certificate Title</label><input type="text" class="form-control form-control-sm" id="certTitle" placeholder="e.g. AWS Certified Cloud Practitioner"></div>
                                            <div class="col-md-6">
                                                <label class="form-label text-muted small fw-bold">Issuing Organization</label><input type="text" class="form-control form-control-sm" id="certIssuer" placeholder="e.g. Coursera / Udemy / RKU"></div>
                                            <div class="col-md-6">
                                                <label class="form-label text-muted small fw-bold">Issue Date</label><input type="date" class="form-control form-control-sm" id="certDate"></div>
                                            <div class="col-md-6">
                                                <label class="form-label text-muted small fw-bold">Upload Certificate File / Image</label><input type="file" class="form-control form-control-sm" id="certFile" accept="image/*,.pdf"></div>
                                            <div class="col-12 text-end mt-3">
                                                <button type="button" class="btn btn-sm btn-secondary me-1" onclick="toggleCertificateForm()">Cancel</button>
                                                <button type="button" class="btn btn-sm btn-rku" onclick="addStudentCertificate()"><i class="fa-solid fa-plus me-1"></i>Save Certificate</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-3" id="certificatesList"></div>

                                    <h6 class="text-rku-maroon fw-bold mt-5 mb-3 border-bottom pb-2 d-flex justify-content-between align-items-center">
                                        <span><i class="fa-solid fa-file-lines me-2"></i>Results &amp; Mark Sheets</span>
                                        <button type="button" class="btn btn-outline-primary btn-sm" onclick="toggleResultForm()"><i class="fa-solid fa-plus me-1"></i>Add Result</button>
                                    </h6>
                                    <div id="resultFormContainer" class="p-3 bg-light rounded-3 border mb-4" style="display: none;">
                                        <h6 class="fw-bold small mb-3 text-dark">Add New Result</h6>
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label class="form-label text-muted small fw-bold">Semester / Subject</label><input type="text" class="form-control form-control-sm" id="resultTitle" placeholder="e.g. Semester 5 / Java Programming"></div>
                                            <div class="col-md-6">
                                                <label class="form-label text-muted small fw-bold">Upload Mark Sheet Image</label><input type="file" class="form-control form-control-sm" id="resultFile" accept="image/*"></div>
                                            <div class="col-12 text-end mt-3">
                                                <button type="button" class="btn btn-sm btn-secondary me-1" onclick="toggleResultForm()">Cancel</button>
                                                <button type="button" class="btn btn-sm btn-rku" onclick="addStudentResult()"><i class="fa-solid fa-plus me-1"></i>Save Result</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-3" id="resultsList"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
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

