<%@ Page Title="Student Directory | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyStudentDirectory.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyStudentDirectory" %>

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

        /* ─── CONTAINER CARD ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        /* ─── BUTTONS ─── */
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

        /* ─── BADGES & LABELS ─── */
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

        .cpi-badge-pro {
            background: rgba(16, 185, 129, 0.1);
            color: #059669;
            border: 1px solid rgba(16, 185, 129, 0.2);
            font-size: 0.76rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
        }

        .backlog-badge-pro {
            background: #f8fafc;
            color: #64748b;
            border: 1px solid #e2e8f0;
            font-size: 0.76rem;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
        }

        /* ─── SKILLS PILLS ─── */
        .skills-cell-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 4px;
            max-width: 280px;
        }

        .skill-pill-pro {
            background: #f1f5f9;
            color: #334155;
            border: 1px solid #e2e8f0;
            font-size: 0.73rem;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 5px;
            display: inline-block;
            transition: all 0.15s ease;
        }

            .skill-pill-pro:hover {
                background: #e2e8f0;
                color: #0f172a;
            }

        /* ─── RESUME PDF BUTTON ─── */
        .btn-resume-action {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            padding: 5px 11px;
            border-radius: 8px;
            background: #fef2f2;
            color: #ef4444;
            border: 1px solid #fee2e2;
            text-decoration: none !important;
            font-size: 0.78rem;
            font-weight: 700;
            transition: all 0.2s ease;
        }

            .btn-resume-action:hover {
                background: #ef4444;
                color: #ffffff !important;
                border-color: #ef4444;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(239, 68, 68, 0.25);
            }

        /* ─── VIEW PROFILE BUTTON ─── */
        .btn-view-profile-pro {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 6px 14px;
            border-radius: 50px;
            background: #ffffff;
            color: var(--rku-orange-red);
            border: 1.5px solid rgba(239, 55, 36, 0.3);
            font-size: 0.81rem;
            font-weight: 700;
            text-decoration: none !important;
            transition: all 0.2s ease;
            white-space: nowrap;
        }

            .btn-view-profile-pro:hover {
                background: linear-gradient(135deg, #ef3724 0%, #d82b19 100%);
                color: #ffffff !important;
                border-color: #ef3724;
                transform: translateY(-1px);
                box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25);
            }

        /* ─── STUDENT INFO BLOCK ─── */
        .student-info-block {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .student-name-title {
            font-size: 0.92rem;
            font-weight: 700;
            color: #1e293b;
            line-height: 1.35;
        }

        .student-contact-details {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 7px;
            font-size: 0.81rem;
            color: #64748b;
        }

            .contact-item i {
                font-size: 0.8rem;
                width: 14px;
                text-align: center;
            }

            .contact-item span {
                color: #475569;
                word-break: break-all;
            }

        /* ─── SIDE DRAWER ─── */
        .side-drawer-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(15, 23, 42, 0.5);
            backdrop-filter: blur(3px);
            z-index: 1050;
        }

        .side-drawer-container {
            position: fixed;
            top: 0;
            right: 0;
            width: 460px;
            max-width: 92vw;
            height: 100vh;
            background: #ffffff;
            box-shadow: -8px 0 35px rgba(0, 0, 0, 0.2);
            z-index: 1055;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            animation: slideInRightDrawer 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes slideInRightDrawer {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(0);
            }
        }

        .drawer-detail-card {
            background: #f8fafc;
            border-radius: 12px;
            padding: 1rem;
            border: 1px solid #e2e8f0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Page Top Hero Card (AdminDashboard Design) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="hero-badge-red mb-2">
                    <i class="fa-solid fa-users me-1.5"></i>TALENT POOL
                </div>
                <h3 class="fw-bold text-dark font-heading mb-1">Student Talent Directory</h3>
                <p class="text-muted small mb-0">Browse registered candidates, filter by academic branch &amp; skills, inspect full profiles, and view resume PDFs.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:HyperLink ID="lnkManageDrives" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="btn btn-light border rounded-pill px-3 py-2 me-2" Style="font-size: 0.82rem; font-weight: 600;">
                    <i class="fa-solid fa-bullhorn me-1 text-muted"></i>Campus Drives
                </asp:HyperLink>

                <asp:HyperLink ID="lnkApplicants" runat="server" NavigateUrl="CompanyApplicants.aspx" CssClass="btn-rku-orange">
                    <i class="fa-solid fa-list-check me-1"></i>Applications
                </asp:HyperLink>
            </div>
        </div>
    </div>

    <!-- Main Container Card: Filters + Table -->
    <div class="dash-card-white">
        <!-- Filter Controls Row -->
        <div class="row g-3 align-items-end mb-4 pb-3 border-bottom">
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-graduation-cap me-1" style="color: var(--rku-orange-red);"></i>Filter by Branch
                </label>
                <asp:DropDownList ID="studentBranchFilter" runat="server" CssClass="form-select form-select-sm" AutoPostBack="true" OnSelectedIndexChanged="studentBranchFilter_SelectedIndexChanged" Style="border-radius: 8px; font-weight: 500; height: 38px;">
                    <asp:ListItem Value="all" Text="All Branches" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Computer Science" Text="Computer Science / IT"></asp:ListItem>
                    <asp:ListItem Value="BCA" Text="BCA"></asp:ListItem>
                    <asp:ListItem Value="MCA" Text="MCA"></asp:ListItem>
                    <asp:ListItem Value="Computer Engineering" Text="Computer Eng"></asp:ListItem>
                    <asp:ListItem Value="Information Technology" Text="Information Tech"></asp:ListItem>
                    <asp:ListItem Value="Mechanical Engineering" Text="Mechanical"></asp:ListItem>
                    <asp:ListItem Value="Civil Engineering" Text="Civil"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-8">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-magnifying-glass me-1" style="color: var(--rku-orange-red);"></i>Instant Candidate Search
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0 text-muted" style="border-radius: 8px 0 0 8px;">
                        <i class="fa-solid fa-search"></i>
                    </span>
                    <asp:TextBox ID="studentSearchInput" runat="server" CssClass="form-control border-start-0" Style="border-radius: 0 8px 8px 0; height: 38px; font-size: 0.88rem;" placeholder="Search by student name, enrollment no, email, degree..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-rku-orange ms-2" />
                    <asp:Button ID="btnClearFilters" runat="server" Text="Reset" OnClick="btnClearFilters_Click" CssClass="btn btn-light border rounded-pill px-3 fw-semibold ms-1" Style="font-size: 0.82rem;" />
                </div>
            </div>
        </div>

        <!-- Table Header Bar -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
                <h6 class="fw-bold mb-0 text-dark font-heading">
                    <i class="fa-solid fa-users me-2" style="color: var(--rku-orange-red);"></i>Registered Students
                    <span class="hero-badge-red ms-2">
                        <asp:Label ID="lblStudentCount" runat="server" Text="0"></asp:Label> Total
                    </span>
                </h6>
            </div>
            <div class="text-muted small">
                <i class="fa-regular fa-lightbulb text-warning me-1"></i>Click "Profile" to inspect complete candidate details
            </div>
        </div>

        <!-- GridView Students Table (Responsive Modern Layout) -->
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="custom-dash-table" GridLines="None"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Enrollment / ID">
                        <HeaderStyle Width="15%" />
                        <ItemTemplate>
                            <span class="roll-badge">
                                <i class="fa-solid fa-id-badge text-secondary me-1.5 opacity-75"></i><%# Eval("regRollNo") != DBNull.Value && !string.IsNullOrEmpty(Eval("regRollNo").ToString()) ? Eval("regRollNo") : Eval("regUsername") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Info &amp; Contact">
                        <HeaderStyle Width="25%" />
                        <ItemTemplate>
                            <div class="student-info-block py-1">
                                <div class="student-name-title fw-bold text-dark">
                                    <%# Eval("regFullName") %>
                                </div>
                                <div class="student-contact-details mt-1">
                                    <div class="contact-item">
                                        <i class="fa-regular fa-envelope" style="color: var(--rku-orange-red);"></i>
                                        <span><%# Eval("regEmail") %></span>
                                    </div>
                                    <div class="contact-item">
                                        <i class="fa-solid fa-phone text-success"></i>
                                        <span><%# Eval("regMobile") %></span>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Degree &amp; Branch">
                        <HeaderStyle Width="22%" />
                        <ItemTemplate>
                            <div class="fw-bold text-dark" style="font-size: 0.88rem;">
                                <i class="fa-solid fa-graduation-cap me-1.5 text-secondary opacity-75"></i><%# Eval("degree") != DBNull.Value && !string.IsNullOrEmpty(Eval("degree").ToString()) ? Eval("degree") : "BCA" %>
                                <span class="text-muted fw-normal" style="font-size: 0.82rem;">(<%# Eval("branch") != DBNull.Value && !string.IsNullOrEmpty(Eval("branch").ToString()) ? Eval("branch") : "Computer Science" %>)</span>
                            </div>
                            <div class="mt-2 d-flex align-items-center gap-2 flex-wrap">
                                <span class="cpi-badge-pro">
                                    <i class="fa-solid fa-chart-line me-1"></i>CPI: <strong><%# Eval("cgpa") != DBNull.Value && !string.IsNullOrEmpty(Eval("cgpa").ToString()) ? Eval("cgpa") : "8.50" %></strong>
                                </span>
                                <span class="backlog-badge-pro">
                                    Backlogs: <strong><%# Eval("backlogs") != DBNull.Value && !string.IsNullOrEmpty(Eval("backlogs").ToString()) ? Eval("backlogs") : "0" %></strong>
                                </span>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Registered Skills">
                        <HeaderStyle Width="20%" />
                        <ItemTemplate>
                            <div class="skills-cell-wrapper">
                                <%# Eval("skills") != DBNull.Value && !string.IsNullOrEmpty(Eval("skills").ToString().Trim()) && Eval("skills").ToString().Trim().ToLower() != "none" ? 
                                    "<span class='skill-pill-pro'>" + Eval("skills").ToString().Replace(",", "</span><span class='skill-pill-pro'>") + "</span>" : 
                                    "<span class='text-muted small fst-italic'>No skills listed</span>" %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Resume">
                        <HeaderStyle Width="8%" CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkPdfResume" runat="server" NavigateUrl='<%# Eval("resumeUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("resumeUrl").ToString()) ? ResolveUrl("~/assets/StudentPDF/" + Eval("resumeUrl")) : "javascript:void(0);" %>' Target='<%# Eval("resumeUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("resumeUrl").ToString()) ? "_blank" : "_self" %>' onclick='<%# Eval("resumeUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("resumeUrl").ToString()) ? "" : "alert(\"Resume PDF not uploaded by student yet.\"); return false;" %>' CssClass="btn-resume-action" ToolTip="View / Download Student Resume PDF"><i class="fa-solid fa-file-pdf"></i> <span>PDF</span></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <HeaderStyle Width="10%" CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="btnProfile" runat="server" CommandName="ViewProfile" CommandArgument='<%# Eval("Id") %>' CssClass="btn-view-profile-pro" title="View Full Profile in Side Drawer"><i class="fa-regular fa-id-card"></i> <span>Profile</span></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center py-5">
                        <div class="mb-3" style="font-size: 2.8rem; color: var(--rku-orange-red); opacity: 0.35;"><i class="fa-regular fa-folder-open"></i></div>
                        <h6 class="fw-bold text-dark mb-1 font-heading">No Students Found</h6>
                        <p class="text-muted small mb-0">No registered students match your filter criteria.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <!-- ===== STUDENT PROFILE RIGHT SIDEBAR / DRAWER ===== -->
    <div id="pnlStudentProfile" runat="server" visible="false">
        <!-- Backdrop (click to close) -->
        <div class="side-drawer-backdrop">
            <asp:LinkButton ID="btnBackdropClose" runat="server" OnClick="btnCloseProfile_Click" Style="display: block; width: 100%; height: 100%; cursor: default;"></asp:LinkButton>
        </div>

        <!-- Right Side Drawer -->
        <div class="side-drawer-container">
            <!-- Header -->
            <div class="p-3 px-4 border-bottom bg-light d-flex justify-content-between align-items-center">
                <h6 class="fw-bold text-dark font-heading mb-0">
                    <i class="fa-solid fa-user-graduate me-2" style="color: var(--rku-orange-red);"></i>Student Candidate Profile
                </h6>
                <asp:LinkButton ID="btnCloseProfileX" runat="server" CssClass="btn-close" OnClick="btnCloseProfile_Click"></asp:LinkButton>
            </div>

            <!-- Scrollable Body -->
            <div class="p-4" style="overflow-y: auto; flex: 1;">
                <!-- Header with Avatar & Name -->
                <div class="text-center pb-3 border-bottom mb-3">
                    <div class="d-inline-block mb-2 position-relative">
                        <asp:Image ID="imgStudentPhoto" runat="server" CssClass="mx-auto" Style="width: 86px; height: 86px; border-radius: 50%; object-fit: cover; border: 3px solid #ef3724; box-shadow: 0 4px 14px rgba(239, 55, 36, 0.2);" />
                        <div id="divFallbackPhoto" runat="server" style="width: 86px; height: 86px; border-radius: 50%; background: linear-gradient(135deg, #ef3724, #d82b19); color: #fff; font-size: 1.8rem; font-weight: 700; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25); border: 3px solid #fff;">SP</div>
                    </div>
                    <h4 class="fw-bold mb-1 font-heading text-dark">
                        <asp:Label ID="lblStudentName" runat="server"></asp:Label>
                    </h4>
                    <div class="text-muted small mt-1">
                        <span class="hero-badge-red py-1 px-2.5 me-1">STUDENT</span>
                        Roll No: <strong class="text-dark font-monospace">
                            <asp:Label ID="lblRollNo" runat="server"></asp:Label></strong>
                    </div>
                </div>

                <!-- Contact Information -->
                <div class="drawer-detail-card mb-3">
                    <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-address-book text-primary me-2"></i>Contact Information</h6>
                    <div class="small mb-1 text-muted">
                        Email: <strong class="text-dark">
                            <asp:Label ID="lblEmail" runat="server"></asp:Label></strong>
                    </div>
                    <div class="small text-muted">
                        Mobile: <strong class="text-dark">
                            <asp:Label ID="lblMobile" runat="server"></asp:Label></strong>
                    </div>
                </div>

                <!-- Academic Information -->
                <div class="drawer-detail-card mb-3">
                    <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-graduation-cap text-success me-2"></i>Academic Details</h6>
                    <div class="row g-2 small">
                        <div class="col-6">
                            <span class="text-muted d-block">Degree &amp; Branch:</span>
                            <strong class="text-dark">
                                <asp:Label ID="lblDegreeBranch" runat="server"></asp:Label></strong>
                        </div>
                        <div class="col-6">
                            <span class="text-muted d-block">Semester:</span>
                            <strong class="text-dark">
                                <asp:Label ID="lblSemester" runat="server"></asp:Label></strong>
                        </div>
                        <div class="col-6 mt-2">
                            <span class="text-muted d-block">Cumulative CPI:</span>
                            <span class="cpi-badge-pro fs-6">
                                <asp:Label ID="lblCgpa" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="col-6 mt-2">
                            <span class="text-muted d-block">Active Backlogs:</span>
                            <strong class="text-dark">
                                <asp:Label ID="lblBacklogs" runat="server"></asp:Label></strong>
                        </div>
                    </div>
                </div>

                <!-- Technical Skills -->
                <div class="drawer-detail-card mb-3">
                    <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-code text-warning me-2"></i>Technical Skills</h6>
                    <div>
                        <span class="badge bg-white text-dark border px-2 py-1" style="font-size: 0.82rem;">
                            <asp:Label ID="lblSkills" runat="server"></asp:Label></span>
                    </div>
                </div>

                <!-- Resume PDF Link -->
                <div class="drawer-detail-card mb-2">
                    <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-file-pdf text-danger me-2"></i>Curriculum Vitae / Resume</h6>
                    <asp:HyperLink ID="lnkResume" runat="server" Target="_blank" CssClass="btn-rku-orange w-100 py-2 d-block">
                        <i class="fa-solid fa-file-pdf me-2"></i>View / Download Resume PDF
                    </asp:HyperLink>
                    <asp:Label ID="lblNoResume" runat="server" Text="Resume not uploaded yet." CssClass="text-muted small" Visible="false"></asp:Label>
                </div>
            </div>

            <!-- Footer Action Button -->
            <div class="p-3 border-top bg-light">
                <asp:Button ID="btnCloseProfile" runat="server" CssClass="btn btn-light border w-100 py-2 rounded-pill fw-semibold" Text="Close Profile" OnClick="btnCloseProfile_Click" />
            </div>
        </div>
    </div>
</asp:Content>
