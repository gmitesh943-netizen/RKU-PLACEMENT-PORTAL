<%@ Page Title="Manage Drives | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .drives-hero {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 18px;
            padding: 1.5rem 1.75rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.02);
            margin-bottom: 1.5rem;
        }

        .drives-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .drives-hero h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #111;
            margin-bottom: 0.35rem;
        }

        .drives-hero p {
            margin-bottom: 0;
            color: #64748b;
            font-size: 0.95rem;
        }

        /* ─── STATS ROW ─── */
        .drive-stat-pill {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.45rem 0.9rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 700;
            font-family: 'Outfit', sans-serif;
            border: 1px solid #eef0f3;
            background: #fff;
        }

        .drive-stat-pill i {
            font-size: 0.7rem;
        }

        .drive-stat-pill.open { color: #28a745; border-color: rgba(40,167,69,0.2); background: rgba(40,167,69,0.06); }
        .drive-stat-pill.closed { color: #6c757d; border-color: rgba(108,117,125,0.2); background: rgba(108,117,125,0.06); }

        /* ─── FILTER BAR ─── */
        .filter-bar {
            background: #fff;
            border-radius: 14px;
            border: 1px solid #eef0f3;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 3px 12px rgba(0,0,0,0.015);
        }

        .filter-tab-btn {
            font-size: 0.82rem;
            font-weight: 600;
            color: #64748b;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            padding: 0.45rem 1rem;
            border-radius: 8px;
            transition: all 0.2s ease;
            font-family: 'Outfit', sans-serif;
        }

        .filter-tab-btn:hover {
            background: #e2e8f0;
            color: #1e293b;
        }

        .filter-tab-btn.active {
            background: linear-gradient(135deg, var(--rku-red), var(--rku-maroon)) !important;
            color: #ffffff !important;
            border-color: var(--rku-maroon) !important;
            box-shadow: 0 3px 8px rgba(163, 15, 20, 0.2);
        }

        .search-box {
            position: relative;
        }

        .search-box .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            font-size: 0.85rem;
        }

        .search-box input {
            padding-left: 36px;
            height: 40px;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            font-size: 0.85rem;
            transition: all 0.25s;
        }

        .search-box input:focus {
            border-color: var(--rku-red);
            box-shadow: 0 0 0 3px rgba(239, 55, 36, 0.08);
        }

        /* ─── DRIVE CARDS ─── */
        .sd-drive-card-col {
            margin-bottom: 1.5rem;
        }

        .sd-drive-card {
            background: #fff;
            border-radius: 16px;
            border: 1px solid #eef0f3;
            padding: 1.5rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 100%;
        }

        .sd-drive-card::before {
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

        .sd-drive-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            border-color: #e2e8f0;
        }

        .sd-drive-card:hover::before {
            opacity: 1;
        }

        .sd-company-avatar {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--rku-red), var(--rku-maroon));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            font-weight: 800;
            color: #fff;
            font-family: 'Outfit', sans-serif;
            flex-shrink: 0;
            box-shadow: 0 4px 10px rgba(163, 15, 20, 0.15);
        }

        .sd-status-badge {
            font-size: 0.7rem;
            font-weight: 700;
            padding: 0.35em 0.85em;
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .sd-status-open {
            background: rgba(40, 167, 69, 0.12);
            color: #28a745;
            border: 1px solid rgba(40, 167, 69, 0.25);
        }

        .sd-status-closed {
            background: rgba(108, 117, 125, 0.12);
            color: #6c757d;
            border: 1px solid rgba(108, 117, 125, 0.25);
        }

        .sd-package-box {
            background: #f8fafc;
            border: 1px solid #f1f5f9;
            border-radius: 10px;
            padding: 0.65rem 0.85rem;
        }

        .sd-package-tag {
            font-family: 'Outfit', sans-serif;
            font-weight: 800;
            font-size: 0.95rem;
            color: var(--rku-maroon);
        }

        .sd-eligible-badge {
            font-size: 0.7rem;
            font-weight: 700;
            padding: 0.25em 0.65em;
            border-radius: 50px;
        }

        .sd-eligible-yes {
            background: rgba(40,167,69,0.1);
            color: #28a745;
            border: 1px solid rgba(40,167,69,0.2);
        }

        .sd-meta {
            font-size: 0.82rem;
            color: #64748b;
        }

        .sd-meta i {
            width: 16px;
            text-align: center;
        }

        .sd-desc-text {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            font-size: 0.82rem;
            line-height: 1.5;
            color: #64748b;
            min-height: 3.7em;
        }

        .btn-rku-danger {
            background: #dc3545;
            color: #fff !important;
            border: none;
            font-weight: 600;
            font-family: 'Outfit', sans-serif;
            transition: all 0.3s ease;
        }

        .btn-rku-danger:hover {
            background: #bb2d3b;
            color: #fff !important;
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.25);
        }

        .sd-count-badge {
            background: rgba(163, 15, 20, 0.08);
            color: var(--rku-maroon);
            font-size: 0.75rem;
            font-weight: 700;
            padding: 0.35em 0.75em;
            border-radius: 8px;
            font-family: 'Outfit', sans-serif;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Section -->
    <div class="drives-hero">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="drives-hero-kicker">Campus Recruitment</div>
                <h2 class="mb-1">Campus Drives</h2>
                <p>Manage campus recruitment drives, student eligibility, and active job openings.</p>
            </div>
            <div class="col-lg-5">
                <div class="d-flex flex-wrap gap-2 justify-content-lg-end">
                    <span class="drive-stat-pill open"><i class="fa-solid fa-circle"></i><asp:Label ID="statOpenCount" runat="server" Text="0" ClientIDMode="Static"></asp:Label> Open</span>
                    <span class="drive-stat-pill closed"><i class="fa-solid fa-circle text-secondary"></i><asp:Label ID="statClosedCount" runat="server" Text="0" ClientIDMode="Static"></asp:Label> Closed</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Filter Bar -->
    <div class="filter-bar">
        <div class="row g-3 align-items-center">
            <div class="col-lg-4 col-md-5">
                <div class="search-box">
                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                    <asp:TextBox ID="driveSearchInput" runat="server" CssClass="form-control" placeholder="Search by role or location..." ClientIDMode="Static" onkeyup="filterDrives()"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-5 col-md-7">
                <div class="d-flex gap-2 flex-wrap" id="studentDriveFilterTabs">
                    <asp:Button ID="btnFilterAll" runat="server" CssClass="btn filter-tab-btn active" Text="All Drives" OnClientClick="setStudentDriveFilter('all', this); return false;" />
                    <asp:Button ID="btnFilterOpen" runat="server" CssClass="btn filter-tab-btn" Text="Open" OnClientClick="setStudentDriveFilter('open', this); return false;" />
                    <asp:Button ID="btnFilterClosed" runat="server" CssClass="btn filter-tab-btn" Text="Closed" OnClientClick="setStudentDriveFilter('closed', this); return false;" />
                </div>
            </div>
            <div class="col-lg-3 text-lg-end">
                <asp:Label ID="driveCountLabel" runat="server" CssClass="sd-count-badge" ClientIDMode="Static" Text="0 Drives"></asp:Label>
            </div>
        </div>
    </div>

    <!-- DataList Container -->
    <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" CssClass="row g-4">
        <ItemStyle CssClass="col-lg-4 col-md-6 d-flex align-items-stretch sd-drive-card-col" />
        <ItemTemplate>
            <div class="sd-drive-card" data-company='<%# Eval("JobRole") %>' data-status='<%# Eval("DriveStatus") %>'>
                <div>
                    <!-- Header Row -->
                    <div class="d-flex align-items-start justify-content-between mb-3">
                        <div class="d-flex align-items-center gap-3">
                            <div class="sd-company-avatar">
                                <%# Eval("JobRole") != DBNull.Value && Eval("JobRole").ToString().Length > 0 ? Eval("JobRole").ToString().Substring(0, 1).ToUpper() : "R" %>
                            </div>
                            <div>
                                <h5 class="fw-bold text-dark mb-1" style="font-family: 'Outfit', sans-serif; font-size: 1.05rem;">
                                    <asp:Label ID="lblJobRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                </h5>
                                <small class="text-muted">
                                    <i class="fa-solid fa-location-dot text-danger me-1"></i>
                                    <asp:Label ID="lblVenueLocation" runat="server" Text='<%# Eval("VenueLocation") %>'></asp:Label>
                                </small>
                            </div>
                        </div>
                        <asp:Label ID="lblDriveStatus" runat="server" Text='<%# Eval("DriveStatus") %>' CssClass='<%# Eval("DriveStatus").ToString() == "Open" ? "sd-status-badge sd-status-open" : "sd-status-badge sd-status-closed" %>'></asp:Label>
                    </div>

                    <!-- Package & Eligibility Box -->
                    <div class="sd-package-box d-flex align-items-center justify-content-between mb-3">
                        <div>
                            <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.62rem; letter-spacing: 0.05em;">Package</small>
                            <asp:Label ID="lblPackageOffered" runat="server" Text='<%# Eval("PackageOffered") %>' CssClass="sd-package-tag"></asp:Label>
                        </div>
                        <div class="text-end">
                            <small class="text-muted d-block text-uppercase fw-bold" style="font-size: 0.62rem; letter-spacing: 0.05em;">Eligibility</small>
                            <span class="sd-eligible-badge sd-eligible-yes">CGPA &ge; <asp:Label ID="lblMinCgpa" runat="server" Text='<%# Eval("MinCgpa") %>'></asp:Label></span>
                        </div>
                    </div>

                    <!-- Date & Vacancies -->
                    <div class="sd-meta mb-3">
                        <div class="row g-2">
                            <div class="col-6">
                                <i class="fa-regular fa-calendar-days text-danger me-1"></i> <strong>Date:</strong> <asp:Label ID="lblDriveDate" runat="server" Text='<%# Eval("DriveDate") %>'></asp:Label>
                            </div>
                            <div class="col-6">
                                <i class="fa-solid fa-user-group text-primary me-1"></i> <strong>Vacancies:</strong> <asp:Label ID="lblTotalVacancies" runat="server" Text='<%# Eval("TotalVacancies") %>'></asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Description -->
                    <p class="sd-desc-text mb-3">
                        <asp:Label ID="lblJobDescription" runat="server" Text='<%# Eval("JobDescription") %>'></asp:Label>
                    </p>
                </div>

                <!-- Footer Action -->
                <div class="pt-3 border-top d-flex align-items-center justify-content-between mt-auto">
                    <small class="text-muted"><i class="fa-solid fa-building-columns me-1"></i>Campus Drive</small>
                    <asp:LinkButton ID="btnDeleteDrive" runat="server" CssClass="btn btn-rku-danger btn-sm px-3 rounded-pill" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure you want to delete this placement drive?');">
                        <i class="fa-regular fa-trash-can me-1"></i> Delete
                    </asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <script>
        let studentDriveFilter = 'all';

        function setStudentDriveFilter(filter, el) {
            studentDriveFilter = filter;
            document.querySelectorAll('#studentDriveFilterTabs .filter-tab-btn').forEach(btn => btn.classList.remove('active'));
            if (el) el.classList.add('active');
            filterDrives();
        }

        function filterDrives() {
            const search = document.getElementById('driveSearchInput');
            const items = document.querySelectorAll('.sd-drive-card-col');
            if (!items.length) return;

            const query = search ? search.value.toLowerCase() : '';
            let visibleCount = 0;

            items.forEach(item => {
                const card = item.querySelector('.sd-drive-card');
                if (!card) return;

                const companyText = (card.getAttribute('data-company') || '').toLowerCase();
                const status = card.getAttribute('data-status') || '';

                const matchesSearch = companyText.includes(query);
                let matchesFilter = true;

                if (studentDriveFilter === 'open') matchesFilter = (status === 'Open');
                else if (studentDriveFilter === 'closed') matchesFilter = (status === 'Closed');

                const show = matchesSearch && matchesFilter;
                item.style.setProperty('display', show ? 'flex' : 'none', 'important');
                if (show) visibleCount++;
            });

            const countLabel = document.getElementById('driveCountLabel');
            if (countLabel) countLabel.textContent = visibleCount + ' Drive' + (visibleCount !== 1 ? 's' : '');
        }
    </script>
</asp:Content>
