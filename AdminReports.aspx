<%@ Page Title="Reports & Analytics | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminReports" EnableEventValidation="false" %>

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

        /* KPI Metric Cards */
        .kpi-report-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 1.25rem 1.5rem;
            box-shadow: 0 2px 12px rgba(15, 23, 42, 0.02);
            transition: all 0.25s ease;
            height: 100%;
        }

        .kpi-report-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06);
            border-color: #cbd5e1;
        }

        .kpi-icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.35rem;
            flex-shrink: 0;
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

        /* Custom Table Styling (Matches AdminStudentDirectory) */
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

        .dept-badge {
            display: inline-block;
            background: #f8fafc;
            color: #334155;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            line-height: 1.4;
            max-width: 100%;
        }

        .student-table-avatar-fallback {
            width: 40px;
            height: 40px;
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

        .btn-rku {
            background: linear-gradient(135deg, #e03627, #c5281b) !important;
            color: #ffffff !important;
            font-weight: 700;
            border: none;
            box-shadow: 0 4px 14px rgba(224, 54, 39, 0.25);
            transition: all 0.2s ease;
        }

        .btn-rku:hover {
            background: linear-gradient(135deg, #c5281b, #991b1b) !important;
            color: #ffffff !important;
            box-shadow: 0 6px 18px rgba(224, 54, 39, 0.35);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner (Matching AdminStudentDirectory design) -->
    <div class="directory-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="directory-hero-kicker">
                    <i class="fa-solid fa-chart-line me-1"></i> ANALYTICS &amp; OUTCOMES
                </div>
                <h2>Placement Performance &amp; Reports</h2>
                <p>
                    Comprehensive recruitment analytics dashboard tracking student placement outcomes, campus drives, and master candidate roster.
                </p>
            </div>
            <div class="col-lg-5 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap">
                <asp:Button ID="btnExportCsv" runat="server" Text="Export Roster CSV" OnClick="btnExportCsv_Click" 
                    CssClass="btn btn-rku btn-sm px-3.5 py-2 rounded-pill shadow-sm fw-semibold" />
            </div>
        </div>
    </div>

    <!-- KPI Metric Cards Row -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-xl-3">
            <div class="kpi-report-card">
                <div class="d-flex align-items-center gap-3">
                    <div class="kpi-icon-circle bg-danger-subtle text-danger">
                        <i class="fa-solid fa-user-graduate"></i>
                    </div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Total Registered</div>
                        <h3 class="fw-bold mb-0 font-heading text-dark">
                            <asp:Label ID="lblRptStudents" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-xl-3">
            <div class="kpi-report-card">
                <div class="d-flex align-items-center gap-3">
                    <div class="kpi-icon-circle bg-success-subtle text-success">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Total Placed</div>
                        <h3 class="fw-bold mb-0 font-heading text-dark">
                            <asp:Label ID="lblRptPlaced" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-xl-3">
            <div class="kpi-report-card">
                <div class="d-flex align-items-center gap-3">
                    <div class="kpi-icon-circle bg-info-subtle text-primary">
                        <i class="fa-solid fa-building"></i>
                    </div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Active Drives</div>
                        <h3 class="fw-bold mb-0 font-heading text-dark">
                            <asp:Label ID="lblRptDrives" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-xl-3">
            <div class="kpi-report-card">
                <div class="d-flex align-items-center gap-3">
                    <div class="kpi-icon-circle bg-warning-subtle text-warning">
                        <i class="fa-solid fa-trophy"></i>
                    </div>
                    <div>
                        <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Placement Rate</div>
                        <h3 class="fw-bold mb-0 font-heading text-dark">
                            <asp:Label ID="lblRptRate" runat="server" Text="0%"></asp:Label>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Card: Recruitment Master Roster -->
    <div class="dir-main-card">
        <div class="dir-main-card-head">
            <div class="row g-2 justify-content-between align-items-center">
                <div class="col-md-5">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-table-list me-2" style="color: #e03627;"></i>Recruitment Master Roster
                    </h6>
                </div>
                <div class="col-md-7 d-flex gap-2 flex-wrap flex-sm-nowrap justify-content-end align-items-center">
                    <div class="input-group input-group-sm" style="max-width: 250px;">
                        <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <asp:TextBox ID="txtReportSearch" runat="server" CssClass="form-control form-control-sm border-start-0" placeholder="Search student, roll, branch..."></asp:TextBox>
                    </div>

                    <asp:DropDownList ID="ddlReportStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ReportFilter_Changed" 
                        CssClass="form-select form-select-sm" style="border-radius: 8px; min-width: 140px; max-width: 170px;">
                        <asp:ListItem Value="All">All Statuses</asp:ListItem>
                        <asp:ListItem Value="Selected">Placed Only</asp:ListItem>
                        <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                        <asp:ListItem Value="Interview Scheduled">Interview Scheduled</asp:ListItem>
                        <asp:ListItem Value="Applied">Applied</asp:ListItem>
                        <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" CssClass="btn btn-sm btn-rku px-3 rounded-2" />
                    <asp:Button ID="btnFilterReset" runat="server" Text="Reset" OnClick="btnFilterReset_Click" CssClass="btn btn-sm btn-light border px-3 rounded-2" />
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvReportRoster" runat="server" AutoGenerateColumns="False"
                CssClass="table align-middle dir-table w-100" GridLines="None"
                ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField HeaderText="Enrollment">
                        <HeaderStyle Width="14%" />
                        <ItemTemplate>
                            <span class="roll-badge"><%# Eval("StudentRollNo") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Candidate">
                        <HeaderStyle Width="24%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-3">
                                <div class="student-table-avatar-fallback">
                                    <%# Eval("StudentName") != DBNull.Value && Eval("StudentName").ToString().Trim().Length > 0 ? Eval("StudentName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>
                                </div>
                                <div>
                                    <div class="fw-bold font-heading text-dark" style="font-size: 0.92rem;"><%# Eval("StudentName") %></div>
                                    <div class="text-muted small mt-0.5" style="font-size: 0.78rem;">
                                        CGPA: <strong><%# Eval("StudentCgpa") != DBNull.Value && !string.IsNullOrEmpty(Eval("StudentCgpa").ToString()) ? Eval("StudentCgpa") : "N/A" %></strong>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Branch / Department">
                        <HeaderStyle Width="18%" />
                        <ItemTemplate>
                            <span class="dept-badge">
                                <i class="fa-solid fa-graduation-cap me-1" style="color: #e03627;"></i><%# Eval("StudentBranch") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Company &amp; Role">
                        <HeaderStyle Width="22%" />
                        <ItemTemplate>
                            <div class="fw-bold font-heading text-dark" style="font-size: 0.9rem;"><%# Eval("JobRole") %></div>
                            <div class="text-muted small mt-0.5" style="font-size: 0.78rem;">
                                <i class="fa-regular fa-building me-1" style="color: #e03627;"></i>
                                <%# Eval("compName") != DBNull.Value && Eval("compName").ToString() != "" ? Eval("compName") : Eval("CompanyUsername") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <HeaderStyle Width="12%" />
                        <ItemTemplate>
                            <%# GetReportStatusBadge(Eval("ApplicationStatus")) %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Applied Date">
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <span class="badge bg-light text-secondary border small fw-semibold">
                                <%# Eval("AppliedDate", "{0:dd MMM yyyy}") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EmptyDataTemplate>
                    <div class="text-center text-muted small py-5">
                        <i class="fa-regular fa-folder-open text-muted opacity-25 mb-3" style="font-size: 3rem;"></i>
                        <h6 class="fw-bold text-dark font-heading">No recruitment records found</h6>
                        <p class="text-muted small">No candidate applications match your current search or status filters.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-reports');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Reports & Analytics';
        });
    </script>
</asp:Content>
