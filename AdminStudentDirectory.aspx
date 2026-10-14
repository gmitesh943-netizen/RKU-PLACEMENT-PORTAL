<%@ Page Title="Student & Company Directory | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminStudentDirectory.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminStudentDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-red: #e03627;
            --rku-red-dark: #c5281b;
            --rku-maroon: #991b1b;
            --rku-dark: #0f172a;
        }

        .directory-hero-card {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 16px;
            padding: 1.5rem 1.85rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            margin-top: 0.25rem;
            margin-bottom: 1.5rem;
        }

        .directory-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .directory-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #0f172a !important;
            font-size: 1.75rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .directory-hero-card p {
            color: #64748b !important;
            font-size: 0.92rem;
            line-height: 1.55;
            margin-bottom: 0;
            max-width: 650px;
        }

        .hero-stat-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 0.55rem 1.15rem;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .hero-stat-badge.student-badge {
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
        }

        .hero-stat-badge.company-badge {
            background: #f8fafc;
            color: #0f172a;
            border: 1px solid #e2e8f0;
        }

        /* Modern Pill Navigation Tabs */
        .directory-tabs {
            border-bottom: none;
            gap: 10px;
            margin-bottom: 1.25rem;
        }

        .directory-tabs .nav-link {
            font-weight: 700;
            font-size: 0.9rem;
            color: #64748b;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 0.65rem 1.3rem;
            transition: all 0.25s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .directory-tabs .nav-link:hover {
            color: #0f172a;
            border-color: #cbd5e1;
            background: #fafbfc;
        }

        .directory-tabs .nav-link.active {
            color: #ffffff !important;
            background: linear-gradient(135deg, #e03627, #c5281b) !important;
            border-color: transparent !important;
            box-shadow: 0 4px 14px rgba(224, 54, 39, 0.25);
        }

        .directory-tabs .nav-link.active .tab-count-badge {
            background: rgba(255, 255, 255, 0.28);
            color: #ffffff;
        }

        .tab-count-badge {
            background: #f1f5f9;
            color: #475569;
            padding: 2px 8px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 800;
        }

        /* Main Card Container */
        .dir-main-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.03);
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .dir-main-card-head {
            padding: 1.15rem 1.5rem;
            background: #ffffff;
            border-bottom: 1px solid #edf2f7;
        }

        /* Custom Table Styling */
        .dir-table {
            margin-bottom: 0;
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .dir-table thead th {
            background: #f8fafc !important;
            color: #475569 !important;
            font-weight: 700 !important;
            font-size: 0.78rem !important;
            text-transform: uppercase !important;
            letter-spacing: 0.06em !important;
            padding: 1rem 1.15rem !important;
            border-top: none !important;
            border-bottom: 2px solid #e2e8f0 !important;
            vertical-align: middle;
            white-space: nowrap;
        }

        .dir-table tbody td {
            padding: 1.05rem 1.15rem !important;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
            background: #ffffff;
            font-size: 0.88rem;
            transition: background 0.15s ease;
        }

        .dir-table tbody tr:hover td {
            background-color: #f8fafc !important;
        }

        /* Badges & Tags */
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

        .cpi-tag {
            background: #fef2f2;
            color: #e03627;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 6px;
            border: 1px solid #fee2e2;
            font-size: 0.76rem;
            display: inline-block;
        }

        .backlog-tag {
            background: #f8fafc;
            color: #64748b;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            font-size: 0.74rem;
            display: inline-block;
        }

        .skill-badge-custom {
            display: inline-block;
            background: #f8fafc;
            color: #334155;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            line-height: 1.4;
            max-width: 100%;
        }

        /* Action Buttons */
        .btn-action-profile {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.75rem;
            border-radius: 8px;
            background: #ffffff;
            color: #1e293b;
            border: 1px solid #cbd5e1;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-action-profile:hover {
            background: #0f172a;
            color: #ffffff;
            border-color: #0f172a;
        }

        .btn-action-delete {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.75rem;
            border-radius: 8px;
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-action-delete:hover {
            background: #e03627;
            color: #ffffff;
            border-color: #e03627;
        }

        .resume-view-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 8px;
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .resume-view-btn:hover {
            background: #e03627;
            color: #ffffff;
            transform: scale(1.06);
        }

        /* Avatar styling */
        .student-table-avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ffffff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
            flex-shrink: 0;
        }

        .student-table-avatar-fallback {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff;
            font-size: 0.95rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(224, 54, 39, 0.2);
            flex-shrink: 0;
        }

        .company-avatar-fallback {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: #ffffff;
            font-size: 1.05rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            flex-shrink: 0;
        }

        .student-drawer-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #e03627;
            box-shadow: 0 4px 12px rgba(224, 54, 39, 0.2);
        }

        .student-drawer-avatar-fallback {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #e03627, #c5281b);
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
            border-radius: 14px;
            padding: 1.15rem;
            border: 1px solid #e2e8f0;
        }

        .skill-pill {
            display: inline-block;
            background: #ffffff;
            color: #1e293b;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 50px;
            border: 1px solid #e2e8f0;
            margin: 2px;
        }

        .offcanvas-profile-drawer {
            width: 440px !important;
            border-left: 1px solid #e2e8f0;
            box-shadow: -5px 0 30px rgba(0,0,0,0.1);
        }

        @media (max-width: 768px) {
            .offcanvas-profile-drawer {
                width: 100% !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner (Consistent White Card + Red Kicker) -->
    <div class="directory-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="directory-hero-kicker">
                    <i class="fa-solid fa-users-gear me-1"></i> MASTER DIRECTORY
                </div>
                <h2>User &amp; Recruiter Management</h2>
                <p>
                    Manage all registered student candidates and recruitment company partners across the campus placement portal.
                </p>
            </div>
            <div class="col-lg-5 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap">
                <span class="hero-stat-badge student-badge shadow-sm">
                    <i class="fa-solid fa-user-graduate"></i> Registered Students: <strong><asp:Label ID="lblStudentCount" runat="server" Text="0"></asp:Label></strong>
                </span>
                <span class="hero-stat-badge company-badge shadow-sm">
                    <i class="fa-solid fa-building"></i> Partner Companies: <strong><asp:Label ID="lblCompanyCount" runat="server" Text="0"></asp:Label></strong>
                </span>
            </div>
        </div>
    </div>

    <!-- Modern Pill Tab Navigation -->
    <ul class="nav directory-tabs" id="directoryTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="students-tab" data-bs-toggle="tab" data-bs-target="#students-pane" type="button" role="tab">
                <i class="fa-solid fa-user-graduate"></i> Registered Students 
                <span class="tab-count-badge ms-1"><%= lblStudentCount.Text %></span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="companies-tab" data-bs-toggle="tab" data-bs-target="#companies-pane" type="button" role="tab">
                <i class="fa-solid fa-building"></i> Recruiter Companies 
                <span class="tab-count-badge ms-1"><%= lblCompanyCount.Text %></span>
            </button>
        </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content" id="directoryTabContent">

        <!-- ==================== TAB 1: REGISTERED STUDENTS ==================== -->
        <div class="tab-pane fade show active" id="students-pane" role="tabpanel">
            <div class="dir-main-card">
                <div class="dir-main-card-head">
                    <div class="row g-2 justify-content-between align-items-center">
                        <div class="col-md-5">
                            <h6 class="fw-bold mb-0 text-dark font-heading">
                                <i class="fa-solid fa-users me-2" style="color: #e03627;"></i>Student Talent Pool
                            </h6>
                        </div>
                        <div class="col-md-7 d-flex gap-2 flex-wrap flex-sm-nowrap justify-content-end">
                            <div class="input-group input-group-sm" style="max-width: 320px;">
                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                                <input type="text" class="form-control form-control-sm border-start-0" id="studentSearchInput" placeholder="Search by name, roll, email, branch..." onkeyup="filterStudentTable()">
                            </div>
                            <select class="form-select form-select-sm" id="studentBranchFilter" onchange="filterStudentTable()" style="border-radius: 8px; min-width: 140px; max-width: 170px;">
                                <option value="all">All Branches</option>
                                <option value="Computer Science">Computer Science / IT</option>
                                <option value="BCA">BCA</option>
                                <option value="MCA">MCA</option>
                                <option value="Computer Engineering">Computer Eng</option>
                                <option value="Information Technology">Information Tech</option>
                                <option value="Mechanical Engineering">Mechanical</option>
                                <option value="Civil Engineering">Civil</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                        CssClass="table align-middle dir-table" GridLines="None"
                        OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Enrollment">
                                <HeaderStyle Width="14%" />
                                <ItemTemplate>
                                    <div>
                                        <span class="roll-badge"><%# Eval("regRollNo") != DBNull.Value && !string.IsNullOrEmpty(Eval("regRollNo").ToString()) ? Eval("regRollNo") : Eval("regUsername") %></span>
                                    </div>
                                    <div class="text-muted small mt-1" style="font-size: 0.72rem;">
                                        ID: #<%# Eval("Id") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Student Details">
                                <HeaderStyle Width="26%" />
                                <ItemTemplate>
                                    <div class="d-flex align-items-center gap-3">
                                        <%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? 
                                            "<img src='" + ResolveUrl(Eval("photoUrl").ToString().StartsWith("http") || Eval("photoUrl").ToString().StartsWith("/") || Eval("photoUrl").ToString().StartsWith("~") ? Eval("photoUrl").ToString() : "~/assets/ProfilePhotos/" + Eval("photoUrl")) + "' class='student-table-avatar' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Student Photo' />" : "" %>
                                        <div class="student-table-avatar-fallback" style='<%# Eval("photoUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("photoUrl").ToString()) ? "display:none;" : "display:inline-flex;" %>'>
                                            <%# Eval("regFullName") != DBNull.Value && Eval("regFullName").ToString().Trim().Length > 0 ? Eval("regFullName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>
                                        </div>
                                        <div>
                                            <div class="fw-bold font-heading text-dark" style="font-size: 0.92rem;"><%# Eval("regFullName") %></div>
                                            <div class="text-muted small mt-0.5" style="font-size: 0.78rem;">
                                                <i class="fa-regular fa-envelope me-1" style="color: #e03627;"></i><%# Eval("regEmail") %>
                                            </div>
                                            <div class="text-muted small" style="font-size: 0.78rem;">
                                                <i class="fa-solid fa-phone me-1 text-secondary"></i><%# Eval("regMobile") %>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Degree &amp; Branch">
                                <HeaderStyle Width="20%" />
                                <ItemTemplate>
                                    <div class="fw-bold text-dark" style="font-size: 0.88rem;">
                                        <%# Eval("degree") != DBNull.Value && !string.IsNullOrEmpty(Eval("degree").ToString()) ? Eval("degree") : "BCA" %> 
                                        <span class="text-muted fw-normal" style="font-size: 0.82rem;">(<%# Eval("branch") != DBNull.Value && !string.IsNullOrEmpty(Eval("branch").ToString()) ? Eval("branch") : "Computer Science" %>)</span>
                                    </div>
                                    <div class="d-flex gap-1.5 align-items-center mt-1.5 flex-wrap">
                                        <span class="cpi-tag">CPI: <%# Eval("cgpa") != DBNull.Value && !string.IsNullOrEmpty(Eval("cgpa").ToString()) ? Eval("cgpa") : "8.50" %></span>
                                        <span class="backlog-tag">Backlogs: <%# Eval("backlogs") != DBNull.Value && !string.IsNullOrEmpty(Eval("backlogs").ToString()) ? Eval("backlogs") : "0" %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Skills">
                                <HeaderStyle Width="20%" />
                                <ItemTemplate>
                                    <div class="skill-badge-custom">
                                        <%# Eval("skills") != DBNull.Value && !string.IsNullOrEmpty(Eval("skills").ToString()) ? Eval("skills") : "None listed" %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Resume" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                <HeaderStyle Width="8%" />
                                <ItemTemplate>
                                    <a href='<%# Eval("resumeUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("resumeUrl").ToString()) ? ResolveUrl("~/assets/StudentPDF/" + Eval("resumeUrl")) : "javascript:alert(\"Resume not uploaded by student yet.\");" %>' 
                                       target='<%# Eval("resumeUrl") != DBNull.Value && !string.IsNullOrEmpty(Eval("resumeUrl").ToString()) ? "_blank" : "_self" %>' 
                                       class='resume-view-btn' title='View Resume PDF'>
                                        <i class='fa-solid fa-file-pdf fs-6'></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                <HeaderStyle Width="12%" />
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center gap-1.5">
                                        <button type="button" class="btn-action-profile"
                                            onclick="openStudentSlideProfile('<%# Eval("regFullName") %>', '<%# Eval("regRollNo") %>', '<%# Eval("regEmail") %>', '<%# Eval("regMobile") %>', '<%# Eval("degree") %>', '<%# Eval("branch") %>', '<%# Eval("semester") %>', '<%# Eval("cgpa") %>', '<%# Eval("backlogs") %>', '<%# Eval("skills") %>', '<%# Eval("resumeUrl") %>', '<%# Eval("photoUrl") %>')"
                                            title="View Full Profile in Side Drawer">
                                            <i class="fa-regular fa-id-card"></i>Profile
                                        </button>
                                        <asp:LinkButton ID="btnDeleteStudent" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>'
                                            CssClass="btn-action-delete"
                                            OnClientClick="return confirm('Are you sure you want to delete this student record?');"
                                            title="Delete Student">
                                            <i class="fa-regular fa-trash-can"></i>Delete
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center text-muted small py-5">
                                <i class="fa-solid fa-user-slash text-muted opacity-25 mb-3" style="font-size: 3rem;"></i>
                                <h6 class="fw-bold text-dark font-heading">No registered students found</h6>
                                <p class="text-muted small">Registered students will automatically appear in this talent directory.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- ==================== TAB 2: RECRUITER COMPANIES ==================== -->
        <div class="tab-pane fade" id="companies-pane" role="tabpanel">
            <div class="dir-main-card">
                <div class="dir-main-card-head">
                    <div class="row g-2 justify-content-between align-items-center">
                        <div class="col-md-5">
                            <h6 class="fw-bold mb-0 text-dark font-heading">
                                <i class="fa-solid fa-building me-2" style="color: #0f172a;"></i>Partner Companies &amp; Recruiters
                            </h6>
                        </div>
                        <div class="col-md-7 d-flex gap-2 flex-wrap flex-sm-nowrap justify-content-end">
                            <div class="input-group input-group-sm" style="max-width: 320px;">
                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                                <input type="text" class="form-control form-control-sm border-start-0" id="companySearchInput" placeholder="Search company, industry, location..." onkeyup="filterCompanyTable()">
                            </div>
                            <select class="form-select form-select-sm" id="companyIndustryFilter" onchange="filterCompanyTable()" style="border-radius: 8px; min-width: 140px; max-width: 170px;">
                                <option value="all">All Industries</option>
                                <option value="Information Technology">Information Tech</option>
                                <option value="Software Development">Software Dev</option>
                                <option value="Consulting">Consulting</option>
                                <option value="Finance">Finance &amp; Banking</option>
                                <option value="Manufacturing">Manufacturing</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%"
                        CssClass="table align-middle dir-table" GridLines="None"
                        OnRowCommand="GridView2_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Company Info">
                                <HeaderStyle Width="26%" />
                                <ItemTemplate>
                                    <div class="d-flex align-items-center gap-3">
                                        <%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? 
                                            "<img src='" + ResolveUrl(Eval("compLogo").ToString().StartsWith("~") || Eval("compLogo").ToString().StartsWith("/") ? Eval("compLogo").ToString() : "~/CompanyUploads/" + Eval("compLogo")) + "' class='rounded-3 border' style='width:42px;height:42px;object-fit:cover;' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Company Logo' />" : "" %>
                                        <div class="company-avatar-fallback" style='<%# Eval("compLogo") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLogo").ToString()) ? "display:none;" : "display:inline-flex;" %>'>
                                            <%# Eval("compName") != DBNull.Value && Eval("compName").ToString().Trim().Length > 0 ? Eval("compName").ToString().Trim().Substring(0, 1).ToUpper() : "C" %>
                                        </div>
                                        <div>
                                            <div class="fw-bold font-heading text-dark" style="font-size: 0.92rem;"><%# Eval("compName") %></div>
                                            <div class="text-muted small" style="font-size: 0.78rem;"><%# Eval("compTagline") != DBNull.Value && !string.IsNullOrEmpty(Eval("compTagline").ToString()) ? Eval("compTagline") : "Recruiting Partner" %></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contact &amp; Account">
                                <HeaderStyle Width="24%" />
                                <ItemTemplate>
                                    <div class="text-dark small" style="font-size: 0.82rem;"><i class="fa-regular fa-envelope me-1" style="color: #e03627;"></i><%# Eval("compEmail") %></div>
                                    <div class="text-muted small mt-0.5" style="font-size: 0.78rem;"><i class="fa-solid fa-phone me-1 text-secondary"></i><%# Eval("compMobile") %> &bull; <span class="font-monospace text-dark"><%# Eval("compUsername") %></span></div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Industry &amp; Location">
                                <HeaderStyle Width="18%" />
                                <ItemTemplate>
                                    <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2.5 py-1 rounded-pill" style="font-size: 0.76rem;"><%# Eval("compIndustry") != DBNull.Value && !string.IsNullOrEmpty(Eval("compIndustry").ToString()) ? Eval("compIndustry") : "IT & Software" %></span>
                                    <div class="text-muted small mt-1" style="font-size: 0.78rem;"><i class="fa-solid fa-location-dot me-1 text-danger"></i><%# Eval("compLocation") != DBNull.Value && !string.IsNullOrEmpty(Eval("compLocation").ToString()) ? Eval("compLocation") : "India" %></div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Package &amp; Website">
                                <HeaderStyle Width="18%" />
                                <ItemTemplate>
                                    <span class="badge bg-success-subtle text-success border border-success-subtle px-2.5 py-1 rounded-pill fw-bold" style="font-size: 0.76rem;"><%# Eval("compPackageRange") != DBNull.Value && !string.IsNullOrEmpty(Eval("compPackageRange").ToString()) ? Eval("compPackageRange") : "3.5 - 6.0 LPA" %></span>
                                    <div class="small mt-1" style="font-size: 0.8rem;">
                                        <%# Eval("compWebsite") != DBNull.Value && !string.IsNullOrEmpty(Eval("compWebsite").ToString()) ? "<a href='" + (Eval("compWebsite").ToString().StartsWith("http") ? Eval("compWebsite") : "https://" + Eval("compWebsite")) + "' target='_blank' class='text-decoration-none fw-semibold' style='color: #e03627;'><i class='fa-solid fa-globe me-1'></i>Website</a>" : "<span class='text-muted small'>-</span>" %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                <HeaderStyle Width="14%" />
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center gap-1.5">
                                        <button type="button" class="btn-action-profile"
                                            onclick="openCompanySlideProfile('<%# Eval("compName") %>', '<%# Eval("compEmail") %>', '<%# Eval("compMobile") %>', '<%# Eval("compUsername") %>', '<%# Eval("compIndustry") %>', '<%# Eval("compLocation") %>', '<%# Eval("compPackageRange") %>', '<%# Eval("compWebsite") %>', '<%# Eval("compTags") %>', '<%# Eval("compDescription") %>', '<%# Eval("compLogo") %>')"
                                            title="View Company Profile">
                                            <i class="fa-regular fa-building"></i>Profile
                                        </button>
                                        <asp:LinkButton ID="btnDeleteCompany" runat="server" CommandName="cmd_cdel" CommandArgument='<%# Eval("Id") %>'
                                            CssClass="btn-action-delete"
                                            OnClientClick="return confirm('Are you sure you want to delete this company record?');"
                                            title="Delete Company">
                                            <i class="fa-regular fa-trash-can"></i>Delete
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center text-muted small py-5">
                                <i class="fa-regular fa-building text-muted opacity-25 mb-3" style="font-size: 3rem;"></i>
                                <h6 class="fw-bold text-dark font-heading">No registered companies found</h6>
                                <p class="text-muted small">Registered company partners will appear here.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>

    <!-- ===== SLIDE-IN STUDENT PROFILE DRAWER (Offcanvas) ===== -->
    <div class="offcanvas offcanvas-end offcanvas-profile-drawer" tabindex="-1" id="studentProfileDrawer" aria-labelledby="drawerStudentName">
        <div class="offcanvas-header bg-light border-bottom py-3">
            <h6 class="offcanvas-title fw-bold text-dark font-heading mb-0">
                <i class="fa-solid fa-user-graduate me-2" style="color: #e03627;"></i>Student Candidate Profile
            </h6>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body p-4">
            <!-- Header with Avatar & Name -->
            <div class="text-center pb-4 border-bottom mb-4">
                <div id="drawerAvatarContainer" class="d-inline-block mb-3">
                    <div class="student-drawer-avatar-fallback mx-auto" id="drawerAvatarFallback">SP</div>
                    <img id="drawerAvatarImg" src="" alt="Student Photo" class="student-drawer-avatar mx-auto d-none" />
                </div>
                <h4 class="fw-bold mb-1 font-heading text-dark" id="drawerStudentName">Student Name</h4>
                <div class="text-muted small">
                    <span class="badge text-white me-1" style="background: #e03627;">STUDENT</span>
                    Roll No: <strong class="text-dark font-monospace" id="drawerRollNo">24FOTCA11208</strong>
                </div>
            </div>

            <!-- Contact Information -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-address-book text-primary me-2"></i>Contact Information</h6>
                <div class="small mb-1 text-muted">
                    Email: <a href="#" id="drawerEmailLink" class="fw-semibold text-dark text-decoration-none">student@rku.ac.in</a>
                </div>
                <div class="small text-muted">
                    Mobile: <strong class="text-dark" id="drawerMobile">9876543210</strong>
                </div>
            </div>

            <!-- Academic Information -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-graduation-cap text-success me-2"></i>Academic Details</h6>
                <div class="row g-2 small">
                    <div class="col-6">
                        <span class="text-muted d-block">Program &amp; Branch:</span>
                        <strong class="text-dark" id="drawerDegreeBranch">BCA (Computer Science)</strong>
                    </div>
                    <div class="col-6">
                        <span class="text-muted d-block">Semester:</span>
                        <strong class="text-dark" id="drawerSemester">6th Sem</strong>
                    </div>
                    <div class="col-6 mt-2">
                        <span class="text-muted d-block">Cumulative CPI:</span>
                        <span class="badge bg-success-subtle text-success fw-bold fs-6" id="drawerCgpa">8.50</span>
                    </div>
                    <div class="col-6 mt-2">
                        <span class="text-muted d-block">Active Backlogs:</span>
                        <strong class="text-dark" id="drawerBacklogs">0</strong>
                    </div>
                </div>
            </div>

            <!-- Technical Skills -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-code text-warning me-2"></i>Technical Skills</h6>
                <div id="drawerSkillsContainer">
                    <span class="skill-pill">C#</span>
                    <span class="skill-pill">ASP.NET</span>
                    <span class="skill-pill">SQL Server</span>
                </div>
            </div>

            <!-- Resume PDF Link -->
            <div class="drawer-detail-card mb-4" id="drawerResumeCard">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-file-pdf me-2" style="color: #e03627;"></i>Curriculum Vitae / Resume</h6>
                <div id="drawerResumeContent">
                    <a href="#" id="drawerResumeBtn" target="_blank" class="btn btn-sm text-white px-3 py-2 w-100 fw-bold rounded-pill" style="background: linear-gradient(135deg, #e03627, #c5281b);">
                        <i class="fa-solid fa-file-pdf me-2"></i>View / Download Resume PDF
                    </a>
                </div>
            </div>

            <!-- Close Action -->
            <button type="button" class="btn btn-light border w-100 py-2 rounded-pill fw-semibold text-secondary" data-bs-dismiss="offcanvas">
                Close Profile
            </button>
        </div>
    </div>

    <!-- ===== SLIDE-IN COMPANY PROFILE DRAWER (Offcanvas) ===== -->
    <div class="offcanvas offcanvas-end offcanvas-profile-drawer" tabindex="-1" id="companyProfileDrawer" aria-labelledby="drawerCompName">
        <div class="offcanvas-header bg-dark text-white py-3">
            <h6 class="offcanvas-title fw-bold font-heading mb-0 text-white">
                <i class="fa-solid fa-building me-2" style="color: #e03627;"></i>Company Partner Profile
            </h6>
            <button type="button" class="btn-close btn-close-white text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body p-4">
            <!-- Header with Logo & Name -->
            <div class="text-center pb-4 border-bottom mb-4">
                <div id="drawerCompLogoContainer" class="d-inline-block mb-3">
                    <div class="student-drawer-avatar-fallback mx-auto" id="drawerCompLogoFallback" style="background: linear-gradient(135deg, #1e293b, #0f172a);">C</div>
                    <img id="drawerCompLogoImg" src="" alt="Company Logo" class="student-drawer-avatar mx-auto d-none" />
                </div>
                <h4 class="fw-bold mb-1 font-heading text-dark" id="drawerCompName">Company Name</h4>
                <div class="text-muted small">
                    <span class="badge bg-success-subtle text-success border border-success-subtle me-1"><i class="fa-solid fa-circle-check me-1"></i>VERIFIED RECRUITER</span>
                    <span id="drawerCompLocation" class="text-muted">India</span>
                </div>
            </div>

            <!-- Contact Information -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-address-book text-primary me-2"></i>Contact Information</h6>
                <div class="small mb-1 text-muted">
                    Email: <a href="#" id="drawerCompEmailLink" class="fw-semibold text-dark text-decoration-none">hr@company.com</a>
                </div>
                <div class="small mb-1 text-muted">
                    Mobile: <strong class="text-dark" id="drawerCompMobile">9876543210</strong>
                </div>
                <div class="small text-muted">
                    Username: <span class="badge bg-light text-dark font-monospace border" id="drawerCompUsername">username</span>
                </div>
            </div>

            <!-- Business Overview -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-briefcase text-success me-2"></i>Business Details</h6>
                <div class="row g-2 small">
                    <div class="col-6">
                        <span class="text-muted d-block">Industry Sector:</span>
                        <strong class="text-dark" id="drawerCompIndustry">IT &amp; Software</strong>
                    </div>
                    <div class="col-6">
                        <span class="text-muted d-block">Package Range:</span>
                        <span class="badge bg-success-subtle text-success fw-bold fs-6" id="drawerCompPackage">4.0 - 8.0 LPA</span>
                    </div>
                    <div class="col-12 mt-2">
                        <span class="text-muted d-block">Official Website:</span>
                        <a href="#" id="drawerCompWebsite" target="_blank" class="fw-semibold text-decoration-none" style="color: #e03627;">https://example.com</a>
                    </div>
                </div>
            </div>

            <!-- About / Description -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-circle-info text-info me-2"></i>About Company</h6>
                <p class="small text-muted mb-0" id="drawerCompDescription" style="white-space: pre-line;">No description provided.</p>
            </div>

            <!-- Hiring Domains / Tags -->
            <div class="drawer-detail-card mb-4">
                <h6 class="fw-bold text-dark small mb-2"><i class="fa-solid fa-tags text-warning me-2"></i>Hiring Focus &amp; Tags</h6>
                <div id="drawerCompTagsContainer">
                    <span class="skill-pill">Full Stack</span>
                    <span class="skill-pill">Cloud</span>
                </div>
            </div>

            <!-- Close Action -->
            <button type="button" class="btn btn-light border w-100 py-2 rounded-pill fw-semibold text-secondary" data-bs-dismiss="offcanvas">
                Close Profile
            </button>
        </div>
    </div>

    <!-- JavaScript for Side Drawers and Client-Side Filters -->
    <script>
        let studentDrawerInst = null;
        let companyDrawerInst = null;

        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-students');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Users & Recruiter Directory';
        });

        function openStudentSlideProfile(name, roll, email, mobile, degree, branch, semester, cgpa, backlogs, skills, resume, photo) {
            document.getElementById('drawerStudentName').innerText = name || 'Student';
            document.getElementById('drawerRollNo').innerText = roll || '-';
            
            const emailLink = document.getElementById('drawerEmailLink');
            emailLink.innerText = email || '-';
            emailLink.href = 'mailto:' + (email || '');

            document.getElementById('drawerMobile').innerText = mobile || '-';

            const deg = degree || 'BCA';
            const br = branch || 'Computer Science';
            document.getElementById('drawerDegreeBranch').innerText = deg + ' (' + br + ')';
            document.getElementById('drawerSemester').innerText = semester ? (semester + ' Sem') : '6th Sem';
            document.getElementById('drawerCgpa').innerText = cgpa || '8.50';
            document.getElementById('drawerBacklogs').innerText = backlogs || '0';

            // Avatar Photo
            const img = document.getElementById('drawerAvatarImg');
            const fallback = document.getElementById('drawerAvatarFallback');

            function showStudentFallback() {
                img.classList.add('d-none');
                fallback.classList.remove('d-none');
                const initials = (name || 'SP').trim().split(' ').map(p => p[0]).join('').substring(0, 2).toUpperCase();
                fallback.innerText = initials || 'SP';
            }

            if (photo && photo.trim() !== '') {
                let cleanPhoto = photo.trim();
                let initialSrc = cleanPhoto;
                if (!cleanPhoto.startsWith('http') && !cleanPhoto.startsWith('/') && !cleanPhoto.startsWith('~')) {
                    initialSrc = 'assets/ProfilePhotos/' + cleanPhoto;
                }

                img.onload = function () {
                    img.classList.remove('d-none');
                    fallback.classList.add('d-none');
                };

                img.onerror = function () {
                    if (!this.src.includes('CompanyUploads')) {
                        this.src = 'CompanyUploads/' + cleanPhoto;
                    } else {
                        showStudentFallback();
                    }
                };

                img.src = initialSrc;
            } else {
                showStudentFallback();
            }

            // Skills
            const skillsDiv = document.getElementById('drawerSkillsContainer');
            skillsDiv.innerHTML = '';
            if (skills && skills.trim() !== '') {
                const arr = skills.split(',');
                arr.forEach(s => {
                    const trimmed = s.trim();
                    if (trimmed) {
                        const span = document.createElement('span');
                        span.className = 'skill-pill';
                        span.innerText = trimmed;
                        skillsDiv.appendChild(span);
                    }
                });
            } else {
                skillsDiv.innerHTML = '<span class="text-muted small">No specific skills listed.</span>';
            }

            // Resume PDF Button
            const resumeContent = document.getElementById('drawerResumeContent');
            if (resume && resume.trim() !== '') {
                resumeContent.innerHTML = `
                    <a href="assets/StudentPDF/${resume}" target="_blank" class="btn btn-sm text-white px-3 py-2 w-100 fw-bold rounded-pill" style="background: linear-gradient(135deg, #e03627, #c5281b);">
                        <i class="fa-solid fa-file-pdf me-2"></i>View / Download Resume (${resume})
                    </a>`;
            } else {
                resumeContent.innerHTML = '<span class="text-muted small"><i class="fa-regular fa-clock me-1"></i>Resume PDF not uploaded yet.</span>';
            }

            // Open Offcanvas Drawer
            const drawerEl = document.getElementById('studentProfileDrawer');
            if (!studentDrawerInst) {
                studentDrawerInst = new bootstrap.Offcanvas(drawerEl);
            }
            studentDrawerInst.show();
        }

        function openCompanySlideProfile(name, email, mobile, username, industry, location, packageRange, website, tags, description, logo) {
            document.getElementById('drawerCompName').innerText = name || 'Company';
            document.getElementById('drawerCompLocation').innerText = location || 'India';
            
            const emailLink = document.getElementById('drawerCompEmailLink');
            emailLink.innerText = email || '-';
            emailLink.href = 'mailto:' + (email || '');

            document.getElementById('drawerCompMobile').innerText = mobile || '-';
            document.getElementById('drawerCompUsername').innerText = username || '-';
            document.getElementById('drawerCompIndustry').innerText = industry || 'IT & Software';
            document.getElementById('drawerCompPackage').innerText = packageRange || 'Negotiable';

            const webLink = document.getElementById('drawerCompWebsite');
            if (website && website.trim() !== '') {
                webLink.innerText = website;
                webLink.href = website.startsWith('http') ? website : 'https://' + website;
            } else {
                webLink.innerText = 'Not specified';
                webLink.removeAttribute('href');
            }

            document.getElementById('drawerCompDescription').innerText = description || 'No detailed description available.';

            // Company Logo
            const img = document.getElementById('drawerCompLogoImg');
            const fallback = document.getElementById('drawerCompLogoFallback');

            function showCompanyFallback() {
                img.classList.add('d-none');
                fallback.classList.remove('d-none');
                const initial = (name || 'C').trim().substring(0, 1).toUpperCase();
                fallback.innerText = initial || 'C';
            }

            if (logo && logo.trim() !== '') {
                let cleanLogo = logo.trim();
                let initialSrc = cleanLogo;
                if (!cleanLogo.startsWith('http') && !cleanLogo.startsWith('/') && !cleanLogo.startsWith('~')) {
                    initialSrc = 'CompanyUploads/' + cleanLogo;
                }

                img.onload = function () {
                    img.classList.remove('d-none');
                    fallback.classList.add('d-none');
                };

                img.onerror = function () {
                    showCompanyFallback();
                };

                img.src = initialSrc;
            } else {
                showCompanyFallback();
            }

            // Tags
            const tagsDiv = document.getElementById('drawerCompTagsContainer');
            tagsDiv.innerHTML = '';
            if (tags && tags.trim() !== '') {
                const arr = tags.split(',');
                arr.forEach(t => {
                    const trimmed = t.trim();
                    if (trimmed) {
                        const span = document.createElement('span');
                        span.className = 'skill-pill';
                        span.innerText = trimmed;
                        tagsDiv.appendChild(span);
                    }
                });
            } else {
                tagsDiv.innerHTML = '<span class="text-muted small">No specific tags specified.</span>';
            }

            // Open Offcanvas Drawer
            const drawerEl = document.getElementById('companyProfileDrawer');
            if (!companyDrawerInst) {
                companyDrawerInst = new bootstrap.Offcanvas(drawerEl);
            }
            companyDrawerInst.show();
        }

        function filterStudentTable() {
            var query = document.getElementById('studentSearchInput').value.toLowerCase();
            var branch = document.getElementById('studentBranchFilter').value.toLowerCase();
            var rows = document.querySelectorAll('#students-pane table tbody tr:not(:first-child)');

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var matchesSearch = text.indexOf(query) > -1;
                var matchesBranch = branch === 'all' || text.indexOf(branch) > -1;

                if (matchesSearch && matchesBranch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function filterCompanyTable() {
            var query = document.getElementById('companySearchInput').value.toLowerCase();
            var industry = document.getElementById('companyIndustryFilter').value.toLowerCase();
            var rows = document.querySelectorAll('#companies-pane table tbody tr:not(:first-child)');

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                var matchesSearch = text.indexOf(query) > -1;
                var matchesIndustry = industry === 'all' || text.indexOf(industry) > -1;

                if (matchesSearch && matchesIndustry) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
