<%@ Page Title="Live Notifications & Alerts | RKU Placement Portal" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentNotifications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentNotifications" %>

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

        /* ─── HERO HEADER (Clean White + Black Text + Red/Orange Accent) ─── */
        .notif-hero-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .notif-hero-card::before {
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
            gap: 6px;
        }

        .notif-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-orange-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .notif-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: var(--rku-dark) !important;
            font-size: 1.85rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .notif-hero-card p {
            color: var(--rku-gray) !important;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 0;
            max-width: 650px;
        }

        /* ─── STAT CARDS (Clean White + Accent Top Border) ─── */
        .notif-stat-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-top: 4px solid var(--rku-orange-red);
            border-radius: 16px;
            padding: 1.3rem 1.4rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            .notif-stat-card:hover {
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
            flex-shrink: 0;
        }

        .notif-stat-card:hover .stat-icon-chip {
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
            font-size: 2.1rem;
            line-height: 1.1;
            margin: 0.3rem 0 0 0;
        }

        /* ─── FILTER PILLS ─── */
        .filter-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 18px;
            min-height: 38px;
            border-radius: 50px;
            border: 1px solid var(--rku-border);
            background: #ffffff;
            color: var(--rku-gray);
            text-decoration: none !important;
            font-size: 13.5px;
            font-weight: 600;
            transition: all 0.25s ease;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.02);
        }

            .filter-btn:hover {
                background: #fff5f3 !important;
                color: var(--rku-orange-red) !important;
                border-color: #fca5a5 !important;
                transform: translateY(-1px);
            }

            .filter-btn.active {
                background: var(--rku-orange-red) !important;
                color: #ffffff !important;
                border-color: var(--rku-orange-red) !important;
                font-weight: 700;
                box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25);
            }

                .filter-btn.active:hover {
                    background: var(--rku-orange-red-dark) !important;
                    border-color: var(--rku-orange-red-dark) !important;
                    color: #ffffff !important;
                }

        /* ─── BUTTONS ─── */
        .btn-rku-orange {
            background: var(--rku-orange-red);
            border: 1px solid var(--rku-orange-red);
            color: #ffffff !important;
            font-weight: 600;
            padding: 0.4rem 1rem;
            border-radius: 50px;
            font-size: 0.82rem;
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

            .btn-rku-orange:hover {
                background: var(--rku-orange-red-dark);
                border-color: var(--rku-orange-red-dark);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(239, 55, 36, 0.25);
            }

        /* ─── NOTIFICATION FEED ITEMS ─── */
        .notif-item-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 16px;
            padding: 1.35rem 1.6rem;
            box-shadow: 0 2px 10px rgba(15, 23, 42, 0.02);
            margin-bottom: 1rem;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
        }

            .notif-item-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 24px rgba(15, 23, 42, 0.06);
                border-color: #cbd5e1;
            }

        .notif-icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            flex-shrink: 0;
            transition: all 0.25s ease;
        }

        .notif-type-drive {
            border-left: 5px solid var(--rku-orange-red);
        }

            .notif-type-drive .notif-icon-circle {
                background: rgba(239, 55, 36, 0.08);
                color: var(--rku-orange-red);
                border: 1px solid rgba(239, 55, 36, 0.18);
            }

        .notif-type-interview {
            border-left: 5px solid #2563eb;
        }

            .notif-type-interview .notif-icon-circle {
                background: #eff6ff;
                color: #2563eb;
                border: 1px solid #dbeafe;
            }

        .notif-type-selected {
            border-left: 5px solid #16a34a;
        }

            .notif-type-selected .notif-icon-circle {
                background: #f0fdf4;
                color: #16a34a;
                border: 1px solid #dcfce7;
            }

        .notif-type-notice {
            border-left: 5px solid #f59e0b;
        }

            .notif-type-notice .notif-icon-circle {
                background: #fffbeb;
                color: #d97706;
                border: 1px solid #fef3c7;
            }

        .notif-type-general {
            border-left: 5px solid var(--rku-dark);
        }

            .notif-type-general .notif-icon-circle {
                background: #f1f5f9;
                color: var(--rku-dark);
                border: 1px solid var(--rku-border);
            }

        .notif-gridview {
            border: none;
        }

            .notif-gridview > tbody > tr > td {
                padding: 0;
                border: none;
                background: transparent;
            }

        /* ─── MOBILE RESPONSIVE ─── */
        @media (max-width: 576px) {
            .notif-hero-card {
                padding: 1.25rem;
            }

                .notif-hero-card h2 {
                    font-size: 1.45rem;
                }

            .filter-btn {
                font-size: 13px;
                padding: 7px 14px;
            }

            .notif-item-card {
                padding: 1.1rem;
            }

            .notif-icon-circle {
                width: 42px;
                height: 42px;
                font-size: 1.05rem;
            }
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header -->
    <div class="notif-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-bell"></i>STUDENT WORKSPACE
                    </span>
                </div>
                <h2 class="mb-1 font-heading">Notifications &amp; Alerts Hub</h2>
                <p>
                    Stay informed with real-time interview calls, application progress,
                    and newly announced campus recruitment drives from the TPO Cell.
               
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <span class="hero-badge-red" style="font-size: 0.85rem; padding: 0.5rem 1.1rem;">
                    <i class="fa-solid fa-tower-broadcast"></i>Live Updates Feed
                </span>
            </div>
        </div>
    </div>


    <!-- Counters Row -->
    <div class="row g-3 mb-4">

        <!-- Total Alerts -->
        <div class="col-sm-4">
            <div class="notif-stat-card">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">SYSTEM ALERTS</span>
                    <div class="stat-icon-chip">
                        <i class="fa-solid fa-bullhorn"></i>
                    </div>
                </div>
                <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">
                    Total Alerts
               
                </div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblTotalAlerts" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- Interview Calls -->
        <div class="col-sm-4">
            <div class="notif-stat-card" style="border-top-color: #2563eb;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">ROUND SCHEDULES</span>
                    <div class="stat-icon-chip" style="background: rgba(37, 99, 235, 0.08); color: #2563eb;">
                        <i class="fa-solid fa-video"></i>
                    </div>
                </div>
                <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">
                    Interview Calls
               
                </div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblInterviewCalls" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

        <!-- Active Drives -->
        <div class="col-sm-4">
            <div class="notif-stat-card" style="border-top-color: #16a34a;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="stat-card-tag">CAMPUS DRIVES</span>
                    <div class="stat-icon-chip" style="background: rgba(22, 163, 74, 0.08); color: #16a34a;">
                        <i class="fa-solid fa-briefcase"></i>
                    </div>
                </div>
                <div class="text-muted small fw-bold text-uppercase" style="font-size: 0.72rem;">
                    Active Drives
               
                </div>
                <h3 class="stat-num-black">
                    <asp:Label ID="lblActiveDrivesCount" runat="server" Text="0"></asp:Label>
                </h3>
            </div>
        </div>

    </div>

    <!-- Filter Buttons -->
    <div class="d-flex gap-2 mb-4 flex-wrap">

        <asp:LinkButton ID="btnFilterAll" runat="server" OnClick="Filter_Click" OnClientClick="setActiveFilter(this);" CommandArgument="All" CssClass="filter-btn active" data-filter="All"><i class="fa-solid fa-layer-group me-1"></i> All Notifications</asp:LinkButton>

        <asp:LinkButton ID="btnFilterNotices" runat="server" OnClick="Filter_Click" OnClientClick="setActiveFilter(this);" CommandArgument="Notices" CssClass="filter-btn" data-filter="Notices"><i class="fa-solid fa-bullhorn me-1"></i> TPO Broadcasts</asp:LinkButton>

        <asp:LinkButton ID="btnFilterInterviews" runat="server" OnClick="Filter_Click" OnClientClick="setActiveFilter(this);" CommandArgument="Interviews" CssClass="filter-btn" data-filter="Interviews"><i class="fa-solid fa-video me-1"></i> Interview Calls</asp:LinkButton>

        <asp:LinkButton ID="btnFilterDrives" runat="server" OnClick="Filter_Click" OnClientClick="setActiveFilter(this);" CommandArgument="Drives" CssClass="filter-btn" data-filter="Drives"><i class="fa-solid fa-building-flag me-1"></i> Campus Drive Alerts</asp:LinkButton>

        <asp:LinkButton ID="btnFilterSelections" runat="server" OnClick="Filter_Click" OnClientClick="setActiveFilter(this);" CommandArgument="Selections" CssClass="filter-btn" data-filter="Selections"><i class="fa-solid fa-award me-1"></i> Selections &amp; Offers</asp:LinkButton>

    </div>

    <!-- Notifications Feed -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        Width="100%" GridLines="None" ShowHeader="False" CssClass="notif-gridview">

        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class='<%# "notif-item-card " + (Eval("NotificationType").ToString() == "Notice" ? "notif-type-notice" : (Eval("NotificationType").ToString() == "Drive" ? "notif-type-drive" : (Eval("ApplicationStatus").ToString() == "Interview Scheduled" || Eval("InterviewDate") != DBNull.Value ? "notif-type-interview" : (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "notif-type-selected" : "notif-type-general")))) %>'>
                        <div class="d-flex align-items-start gap-3">

                            <!-- Notification Icon -->
                            <div class="notif-icon-circle">
                                <i class='<%# Eval("NotificationType").ToString() == "Notice" ? "fa-solid fa-bullhorn" : (Eval("NotificationType").ToString() == "Drive" ? "fa-solid fa-building-flag" : (Eval("ApplicationStatus").ToString() == "Interview Scheduled" || Eval("InterviewDate") != DBNull.Value ? "fa-solid fa-calendar-check" : (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "fa-solid fa-award" : (Eval("ApplicationStatus").ToString() == "Shortlisted" ? "fa-solid fa-star" : "fa-solid fa-briefcase")))) %>'></i>
                            </div>
                            <div class="flex-grow-1">

                                <!-- Title + Date -->
                                <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-1">
                                    <h6 class="fw-bold text-dark mb-0 font-heading" style="font-size: 1.05rem;">
                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("NotificationType").ToString() == "Notice" ? "📢 " + Eval("compName") : (Eval("NotificationType").ToString() == "Drive" ? "New Campus Drive: " + (!string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName") : "Corporate Partner") : (Eval("ApplicationStatus").ToString() == "Interview Scheduled" || Eval("InterviewDate") != DBNull.Value ? "Interview Scheduled with " + (!string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName") : "Corporate Partner") : (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "Job Offer Received from " + (!string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName") : "Corporate Partner") + "!" : (Eval("ApplicationStatus").ToString() == "Shortlisted" ? "Shortlisted by " + (!string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName") : "Corporate Partner") : "Application Update: " + Eval("JobRole"))))) %>'></asp:Label>
                                    </h6>
                                    <div class="d-flex align-items-center gap-2">
                                        <asp:Label ID="lblNoticeBadge" runat="server" Visible='<%# Eval("NotificationType").ToString() == "Notice" %>' Text='<%# Eval("ApplicationStatus") %>' CssClass='<%# "badge rounded-pill small px-2.5 py-1 " + (Eval("ApplicationStatus").ToString() == "Urgent" ? "bg-danger text-white" : (Eval("ApplicationStatus").ToString() == "High" ? "bg-warning text-dark" : "bg-primary-subtle text-primary border border-primary-subtle")) %>'></asp:Label>
                                        <span class="badge bg-light text-secondary border small fw-semibold">
                                            <asp:Label ID="lblTimeAgo" runat="server" Text='<%# Eval("NotificationDate", "{0:dd MMM yyyy}") %>'></asp:Label>
                                        </span>
                                    </div>
                                </div>

                                <!-- Message -->
                                <p class="text-secondary small mb-2" style="line-height: 1.55;">
                                    <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("NotificationType").ToString() == "Notice" ? Eval("JobRole") : (Eval("NotificationType").ToString() == "Drive" ? (!string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName") : "Company") + " announced campus recruitment drive for " + Eval("JobRole") + "." : (Eval("ApplicationStatus").ToString() == "Interview Scheduled" || Eval("InterviewDate") != DBNull.Value ? "Your interview for " + Eval("JobRole") + " has been scheduled for " + Eval("InterviewDate") + "." : (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "Congratulations! You have been selected for " + Eval("JobRole") + ". Review and accept your official offer letter now." : (Eval("ApplicationStatus").ToString() == "Shortlisted" ? "Your application for " + Eval("JobRole") + " has been shortlisted for the next recruitment round." : "Your application status for " + Eval("JobRole") + " is currently " + Eval("ApplicationStatus") + ".")))) %>'></asp:Label>
                                </p>
                                <!-- Action Buttons -->
                                <div class="d-flex flex-wrap gap-2 align-items-center pt-1">

                                    <!-- Notice Link / Attachment -->
                                    <asp:HyperLink ID="lnkNotice" runat="server" NavigateUrl='<%# Eval("InterviewVenue") %>' Target="_blank" Visible='<%# Eval("NotificationType").ToString() == "Notice" && !string.IsNullOrEmpty(Convert.ToString(Eval("InterviewVenue"))) %>' CssClass="btn btn-outline-warning text-dark btn-sm rounded-pill px-3 fw-semibold"><i class="fa-solid fa-arrow-up-right-from-square me-1"></i> Open Notice Link / Attachment</asp:HyperLink>

                                    <!-- Drive -->
                                    <asp:HyperLink ID="lnkDrive" runat="server" NavigateUrl="StudentDrives.aspx" Visible='<%# Eval("NotificationType").ToString() == "Drive" %>' CssClass="btn btn-rku-orange"><i class="fa-solid fa-arrow-right me-1"></i> View &amp; Apply</asp:HyperLink>

                                    <!-- Offer Letter -->
                                    <asp:HyperLink ID="lnkOffer" runat="server" NavigateUrl="StudentOfferLetters.aspx" Visible='<%# Eval("NotificationType").ToString() == "Application" && (Eval("ApplicationStatus").ToString() == "Selected" || Eval("ApplicationStatus").ToString() == "Offer Accepted") %>' CssClass="btn btn-success btn-sm rounded-pill px-3 fw-semibold shadow-sm"><i class="fa-solid fa-file-contract me-1"></i> View Offer Letter</asp:HyperLink>

                                    <!-- Interview -->
                                    <asp:HyperLink ID="lnkInterview" runat="server" NavigateUrl='<%# Eval("InterviewVenue") %>' Target="_blank" Visible='<%# Eval("NotificationType").ToString() == "Application" && (Eval("ApplicationStatus").ToString() == "Interview Scheduled" || Eval("InterviewDate") != DBNull.Value) && !string.IsNullOrEmpty(Convert.ToString(Eval("InterviewVenue"))) && (Convert.ToString(Eval("InterviewVenue")).ToLower().StartsWith("http") || Convert.ToString(Eval("InterviewVenue")).ToLower().Contains("meet.google.com") || Convert.ToString(Eval("InterviewVenue")).ToLower().Contains("zoom.us")) %>' CssClass="btn btn-primary btn-sm rounded-pill px-3 fw-semibold shadow-sm"><i class="fa-solid fa-video me-1"></i> Join Interview Meet</asp:HyperLink>

                                    <!-- Physical Venue -->
                                    <asp:Label ID="lblVenue" runat="server" Text='<%# "<i class=\"fa-solid fa-location-dot text-danger me-1\"></i>" + Eval("InterviewVenue") %>' Visible='<%# Eval("NotificationType").ToString() == "Application" && (Eval("ApplicationStatus").ToString() == "Interview Scheduled" || Eval("InterviewDate") != DBNull.Value) && !string.IsNullOrEmpty(Convert.ToString(Eval("InterviewVenue"))) && !Convert.ToString(Eval("InterviewVenue")).ToLower().StartsWith("http") && !Convert.ToString(Eval("InterviewVenue")).ToLower().Contains("meet.google.com") && !Convert.ToString(Eval("InterviewVenue")).ToLower().Contains("zoom.us") %>' CssClass="badge bg-light text-dark border px-3 py-1.5 rounded-pill"></asp:Label>

                                    <!-- General Application -->
                                    <asp:HyperLink ID="lnkApp" runat="server" NavigateUrl="StudentApplications.aspx" Visible='<%# Eval("NotificationType").ToString() == "Application" && Eval("ApplicationStatus").ToString() != "Selected" && Eval("ApplicationStatus").ToString() != "Offer Accepted" && Eval("ApplicationStatus").ToString() != "Interview Scheduled" && Eval("InterviewDate") == DBNull.Value %>' CssClass="btn btn-outline-secondary btn-sm rounded-pill px-3 fw-semibold"><i class="fa-solid fa-briefcase me-1"></i> Track Application</asp:HyperLink>

                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <%-- Empty Data --%>
        <EmptyDataTemplate>
            <div class="card border-0 shadow-sm rounded-4 p-5 text-center bg-white" style="border: 1px solid var(--rku-border) !important;">
                <div class="mb-3 text-muted">
                    <i class="fa-regular fa-bell-slash" style="font-size: 3.5rem; color: #cbd5e1;"></i>
                </div>
                <h5 class="fw-bold text-dark font-heading">All Caught Up!</h5>
                <p class="text-muted small mx-auto" style="max-width: 480px;">
                    You have no pending notifications or unread alerts right now.
                    Keep checking back as recruiters schedule new interviews and post drives.
               
                </p>
            </div>
        </EmptyDataTemplate>

    </asp:GridView>

    <!-- Active Filter Script -->
    <script>
        function setActiveFilter(btn) {
            document.querySelectorAll('.filter-btn').forEach(function (item) {
                item.classList.remove('active');
            });
            btn.classList.add('active');
            localStorage.setItem('studentNotificationFilter', btn.getAttribute('data-filter'));
        }

        document.addEventListener("DOMContentLoaded", function () {
            var savedFilter = localStorage.getItem('studentNotificationFilter');
            if (savedFilter) {
                document.querySelectorAll('.filter-btn').forEach(function (btn) {
                    if (btn.getAttribute('data-filter') === savedFilter) {
                        btn.classList.add('active');
                    }
                    else {
                        btn.classList.remove('active');
                    }
                });
            }
        });
    </script>
</asp:Content>
