<%@ Page Title="Campus Drives | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyManageDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyManageDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .drive-card {
            background: #fff;
            border-radius: 14px;
            border: 1px solid #eef0f3;
            padding: 1.5rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .drive-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(180deg, var(--rku-red), var(--rku-maroon));
            border-radius: 4px 0 0 4px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .drive-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);
        }

        .drive-card:hover::before {
            opacity: 1;
        }

        .drive-status-badge {
            font-size: 0.65rem;
            font-weight: 700;
            padding: 0.3em 0.75em;
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .drive-status-open {
            background: rgba(40, 167, 69, 0.1);
            color: #28a745;
            border: 1px solid rgba(40, 167, 69, 0.2);
        }

        .drive-status-closed {
            background: rgba(108, 117, 125, 0.1);
            color: #6c757d;
            border: 1px solid rgba(108, 117, 125, 0.2);
        }

        .drive-package-tag {
            font-family: 'Outfit', sans-serif;
            font-weight: 800;
            font-size: 0.85rem;
            color: var(--rku-maroon);
            background: rgba(163, 15, 20, 0.06);
            padding: 0.2em 0.65em;
            border-radius: 6px;
        }

        .drive-meta {
            font-size: 0.82rem;
            color: #94a3b8;
        }

        .drive-meta i {
            width: 16px;
            text-align: center;
            margin-right: 4px;
        }

        .drive-action-btn {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #eef0f3;
            background: #fafafa;
            color: #64748b;
            transition: all 0.25s ease;
            font-size: 0.85rem;
        }

        .drive-action-btn:hover {
            background: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }

        .drive-action-btn.edit:hover {
            color: #0d6efd;
            border-color: #0d6efd;
        }

        .drive-action-btn.delete:hover {
            color: #dc3545;
            border-color: #dc3545;
        }

        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
        }

        .empty-state i {
            font-size: 3rem;
            color: #dee2e6;
            margin-bottom: 1rem;
        }

        .empty-state h6 {
            color: #94a3b8;
            font-weight: 600;
        }

        .empty-state p {
            color: #b0bec5;
            font-size: 0.85rem;
        }

        .form-section-title {
            font-family: 'Outfit', sans-serif;
            font-weight: 700;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--rku-red);
            margin-bottom: 0.75rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid rgba(239, 55, 36, 0.1);
        }

        .drives-count-badge {
            background: rgba(163, 15, 20, 0.08);
            color: var(--rku-maroon);
            font-size: 0.7rem;
            font-weight: 700;
            padding: 0.25em 0.6em;
            border-radius: 6px;
        }

        .app-count-pill {
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.2em 0.55em;
            border-radius: 50px;
            background: rgba(23, 162, 184, 0.1);
            color: #17a2b8;
            border: 1px solid rgba(23, 162, 184, 0.15);
        }

        .btn-rku {
            background: linear-gradient(135deg, var(--rku-red), var(--rku-maroon));
            color: #fff;
            border: none;
            font-weight: 600;
            font-family: 'Outfit', sans-serif;
            transition: all 0.3s ease;
        }

        .btn-rku:hover {
            background: linear-gradient(135deg, var(--rku-maroon), #8b0b0f);
            color: #fff;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(163, 15, 20, 0.25);
        }

        .filter-tabs .nav-link {
            font-size: 0.8rem;
            font-weight: 600;
            color: #94a3b8;
            padding: 0.4rem 0.9rem;
            border-radius: 8px;
            transition: all 0.25s;
        }

        .filter-tabs .nav-link.active {
            background: var(--rku-maroon);
            color: #fff;
        }

        .filter-tabs .nav-link:not(.active):hover {
            background: #f1f5f9;
            color: #334155;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Section -->
    <div class="company-hero-card mb-4">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="company-hero-kicker">Recruitment Management</div>
                <h2 class="mb-1">Campus Drives</h2>
                <p>Create, manage, and track your campus recruitment drives. Monitor applications and update drive status.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <button class="btn btn-rku px-4 py-2" onclick="showCreateForm()">
                    <i class="fa-solid fa-plus me-2"></i>Create New Drive
                </button>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Left: Drives List -->
        <div class="col-lg-7">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <h5 class="fw-bold mb-0 font-heading text-dark">Your Drives</h5>
                        <span class="text-muted small" id="drivesSubtitle" runat="server">0 total drives</span>
                    </div>
                    <span class="drives-count-badge" id="drivesCountBadge" runat="server">0</span>
                </div>

                <!-- Drives Container with GridView -->
                <div id="companyDrivesList" style="max-height: 580px; overflow-y: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None" ShowHeader="false" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="drive-card mb-3 p-3 shadow-sm border rounded-3 bg-white">
                                        <div class="d-flex justify-content-between align-items-start gap-2">
                                            <div style="flex: 1; min-width: 0;">
                                                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                                                    <span class='<%# Eval("DriveStatus") != null && Eval("DriveStatus").ToString() == "Closed" ? "drive-status-badge drive-status-closed" : "drive-status-badge drive-status-open" %>'>
                                                        <i class="fa-solid fa-circle me-1" style="font-size: 0.4rem; vertical-align: middle;"></i><%# Eval("DriveStatus") %>
                                                    </span>
                                                    <span class="drive-package-tag"><%# Eval("PackageOffered") %></span>
                                                    <%# Eval("TotalVacancies") != DBNull.Value && !string.IsNullOrEmpty(Eval("TotalVacancies").ToString()) ? "<span class=\"app-count-pill\"><i class=\"fa-solid fa-users me-1\"></i>" + Eval("TotalVacancies") + " Vacancies</span>" : "" %>
                                                </div>
                                                <h6 class="fw-bold mb-2 text-dark font-heading" style="font-size: 1.05rem;"><%# Eval("JobRole") %></h6>
                                                <div class="drive-meta d-flex flex-wrap align-items-center gap-3 p-2 px-3 rounded-3 bg-light border" style="font-size: 0.82rem; color: #475569;">
                                                    <span><i class="fa-regular fa-calendar text-danger me-1"></i><%# Eval("DriveDate") %></span>
                                                    <span><i class="fa-solid fa-graduation-cap text-danger me-1"></i>Min CGPA: <%# Eval("MinCgpa") %></span>
                                                    <%# Eval("VenueLocation") != DBNull.Value && !string.IsNullOrEmpty(Eval("VenueLocation").ToString()) ? "<span><i class=\"fa-solid fa-location-dot text-danger me-1\"></i>" + Eval("VenueLocation") + "</span>" : "" %>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-2 ms-2 flex-shrink-0 mt-1">
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="drive-action-btn edit" title="Edit Drive">
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' CssClass="drive-action-btn delete" OnClientClick="return confirm('Are you sure you want to delete this drive?');" title="Delete Drive">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <%# Eval("JobDescription") != DBNull.Value && !string.IsNullOrEmpty(Eval("JobDescription").ToString()) ? "<p class=\"text-muted small mt-2 mb-0 pt-2 border-top\" style=\"line-height: 1.5;\"><i class=\"fa-solid fa-align-left me-1 text-secondary\"></i>" + Eval("JobDescription") + "</p>" : "" %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="empty-state text-center py-4">
                                <i class="fa-solid fa-bullhorn d-block text-muted fa-3x mb-3"></i>
                                <h6 class="fw-bold text-muted mb-1">No Drives Found</h6>
                                <p class="text-muted small mb-0">You haven't created any campus drives yet. Click "Publish Drive" to get started!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Right: Create/Edit Form -->
        <div class="col-lg-5">
            <div class="dashboard-card" id="driveFormCard">
                <h5 class="fw-bold mb-1 text-dark font-heading" id="cmpDriveFormTitle">
                    <i class="fa-solid fa-plus-circle text-rku-maroon me-2"></i>Create New Drive
                </h5>
                <p class="text-muted small mb-3">Fill in the details below to publish a new campus recruitment drive.</p>

                <div class="form-section-title">Job Information</div>

                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Recruiting Job Role</label>
                    <asp:TextBox ID="cmpDriveRole" runat="server" CssClass="form-control" placeholder="e.g. SDE-1 Freshers / Power Programmer" required="required"></asp:TextBox>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-4">
                        <label class="form-label text-muted small fw-bold">Package Offered</label>
                        <asp:TextBox ID="cmpDrivePackage" runat="server" CssClass="form-control" placeholder="e.g. 7.5 LPA" required="required"></asp:TextBox>
                    </div>
                    <div class="col-4">
                        <label class="form-label text-muted small fw-bold">Min CGPA</label>
                        <asp:TextBox ID="cmpDriveMinCgpa" runat="server" CssClass="form-control" placeholder="e.g. 7.0" required="required"></asp:TextBox>
                    </div>
                    <div class="col-4">
                        <label class="form-label text-muted small fw-bold">Total Vacancies</label>
                        <asp:TextBox ID="cmpDriveVacancies" runat="server" CssClass="form-control" placeholder="e.g. 10 Positions" required="required"></asp:TextBox>
                    </div>
                </div>

                <div class="form-section-title mt-4">Drive Details</div>

                <div class="row g-3 mb-3">
                    <div class="col-6">
                        <label class="form-label text-muted small fw-bold">Drive Date</label>
                        <asp:TextBox ID="cmpDriveDate" runat="server" TextMode="Date" CssClass="form-control" required="required"></asp:TextBox>
                    </div>
                    <div class="col-6">
                        <label class="form-label text-muted small fw-bold">Status</label>
                        <asp:DropDownList ID="cmpDriveStatus" runat="server" CssClass="form-select">
                            <asp:ListItem Value="Open">Open</asp:ListItem>
                            <asp:ListItem Value="Closed">Closed</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Venue / Test Mode</label>
                    <asp:TextBox ID="cmpDriveLocation" runat="server" CssClass="form-control" placeholder="e.g. RKU SJT Lab 102 / Online" required="required"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Job Description &amp; Eligibility</label>
                    <asp:TextBox ID="cmpDriveDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Enter key eligibility, coding rounds, syllabus criteria, and other details..." required="required"></asp:TextBox>
                </div>

                <div class="d-flex gap-2 justify-content-end mt-4">
                    <asp:Button ID="cmpBtnResetDrive" runat="server" Text="Reset" CssClass="btn btn-light btn-sm px-3" OnClick="cmpBtnResetDrive_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="cmpBtnSubmitDrive" runat="server" Text="Publish Drive" CssClass="btn btn-rku btn-sm px-4" OnClick="cmpBtnSubmitDrive_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        let currentFilter = 'all';
        let companyUsername = '';
        let companyName = '';

        document.addEventListener('DOMContentLoaded', () => {
            // Highlight active sidebar
            const navItem = document.getElementById('nav-drives');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Manage Campus Drives';

            // Get current company info
            const user = PortalDB.getCurrentUser();
            if (user) {
                companyUsername = user.username;
                const companies = PortalDB.getCompanies();
                // Try matching by username first, then by email via linkedUsername
                let compEntry = companies.find(c => c.username === user.username) || null;
                if (!compEntry) {
                    compEntry = companies.find(c => c.linkedUsername === user.username) || {};
                }
                const profiles = JSON.parse(localStorage.getItem('rku_company_profiles') || '{}');
                const cp = profiles[user.username] || {};
                companyName = compEntry.name || cp.name || user.name || 'My Company';
            }

            renderCompanyDrives();
        });

        function getCompanyDrives() {
            const allDrives = PortalDB.getDrives();
            // Filter drives belonging to this company
            return allDrives.filter(d => {
                if (d.companyUsername && d.companyUsername === companyUsername) return true;
                if (d.companyName && companyName && d.companyName.toLowerCase() === companyName.toLowerCase()) return true;
                return false;
            });
        }

        function renderCompanyDrives() {
            const drives = getCompanyDrives();
            const container = document.getElementById('companyDrivesList');
            const applications = PortalDB.getApplications();

            // Apply filter
            const filtered = currentFilter === 'all'
                ? drives
                : drives.filter(d => d.status === currentFilter);

            // Update count
            document.getElementById('drivesCountBadge').textContent = filtered.length;
            document.getElementById('drivesSubtitle').textContent =
                `${drives.length} total drive${drives.length !== 1 ? 's' : ''} \u2022 ${drives.filter(d => d.status === 'Open').length} active`;

            if (filtered.length === 0) {
                container.innerHTML = `
                    <div class="empty-state">
                        <i class="fa-solid fa-bullhorn d-block"></i>
                        <h6>No Drives Found</h6>
                        <p>${currentFilter === 'all'
                        ? 'You haven\'t created any campus drives yet. Click "Create New Drive" to get started!'
                        : 'No ' + currentFilter.toLowerCase() + ' drives found.'}</p>
                    </div>
                `;
                return;
            }

            container.innerHTML = filtered.map(d => {
                const isClosed = d.status === 'Closed';
                const appCount = applications.filter(a => a.driveId === d.id).length;
                const dateStr = d.date ? new Date(d.date).toLocaleDateString('en-IN', {
                    day: 'numeric', month: 'short', year: 'numeric'
                }) : 'TBD';

                return `
                    <div class="drive-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div style="flex: 1; min-width: 0;">
                                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                                    <span class="drive-status-badge ${isClosed ? 'drive-status-closed' : 'drive-status-open'}">
                                        <i class="fa-solid fa-circle me-1" style="font-size: 0.4rem; vertical-align: middle;"></i>${d.status}
                                    </span>
                                    <span class="drive-package-tag">${d.package}</span>
                                    ${appCount > 0 ? `<span class="app-count-pill"><i class="fa-solid fa-file-lines me-1"></i>${appCount} Application${appCount !== 1 ? 's' : ''}</span>` : ''}
                                </div>
                                <h6 class="fw-bold mb-1 text-dark font-heading" style="font-size: 1.05rem;">${d.role || 'Untitled Role'}</h6>
                                <div class="drive-meta d-flex flex-wrap gap-3 mt-2">
                                    <span><i class="fa-regular fa-calendar"></i>${dateStr}</span>
                                    <span><i class="fa-solid fa-graduation-cap"></i>CGPA ≥ ${d.minCgpa}</span>
                                    ${d.location ? `<span><i class="fa-solid fa-location-dot"></i>${d.location}</span>` : ''}
                                </div>
                            </div>
                            <div class="d-flex gap-2 ms-3 flex-shrink-0">
                                <button class="drive-action-btn edit" onclick="editCompanyDrive('${d.id}')" title="Edit Drive">
                                    <i class="fa-regular fa-pen-to-square"></i>
                                </button>
                                <button class="drive-action-btn delete" onclick="deleteCompanyDrive('${d.id}')" title="Delete Drive">
                                    <i class="fa-regular fa-trash-can"></i>
                                </button>
                            </div>
                        </div>
                        ${d.description ? `<p class="text-muted small mt-2 mb-0" style="line-height: 1.5;">${d.description.substring(0, 120)}${d.description.length > 120 ? '...' : ''}</p>` : ''}
                    </div>
                `;
            }).join('');
        }

        function filterDrives(filter, el) {
            currentFilter = filter;
            document.querySelectorAll('#driveFilterTabs .nav-link').forEach(n => n.classList.remove('active'));
            if (el) el.classList.add('active');
            renderCompanyDrives();
        }

        function showCreateForm() {
            clearCompanyDriveForm();
            document.getElementById('driveFormCard').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function clearCompanyDriveForm() {
            document.getElementById('cmpDriveIdField').value = '';
            document.getElementById('cmpDriveRole').value = '';
            document.getElementById('cmpDrivePackage').value = '';
            document.getElementById('cmpDriveMinCgpa').value = '';
            document.getElementById('cmpDriveDate').value = '';
            document.getElementById('cmpDriveStatus').value = 'Open';
            document.getElementById('cmpDriveLocation').value = '';
            document.getElementById('cmpDriveDescription').value = '';

            document.getElementById('cmpDriveFormTitle').innerHTML =
                '<i class="fa-solid fa-plus-circle text-rku-maroon me-2"></i>Create New Drive';
            document.getElementById('cmpBtnSubmitDrive').innerHTML =
                '<i class="fa-solid fa-rocket me-1"></i>Publish Drive';
        }

        function editCompanyDrive(id) {
            const drive = PortalDB.getDrive(id);
            if (!drive) return;

            document.getElementById('cmpDriveIdField').value = drive.id;
            document.getElementById('cmpDriveRole').value = drive.role || '';
            document.getElementById('cmpDrivePackage').value = drive.package || '';
            document.getElementById('cmpDriveMinCgpa').value = drive.minCgpa || '';
            document.getElementById('cmpDriveDate').value = drive.date || '';
            document.getElementById('cmpDriveStatus').value = drive.status || 'Open';
            document.getElementById('cmpDriveLocation').value = drive.location || '';
            document.getElementById('cmpDriveDescription').value = drive.description || '';

            document.getElementById('cmpDriveFormTitle').innerHTML =
                '<i class="fa-solid fa-pen text-rku-maroon me-2"></i>Edit Drive';
            document.getElementById('cmpBtnSubmitDrive').innerHTML =
                '<i class="fa-solid fa-check me-1"></i>Save Changes';

            document.getElementById('driveFormCard').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function saveCompanyDrive(e) {
            e.preventDefault();

            const driveId = document.getElementById('cmpDriveIdField').value;
            const role = document.getElementById('cmpDriveRole').value.trim();
            const packageVal = document.getElementById('cmpDrivePackage').value.trim();
            const minCgpa = document.getElementById('cmpDriveMinCgpa').value.trim();
            const date = document.getElementById('cmpDriveDate').value;
            const status = document.getElementById('cmpDriveStatus').value;
            const location = document.getElementById('cmpDriveLocation').value.trim();
            const description = document.getElementById('cmpDriveDescription').value.trim();

            const driveObj = {
                companyName: companyName,
                companyUsername: companyUsername,
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
                if (success) {
                    showToast('Drive updated successfully!', 'success');
                }
            } else {
                PortalDB.addDrive(driveObj);
                showToast('New drive published successfully!', 'success');
            }

            clearCompanyDriveForm();
            renderCompanyDrives();
        }

        function deleteCompanyDrive(id) {
            if (confirm('Are you sure you want to delete this drive? All associated student applications will also be removed.')) {
                PortalDB.deleteDrive(id);
                showToast('Drive deleted.', 'warning');
                renderCompanyDrives();
            }
        }

        function showToast(message, type) {
            // Simple toast using alert as fallback
            const colors = { success: '#28a745', warning: '#ffc107', error: '#dc3545' };
            const toast = document.createElement('div');
            toast.style.cssText = `
                position: fixed; top: 20px; right: 20px; z-index: 9999;
                background: ${colors[type] || '#333'}; color: #fff;
                padding: 0.75rem 1.25rem; border-radius: 10px;
                font-size: 0.9rem; font-weight: 600;
                box-shadow: 0 8px 25px rgba(0,0,0,0.15);
                font-family: 'Outfit', sans-serif;
                animation: slideIn 0.3s ease;
            `;
            toast.innerHTML = `<i class="fa-solid fa-check-circle me-2"></i>${message}`;
            document.body.appendChild(toast);

            const style = document.createElement('style');
            style.textContent = `
                @keyframes slideIn { from { transform: translateX(100%); opacity: 0; } to { transform: translateX(0); opacity: 1; } }
                @keyframes slideOut { from { transform: translateX(0); opacity: 1; } to { transform: translateX(100%); opacity: 0; } }
            `;
            document.head.appendChild(style);

            setTimeout(() => {
                toast.style.animation = 'slideOut 0.3s ease forwards';
                setTimeout(() => toast.remove(), 300);
            }, 2500);
        }
    </script>
</asp:Content>
