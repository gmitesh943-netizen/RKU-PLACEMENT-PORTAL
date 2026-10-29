<%@ Page Title="Applicants & Selection | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyApplicants.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyApplicants" %>

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

        /* ─── HERO HEADER (Matching AdminDashboard) ─── */
        .dash-hero-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .dash-hero-card::before {
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
            letter-spacing: 0.5px;
        }

        /* ─── 4 STAT CARDS (Matching AdminDashboard) ─── */
        .stat-card-clean {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-top: 4px solid var(--rku-orange-red);
            border-radius: 16px;
            padding: 1.4rem 1.4rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .stat-card-clean:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 28px rgba(239, 55, 36, 0.1);
                border-color: #fca5a5;
            }

        .stat-icon-chip {
            width: 46px;
            height: 46px;
            border-radius: 12px;
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            transition: all 0.25s ease;
        }

        .stat-card-clean:hover .stat-icon-chip {
            background: var(--rku-orange-red);
            color: #ffffff;
        }

        .stat-card-tag {
            background: #f8fafc;
            border: 1px solid var(--rku-border);
            color: var(--rku-gray);
            font-size: 0.72rem;
            font-weight: 600;
            padding: 0.25rem 0.65rem;
            border-radius: 50px;
        }

        .stat-num-black {
            font-family: var(--font-heading);
            font-weight: 800;
            color: var(--rku-dark);
            font-size: 2.2rem;
            line-height: 1.1;
            margin: 0.35rem 0 0 0;
        }

        .stat-watermark-icon {
            position: absolute;
            right: -8px;
            bottom: -10px;
            font-size: 5rem;
            color: var(--rku-orange-red);
            opacity: 0.04;
            pointer-events: none;
        }

        /* ─── CONTAINER CARD ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .btn-rku-orange {
            background: linear-gradient(135deg, #ef3724 0%, #d82b19 100%) !important;
            background-color: #ef3724 !important;
            border: 1px solid #d82b19 !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            padding: 0.45rem 1.15rem !important;
            border-radius: 50px !important;
            font-size: 0.82rem !important;
            transition: all 0.25s ease !important;
            text-decoration: none !important;
            display: inline-block !important;
            text-align: center !important;
            box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25) !important;
            cursor: pointer !important;
        }

            .btn-rku-orange:hover {
                background: linear-gradient(135deg, #d82b19 0%, #a30f14 100%) !important;
                background-color: #d82b19 !important;
                border-color: #a30f14 !important;
                color: #ffffff !important;
                transform: translateY(-1px) !important;
                box-shadow: 0 6px 18px rgba(239, 55, 36, 0.35) !important;
            }

        /* ─── CUSTOM DASH TABLE ─── */
        .custom-dash-table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }

            .custom-dash-table th {
                background-color: #f8fafc;
                color: var(--rku-dark);
                font-size: 0.74rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.6px;
                padding: 13px 14px;
                border-bottom: 1px solid var(--rku-border);
                white-space: nowrap;
            }

            .custom-dash-table td {
                padding: 13px 14px;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                font-size: 0.88rem;
                background: #ffffff;
                transition: background 0.15s ease;
            }

            .custom-dash-table tr:hover td {
                background-color: #fffafa;
            }

            .custom-dash-table tr:last-child td {
                border-bottom: none;
            }

        /* Status Badges */
        .app-status-badge {
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            white-space: nowrap;
        }

        .status-pending {
            background-color: #fff8e6;
            color: #b78103;
            border: 1px solid #ffe8a3;
        }

        .status-shortlisted {
            background-color: #e8f4fd;
            color: #0369a1;
            border: 1px solid #bae6fd;
        }

        .status-selected {
            background-color: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .status-rejected {
            background-color: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .status-under-review {
            background-color: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
        }

        /* Tags */
        .roll-badge {
            background: #f8fafc;
            color: #334155;
            font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
            font-weight: 700;
            font-size: 0.82rem;
            padding: 4px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            display: inline-block;
        }

        .cgpa-tag {
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.78rem;
            display: inline-block;
            margin-top: 3px;
        }

        /* Action Buttons */
        .action-btn-circle {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            font-size: 0.85rem;
            transition: all 0.2s ease;
            text-decoration: none !important;
            flex-shrink: 0;
        }

            .action-btn-circle:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }

        .btn-save-status {
            background: #2563eb;
            color: #ffffff;
        }

            .btn-save-status:hover {
                background: #1d4ed8;
                color: #ffffff;
            }

        .btn-schedule-round {
            background: #f59e0b;
            color: #ffffff;
        }

            .btn-schedule-round:hover {
                background: #d97706;
                color: #ffffff;
            }

        .btn-resume-pdf {
            background: #ef4444;
            color: #ffffff;
        }

            .btn-resume-pdf:hover {
                background: #dc2626;
                color: #ffffff;
            }

        /* Pagination */
        .pagination-pages {
            font-weight: 700;
            font-size: 0.88rem;
            color: var(--rku-dark);
            padding: 0 0.5rem;
        }

        .pagination .btn[disabled] {
            opacity: 0.45;
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Page Top Header (Matching AdminDashboard) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-users-viewfinder me-1"></i>CANDIDATE RECRUITMENT
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Live Applicants Tracking
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">
                    Applicants &amp; Selection Tracker
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Review registered candidates, update application stages, schedule interviews, and view resumes.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap align-items-center">
                <asp:HyperLink ID="lnkManageDrives" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="btn btn-light border px-3 py-2 rounded-pill fw-semibold shadow-sm" style="font-size: 0.82rem;">
                    <i class="fa-solid fa-bullhorn me-1" style="color: var(--rku-orange-red);"></i>Campus Drives
                </asp:HyperLink>
                <asp:HyperLink ID="lnkStudentDirectory" runat="server" NavigateUrl="CompanyStudentDirectory.aspx" CssClass="btn-rku-orange shadow-sm">
                    <i class="fa-solid fa-users me-1"></i>Student Directory
                </asp:HyperLink>
            </div>
        </div>
    </div>

    <!-- Alert / Notification Message -->
    <div id="pnlAlert" runat="server" visible="false" class="alert alert-dismissible fade show mb-3 border-0 shadow-sm" role="alert" style="border-radius: 10px;">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <!-- 4 Clean Stat KPI Cards (Matching AdminDashboard) -->
    <div class="row g-3 mb-4">
        <!-- 1. Total Applications -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-file-lines stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-file-lines"></i>
                        </div>
                        <span class="stat-card-tag">All Candidates</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Total Applications</div>
                    <h2 class="stat-num-black" id="statTotalApplicants" runat="server">0</h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-circle-check text-success me-1"></i>Received Resumes &amp; Profiles
                </div>
            </div>
        </div>

        <!-- 2. Shortlisted -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-user-check stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-user-check"></i>
                        </div>
                        <span class="stat-card-tag">Evaluation</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Shortlisted</div>
                    <h2 class="stat-num-black" id="statShortlisted" runat="server">0</h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-star text-warning me-1"></i>Screened for Interview Rounds
                </div>
            </div>
        </div>

        <!-- 3. Selected / Placed -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-award stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-trophy"></i>
                        </div>
                        <span class="stat-card-tag">Selected</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Selected / Placed</div>
                    <h2 class="stat-num-black" id="statSelected" runat="server">0</h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-circle-check text-success me-1"></i>Final Offers Extended
                </div>
            </div>
        </div>

        <!-- 4. Pending Review -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-clock stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-hourglass-half"></i>
                        </div>
                        <span class="stat-card-tag">Awaiting</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Pending Review</div>
                    <h2 class="stat-num-black" id="statPending" runat="server">0</h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-bolt text-warning me-1"></i>Action Required on Profiles
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content Box: Filters + Table (Matching AdminDashboard) -->
    <div class="dash-card-white">
        <!-- Filter Controls Row -->
        <div class="row g-3 align-items-center mb-3 pb-3 border-bottom">
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-filter me-1" style="color: var(--rku-orange-red);"></i>Filter by Campus Drive
                </label>
                <asp:DropDownList ID="ddlDriveFilter" runat="server" CssClass="form-select form-select-sm"
                    Style="border-radius: 8px; font-weight: 500;" AutoPostBack="true" OnSelectedIndexChanged="ddlDriveFilter_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-layer-group me-1" style="color: var(--rku-orange-red);"></i>Status Filter
                </label>
                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-select form-select-sm"
                    Style="border-radius: 8px; font-weight: 500;" AutoPostBack="true" OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged">
                    <asp:ListItem Value="All" Text="All Application Statuses" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                    <asp:ListItem Value="Under Review" Text="Under Review"></asp:ListItem>
                    <asp:ListItem Value="Shortlisted" Text="Shortlisted"></asp:ListItem>
                    <asp:ListItem Value="Selected" Text="Selected / Placed"></asp:ListItem>
                    <asp:ListItem Value="Rejected" Text="Rejected"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-5">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-magnifying-glass me-1" style="color: var(--rku-orange-red);"></i>Search Candidates
                </label>
                <div class="input-group input-group-sm">
                    <span class="input-group-text bg-light border-end-0 text-muted" style="border-radius: 8px 0 0 8px;">
                        <i class="fa-solid fa-search"></i>
                    </span>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm border-start-0"
                        placeholder="Search by student name, roll no, email..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-sm btn-rku-orange px-3 ms-2" />
                    <asp:Button ID="btnClearFilters" runat="server" Text="Reset" OnClick="btnClearFilters_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill ms-1" />
                </div>
            </div>
        </div>

        <!-- Table Header Bar -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
                <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 1.05rem;">
                    <i class="fa-solid fa-list-check me-2" style="color: var(--rku-orange-red);"></i>Candidate Applications
                    <span class="badge bg-light text-dark border ms-1 fw-bold">
                        <asp:Label ID="lblApplicantCount" runat="server" Text="0"></asp:Label>
                    </span>
                </h6>
            </div>
            <div class="text-muted small">
                <i class="fa-regular fa-lightbulb text-warning me-1"></i>Select a status and click checkmark to update
            </div>
        </div>

        <!-- GridView Applicants Table -->
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="Id"
                CssClass="table custom-dash-table align-middle mb-0 custom-gridview" GridLines="None"
                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Roll No / ID">
                        <HeaderStyle Width="13%" />
                        <ItemTemplate>
                            <span class="roll-badge"><%# Eval("StudentRollNo") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Info &amp; Contact">
                        <HeaderStyle Width="23%" />
                        <ItemTemplate>
                            <div class="fw-bold text-dark font-heading" style="font-size: 0.92rem;"><%# Eval("StudentName") %></div>
                            <div class="text-muted small mt-1">
                                <div><i class="fa-regular fa-envelope me-1 text-secondary"></i><%# Eval("StudentEmail") %></div>
                                <div><i class="fa-solid fa-phone me-1 text-secondary"></i><%# Eval("StudentMobile") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Job Role &amp; Date">
                        <HeaderStyle Width="18%" />
                        <ItemTemplate>
                            <div class="fw-semibold text-dark"><%# Eval("JobRole") %></div>
                            <div class="text-muted small mt-1">
                                <i class="fa-regular fa-calendar me-1 text-secondary"></i><%# Eval("AppliedDate", "{0:dd-MM-yyyy}") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Branch &amp; CPI">
                        <HeaderStyle Width="16%" />
                        <ItemTemplate>
                            <div class="fw-semibold text-dark small"><%# Eval("StudentBranch") %></div>
                            <span class="cgpa-tag"><i class="fa-solid fa-chart-line me-1"></i>CPI: <%# Eval("StudentCgpa") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Current Status">
                        <HeaderStyle Width="14%" />
                        <ItemTemplate>
                            <span class='app-status-badge <%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString().Trim().ToLower() == "selected" || Eval("ApplicationStatus").ToString().Trim().ToLower() == "offer accepted") ? "status-selected" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "shortlisted" ? "status-shortlisted" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "rejected" ? "status-rejected" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower().Contains("review") ? "status-under-review" : "status-pending"))) %>'>
                                <i class='<%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString().Trim().ToLower() == "selected" || Eval("ApplicationStatus").ToString().Trim().ToLower() == "offer accepted") ? "fa-solid fa-circle-check" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "shortlisted" ? "fa-solid fa-user-check" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "rejected" ? "fa-solid fa-circle-xmark" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower().Contains("review") ? "fa-solid fa-magnifying-glass" : "fa-regular fa-clock"))) %>'></i>
                                <%# Eval("ApplicationStatus") %>
                            </span>
                            <%# Eval("InterviewDate") != DBNull.Value && !string.IsNullOrEmpty(Eval("InterviewDate").ToString()) ? "<div class='small text-primary mt-1 fw-semibold' style='font-size: 0.75rem;'><i class='fa-regular fa-calendar-check me-1'></i>" + Eval("InterviewDate") + "</div>" : "" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions &amp; Decision">
                        <HeaderStyle Width="16%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <asp:DropDownList ID="ddlRowStatus" runat="server" CssClass="form-select form-select-sm"
                                    Style="width: 125px; font-size: 0.78rem; border-radius: 6px; padding: 0.3rem 0.5rem;">
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="Under Review">Under Review</asp:ListItem>
                                    <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                                    <asp:ListItem Value="Selected">Selected</asp:ListItem>
                                    <asp:ListItem Value="Offer Accepted">Offer Accepted</asp:ListItem>
                                    <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                </asp:DropDownList>

                                <asp:LinkButton ID="btnSaveRowStatus" runat="server" CssClass="action-btn-circle btn-save-status" CommandName="UpdateStatus" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' title="Save Status"><i class="fa-solid fa-check"></i></asp:LinkButton>

                                <asp:LinkButton ID="btnScheduleModal" runat="server" CssClass="action-btn-circle btn-schedule-round" CommandName="ScheduleInterview" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' title="Schedule Interview"><i class="fa-regular fa-calendar-plus"></i></asp:LinkButton>

                                <a href='<%# Eval("StudentResume") != DBNull.Value && !string.IsNullOrEmpty(Eval("StudentResume").ToString()) ? ResolveUrl("~/assets/StudentPDF/" + Eval("StudentResume")) : "javascript:alert(\"Resume not uploaded by student yet.\");" %>'
                                    target='<%# Eval("StudentResume") != DBNull.Value && !string.IsNullOrEmpty(Eval("StudentResume").ToString()) ? "_blank" : "_self" %>'
                                    class='action-btn-circle btn-resume-pdf' title='View Resume PDF'>
                                    <i class='fa-solid fa-file-pdf'></i>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center py-5">
                        <div class="mb-3 text-muted" style="font-size: 2.8rem; opacity: 0.5;"><i class="fa-regular fa-folder-open"></i></div>
                        <h6 class="fw-bold text-dark mb-1 font-heading">No Applications Found</h6>
                        <p class="text-muted small mb-0">No students match your selected campus drive or status filter.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <!-- Pagination Controls -->
        <div class="pagination d-flex justify-content-center align-items-center gap-3 mt-3 pt-3 border-top">
            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill fw-semibold" />
            <asp:Label ID="lblPages" runat="server" CssClass="pagination-pages" Text="Page 1 of 1" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn btn-sm btn-rku-orange px-3 rounded-pill fw-semibold" />
        </div>
    </div>

    <!-- Schedule Interview Modal -->
    <div id="pnlScheduleModal" runat="server" visible="false">
        <div class="modal fade show d-block" tabindex="-1" style="background: rgba(15, 23, 42, 0.6); backdrop-filter: blur(4px); z-index: 1055;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow-lg" style="border-radius: 18px; overflow: hidden;">
                    <div class="modal-header border-bottom bg-light px-4 py-3">
                        <h5 class="modal-title fw-bold font-heading text-dark mb-0 fs-6">
                            <i class="fa-regular fa-calendar-check me-2" style="color: var(--rku-orange-red);"></i>Schedule Interview Round
                        </h5>
                        <asp:LinkButton ID="btnCloseModal" runat="server" CssClass="btn-close" OnClick="btnCloseModal_Click"></asp:LinkButton>
                    </div>
                    <div class="modal-body p-4">
                        <div class="p-3 bg-light rounded-3 mb-3 border">
                            <div class="small text-muted">Candidate Name</div>
                            <div class="fw-bold text-dark font-heading">
                                <asp:Label ID="lblModalStudentName" runat="server"></asp:Label>
                            </div>
                            <div class="small text-secondary mt-1">
                                Applying for: <strong>
                                    <asp:Label ID="lblModalJobRole" runat="server"></asp:Label></strong>
                            </div>
                        </div>

                        <asp:HiddenField ID="hfModalAppId" runat="server" />

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Interview Date &amp; Time</label>
                            <asp:TextBox ID="txtModalInterviewDate" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. 15 Oct 2026, 10:30 AM" Style="border-radius: 8px;"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Venue / Online Meeting Link</label>
                            <asp:TextBox ID="txtModalVenue" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. RKU Seminar Hall-2 or Google Meet Link" Style="border-radius: 8px;"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Remarks / Instructions for Student</label>
                            <asp:TextBox ID="txtModalRemarks" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control form-control-sm" placeholder="e.g. Please bring 2 hard copies of your updated resume." Style="border-radius: 8px;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer border-top bg-light px-4 py-3">
                        <asp:Button ID="btnCancelModal" runat="server" CssClass="btn btn-sm btn-light border px-3 rounded-pill" Text="Cancel" OnClick="btnCloseModal_Click" />
                        <asp:Button ID="btnSaveSchedule" runat="server" CssClass="btn btn-sm btn-rku-orange px-4 rounded-pill" Text="Save &amp; Shortlist" OnClick="btnSaveSchedule_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Client-side Fast Search Filter Script -->
    <script>
        function filterApplicantsTable() {
            var input = document.getElementById('applicantSearchInput');
            var filter = input.value.toLowerCase();
            var rows = document.querySelectorAll('.custom-gridview tbody tr:not(:first-child)');

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                if (text.indexOf(filter) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
