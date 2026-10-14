<%@ Page Title="Campus Drives | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyManageDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyManageDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-orange-red: #ef3724;
            --rku-orange-red-dark: #d82b19;
            --rku-dark: #0f172a;
            --rku-gray: #64748b;
            --rku-light: #f8fafc;
            --rku-border: #e2e8f0;
        }

        /* ─── HERO HEADER (Clean White + Red/Orange Accent) ─── */
        .page-header-box {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .page-header-box::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 6px;
                background: linear-gradient(180deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            }

        .hero-badge-red {
            background: rgba(239, 55, 36, 0.08);
            border: 1px solid rgba(239, 55, 36, 0.2);
            color: var(--rku-orange-red);
            font-size: 0.76rem;
            font-weight: 700;
            padding: 0.35rem 0.85rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            letter-spacing: 0.5px;
        }

        .page-header-box h3 {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 800;
            color: var(--rku-dark) !important;
            font-size: 1.85rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .page-header-box p {
            color: var(--rku-gray) !important;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 0;
            max-width: 650px;
        }

        .btn-rku-orange {
            background: var(--rku-orange-red);
            border: 1px solid var(--rku-orange-red);
            color: #ffffff !important;
            font-weight: 600;
            padding: 0.5rem 1.25rem;
            border-radius: 50px;
            font-size: 0.85rem;
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
            cursor: pointer;
        }

            .btn-rku-orange:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                transform: translateY(-1px);
                box-shadow: 0 6px 16px rgba(239, 55, 36, 0.35);
                color: #ffffff !important;
            }

        /* ─── DASHBOARD WHITE CARDS ─── */
        .dashboard-box-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            margin-bottom: 1.25rem;
        }

        /* ─── DRIVE CARD ITEM ─── */
        .drive-card-item {
            background: #ffffff;
            border-radius: 14px;
            border: 1px solid var(--rku-border);
            padding: 1.25rem 1.35rem;
            margin-bottom: 1rem;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
        }

            .drive-card-item:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 24px rgba(15, 23, 42, 0.06);
                border-color: #cbd5e1;
            }

        .drive-status-badge {
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.3rem 0.75rem;
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 0.04em;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .drive-status-open {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .drive-status-closed {
            background: #f1f5f9;
            color: var(--rku-gray);
            border: 1px solid var(--rku-border);
        }

        .drive-package-tag {
            font-weight: 700;
            font-size: 0.82rem;
            color: var(--rku-orange-red);
            background: rgba(239, 55, 36, 0.08);
            border: 1px solid rgba(239, 55, 36, 0.18);
            padding: 0.25rem 0.65rem;
            border-radius: 6px;
        }

        .app-count-pill {
            font-size: 0.74rem;
            font-weight: 600;
            padding: 0.25rem 0.6rem;
            border-radius: 6px;
            background: #eff6ff;
            color: #1d4ed8;
            border: 1px solid #bfdbfe;
        }

        .drive-action-btn-circle {
            width: 34px;
            height: 34px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid var(--rku-border);
            background: #f8fafc;
            color: var(--rku-gray);
            transition: all 0.2s ease;
            font-size: 0.85rem;
            text-decoration: none !important;
        }

            .drive-action-btn-circle:hover {
                background: #ffffff;
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            }

            .drive-action-btn-circle.edit:hover {
                color: #2563eb;
                border-color: #2563eb;
                background: #eff6ff;
            }

            .drive-action-btn-circle.delete:hover {
                color: #dc2626;
                border-color: #dc2626;
                background: #fef2f2;
            }

        .form-section-title-custom {
            font-size: 0.74rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: var(--rku-orange-red);
            margin-bottom: 0.75rem;
            padding-bottom: 0.4rem;
            border-bottom: 2px solid rgba(239, 55, 36, 0.12);
        }

        .form-control, .form-select {
            border: 1px solid var(--rku-border);
            border-radius: 10px;
            font-size: 0.88rem;
            transition: all 0.2s ease;
        }

            .form-control:focus, .form-select:focus {
                border-color: var(--rku-orange-red);
                box-shadow: 0 0 0 3px rgba(239, 55, 36, 0.1);
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Page Top Header -->
    <div class="page-header-box">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-briefcase"></i>RECRUITMENT MANAGEMENT
                    </span>
                </div>
                <h3 class="mb-1 fw-bold text-dark font-heading">Campus Recruitment Drives</h3>
                <p>Create, update, and manage your campus recruitment job postings and review applicant counts.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:LinkButton ID="btnShowCreateForm" runat="server" OnClientClick="showCreateForm(); return false;" CssClass="btn-rku-orange">
                    <i class="fa-solid fa-plus me-1"></i>Publish New Drive
                </asp:LinkButton>
            </div>
        </div>
    </div>

    <!-- Main Content Layout (Left: Drives List, Right: Form) -->
    <div class="row g-3">
        <!-- Left: Drives List -->
        <div class="col-lg-7">
            <div class="dashboard-box-card">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                    <div>
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-solid fa-bullhorn text-danger me-2"></i>Posted Drives
                           
                            <span class="badge bg-light text-dark border ms-1 fw-bold" id="drivesCountBadge" runat="server">0</span>
                        </h6>
                        <span class="text-muted small" id="drivesSubtitle" runat="server">0 total drives</span>
                    </div>
                </div>

                <!-- Drives Container with GridView -->
                <div id="companyDrivesList" style="max-height: 600px; overflow-y: auto; padding-right: 2px;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None" ShowHeader="false" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="drive-card-item">
                                        <div class="d-flex justify-content-between align-items-start gap-2">
                                            <div style="flex: 1; min-width: 0;">
                                                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                                                    <span class='<%# Eval("DriveStatus") != null && Eval("DriveStatus").ToString() == "Closed" ? "drive-status-badge drive-status-closed" : "drive-status-badge drive-status-open" %>'>
                                                        <i class="fa-solid fa-circle" style="font-size: 0.4rem;"></i>
                                                        <asp:Label ID="lblDriveStatus" runat="server" Text='<%# Eval("DriveStatus") %>'></asp:Label>
                                                    </span>
                                                    <span class="drive-package-tag">
                                                        <i class="fa-solid fa-indian-rupee-sign me-1"></i>
                                                        <asp:Label ID="lblPackageOffered" runat="server" Text='<%# Eval("PackageOffered") %>'></asp:Label>
                                                    </span>
                                                    <%# Eval("TotalVacancies") != DBNull.Value && !string.IsNullOrEmpty(Eval("TotalVacancies").ToString()) ? "<span class=\"app-count-pill\"><i class=\"fa-solid fa-users me-1\"></i>" + Eval("TotalVacancies") + " Vacancies</span>" : "" %>
                                                </div>
                                                <h6 class="fw-bold mb-2 text-dark font-heading" style="font-size: 1rem;">
                                                    <asp:Label ID="lblJobRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                                </h6>

                                                <div class="d-flex flex-wrap align-items-center gap-3 p-2 px-3 rounded-3 bg-light border small text-muted" style="font-size: 0.8rem;">
                                                    <span>
                                                        <i class="fa-regular fa-calendar text-danger me-1"></i>
                                                        <asp:Label ID="lblDriveDate" runat="server" Text='<%# Eval("DriveDate", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                    </span>
                                                    <span>
                                                        <i class="fa-solid fa-graduation-cap text-danger me-1"></i>Min CGPA: 
                                                       
                                                        <strong>
                                                            <asp:Label ID="lblMinCgpa" runat="server" Text='<%# Eval("MinCgpa") %>'></asp:Label>
                                                        </strong>
                                                    </span>
                                                    <%# Eval("VenueLocation") != DBNull.Value && !string.IsNullOrEmpty(Eval("VenueLocation").ToString()) ? "<span><i class=\"fa-solid fa-location-dot text-danger me-1\"></i>" + Eval("VenueLocation") + "</span>" : "" %>
                                                </div>
                                            </div>

                                            <div class="d-flex gap-1.5 ms-2 flex-shrink-0 mt-1">
                                                <asp:HyperLink ID="lnkViewApplicants" runat="server" NavigateUrl='<%# "CompanyApplicants.aspx?driveId=" + Eval("Id") %>' CssClass="drive-action-btn-circle" ToolTip="View Applicants" Style="background: #eff6ff; color: #2563eb; border-color: #bfdbfe;">
                                                    <i class="fa-solid fa-user-check"></i>
                                                </asp:HyperLink>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="drive-action-btn-circle edit" ToolTip="Edit Drive"><i class="fa-regular fa-pen-to-square"></i></asp:LinkButton>

                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' CssClass="drive-action-btn-circle delete" OnClientClick="return confirm('Are you sure you want to delete this drive?');" ToolTip="Delete Drive"><i class="fa-regular fa-trash-can"></i></asp:LinkButton>

                                            </div>
                                        </div>
                                        <%# Eval("JobDescription") != DBNull.Value && !string.IsNullOrEmpty(Eval("JobDescription").ToString()) ? "<p class=\"text-muted small mt-2 mb-0 pt-2 border-top\" style=\"line-height: 1.5; font-size: 0.82rem;\"><i class=\"fa-solid fa-align-left me-1 text-secondary\"></i>" + Eval("JobDescription") + "</p>" : "" %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center py-5">
                                <div class="mb-3 text-muted" style="font-size: 2.8rem; opacity: 0.5;"><i class="fa-solid fa-bullhorn"></i></div>
                                <h6 class="fw-bold text-dark mb-1 font-heading">No Drives Found</h6>
                                <p class="text-muted small mb-0">You haven't published any campus drives yet. Fill the form to create your first drive!</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Right: Create/Edit Form -->
        <div class="col-lg-5">
            <div class="dashboard-box-card" id="driveFormCard">
                <h6 class="fw-bold mb-1 text-dark font-heading" id="cmpDriveFormTitle">
                    <i class="fa-solid fa-circle-plus text-danger me-2"></i>Create New Drive
                </h6>
                <p class="text-muted small mb-3">Fill in the details below to publish or update a campus recruitment drive.</p>

                <div class="form-section-title-custom">Job Information</div>

                <div class="mb-3">
                    <label class="form-label text-secondary small fw-bold mb-1">Recruiting Job Role</label>
                    <asp:TextBox ID="cmpDriveRole" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. SDE-1 Freshers / Full Stack Developer" required="required" Style="border-radius: 8px;"></asp:TextBox>
                </div>
                <div class="row g-2 mb-3">
                    <div class="col-4">
                        <label class="form-label text-secondary small fw-bold mb-1">Package</label>
                        <asp:TextBox ID="cmpDrivePackage" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. 7.5 LPA" required="required" Style="border-radius: 8px;"></asp:TextBox>
                    </div>
                    <div class="col-4">
                        <label class="form-label text-secondary small fw-bold mb-1">Min CGPA</label>
                        <asp:TextBox ID="cmpDriveMinCgpa" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. 7.0" required="required" Style="border-radius: 8px;"></asp:TextBox>
                    </div>
                    <div class="col-4">
                        <label class="form-label text-secondary small fw-bold mb-1">Vacancies</label>
                        <asp:TextBox ID="cmpDriveVacancies" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. 10 Positions" required="required" Style="border-radius: 8px;"></asp:TextBox>
                    </div>
                </div>

                <div class="form-section-title-custom mt-3">Drive Criteria &amp; Venue</div>

                <div class="row g-2 mb-3">
                    <div class="col-6">
                        <label class="form-label text-secondary small fw-bold mb-1">Drive Date</label>
                        <asp:TextBox ID="cmpDriveDate" runat="server" TextMode="Date" CssClass="form-control form-control-sm" required="required" Style="border-radius: 8px;"></asp:TextBox>
                    </div>
                    <div class="col-6">
                        <label class="form-label text-secondary small fw-bold mb-1">Status</label>
                        <asp:DropDownList ID="cmpDriveStatus" runat="server" CssClass="form-select form-select-sm" Style="border-radius: 8px; font-weight: 500;">
                            <asp:ListItem Value="Open">Open</asp:ListItem>
                            <asp:ListItem Value="Closed">Closed</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-secondary small fw-bold mb-1">Venue / Online Link</label>
                    <asp:TextBox ID="cmpDriveLocation" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. RKU Seminar Hall-2 / Google Meet" required="required" Style="border-radius: 8px;"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label text-secondary small fw-bold mb-1">Job Description &amp; Eligibility</label>
                    <asp:TextBox ID="cmpDriveDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control form-control-sm" placeholder="Enter key eligibility criteria, tech stack, selection process..." required="required" Style="border-radius: 8px;"></asp:TextBox>
                </div>

                <div class="d-flex gap-2 justify-content-end mt-4 pt-2 border-top">
                    <asp:Button ID="cmpBtnResetDrive" runat="server" Text="Reset" CssClass="btn btn-light btn-sm px-3 border" OnClick="cmpBtnResetDrive_Click" UseSubmitBehavior="false" Style="border-radius: 8px;" />
                    <asp:Button ID="cmpBtnSubmitDrive" runat="server" Text="Publish Drive" CssClass="btn-rku-orange btn-sm px-4" OnClick="cmpBtnSubmitDrive_Click" Style="font-weight: 600;" />
                </div>
            </div>
        </div>
    </div>

    <script>
        function showCreateForm() {
            var el = document.getElementById('driveFormCard');
            if (el) {
                el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
    </script>
</asp:Content>
