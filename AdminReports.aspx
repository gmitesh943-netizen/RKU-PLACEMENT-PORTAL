<%@ Page Title="Reports & Analytics | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminReports" EnableEventValidation="false" %>

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

        /* ─── DATA CONTAINER CARD ─── */
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
            padding: 0.55rem 1.4rem !important;
            border-radius: 50px !important;
            font-size: 0.88rem !important;
            transition: all 0.25s ease !important;
            text-decoration: none !important;
            display: inline-block !important;
            text-align: center !important;
            vertical-align: middle !important;
            line-height: 1.5 !important;
            box-shadow: 0 4px 14px rgba(239, 55, 36, 0.3) !important;
            cursor: pointer !important;
        }

            .btn-rku-orange:hover {
                background: linear-gradient(135deg, #d82b19 0%, #a30f14 100%) !important;
                background-color: #d82b19 !important;
                border-color: #a30f14 !important;
                color: #ffffff !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 6px 20px rgba(239, 55, 36, 0.4) !important;
            }

        .btn-rku-orange.btn-sm {
            padding: 0.35rem 1rem !important;
            font-size: 0.78rem !important;
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

        /* Badges & Elements */
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

        .candidate-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            color: #ffffff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 0.9rem;
            flex-shrink: 0;
            box-shadow: 0 2px 6px rgba(239, 55, 36, 0.25);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header (Matching AdminDashboard Theme) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-chart-line me-1"></i>REPORTS &amp; OUTCOMES
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Live Placement Analytics
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">
                    Placement Performance &amp; Reports
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Comprehensive recruitment analytics dashboard tracking student placement outcomes, campus drives, and master candidate roster.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap align-items-center">
                <asp:Button ID="btnExportCsv" runat="server" Text="Export Roster CSV" OnClick="btnExportCsv_Click" 
                    CssClass="btn-rku-orange shadow-sm" Style="background: linear-gradient(135deg, #ef3724, #d82b19) !important; color: #ffffff !important; border: 1px solid #d82b19 !important; font-weight: 700 !important; border-radius: 50px !important; padding: 0.55rem 1.4rem !important; display: inline-block !important;" />
            </div>
        </div>
    </div>

    <!-- 4 Clean Stat KPI Cards (Matching AdminDashboard) -->
    <div class="row g-3 mb-4">
        <!-- 1. Registered Students -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-user-graduate stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-users"></i>
                        </div>
                        <span class="stat-card-tag">Job Seekers</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Total Registered</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblRptStudents" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-circle-check text-success me-1"></i>Active Student Profiles
                </div>
            </div>
        </div>

        <!-- 2. Total Placed -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-trophy stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-trophy"></i>
                        </div>
                        <span class="stat-card-tag">Selected</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Total Placed</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblRptPlaced" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-star text-warning me-1"></i>Verified Selections
                </div>
            </div>
        </div>

        <!-- 3. Campus Drives -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-briefcase stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-calendar-check"></i>
                        </div>
                        <span class="stat-card-tag">Openings</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Campus Drives</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblRptDrives" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-bolt text-warning me-1"></i>Active Recruitment Events
                </div>
            </div>
        </div>

        <!-- 4. Placement Rate -->
        <div class="col-6 col-xl-3">
            <div class="stat-card-clean">
                <i class="fa-solid fa-percent stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-chart-pie"></i>
                        </div>
                        <span class="stat-card-tag">Success Ratio</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Placement Rate</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblRptRate" runat="server" Text="0%"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-arrow-trend-up text-success me-1"></i>Overall Conversion Rate
                </div>
            </div>
        </div>
    </div>

    <!-- Main Card Container (Matching AdminDashboard) -->
    <div class="dash-card-white">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 pb-3 mb-3 border-bottom">
            <div>
                <h6 class="fw-bold mb-1 text-dark font-heading" style="font-size: 1.05rem;">
                    <i class="fa-solid fa-table-list me-2" style="color: var(--rku-orange-red);"></i>Recruitment Master Roster
                </h6>
                <div class="text-muted small" style="font-size: 0.8rem;">
                    Search, filter and analyze candidate applications across all companies
                </div>
            </div>

            <div class="d-flex gap-2 flex-wrap flex-sm-nowrap align-items-center">
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

                <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" CssClass="btn btn-sm btn-rku-orange px-3 rounded-pill" />
                <asp:Button ID="btnFilterReset" runat="server" Text="Reset" OnClick="btnFilterReset_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill" />
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvReportRoster" runat="server" AutoGenerateColumns="False"
                CssClass="table align-middle custom-dash-table w-100 mb-0" GridLines="None"
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
                                <div class="candidate-avatar">
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
                                <i class="fa-solid fa-graduation-cap me-1" style="color: var(--rku-orange-red);"></i><%# Eval("StudentBranch") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Company &amp; Role">
                        <HeaderStyle Width="22%" />
                        <ItemTemplate>
                            <div class="fw-bold font-heading text-dark" style="font-size: 0.9rem;"><%# Eval("JobRole") %></div>
                            <div class="text-muted small mt-0.5" style="font-size: 0.78rem;">
                                <i class="fa-regular fa-building me-1" style="color: var(--rku-orange-red);"></i>
                                <%# Eval("compName") != DBNull.Value && Eval("compName").ToString() != "" ? Eval("compName") : Eval("CompanyUsername") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <HeaderStyle Width="12%" />
                        <ItemTemplate>
                            <span class='badge <%# 
                                Convert.ToString(Eval("ApplicationStatus")) == "Offer Accepted" || Convert.ToString(Eval("ApplicationStatus")) == "Selected" || Convert.ToString(Eval("ApplicationStatus")) == "Placed" ? "bg-success-subtle text-success border border-success-subtle" :
                                Convert.ToString(Eval("ApplicationStatus")) == "Shortlisted" ? "bg-info-subtle text-info border border-info-subtle" :
                                Convert.ToString(Eval("ApplicationStatus")) == "Interview Scheduled" ? "bg-primary-subtle text-primary border border-primary-subtle" :
                                Convert.ToString(Eval("ApplicationStatus")) == "Rejected" ? "bg-danger-subtle text-danger border border-danger-subtle" :
                                "bg-secondary-subtle text-secondary border" %> px-2 py-1'>
                                <%# 
                                Convert.ToString(Eval("ApplicationStatus")) == "Offer Accepted" || Convert.ToString(Eval("ApplicationStatus")) == "Selected" || Convert.ToString(Eval("ApplicationStatus")) == "Placed" ? "<i class='fa-solid fa-trophy me-1'></i>Placed" :
                                Convert.ToString(Eval("ApplicationStatus")) == "Shortlisted" ? "<i class='fa-solid fa-star me-1'></i>Shortlisted" :
                                Convert.ToString(Eval("ApplicationStatus")) == "Interview Scheduled" ? "<i class='fa-solid fa-calendar me-1'></i>Interview" :
                                Convert.ToString(Eval("ApplicationStatus")) == "Rejected" ? "<i class='fa-solid fa-xmark me-1'></i>Rejected" :
                                "Applied" %>
                            </span>
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
