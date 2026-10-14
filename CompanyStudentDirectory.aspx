<%@ Page Title="Student Directory | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyStudentDirectory.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyStudentDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Card & Layout Enhancements */
        .page-header-box {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.25rem;
        }

        .filter-container-box {
            background: #ffffff;
            border: 1px solid #eef2f6;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            padding: 1.25rem;
            margin-bottom: 1.25rem;
        }

        /* Modern Badges & Indicators */
        .roll-badge-pro {
            background: #f8fafc;
            color: #334155;
            font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
            font-weight: 700;
            font-size: 0.82rem;
            padding: 5px 9px;
            border-radius: 7px;
            border: 1px solid #e2e8f0;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.03);
            white-space: nowrap;
        }

        /* Student Info & Contact Block - Clean & Spaced */
        .student-info-block {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .student-name-title {
            font-size: 0.94rem;
            font-weight: 700;
            color: #1e293b;
            line-height: 1.35;
        }

        .student-contact-details {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 7px;
            font-size: 0.81rem;
            color: #64748b;
            line-height: 1.35;
        }

            .contact-item i {
                font-size: 0.8rem;
                width: 14px;
                text-align: center;
                color: #64748b;
            }

            .contact-item span {
                color: #475569;
                word-break: break-all;
            }

        .cpi-badge-pro {
            background: rgba(16, 185, 129, 0.1);
            color: #059669;
            border: 1px solid rgba(16, 185, 129, 0.2);
            font-size: 0.76rem;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
        }

        .backlog-badge-pro {
            background: #f8fafc;
            color: #64748b;
            border: 1px solid #e2e8f0;
            font-size: 0.76rem;
            font-weight: 500;
            padding: 2px 8px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
        }

        /* Skills Pill Layout */
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
            padding: 2px 7px;
            border-radius: 5px;
            display: inline-block;
            transition: all 0.15s ease;
        }

            .skill-pill-pro:hover {
                background: #e2e8f0;
                color: #0f172a;
            }

        /* Resume PDF Action Button */
        .btn-resume-action {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            padding: 5px 10px;
            border-radius: 7px;
            background: #fef2f2;
            color: #ef4444;
            border: 1px solid #fee2e2;
            text-decoration: none !important;
            font-size: 0.77rem;
            font-weight: 700;
            transition: all 0.2s ease;
        }

            .btn-resume-action:hover {
                background: #ef4444;
                color: #ffffff !important;
                border-color: #ef4444;
                transform: translateY(-1px);
                box-shadow: 0 3px 8px rgba(239, 68, 68, 0.25);
            }

                .btn-resume-action:hover i {
                    color: #ffffff !important;
                }

        /* Profile Button Pro */
        .btn-view-profile-pro {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 6px 14px;
            border-radius: 8px;
            background: #ffffff;
            color: #2563eb;
            border: 1.5px solid #bfdbfe;
            font-size: 0.81rem;
            font-weight: 600;
            text-decoration: none !important;
            transition: all 0.2s ease;
            white-space: nowrap;
        }

            .btn-view-profile-pro:hover {
                background: linear-gradient(135deg, #2563eb, #1d4ed8);
                color: #ffffff !important;
                border-color: #2563eb;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.22);
            }

                .btn-view-profile-pro:hover i {
                    color: #ffffff !important;
                }

        /* Responsive Table Container & Styling */
        .table-responsive-custom {
            border-radius: 12px;
            border: 1px solid #eef2f6;
            background: #ffffff;
            box-shadow: 0 2px 12px rgba(15, 23, 42, 0.03);
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        .table-custom-students {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            min-width: 920px;
        }

            .table-custom-students thead th {
                background: #f8fafc;
                color: #475569;
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                padding: 0.95rem 1rem;
                border-top: none;
                border-bottom: 2px solid #e2e8f0;
                vertical-align: middle;
                white-space: nowrap;
            }

            .table-custom-students tbody td {
                padding: 1.05rem 1rem;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                background: #ffffff;
                transition: all 0.15s ease;
            }

            .table-custom-students tbody tr:hover td {
                background-color: #fbfcfe;
            }

            .table-custom-students tbody tr:last-child td {
                border-bottom: none;
            }

        @media (max-width: 768px) {
            .table-custom-students {
                min-width: 860px;
            }
        }

        /* Drawer Custom Styling */
        .student-drawer-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ef3724;
            box-shadow: 0 4px 12px rgba(163, 15, 20, 0.15);
        }

        .student-drawer-avatar-fallback {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #ef3724, #a30f14);
            color: #ffffff;
            font-size: 1.8rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 3px solid #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .drawer-detail-card {
            background: #f8fafc;
            border-radius: 12px;
            padding: 1rem;
            border: 1px solid #e2e8f0;
        }

        @keyframes slideInRightDrawer {
            from {
                transform: translateX(100%);
            }

            to {
                transform: translateX(0);
            }
        }

        .side-drawer-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(2px);
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
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Page Top Header -->
    <div class="page-header-box">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="text-uppercase fw-bold text-rku-red small mb-1" style="letter-spacing: 0.08em; font-size: 0.75rem;">TALENT POOL</div>
                <h3 class="mb-1 fw-bold text-dark font-heading">Student Talent Directory</h3>
                <p class="mb-0 text-muted small">Browse registered candidates, filter by academic branch &amp; skills, inspect full profiles, and view resume PDFs.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:HyperLink ID="lnkManageDrives" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="btn btn-outline-secondary btn-sm px-3 py-2 me-2" Style="border-radius: 8px; font-weight: 600;">
                    <i class="fa-solid fa-bullhorn me-1"></i>Campus Drives
                </asp:HyperLink>

                <asp:HyperLink ID="lnkApplicants" runat="server" NavigateUrl="CompanyApplicants.aspx" CssClass="btn btn-rku btn-sm px-3 py-2" Style="border-radius: 8px; font-weight: 600;">
                    <i class="fa-solid fa-list-check me-1"></i>Applications
                </asp:HyperLink>
            </div>
        </div>
    </div>

    <!-- Main Content Box: Filters + Table -->
    <div class="filter-container-box">
        <!-- Filter Controls Row -->
        <div class="row g-3 align-items-center mb-3 pb-3 border-bottom">
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-graduation-cap me-1 text-rku-red"></i>Filter by Branch
               
                </label>
                <asp:DropDownList ID="studentBranchFilter" runat="server" ClientIDMode="Static" CssClass="form-select form-select-sm" onchange="filterStudentTable()" Style="border-radius: 8px; font-weight: 500;">
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
                    <i class="fa-solid fa-magnifying-glass me-1 text-rku-red"></i>Instant Candidate Search
               
                </label>
                <div class="input-group input-group-sm">
                    <span class="input-group-text bg-light border-end-0 text-muted" style="border-radius: 8px 0 0 8px;">
                        <i class="fa-solid fa-search"></i>
                    </span>
                    <asp:TextBox ID="studentSearchInput" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm border-start-0" Style="border-radius: 0 8px 8px 0;" placeholder="Search by student name, enrollment no, email, degree..." onkeyup="filterStudentTable()"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Table Header Bar -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
                <h6 class="fw-bold mb-0 text-dark font-heading">
                    <i class="fa-solid fa-users text-rku-maroon me-2"></i>Registered Students
                   
                    <span class="badge bg-light text-dark border ms-1 fw-bold">
                        <asp:Label ID="lblStudentCount" runat="server" Text="0"></asp:Label></span>
                </h6>
            </div>
            <div class="text-muted small">
                <i class="fa-regular fa-lightbulb text-warning me-1"></i>Click "Profile" to inspect complete candidate details
           
            </div>
        </div>

        <!-- GridView Students Table (Responsive Modern Layout) -->
        <div class="table-responsive-custom">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table table-custom-students align-middle mb-0 custom-gridview" GridLines="None"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Enrollment / ID">
                        <HeaderStyle Width="15%" />
                        <ItemTemplate>
                            <span class="roll-badge-pro">
                                <i class="fa-solid fa-id-badge text-secondary me-1.5 opacity-75"></i><%# Eval("regRollNo") != DBNull.Value && !string.IsNullOrEmpty(Eval("regRollNo").ToString()) ? Eval("regRollNo") : Eval("regUsername") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Info &amp; Contact">
                        <HeaderStyle Width="25%" />
                        <ItemTemplate>
                            <div class="student-info-block py-1">
                                <div class="student-name-title">
                                    <%# Eval("regFullName") %>
                                </div>
                                <div class="student-contact-details">
                                    <div class="contact-item">
                                        <i class="fa-regular fa-envelope text-danger opacity-75"></i>
                                        <span><%# Eval("regEmail") %></span>
                                    </div>
                                    <div class="contact-item">
                                        <i class="fa-solid fa-phone text-success opacity-75"></i>
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
                                <span class="backlog-badge-pro">Backlogs: <strong><%# Eval("backlogs") != DBNull.Value && !string.IsNullOrEmpty(Eval("backlogs").ToString()) ? Eval("backlogs") : "0" %></strong>
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
                        <div class="mb-3 text-muted" style="font-size: 2.8rem; opacity: 0.5;"><i class="fa-regular fa-folder-open"></i></div>
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
                    <i class="fa-solid fa-user-graduate text-rku-maroon me-2"></i>Student Candidate Profile
                </h6>
                <asp:LinkButton ID="btnCloseProfileX" runat="server" CssClass="btn-close" OnClick="btnCloseProfile_Click"></asp:LinkButton>
            </div>

            <!-- Scrollable Body -->
            <div class="p-4" style="overflow-y: auto; flex: 1;">
                <!-- Header with Avatar & Name -->
                <div class="text-center pb-3 border-bottom mb-3">
                    <div class="d-inline-block mb-2">
                        <asp:Image ID="imgStudentPhoto" runat="server" CssClass="mx-auto" Style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid #ef3724;" />
                        <div id="divFallbackPhoto" runat="server" style="width: 80px; height: 80px; border-radius: 50%; background: linear-gradient(135deg, #ef3724, #a30f14); color: #fff; font-size: 1.8rem; font-weight: 700; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">SP</div>
                    </div>
                    <h4 class="fw-bold mb-1 font-heading text-dark">
                        <asp:Label ID="lblStudentName" runat="server"></asp:Label>
                    </h4>
                    <div class="text-muted small">
                        <span class="badge text-white me-1" style="background: #ef3724;">STUDENT</span>
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
                            <span class="badge bg-success bg-opacity-10 text-success fw-bold fs-6">
                                <asp:Label ID="lblCgpa" runat="server"></asp:Label></span>
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
                    <asp:HyperLink ID="lnkResume" runat="server" Target="_blank" CssClass="btn btn-sm btn-danger px-3 py-2 w-100" Style="border-radius: 8px;">
                        <i class="fa-solid fa-file-pdf me-2"></i>View / Download Resume PDF
                    </asp:HyperLink>
                    <asp:Label ID="lblNoResume" runat="server" Text="Resume not uploaded yet." CssClass="text-muted small" Visible="false"></asp:Label>
                </div>
            </div>

            <!-- Footer Action Button -->
            <div class="p-3 border-top bg-light">
                <asp:Button ID="btnCloseProfile" runat="server" CssClass="btn btn-outline-secondary w-100 py-2" Text="Close Profile" OnClick="btnCloseProfile_Click" Style="border-radius: 8px; font-weight: 600;" />
            </div>
        </div>
    </div>

    <!-- Client-Side Filter Script -->
    <script>
        function filterStudentTable() {
            const query = document.getElementById('studentSearchInput').value.toLowerCase();
            const branch = document.getElementById('studentBranchFilter').value.toLowerCase();
            const rows = document.querySelectorAll('.table-custom-students tbody tr');

            rows.forEach(row => {
                const text = row.innerText.toLowerCase();
                const matchesSearch = !query || text.includes(query);
                const matchesBranch = branch === 'all' || text.includes(branch);

                if (matchesSearch && matchesBranch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
