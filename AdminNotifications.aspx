<%@ Page Title="Broadcast Notifications | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminNotifications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-red: #e03627;
            --rku-red-dark: #c5281b;
            --rku-maroon: #991b1b;
            --rku-dark: #0f172a;
        }

        .broadcast-hero-card {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 18px;
            padding: 1.5rem 1.85rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.02);
            margin-bottom: 1.5rem;
        }

        .broadcast-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .broadcast-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #0f172a !important;
            font-size: 1.85rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .broadcast-hero-card p {
            color: #64748b !important;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 0;
            max-width: 650px;
        }

        .hero-action-btn {
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff !important;
            border-radius: 10px;
            font-weight: 700;
            padding: 0.65rem 1.4rem;
            box-shadow: 0 4px 14px rgba(224, 54, 39, 0.28);
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 0.9rem;
        }

        .stat-card-custom {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 1.25rem 1.5rem;
            box-shadow: 0 2px 12px rgba(15, 23, 42, 0.03);
            transition: all 0.25s ease;
        }

        .stat-card-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.06);
            border-color: #cbd5e1;
        }

        .card-custom {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.03);
            overflow: hidden;
        }

        .card-custom-head {
            padding: 1.25rem 1.75rem;
            background: #fafbfc;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-custom-body {
            padding: 1.75rem;
        }

        .broadcast-item {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1rem;
            transition: all 0.2s ease;
            position: relative;
        }

        .broadcast-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(15, 23, 42, 0.05);
            border-color: #cbd5e1;
        }

        .broadcast-item.priority-urgent {
            border-left: 5px solid #e03627;
        }

        .broadcast-item.priority-high {
            border-left: 5px solid #f59e0b;
        }

        .broadcast-item.priority-normal {
            border-left: 5px solid #2563eb;
        }

        .category-icon-box {
            width: 46px;
            height: 46px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .btn-rku-publish {
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff !important;
            box-shadow: 0 4px 14px rgba(224, 54, 39, 0.25);
            border: none;
            transition: all 0.2s ease;
        }

        .btn-rku-publish:hover {
            background: linear-gradient(135deg, #c5281b, #991b1b);
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(224, 54, 39, 0.35);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner -->
    <div class="broadcast-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="broadcast-hero-kicker">
                    <i class="fa-solid fa-bullhorn me-1"></i> TPO ADMIN WORKSPACE
                </div>
                <h2>TPO Broadcast &amp; Notice System</h2>
                <p>
                    Publish official placement notices, drive alerts, and training announcements instantly to all students or target specific academic branches.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <span class="hero-action-btn">
                    <i class="fa-solid fa-tower-broadcast me-1"></i> Live University Stream
                </span>
            </div>
        </div>
    </div>

    <!-- Live Counters Row -->
    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="stat-card-custom d-flex align-items-center gap-3">
                <div class="p-3 bg-danger-subtle text-danger rounded-3 fs-4">
                    <i class="fa-solid fa-bullhorn"></i>
                </div>
                <div>
                    <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Total Broadcasts</div>
                    <h3 class="fw-bold mb-0 text-dark font-heading"><asp:Label ID="lblTotalBroadcasts" runat="server" Text="0"></asp:Label></h3>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card-custom d-flex align-items-center gap-3">
                <div class="p-3 bg-success-subtle text-success rounded-3 fs-4">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
                <div>
                    <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Active Live Notices</div>
                    <h3 class="fw-bold mb-0 text-dark font-heading"><asp:Label ID="lblActiveBroadcasts" runat="server" Text="0"></asp:Label></h3>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card-custom d-flex align-items-center gap-3">
                <div class="p-3 bg-warning-subtle text-warning-emphasis rounded-3 fs-4">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
                <div>
                    <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">Urgent / High Priority</div>
                    <h3 class="fw-bold mb-0 text-dark font-heading"><asp:Label ID="lblUrgentAlerts" runat="server" Text="0"></asp:Label></h3>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Layout: Broadcast Form & Live Stream -->
    <div class="row g-4">
        
        <!-- Left Column: Create Broadcast Form -->
        <div class="col-lg-5">
            <div class="card-custom">
                <div class="card-custom-head">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-paper-plane me-2" style="color: #e9392a;"></i>Create New Broadcast Notice
                    </h6>
                </div>
                <div class="card-custom-body">
                    
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
                        <asp:Button ID="btnSendBroadcast" runat="server" OnClick="btnSendBroadcast_Click" Text="Publish Notice Broadcast" CssClass="btn btn-rku-publish fw-bold px-4 rounded-pill flex-grow-1 shadow-sm" />
                        <asp:Button ID="btnResetForm" runat="server" OnClick="btnResetForm_Click" Text="Cancel" CssClass="btn btn-light border px-3 rounded-pill text-secondary" />
                    </div>

                </div>
            </div>
        </div>

        <!-- Right Column: Live Broadcast History Stream -->
        <div class="col-lg-7">
            <div class="card-custom">
                <div class="card-custom-head">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-list-check me-2" style="color: #e9392a;"></i>Published Placement Broadcasts
                    </h6>
                    <div class="d-flex gap-1">
                        <asp:LinkButton ID="btnFilterAll" runat="server" OnClick="FilterBroadcast_Click" CommandArgument="All" CssClass="btn btn-sm btn-dark px-3 rounded-pill fw-bold" style="font-size: 0.75rem;">All</asp:LinkButton>
                        <asp:LinkButton ID="btnFilterUrgent" runat="server" OnClick="FilterBroadcast_Click" CommandArgument="Urgent" CssClass="btn btn-sm btn-light border px-2.5 rounded-pill text-secondary" style="font-size: 0.75rem;">Urgent</asp:LinkButton>
                        <asp:LinkButton ID="btnFilterDrives" runat="server" OnClick="FilterBroadcast_Click" CommandArgument="Campus Drive" CssClass="btn btn-sm btn-light border px-2.5 rounded-pill text-secondary" style="font-size: 0.75rem;">Drives</asp:LinkButton>
                    </div>
                </div>

                <div class="card-custom-body">
                    
                    <div style="max-height: 650px; overflow-y: auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView1_RowCommand1" EmptyDataText="No broadcast notices published yet." EmptyDataRowStyle-CssClass="text-center text-muted small py-4 d-block">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="broadcast-item bg-white border rounded-3 p-3 mb-3 shadow-sm">
                                            <div class="d-flex align-items-start gap-3">
                                                <div class="bg-light text-danger rounded-3 p-2 d-flex align-items-center justify-content-center" style="width: 44px; height: 44px; flex-shrink: 0;">
                                                    <i class="fa-solid fa-bullhorn fs-5"></i>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-1">
                                                        <div class="d-flex align-items-center gap-2 flex-wrap">
                                                            <h6 class="fw-bold text-dark mb-0 font-heading" style="font-size: 1.05rem;"><%# Eval("Title") %></h6>
                                                            <span class="badge bg-danger-subtle text-danger border border-danger-subtle rounded-pill px-2.5 py-1 small fw-bold"><%# Eval("Priority") %></span>
                                                        </div>
                                                        <span class="badge bg-light text-secondary border small"><i class="fa-regular fa-clock me-1"></i><%# Eval("CreatedDate", "{0:dd MMM yyyy, hh:mm tt}") %></span>
                                                    </div>

                                                    <div class="d-flex align-items-center gap-2 mb-2 flex-wrap" style="font-size: 0.8rem;">
                                                        <span class="badge bg-light text-dark border px-2.5 py-1 rounded-pill">
                                                            <i class="fa-solid fa-graduation-cap text-danger me-1"></i>Target: <strong><%# Eval("TargetAudience") %></strong>
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
