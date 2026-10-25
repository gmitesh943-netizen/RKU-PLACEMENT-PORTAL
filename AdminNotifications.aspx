<%@ Page Title="Broadcast Notifications | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminNotifications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminNotifications" %>

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

        /* ─── 3 STAT CARDS (Matching AdminDashboard) ─── */
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

        /* ─── WHITE CONTAINER CARDS ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            overflow: hidden;
            height: 100%;
        }

        .dash-card-head {
            padding: 1.25rem 1.5rem;
            background: #ffffff;
            border-bottom: 1px solid var(--rku-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .dash-card-body {
            padding: 1.5rem;
        }

        /* ─── BROADCAST ITEMS ─── */
        .broadcast-card-item {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 14px;
            padding: 1.2rem 1.35rem;
            margin-bottom: 1rem;
            transition: all 0.25s ease;
            position: relative;
        }

            .broadcast-card-item:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
                border-color: #cbd5e1;
            }

        .broadcast-icon-box {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: rgba(239, 55, 36, 0.08);
            color: var(--rku-orange-red);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.15rem;
            flex-shrink: 0;
        }

        .btn-rku-orange {
            background: linear-gradient(135deg, #ef3724 0%, #d82b19 100%) !important;
            background-color: #ef3724 !important;
            border: 1px solid #d82b19 !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            padding: 0.55rem 1.35rem !important;
            border-radius: 50px !important;
            font-size: 0.85rem !important;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner (Matching AdminDashboard) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-bullhorn me-1"></i>TPO BROADCAST HUB
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Live Stream Active
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">
                    TPO Broadcast &amp; Notice System
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Publish official placement notices, drive alerts, and training announcements instantly to all students or target specific academic branches.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <div class="d-inline-flex align-items-center gap-3 p-2 rounded-4 bg-light border">
                    <div class="text-lg-end d-none d-lg-block ps-2">
                        <div class="fw-bold text-dark" style="font-size: 0.92rem;">Placement Cell Broadcasts</div>
                        <div class="text-muted small" style="font-size: 0.78rem;">RK University &bull; Live Stream</div>
                    </div>
                    <div class="avatar-circle text-white fw-extrabold rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 46px; height: 46px; font-size: 1.15rem; background: linear-gradient(135deg, var(--rku-orange-red), var(--rku-orange-red-dark));">
                        <i class="fa-solid fa-tower-broadcast"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 3 Clean Stat KPI Cards (Matching AdminDashboard) -->
    <div class="row g-3 mb-4">
        <!-- 1. Total Broadcasts -->
        <div class="col-md-4">
            <div class="stat-card-clean">
                <i class="fa-solid fa-bullhorn stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-bullhorn"></i>
                        </div>
                        <span class="stat-card-tag">All Notices</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Total Broadcasts</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblTotalBroadcasts" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-list-check text-dark me-1"></i>All Published Announcements
                </div>
            </div>
        </div>

        <!-- 2. Active Live Notices -->
        <div class="col-md-4">
            <div class="stat-card-clean">
                <i class="fa-solid fa-circle-check stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-tower-broadcast"></i>
                        </div>
                        <span class="stat-card-tag">Live Now</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Active Live Notices</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblActiveBroadcasts" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-circle-check text-success me-1"></i>Visible on Student Portal
                </div>
            </div>
        </div>

        <!-- 3. Urgent / High Priority -->
        <div class="col-md-4">
            <div class="stat-card-clean">
                <i class="fa-solid fa-triangle-exclamation stat-watermark-icon"></i>
                <div>
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="stat-icon-chip">
                            <i class="fa-solid fa-bell"></i>
                        </div>
                        <span class="stat-card-tag">Attention</span>
                    </div>
                    <div class="text-muted small fw-bold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.72rem;">Urgent / High Priority</div>
                    <h2 class="stat-num-black">
                        <asp:Label ID="lblUrgentAlerts" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <div class="mt-3 pt-2 border-top d-flex align-items-center gap-1 text-muted small" style="font-size: 0.78rem;">
                    <i class="fa-solid fa-bolt text-warning me-1"></i>High-Priority Direct Alerts
                </div>
            </div>
        </div>
    </div>

    <!-- Main Layout: Broadcast Form & Live Stream (Matching AdminDashboard) -->
    <div class="row g-4">
        
        <!-- Left Column: Create Broadcast Form -->
        <div class="col-lg-5">
            <div class="dash-card-white">
                <div class="dash-card-head">
                    <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 1.05rem;">
                        <i class="fa-solid fa-paper-plane me-2" style="color: var(--rku-orange-red);"></i>Create New Broadcast Notice
                    </h6>
                </div>
                <div class="dash-card-body">
                    
                    <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>

                    <!-- Notice Title -->
                    <div class="mb-3">
                        <label class="form-label text-dark small fw-bold">Notice Title / Subject <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="e.g. TCS NQT 2026 Registration Open" MaxLength="200" required="required"></asp:TextBox>
                    </div>

                    <!-- Category & Priority Row -->
                    <div class="row g-2 mb-3">
                        <div class="col-sm-6">
                            <label class="form-label text-dark small fw-bold">Category <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Campus Drive" Value="Campus Drive"></asp:ListItem>
                                <asp:ListItem Text="Interview Schedule" Value="Interview Schedule"></asp:ListItem>
                                <asp:ListItem Text="Training & Workshop" Value="Training/Workshop"></asp:ListItem>
                                <asp:ListItem Text="Urgent Alert" Value="Urgent Alert"></asp:ListItem>
                                <asp:ListItem Text="General Announcement" Value="General"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-6">
                            <label class="form-label text-dark small fw-bold">Priority Level <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Urgent (Red Alert)" Value="Urgent"></asp:ListItem>
                                <asp:ListItem Text="High (Attention)" Value="High"></asp:ListItem>
                                <asp:ListItem Text="Normal Notice" Value="Normal" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Target Audience -->
                    <div class="mb-3">
                        <label class="form-label text-dark small fw-bold">Target Audience / Branch <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlAudience" runat="server" CssClass="form-select">
                            <asp:ListItem Text="All Students (All Branches)" Value="All Students"></asp:ListItem>
                            <asp:ListItem Text="B.Tech CSE / IT" Value="B.Tech CSE / IT"></asp:ListItem>
                            <asp:ListItem Text="BCA / MCA" Value="BCA / MCA"></asp:ListItem>
                            <asp:ListItem Text="Diploma Engineering" Value="Diploma Engineering"></asp:ListItem>
                            <asp:ListItem Text="Mechanical / Civil Engineering" Value="Mechanical / Civil"></asp:ListItem>
                            <asp:ListItem Text="Management & Pharmacy" Value="Management & Pharmacy"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- External Link / URL -->
                    <div class="mb-3">
                        <label class="form-label text-dark small fw-bold">Attachment / Registration URL <span class="text-muted fw-normal">(Optional)</span></label>
                        <asp:TextBox ID="txtLink" runat="server" CssClass="form-control" placeholder="e.g. https://nextstep.tcs.com or meeting link"></asp:TextBox>
                    </div>

                    <!-- Message Body -->
                    <div class="mb-4">
                        <label class="form-label text-dark small fw-bold">Notice Message / Instructions <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Provide complete placement instructions, eligibility criteria, date/time, and steps for students..." required="required"></asp:TextBox>
                    </div>

                    <!-- Submit & Reset Buttons -->
                    <div class="d-flex gap-2">
                        <asp:Button ID="btnSendBroadcast" runat="server" OnClick="btnSendBroadcast_Click" Text="Publish Notice Broadcast" 
                            CssClass="btn-rku-orange flex-grow-1 shadow-sm" Style="background: linear-gradient(135deg, #ef3724, #d82b19) !important; color: #ffffff !important; border: 1px solid #d82b19 !important; font-weight: 700 !important; border-radius: 50px !important; padding: 0.65rem 1.4rem !important; display: inline-block !important;" />
                        <asp:Button ID="btnResetForm" runat="server" OnClick="btnResetForm_Click" Text="Cancel" CssClass="btn btn-light border px-4 rounded-pill text-secondary fw-semibold" />
                    </div>

                </div>
            </div>
        </div>

        <!-- Right Column: Live Broadcast History Stream -->
        <div class="col-lg-7">
            <div class="dash-card-white">
                <div class="dash-card-head">
                    <div>
                        <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 1.05rem;">
                            <i class="fa-solid fa-list-check me-2" style="color: var(--rku-orange-red);"></i>Published Placement Broadcasts
                        </h6>
                    </div>
                    <div class="d-flex gap-1">
                        <asp:LinkButton ID="btnFilterAll" runat="server" OnClick="FilterBroadcast_Click" CommandArgument="All" CssClass="btn btn-sm btn-dark px-3 rounded-pill fw-bold" style="font-size: 0.75rem;">All</asp:LinkButton>
                        <asp:LinkButton ID="btnFilterUrgent" runat="server" OnClick="FilterBroadcast_Click" CommandArgument="Urgent" CssClass="btn btn-sm btn-light border px-2.5 rounded-pill text-secondary" style="font-size: 0.75rem;">Urgent</asp:LinkButton>
                        <asp:LinkButton ID="btnFilterDrives" runat="server" OnClick="FilterBroadcast_Click" CommandArgument="Campus Drive" CssClass="btn btn-sm btn-light border px-2.5 rounded-pill text-secondary" style="font-size: 0.75rem;">Drives</asp:LinkButton>
                    </div>
                </div>

                <div class="dash-card-body">
                    
                    <div style="max-height: 650px; overflow-y: auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView1_RowCommand1" EmptyDataText="No broadcast notices published yet." EmptyDataRowStyle-CssClass="text-center text-muted small py-4 d-block">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="broadcast-card-item">
                                            <div class="d-flex align-items-start gap-3">
                                                <div class="broadcast-icon-box">
                                                    <i class="fa-solid fa-bullhorn"></i>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-1">
                                                        <div class="d-flex align-items-center gap-2 flex-wrap">
                                                            <h6 class="fw-bold text-dark mb-0 font-heading" style="font-size: 1.02rem;"><%# Eval("Title") %></h6>
                                                            <span class='badge <%# Eval("Priority").ToString() == "Urgent" ? "bg-danger-subtle text-danger border border-danger-subtle" : (Eval("Priority").ToString() == "High" ? "bg-warning-subtle text-warning-emphasis border border-warning-subtle" : "bg-primary-subtle text-primary border border-primary-subtle") %> rounded-pill px-2.5 py-1 small fw-bold'>
                                                                <%# Eval("Priority") %>
                                                            </span>
                                                        </div>
                                                        <span class="badge bg-light text-secondary border small"><i class="fa-regular fa-clock me-1"></i><%# Eval("CreatedDate", "{0:dd MMM yyyy, hh:mm tt}") %></span>
                                                    </div>

                                                    <div class="d-flex align-items-center gap-2 mb-2 flex-wrap" style="font-size: 0.8rem;">
                                                        <span class="badge bg-light text-dark border px-2.5 py-1 rounded-pill">
                                                            <i class="fa-solid fa-graduation-cap me-1" style="color: var(--rku-orange-red);"></i>Target: <strong><%# Eval("TargetAudience") %></strong>
                                                        </span>
                                                        <span class="badge bg-light text-secondary border px-2.5 py-1 rounded-pill">
                                                            <i class="fa-solid fa-tag me-1"></i><%# Eval("Category") %>
                                                        </span>
                                                    </div>

                                                    <p class="text-secondary small mb-2" style="line-height: 1.6; text-align: justify;"><%# Eval("MessageBody") %></p>

                                                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 pt-2 border-top" style="border-color: #f1f5f9 !important;">
                                                        <div>
                                                            <%# !string.IsNullOrEmpty(Eval("AttachmentLink") as string) ? "<a href='" + Eval("AttachmentLink") + "' target='_blank' class='btn btn-light border btn-sm rounded-pill px-3 fw-semibold text-primary' style='font-size: 0.78rem;'><i class='fa-solid fa-link me-1'></i>Open Link</a>" : "" %>
                                                        </div>
                                                        <div class="d-flex gap-1">
                                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-primary btn-sm rounded-pill px-2.5" ToolTip="Edit Notice" style="font-size: 0.75rem;">
                                                                <i class="fa-regular fa-pen-to-square"></i>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btnDeleteBroadcast" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-danger btn-sm rounded-pill px-2.5" ToolTip="Delete Broadcast" OnClientClick="return confirm('Are you sure you want to delete this broadcast notice?');" style="font-size: 0.75rem;">
                                                                <i class="fa-regular fa-trash-can"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>

    </div>

</asp:Content>
