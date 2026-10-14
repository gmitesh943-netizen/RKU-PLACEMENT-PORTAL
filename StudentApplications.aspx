<%@ Page Title="My Applications | RKU Placement Portal" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentApplications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-orange-red: #ef3724;
            --rku-orange-red-dark: #d82b19;
            --rku-dark: #0f172a;
            --rku-gray: #64748b;
            --rku-light: #f8fafc;
            --rku-border: #e2e8f0;
            --card-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        /* ─── HERO HEADER (Clean White + Black Text + Red/Orange Accent) ─── */
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

        /* ─── MAIN WHITE CARD ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            overflow: hidden;
        }

        /* ─── BUTTONS (AdminDashboard style) ─── */
        .btn-rku-orange {
            background: var(--rku-orange-red);
            border: 1px solid var(--rku-orange-red);
            color: #ffffff !important;
            font-weight: 600;
            padding: 0.45rem 1.15rem;
            border-radius: 50px;
            font-size: 0.82rem;
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

            .btn-rku-orange:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
                color: #ffffff !important;
            }

        .btn-outline-rku {
            background: #ffffff;
            color: var(--rku-orange-red) !important;
            border: 1.5px solid var(--rku-orange-red);
            font-weight: 600;
            font-size: 0.82rem;
            border-radius: 50px;
            padding: 0.45rem 1rem;
            text-align: center;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.2s ease;
        }

            .btn-outline-rku:hover {
                background: var(--rku-orange-red);
                color: #ffffff !important;
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.2);
                transform: translateY(-1px);
            }

        /* ─── DATA TABLE (AdminDashboard custom-dash-table style) ─── */
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
                padding: 13px 16px;
                border-bottom: 1px solid var(--rku-border);
            }

            .custom-dash-table td {
                padding: 14px 16px;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                font-size: 0.88rem;
                background-color: #ffffff;
            }

            .custom-dash-table tr:last-child td {
                border-bottom: none;
            }

            .custom-dash-table tr:hover td {
                background-color: #fffafa;
            }

        .company-logo-avatar {
            width: 44px;
            height: 44px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid var(--rku-border);
            background: #ffffff;
            padding: 2px;
            flex-shrink: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header (White & Dark with Red/Orange Accent) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-file-signature me-1"></i>APPLICATIONS TRACKER
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold font-monospace" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Live Status
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">My Placement Applications
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Track your campus recruitment drive submissions, shortlisted stages, scheduled interview rounds, and selection outcomes in real time.
               
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a href="StudentDrives.aspx" class="btn-rku-orange shadow-sm">
                    <i class="fa-solid fa-compass me-1"></i>Browse Open Drives
                </a>
            </div>
        </div>
    </div>

    <!-- Main Applications Card with GridView -->
    <div class="dash-card-white">
        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
            <div class="d-flex align-items-center gap-3">
                <div class="d-flex align-items-center justify-content-center" style="width: 42px; height: 42px; border-radius: 12px; background: rgba(239, 55, 36, 0.08); color: var(--rku-orange-red);">
                    <i class="fa-solid fa-briefcase fs-6"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-0 text-dark font-heading" style="font-size: 1.15rem;">Submitted Applications</h5>
                    <small class="text-muted">History of recruitment drives you applied for</small>
                </div>
            </div>
            <span class="hero-badge-red">
                <i class="fa-solid fa-layer-group me-1"></i>
                <asp:Label ID="lblApplicationCount" runat="server" Text="0 Applications"></asp:Label>
            </span>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="custom-dash-table" GridLines="None">
                <HeaderStyle CssClass="text-dark small fw-bold" />
                <Columns>
                    <asp:TemplateField HeaderText="Job Role &amp; Drive">
                        <ItemTemplate>
                            <div class="d-flex align-items-center">
                                <asp:Image ID="imgCompLogo" runat="server" ImageUrl='<%# "~/Comp_Images/" + Eval("compLogo") %>' Width="44px" Height="44px" CssClass="company-logo-avatar me-3" onerror="this.onerror=null;this.src='assets/images/default-company.png';" AlternateText="Logo" />
                                <div>
                                    <asp:Label ID="lblJobRole" runat="server" CssClass="fw-bold text-dark fs-6 d-block" Text='<%# Eval("JobRole") %>'></asp:Label>
                                    <div class="text-muted small mt-1 d-flex align-items-center gap-1">
                                        <i class="fa-regular fa-building me-1 text-secondary"></i>
                                        <asp:Label ID="lblCompany" runat="server" CssClass="text-secondary fw-semibold" Text='<%# Eval("compName") != DBNull.Value && !string.IsNullOrEmpty(Eval("compName").ToString()) ? Eval("compName") : Eval("CompanyUsername") %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Applied Student Info">
                        <ItemTemplate>
                            <asp:Label ID="lblStudentName" runat="server" CssClass="fw-bold text-dark d-block" Text='<%# Eval("StudentName") %>'></asp:Label>
                            <div class="text-muted small font-monospace mt-1 d-flex align-items-center gap-1">
                                <i class="fa-regular fa-id-badge me-1" style="color: var(--rku-orange-red);"></i>
                                <asp:Label ID="lblStudentRollNo" runat="server" CssClass="text-secondary" Text='<%# Eval("StudentRollNo") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Applied Date">
                        <ItemTemplate>
                            <div class="text-dark small fw-semibold d-flex align-items-center">
                                <i class="fa-regular fa-calendar-days me-2 text-secondary"></i>
                                <asp:Label ID="lblAppliedDate" runat="server" Text='<%# Eval("AppliedDate", "{0:dd MMM yyyy}") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='badge <%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted") ? "bg-success-subtle text-success border border-success-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Shortlisted" ? "bg-info-subtle text-info border border-info-subtle" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString() == "Rejected" ? "bg-danger-subtle text-danger border border-danger-subtle" : "bg-warning-subtle text-warning border border-warning-subtle")) %> px-3 py-1.5 rounded-pill fw-bold small'>
                                <i class="fa-regular fa-clock me-1"></i>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("ApplicationStatus") %>'></asp:Label>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Interview Details &amp; Remarks">
                        <ItemTemplate>
                            <asp:Label ID="lblScheduleAwaited" runat="server" Visible='<%# (Eval("InterviewDate") == DBNull.Value || Eval("InterviewDate").ToString().Trim() == "") && (Eval("InterviewVenue") == DBNull.Value || Eval("InterviewVenue").ToString().Trim() == "") %>' CssClass="text-secondary small"><i class="fa-regular fa-clock me-1 text-muted"></i> Schedule Awaited</asp:Label>

                            <div id="divInterview" runat="server"
                                visible='<%# (Eval("InterviewDate") != DBNull.Value && Eval("InterviewDate").ToString().Trim() != "") || (Eval("InterviewVenue") != DBNull.Value && Eval("InterviewVenue").ToString().Trim() != "") %>'
                                class="p-2 bg-light rounded border border-light-subtle d-inline-block text-start" style="min-width: 180px;">
                                <div class="small fw-bold text-dark mb-1">
                                    <i class="fa-solid fa-calendar-check text-primary me-1"></i>
                                    <asp:Label ID="lblInterviewDate" runat="server" Text='<%# Eval("InterviewDate") %>'></asp:Label>
                                </div>
                                <div class="mt-1">
                                    <span class="badge bg-danger bg-opacity-10 text-danger border border-danger-subtle px-2 py-1" style="font-size: 0.75rem;">
                                        <i class="fa-solid fa-location-dot me-1"></i>
                                        <asp:Label ID="lblInterviewVenue" runat="server" Text='<%# Eval("InterviewVenue") %>'></asp:Label>
                                    </span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center py-5">
                        <div class="text-muted mb-3 opacity-50" style="font-size: 3rem;">
                            <i class="fa-regular fa-folder-open"></i>
                        </div>
                        <h5 class="fw-bold text-dark font-heading">No Applications Found</h5>
                        <p class="text-muted small mb-3">You haven't applied to any campus drives yet. Explore open drives and start applying!</p>
                        <a href="StudentDrives.aspx" class="btn-rku-orange px-4 py-2">
                            <i class="fa-solid fa-bullhorn me-2"></i>Explore Campus Drives
                        </a>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
