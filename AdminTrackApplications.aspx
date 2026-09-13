<%@ Page Title="Application Tracker | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminTrackApplications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminTrackApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <div class="col-md-4">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3">Select Placement Drive</h5>
                <p class="text-muted small">Choose a drive to view and manage applied student profiles.</p>
                <select class="form-select" id="applicationTrackerDriveSelect" onchange="loadApplicationsForDrive()">
                </select>
            </div>
        </div>

        <div class="col-md-8">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 d-flex justify-content-between">
                    <span>Applicants Roster</span>
                    <span class="badge bg-rku-maroon" id="applicantsCountBadge">0 Applicants</span>
                </h5>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Applicant</th>
                                <th>GPA</th>
                                <th>Applied Date</th>
                                <th>Recruitment Stage</th>
                                <th class="text-center">Modify Stage</th>
                            </tr>
                        </thead>
                        <tbody id="driveApplicantsTableBody">
                        </tbody>
                    </table>
                </div>
                <div id="emptyApplicantsState" class="text-center py-5 text-muted d-none">
                    <i class="fa-solid fa-users-slash mb-3" style="font-size: 2.5rem;"></i>
                    <h6>No Applicants Found</h6>
                    <p class="small text-muted mb-0">No students have applied to this placement drive yet.</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-applications');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Application Tracker';

            renderApplicationsDropdown();
        });

        function renderApplicationsDropdown() {
            const drives = PortalDB.getDrives();
            const select = document.getElementById('applicationTrackerDriveSelect');

            select.innerHTML = '<option value="">-- Choose Placement Drive --</option>';
            drives.forEach(d => {
                const option = document.createElement('option');
                option.value = d.id;
                option.innerText = `${d.companyName} - ${d.role} (${d.package})`;
                select.appendChild(option);
            });

            if (drives.length > 0) {
                select.value = drives[0].id;
                loadApplicationsForDrive();
            }
        }

        function loadApplicationsForDrive() {
            const driveId = document.getElementById('applicationTrackerDriveSelect').value;
            const tbody = document.getElementById('driveApplicantsTableBody');
            const emptyState = document.getElementById('emptyApplicantsState');
            const badge = document.getElementById('applicantsCountBadge');

            tbody.innerHTML = '';
            badge.innerText = '0 Applicants';

            if (!driveId) {
                emptyState.classList.remove('d-none');
                return;
            }

            const applications = PortalDB.getApplications().filter(a => a.driveId === driveId);
            badge.innerText = `${applications.length} Applicants`;

            if (applications.length === 0) {
                emptyState.classList.remove('d-none');
                return;
            }

            emptyState.classList.add('d-none');

            const students = PortalDB.getUsers().filter(u => u.role === 'student');

            applications.forEach(app => {
                const student = students.find(s => s.enrollment === app.studentEnrollment) || {
                    name: 'Deleted Student',
                    cgpa: 'N/A',
                    branch: 'N/A'
                };

                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>
                        <div class="fw-bold font-heading text-dark">${student.name}</div>
                        <div class="text-muted small font-monospace">${app.studentEnrollment} &bull; ${student.branch}</div>
                    </td>
                    <td><span class="fw-semibold font-heading text-dark">${student.cgpa || '0.0'}</span></td>
                    <td><span class="text-muted small font-monospace">${app.appliedDate || 'Recently'}</span></td>
                    <td>
                        <span class="badge ${app.status === 'Selected' ? 'bg-success' : app.status === 'Rejected' ? 'bg-danger' : app.status === 'Shortlisted' ? 'bg-warning text-dark' : 'bg-primary'} text-white rounded-pill px-2">
                            ${app.stage || 'Applied'}
                        </span>
                    </td>
                    <td class="text-center">
                        <select class="form-select form-select-sm d-inline-block w-auto" onchange="changeApplicantStage('${app.id}', this.value)">
                            <option value="Applied" ${app.stage === 'Applied' ? 'selected' : ''}>Applied</option>
                            <option value="Shortlisted" ${app.stage === 'Shortlisted' ? 'selected' : ''}>Shortlisted</option>
                            <option value="Technical Round" ${app.stage === 'Technical Round' ? 'selected' : ''}>Technical Round</option>
                            <option value="HR Round" ${app.stage === 'HR Round' ? 'selected' : ''}>HR Round</option>
                            <option value="Selected" ${app.stage === 'Selected' ? 'selected' : ''}>Selected (Placed)</option>
                            <option value="Rejected" ${app.stage === 'Rejected' ? 'selected' : ''}>Rejected</option>
                        </select>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }

        function changeApplicantStage(appId, newStage) {
            let status = 'Applied';
            if (newStage === 'Selected') status = 'Selected';
            else if (newStage === 'Rejected') status = 'Rejected';
            else if (newStage === 'Shortlisted' || newStage === 'Technical Round' || newStage === 'HR Round') status = 'Shortlisted';

            const success = PortalDB.updateApplicationStatus(appId, status, newStage);
            if (success) {
                loadApplicationsForDrive();
            } else {
                alert('Error updating recruitment stage.');
            }
        }
    </script>
</asp:Content>
