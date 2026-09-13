<%@ Page Title="Student Directory | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyStudentDirectory.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyStudentDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="dashboard-card">
        <div class="row g-3 mb-4 justify-content-between align-items-center">
            <div class="col-md-5">
                <h5 class="fw-bold mb-0">Registered Student Directory</h5>
            </div>
            <div class="col-md-7 d-flex gap-2">
                <input type="text" class="form-control form-control-sm" id="studentSearchInput" placeholder="Search by name, roll, email..." onkeyup="filterStudentTable()">
                <select class="form-select form-select-sm" id="studentBranchFilter" onchange="filterStudentTable()" style="max-width: 180px;">
                    <option value="all">All Branches</option>
                    <option value="Computer Engineering">CE</option>
                    <option value="Information Technology">IT</option>
                    <option value="Mechanical Engineering">Mechanical</option>
                    <option value="Civil Engineering">Civil</option>
                    <option value="Marketing">MBA-Marketing</option>
                </select>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Enrollment</th>
                        <th>Student Details</th>
                        <th>Branch &amp; GPA</th>
                        <th>Registered Skills</th>
                        <th>Resume</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody id="studentTableBody">
                </tbody>
            </table>
        </div>
    </div>

    <script>
        let profileModalInstance = null;
        let mailModalInstance = null;

        document.addEventListener('DOMContentLoaded', () => {
            // Highlight active sidebar item
            const navItem = document.getElementById('nav-directory');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Student Directory';

            renderStudentDirectory();
        });

        function renderStudentDirectory() {
            const students = PortalDB.getUsers().filter(u => u.role === 'student');
            const tbody = document.getElementById('studentTableBody');
            tbody.innerHTML = '';

            if (students.length === 0) {
                tbody.innerHTML = `<tr><td colspan="6" class="text-center text-muted small py-4">No registered students found.</td></tr>`;
                return;
            }

            students.forEach(st => {
                const branchInitials = st.branch ? st.branch.split(' ').map(p => p[0]).join('').toUpperCase() : 'N/A';

                const tr = document.createElement('tr');
                tr.className = 'student-row';
                tr.setAttribute('data-search', (st.name || '').toLowerCase() + ' ' + (st.enrollment || '').toLowerCase() + ' ' + (st.email || '').toLowerCase());
                tr.setAttribute('data-branch', st.branch || '');

                tr.innerHTML = `
                    <td><span class="fw-bold font-monospace small text-dark">${st.enrollment || st.username}</span></td>
                    <td>
                        <div class="fw-bold font-heading text-dark">${st.name || 'Student'}</div>
                        <div class="text-muted small">${st.email || '-'} &bull; ${st.mobile || '-'}</div>
                    </td>
                    <td>
                        <div class="fw-bold font-heading text-dark">${st.degree || 'B.Tech'} (${branchInitials})</div>
                        <div class="text-muted small">CGPA: ${st.cgpa ? parseFloat(st.cgpa).toFixed(2) : '0.00'} &bull; Backlogs: ${st.backlogs || 0}</div>
                    </td>
                    <td>
                        <div style="max-width: 250px; overflow-wrap: break-word;">
                            ${st.skills ? st.skills.split(',').map(sk => `<span class="badge bg-light text-dark border me-1 my-1" style="font-size:0.7rem;">${sk.trim()}</span>`).join('') : '<span class="text-muted small">None</span>'}
                        </div>
                    </td>
                    <td>
                        ${st.resumeUrl
                            ? `<a href="#" onclick="alert('Downloading resume PDF: ${st.resumeUrl} (Simulated)'); return false;" class="btn btn-outline-danger btn-sm py-1 border-0" title="${st.resumeUrl}"><i class="fa-solid fa-file-pdf fs-5"></i></a>`
                            : '<span class="text-muted small">Not Uploaded</span>'
                        }
                    </td>
                    <td class="text-center">
                        <div class="d-flex justify-content-center gap-1">
                            <button class="btn btn-outline-info btn-sm border-0" onclick="viewStudentFullProfile('${st.username}')" title="View Full Profile"><i class="fa-solid fa-id-card me-1"></i>Profile</button>
                            <button class="btn btn-outline-primary btn-sm border-0" onclick="openSendMailModal('${st.username}')" title="Send Placement Invite"><i class="fa-regular fa-paper-plane me-1"></i>Invite</button>
                        </div>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }

        function filterStudentTable() {
            const query = document.getElementById('studentSearchInput').value.toLowerCase();
            const branch = document.getElementById('studentBranchFilter').value;
            const rows = document.querySelectorAll('.student-row');

            rows.forEach(row => {
                const matchesSearch = row.getAttribute('data-search').includes(query);
                const matchesBranch = branch === 'all' || row.getAttribute('data-branch') === branch;

                if (matchesSearch && matchesBranch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function viewStudentFullProfile(username) {
            const st = PortalDB.getUser(username);
            if (!st) return;

            const modalBody = document.getElementById('studentProfileModalBody');
            const avatarHtml = st.photoBase64
                ? `<img src="${st.photoBase64}" alt="${st.name}" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%;" class="border border-3 border-danger shadow-sm me-3">`
                : `<div class="rounded-circle bg-rku-maroon text-white fw-bold d-inline-flex align-items-center justify-content-center border me-3" style="width: 80px; height: 80px; font-size: 1.8rem;">${(st.name || 'SP').split(' ').map(p => p[0]).join('').substring(0, 2).toUpperCase()}</div>`;

            const certs = st.certificates || [];
            let certsHtml = '';
            if (certs.length === 0) {
                certsHtml = `<p class="text-muted small mb-0"><i class="fa-solid fa-certificate me-1 text-muted"></i>No certificates uploaded by student yet.</p>`;
            } else {
                certsHtml = `<div class="row g-2 mt-1">` + certs.map(c => `
                    <div class="col-md-6">
                        <div class="p-2 border rounded bg-white shadow-sm d-flex justify-content-between align-items-center">
                            <div>
                                <div class="fw-bold small text-dark"><i class="fa-solid fa-award text-warning me-1"></i>${c.title}</div>
                                <div class="text-muted" style="font-size:0.75rem;">${c.issuer} &bull; ${c.date}</div>
                            </div>
                            ${c.fileBase64 ? `<a href="${c.fileBase64}" target="_blank" class="btn btn-sm btn-outline-secondary py-0 px-2" title="View Certificate"><i class="fa-solid fa-eye"></i></a>` : ''}
                        </div>
                    </div>
                `).join('') + `</div>`;
            }

            modalBody.innerHTML = `
                <div class="d-flex align-items-center mb-4 pb-3 border-bottom">
                    ${avatarHtml}
                    <div>
                        <h4 class="fw-bold mb-1 font-heading text-dark">${st.name || 'Student'}</h4>
                        <div class="text-muted small">
                            <span class="badge bg-rku-maroon me-2">${(st.role || 'STUDENT').toUpperCase()}</span> 
                            Enrollment: <strong class="text-dark font-monospace">${st.enrollment || st.username}</strong>
                        </div>
                    </div>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block">Email Address</label>
                        <span class="fw-semibold text-dark">${st.email || '-'}</span>
                    </div>
                    <div class="col-md-6">
                        <label class="text-muted small fw-bold d-block">Mobile Contact</label>
                        <span class="fw-semibold text-dark">${st.mobile || 'N/A'}</span>
                    </div>
                    <div class="col-md-4">
                        <label class="text-muted small fw-bold d-block">Degree &amp; Branch</label>
                        <span class="fw-semibold text-dark">${st.degree || 'B.Tech'} (${st.branch || 'CE'})</span>
                    </div>
                    <div class="col-md-4">
                        <label class="text-muted small fw-bold d-block">Current Semester</label>
                        <span class="fw-semibold text-dark">${st.semester || '7th'}</span>
                    </div>
                    <div class="col-md-4">
                        <label class="text-muted small fw-bold d-block">CGPA &amp; Backlogs</label>
                        <span class="fw-semibold text-rku-maroon">CGPA: ${st.cgpa || '0.0'}</span> <small class="text-muted">(Backlogs: ${st.backlogs || 0})</small>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="text-muted small fw-bold d-block mb-1">Key Technical Skills</label>
                    <div>${st.skills ? st.skills.split(',').map(s => `<span class="badge bg-light text-dark border me-1 my-1" style="font-size:0.75rem;">${s.trim()}</span>`).join('') : '<span class="text-muted small">None listed</span>'}</div>
                </div>

                <div class="mb-4">
                    <label class="text-muted small fw-bold d-block mb-1">Uploaded Resume</label>
                    <div>${st.resumeUrl ? `<span class="badge bg-success-subtle text-success border border-success-subtle p-2" style="font-size:0.82rem;"><i class="fa-solid fa-file-pdf me-1 text-danger"></i> ${st.resumeUrl}</span>` : '<span class="text-muted small">No resume uploaded</span>'}</div>
                </div>

                <div>
                    <label class="text-muted small fw-bold d-block mb-1"><i class="fa-solid fa-certificate me-1 text-warning"></i>Certificates &amp; Achievements (${certs.length})</label>
                    ${certsHtml}
                </div>
            `;

            if (!profileModalInstance) {
                profileModalInstance = new bootstrap.Modal(document.getElementById('studentProfileModal'));
            }
            profileModalInstance.show();
        }

        function openSendMailModal(username) {
            const st = PortalDB.getUser(username);
            if (!st) return;

            document.getElementById('mailStudentUsername').value = st.username;
            document.getElementById('mailStudentDetails').value = `${st.name || st.username} (${st.email || 'N/A'})`;

            const driveSelect = document.getElementById('mailDriveSelect');
            driveSelect.innerHTML = `<option value="">-- Select Placement Drive --</option>`;
            const drives = PortalDB.getDrives();
            drives.forEach(d => {
                driveSelect.innerHTML += `<option value="${d.id}">${d.companyName} - ${d.role} (${d.package})</option>`;
            });

            document.getElementById('mailSubject').value = `Invitation: Campus Placement Drive`;
            document.getElementById('mailMessage').value = `Dear ${st.name || 'Student'},\n\nYou are invited to participate in our upcoming campus placement drive at RK University. Please review the drive requirements and ensure your student profile and resume are updated.\n\nBest regards,\nTraining & Placement Cell,\nRK University`;

            if (!mailModalInstance) {
                mailModalInstance = new bootstrap.Modal(document.getElementById('sendMailModal'));
            }
            mailModalInstance.show();
        }

        function autoFillMailContent(driveId) {
            if (!driveId) return;
            const drive = PortalDB.getDrives().find(d => d.id === driveId);
            const username = document.getElementById('mailStudentUsername').value;
            const st = PortalDB.getUser(username);
            if (drive && st) {
                document.getElementById('mailSubject').value = `Invitation: ${drive.companyName} (${drive.role}) Placement Drive`;
                document.getElementById('mailMessage').value = `Dear ${st.name || 'Student'},\n\nWe are pleased to invite you to participate in the upcoming campus recruitment drive for ${drive.companyName} for the position of ${drive.role} (${drive.package}).\n\nDate: ${drive.date}\nVenue/Location: ${drive.location}\nMinimum CGPA Required: ${drive.minCgpa}\n\nPlease submit your application from your Student Panel prior to the deadline.\n\nBest regards,\nTraining & Placement Cell,\nRK University`;
            }
        }

        function sendStudentPlacementMail(e) {
            e.preventDefault();
            const username = document.getElementById('mailStudentUsername').value;
            const st = PortalDB.getUser(username);
            const subject = document.getElementById('mailSubject').value.trim();
            const message = document.getElementById('mailMessage').value.trim();

            if (!st || !subject || !message) return;

            PortalDB.addAnnouncement(subject, `[Direct Email to ${st.email}]\n${message}`);

            const currentComp = PortalDB.getCurrentUser();
            PortalDB.addCompanyMail({
                companyUsername: currentComp ? currentComp.username : 'company',
                companyName: currentComp ? (currentComp.enrollment || currentComp.name) : 'Company HR',
                studentUsername: st.username || st.enrollment,
                studentName: st.name || st.enrollment,
                studentEmail: st.email || (st.enrollment + '@rku.ac.in'),
                subject: subject,
                message: message,
                sentAt: new Date().toISOString().replace('T', ' ').slice(0, 16)
            });

            alert(`📧 Placement Invite Email Dispatched!\n\nTo: ${st.email}\nSubject: ${subject}\n\nSent email logged for Admin review and pushed to student panel.`);

            if (mailModalInstance) mailModalInstance.hide();
        }
    </script>
</asp:Content>
