<%@ Page Title="Manage Drives | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <!-- Drives List -->
        <div class="col-lg-7">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 d-flex justify-content-between align-items-center">
                    <span>Active Recruiting Drives</span>
                    <button class="btn btn-rku btn-sm" onclick="clearDriveForm()"><i class="fa-solid fa-plus me-1"></i>Add New</button>
                </h5>

                <div class="list-group overflow-auto" id="adminDrivesList" style="max-height: 550px;">
                </div>
            </div>
        </div>

        <!-- Add/Edit Form -->
        <div class="col-lg-5">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 text-dark" id="driveFormTitle">Create New Campus Drive</h5>
                <form id="driveForm" onsubmit="saveDrive(event)">
                    <input type="hidden" id="driveIdField">

                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Company Name</label>
                        <input type="text" class="form-control" id="driveCompany" placeholder="e.g. Google India" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Recruiting Job Role</label>
                        <input type="text" class="form-control" id="driveRole" placeholder="e.g. SDE-1 Freshers" required>
                    </div>
                    <div class="row g-3 mb-3">
                        <div class="col-6">
                            <label class="form-label text-muted small fw-bold">Package Offered</label>
                            <input type="text" class="form-control" id="drivePackage" placeholder="e.g. 7.5 LPA" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label text-muted small fw-bold">Min CGPA Required</label>
                            <input type="number" step="0.1" min="0" max="10" class="form-control" id="driveMinCgpa" placeholder="e.g. 7.0" required>
                        </div>
                    </div>
                    <div class="row g-3 mb-3">
                        <div class="col-6">
                            <label class="form-label text-muted small fw-bold">Drive Date</label>
                            <input type="date" class="form-control" id="driveDate" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label text-muted small fw-bold">Job Status</label>
                            <select class="form-select" id="driveStatus">
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Venue Location / Test Mode</label>
                        <input type="text" class="form-control" id="driveLocation" placeholder="e.g. SJT Lab 102 / Online" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Job Profile Description</label>
                        <textarea class="form-control" id="driveDescription" rows="4" placeholder="Enter key eligibility, coding rounds, syllabus criteria..." required></textarea>
                    </div>

                    <div class="d-flex gap-2 justify-content-end">
                        <button type="button" class="btn btn-secondary btn-sm" onclick="clearDriveForm()">Reset</button>
                        <button type="submit" class="btn btn-rku btn-sm" id="btnSubmitDrive">Create Drive</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-drives');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Manage Campus Recruitment Drives';

            renderManageDrives();
        });

        function renderManageDrives() {
            const drives = PortalDB.getDrives();
            const list = document.getElementById('adminDrivesList');
            list.innerHTML = '';

            if (drives.length === 0) {
                list.innerHTML = `<p class="text-center text-muted small py-4">No active placement drives found.</p>`;
                return;
            }

            drives.forEach(d => {
                const isClosed = d.status === 'Closed';
                const div = document.createElement('div');
                div.className = `list-group-item list-group-item-action border-0 border-bottom p-3 d-flex justify-content-between align-items-center`;
                div.innerHTML = `
                    <div style="max-width: 70%;">
                        <div class="d-flex align-items-center gap-2 mb-1">
                            <span class="badge ${isClosed ? 'bg-secondary' : 'bg-success'} text-white rounded-pill px-2" style="font-size: 0.65rem;">${d.status}</span>
                            <span class="fw-bold small text-rku-maroon font-monospace">${d.package}</span>
                        </div>
                        <h6 class="fw-bold mb-0 text-dark font-heading">${d.companyName}</h6>
                        <p class="mb-0 text-muted small">${d.role} &bull; CGPA >= ${d.minCgpa}</p>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editDrive('${d.id}')" title="Edit Drive"><i class="fa-regular fa-edit"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteDrive('${d.id}')" title="Delete Drive"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                list.appendChild(div);
            });
        }

        function clearDriveForm() {
            document.getElementById('driveIdField').value = '';
            document.getElementById('driveCompany').value = '';
            document.getElementById('driveRole').value = '';
            document.getElementById('drivePackage').value = '';
            document.getElementById('driveMinCgpa').value = '';
            document.getElementById('driveDate').value = '';
            document.getElementById('driveStatus').value = 'Open';
            document.getElementById('driveLocation').value = '';
            document.getElementById('driveDescription').value = '';

            document.getElementById('driveFormTitle').innerText = 'Create New Campus Drive';
            document.getElementById('btnSubmitDrive').innerText = 'Create Drive';
        }

        function editDrive(id) {
            const drive = PortalDB.getDrive(id);
            if (!drive) return;

            document.getElementById('driveIdField').value = drive.id;
            document.getElementById('driveCompany').value = drive.companyName;
            document.getElementById('driveRole').value = drive.role;
            document.getElementById('drivePackage').value = drive.package;
            document.getElementById('driveMinCgpa').value = drive.minCgpa;
            document.getElementById('driveDate').value = drive.date;
            document.getElementById('driveStatus').value = drive.status;
            document.getElementById('driveLocation').value = drive.location || '';
            document.getElementById('driveDescription').value = drive.description;

            document.getElementById('driveFormTitle').innerText = 'Modify Campus Drive';
            document.getElementById('btnSubmitDrive').innerText = 'Save Changes';
        }

        function saveDrive(e) {
            e.preventDefault();

            const driveId = document.getElementById('driveIdField').value;
            const companyName = document.getElementById('driveCompany').value.trim();
            const role = document.getElementById('driveRole').value.trim();
            const packageVal = document.getElementById('drivePackage').value.trim();
            const minCgpa = document.getElementById('driveMinCgpa').value.trim();
            const date = document.getElementById('driveDate').value;
            const status = document.getElementById('driveStatus').value;
            const location = document.getElementById('driveLocation').value.trim();
            const description = document.getElementById('driveDescription').value.trim();

            const driveObj = {
                companyName: companyName,
                role: role,
                package: packageVal,
                minCgpa: minCgpa,
                date: date,
                status: status,
                location: location,
                description: description
            };

            if (driveId) {
                driveObj.id = driveId;
                const success = PortalDB.updateDrive(driveObj);
                if (success) alert('Recruitment Drive updated successfully!');
            } else {
                PortalDB.addDrive(driveObj);
                alert('New recruitment drive added successfully!');
            }

            clearDriveForm();
            renderManageDrives();
        }

        function deleteDrive(id) {
            if (confirm('Are you sure you want to delete this placement drive? All corresponding student applications will also be deleted.')) {
                PortalDB.deleteDrive(id);
                renderManageDrives();
            }
        }
    </script>
</asp:Content>
