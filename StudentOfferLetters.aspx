<%@ Page Title="Job Offer Letters | RKU Placement Portal" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentOfferLetters.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentOfferLetters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Google Fonts: Inter, Playfair Display & Outfit + Cursive for Signature -->
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@600;700&family=Inter:wght@300;400;500;600;700;800&family=Playfair+Display:ital,wght@0,600;0,700;0,800;0,900;1,600;1,700&family=Outfit:wght@400;600;700;800;900&display=swap" rel="stylesheet">
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
        .offer-hero-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .offer-hero-card::before {
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

        .offer-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: var(--rku-dark) !important;
            font-size: 1.75rem;
            letter-spacing: -0.02em;
            margin-bottom: 0.35rem;
        }

        .offer-hero-card p {
            color: var(--rku-gray) !important;
            font-size: 0.88rem;
            line-height: 1.5;
            margin-bottom: 0;
            max-width: 650px;
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

        /* ─── OFFER ITEM CARDS ─── */
        .offer-item-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.6rem 1.75rem;
            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.02);
            margin-bottom: 1.25rem;
            transition: all 0.25s ease;
            position: relative;
            overflow: hidden;
        }

            .offer-item-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 12px 28px rgba(239, 55, 36, 0.08);
                border-color: #fca5a5;
            }

            .offer-item-card.accepted-card {
                border-left: 6px solid #16a34a;
            }

            .offer-item-card.pending-card {
                border-left: 6px solid var(--rku-orange-red);
            }

            .offer-item-card.declined-card {
                border-left: 6px solid #64748b;
                opacity: 0.85;
            }

        .company-logo-box {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            border: 1px solid var(--rku-border);
            background: #ffffff;
            object-fit: contain;
            padding: 3px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .package-badge-lg {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 1.25rem;
            color: var(--rku-orange-red);
            background: rgba(239, 55, 36, 0.08);
            border: 1.5px solid rgba(239, 55, 36, 0.2);
            padding: 0.4rem 1.15rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        /* ─── EXACT CORPORATE HIRING LETTER SHEET DESIGN ─── */
        .hiring-letter-sheet {
            background: #ffffff;
            border-radius: 4px;
            padding: 3.5rem 3.5rem 3.5rem 3.5rem;
            color: #1e293b;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(15, 23, 42, 0.08);
            border: 1px solid #e2e8f0;
            line-height: 1.65;
            min-height: 1050px;
        }

        .hiring-decor-top {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 42px;
            pointer-events: none;
            z-index: 1;
        }

        .hiring-decor-bottom {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100px;
            pointer-events: none;
            z-index: 1;
        }

        .hiring-header-contact {
            font-size: 0.88rem;
            color: #334155;
            line-height: 1.45;
        }

        .hiring-brand-container {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 12px;
        }

        .hiring-brand-name {
            font-family: 'Inter', sans-serif;
            font-weight: 700;
            font-size: 1.15rem;
            color: #0f172a;
            line-height: 1.2;
            text-align: right;
        }

        .hiring-brand-sub {
            font-size: 0.78rem;
            color: #64748b;
            text-align: right;
        }

        .hiring-logo-bars {
            display: inline-flex;
            align-items: flex-end;
            gap: 3px;
            height: 38px;
        }

            .hiring-logo-bars .b1 {
                width: 5px;
                height: 22px;
                background: #38bdf8;
                border-radius: 2px;
            }

            .hiring-logo-bars .b2 {
                width: 6px;
                height: 32px;
                background: #0284c7;
                border-radius: 2px;
            }

            .hiring-logo-bars .b3 {
                width: 7px;
                height: 38px;
                background: #1e40af;
                border-radius: 2px;
            }

        .hiring-main-title {
            font-family: 'Playfair Display', Georgia, 'Times New Roman', serif;
            font-weight: 700;
            font-size: 2.35rem;
            color: #1e3a8a !important;
            letter-spacing: 1.5px;
            text-transform: uppercase;
        }

        .hiring-date-text {
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            color: #334155;
            font-weight: 500;
        }

        .hiring-section-heading {
            font-family: 'Playfair Display', Georgia, 'Times New Roman', serif;
            font-style: italic;
            font-weight: 700;
            font-size: 1.05rem;
            color: #1e3a8a;
            margin-bottom: 0.45rem;
        }

        .hiring-detail-item {
            font-size: 0.9rem;
            color: #334155;
            margin-bottom: 0.35rem;
            line-height: 1.5;
        }

            .hiring-detail-item strong {
                color: #0f172a;
                font-weight: 600;
            }

        .hiring-responsibilities-list {
            padding-left: 1.25rem;
            margin-bottom: 0;
            font-size: 0.9rem;
            color: #334155;
        }

            .hiring-responsibilities-list li {
                margin-bottom: 0.35rem;
                line-height: 1.55;
            }

        .hiring-body-p {
            font-size: 0.92rem;
            color: #334155;
            line-height: 1.7;
            text-align: justify;
        }

        .hiring-signature-cursive {
            font-family: 'Caveat', cursive;
            font-size: 2.5rem;
            color: #1e3a8a;
            line-height: 1;
            margin: 0.15rem 0;
            font-weight: 700;
        }

        .offer-gridview, .offer-gridview tbody, .offer-gridview tr, .offer-gridview td {
            background: transparent !important;
            border: none !important;
            padding: 0 !important;
        }

            .offer-gridview td {
                padding-bottom: 0.5rem !important;
            }

        @media print {
            body * {
                visibility: hidden;
            }

            #printSection, #printSection * {
                visibility: visible;
            }

            #printSection {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                max-width: 100%;
                margin: 0;
                padding: 2rem 2.5rem;
                box-shadow: none !important;
                border: none !important;
            }

            .modal-header, .modal-footer {
                display: none !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header (White & Dark with Red/Orange Accent matching AdminDashboard) -->
    <div class="offer-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-file-contract me-1"></i>CAREER MILESTONES
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold font-monospace" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Confirmed Placement
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">Job Offer Letters &amp; Acceptance</h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Review your official corporate selection offers, confirm your employment acceptance, and download your verified Letter of Intent.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:Label ID="lblOfferPortalBadge" runat="server" CssClass="btn-rku-orange shadow-sm">
                    <i class="fa-solid fa-file-signature me-1"></i>Official Offer Portal
                </asp:Label>
            </div>
        </div>
    </div>

    <!-- Offers GridView (Using ASP.NET GridView & Controls, No Repeater & No Panel) -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
        GridLines="None" ShowHeader="False" CssClass="offer-gridview" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class='<%# "offer-item-card " + (Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "accepted-card" : (Eval("ApplicationStatus").ToString() == "Offer Declined" ? "declined-card" : "pending-card")) %>'>
                        <div class="row align-items-center g-3">
                            <div class="col-md-7">
                                <div class="d-flex align-items-start gap-3">
                                    <asp:Image ID="imgCompanyLogo" runat="server" ImageUrl='<%# "~/Comp_Images/" + Eval("compLogo") %>' Width="56px" Height="56px" CssClass="company-logo-box" onerror="this.style.display='none';" AlternateText="Company Logo" />
                                    <div>
                                        <div class="d-flex align-items-center gap-2 flex-wrap mb-1">
                                            <h5 class="fw-bold text-dark mb-0 font-heading">
                                                <asp:Label ID="lblJobRole" runat="server" Text='<%# Eval("JobRole") %>'></asp:Label>
                                            </h5>
                                            <span class='<%# Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "badge bg-success-subtle text-success border border-success-subtle px-3 py-1.5 rounded-pill fw-bold small" : (Eval("ApplicationStatus").ToString() == "Offer Declined" ? "badge bg-secondary-subtle text-secondary border px-3 py-1.5 rounded-pill fw-bold small" : "badge bg-warning-subtle text-warning-emphasis border border-warning-subtle px-3 py-1.5 rounded-pill fw-bold small") %>'>
                                                <i class='<%# Eval("ApplicationStatus").ToString() == "Offer Accepted" ? "fa-solid fa-check-circle me-1" : (Eval("ApplicationStatus").ToString() == "Offer Declined" ? "fa-solid fa-xmark-circle me-1" : "fa-regular fa-clock me-1") %>'></i>
                                                <asp:Label ID="lblStatusText" runat="server" Text='<%# Eval("ApplicationStatus").ToString() == "Selected" ? "Decision Pending" : Eval("ApplicationStatus") %>'></asp:Label>
                                            </span>
                                        </div>
                                        <div class="fw-semibold text-danger small mb-1">
                                            <i class="fa-regular fa-building me-1"></i>
                                            <asp:Label ID="lblCompany" runat="server" Text='<%# !string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName") : Eval("CompanyUsername") %>'></asp:Label>
                                        </div>
                                        <div class="text-muted small">
                                            <i class="fa-regular fa-calendar-check me-1"></i>Drive / Selection Date: 
                                           
                                            <strong>
                                                <asp:Label ID="lblAppliedDate" runat="server" Text='<%# Eval("AppliedDate", "{0:dd MMM yyyy}") %>'></asp:Label>
                                            </strong>
                                        </div>
                                        <asp:Label ID="lblRemarks" runat="server" Visible='<%# Eval("Remarks") != DBNull.Value && !string.IsNullOrEmpty(Eval("Remarks").ToString()) %>' CssClass="mt-2 p-2 bg-light rounded-3 text-secondary small fst-italic d-block" Text='<%# "<i class=\"fa-solid fa-quote-left text-muted me-1\"></i>" + HttpUtility.HtmlEncode(Eval("Remarks")) %>'></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5 text-md-end">
                                <div class="mb-3">
                                    <div class="small text-muted fw-bold text-uppercase" style="font-size: 0.72rem;">Compensation Package</div>
                                    <div class="package-badge-lg mt-1">
                                        <i class="fa-solid fa-indian-rupee-sign me-1"></i>
                                        <asp:Label ID="lblPackage" runat="server" Text='<%# Eval("PackageOffered") != null ? (Eval("PackageOffered").ToString().ToUpper().Contains("LPA") ? Eval("PackageOffered").ToString() : Eval("PackageOffered").ToString() + " LPA") : "N/A" %>'></asp:Label>
                                    </div>
                                </div>

                                <!-- Dynamic Action Buttons -->
                                <div class="d-flex justify-content-md-end gap-2 flex-wrap align-items-center">
                                    <asp:LinkButton ID="btnAcceptOffer" runat="server" CommandName="cmd_accept" CommandArgument='<%# Eval("Id") %>' Visible='<%# Eval("ApplicationStatus").ToString() == "Selected" %>' CssClass="btn btn-success btn-sm px-3 rounded-pill fw-semibold shadow-sm"><i class="fa-solid fa-check me-1"></i>Accept Offer</asp:LinkButton>

                                    <asp:LinkButton ID="btnDeclineOffer" runat="server" CommandName="cmd_decline" CommandArgument='<%# Eval("Id") %>' Visible='<%# Eval("ApplicationStatus").ToString() == "Selected" %>' CssClass="btn btn-outline-secondary btn-sm px-3 rounded-pill" OnClientClick="return confirm('Are you sure you want to decline this job offer?');"><i class="fa-solid fa-xmark me-1"></i>Decline</asp:LinkButton>

                                    <button type="button" class="btn-rku-orange btn-sm px-3.5 py-1.5 rounded-pill fw-semibold shadow-sm" onclick='<%# "openOfferLetterModal(\"" + Eval("Id") + "\", \"" + (Eval("StudentName") != DBNull.Value ? Eval("StudentName").ToString().Replace("'", "\\'") : "") + "\", \"" + (Eval("StudentRollNo") != DBNull.Value ? Eval("StudentRollNo").ToString().Replace("'", "\\'") : "") + "\", \"" + (Eval("StudentBranch") != DBNull.Value ? Eval("StudentBranch").ToString().Replace("'", "\\'") : "") + "\", \"" + (Eval("JobRole") != DBNull.Value ? Eval("JobRole").ToString().Replace("'", "\\'") : "") + "\", \"" + (!string.IsNullOrEmpty(Convert.ToString(Eval("compName"))) ? Eval("compName").ToString().Replace("'", "\\'") : (Eval("CompanyUsername") != DBNull.Value ? Eval("CompanyUsername").ToString().Replace("'", "\\'") : "Corporate Partner")) + "\", \"" + (Eval("PackageOffered") != null ? (Eval("PackageOffered").ToString().ToUpper().Contains("LPA") ? Eval("PackageOffered").ToString() : Eval("PackageOffered").ToString() + " LPA") : "N/A") + "\", \"" + Eval("AppliedDate", "{0:dd MMMM yyyy}") + "\");" %>'><i class="fa-regular fa-file-lines me-1"></i>View Letter</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div class="card border-0 shadow-sm rounded-4 p-5 text-center bg-white">
                <div class="mb-3 text-muted">
                    <i class="fa-solid fa-file-circle-question" style="font-size: 3.5rem; color: #cbd5e1;"></i>
                </div>
                <h5 class="fw-bold text-dark font-heading">No Job Offers Yet</h5>
                <p class="text-muted small mx-auto" style="max-width: 480px;">
                    You currently do not have any confirmed selection offers. Complete upcoming campus drive interviews to receive your official offer letter!
               
                </p>
                <div>
                    <asp:HyperLink ID="lnkBrowseDrives" runat="server" NavigateUrl="StudentDrives.aspx" CssClass="btn-rku-orange px-4 py-2 shadow-sm"><i class="fa-regular fa-building me-1"></i>Browse Active Campus Drives</asp:HyperLink>
                </div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>

    <!-- Professional Job Offer Letter Modal (Matching User Screenshot Design) -->
    <div class="modal fade" id="offerLetterModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                <!-- Modal Top Header in Deep Royal Blue -->
                <div class="modal-header border-0 py-3 px-4 d-flex align-items-center justify-content-between" style="background: #1e3a8a; border-bottom: 3px solid #3b82f6 !important;">
                    <h5 class="modal-title font-heading fw-bold text-white mb-0" style="color: #ffffff !important; font-size: 1.15rem; letter-spacing: 0.5px;">
                        <i class="fa-solid fa-file-contract me-2" style="color: #60a5fa;"></i>Official Job Offer Letter
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="filter: invert(1) grayscale(100%) brightness(200%); opacity: 0.85;"></button>
                </div>

                <div class="modal-body p-3 p-md-4" style="background-color: #f1f5f9;">
                    <!-- The Printable Document Sheet (Matching Screenshot Design) -->
                    <div id="printSection" class="hiring-letter-sheet">

                        <!-- Top Geometric Blue Accent (Matching Screenshot) -->
                        <svg class="hiring-decor-top" viewBox="0 0 800 50" preserveAspectRatio="none">
                            <rect x="0" y="0" width="800" height="15" fill="#1e40af" />
                            <polygon points="0,0 130,0 60,50 0,50" fill="#1d4ed8" />
                            <polygon points="135,0 155,0 85,50 65,50" fill="#3b82f6" />
                        </svg>

                        <!-- Bottom Geometric Blue Accent (Matching Screenshot) -->
                        <svg class="hiring-decor-bottom" viewBox="0 0 800 110" preserveAspectRatio="none">
                            <rect x="0" y="94" width="800" height="16" fill="#1e40af" />
                            <polygon points="0,110 0,45 65,110" fill="#1e3a8a" />
                            <polygon points="0,35 110,110 85,110 0,45" fill="#1d4ed8" />
                            <polygon points="0,15 155,110 130,110 0,30" fill="#2563eb" />
                            <polygon points="0,0 195,110 175,110 0,10" fill="#38bdf8" />
                            <polygon points="120,94 800,94 800,110 140,110" fill="#1e40af" />
                        </svg>

                        <!-- Header Row (Address on Left, Company Logo/Name on Right) -->
                        <div class="d-flex justify-content-between align-items-start mb-4 pt-2">
                            <div class="hiring-header-contact">
                                <div id="lblModalCompanyAddress">123 Anywhere St, Any City</div>
                                <div id="lblModalCompanyEmail">hello@reallygreatsite.com</div>
                                <div id="lblModalCompanyPhone">+123-456-7890</div>
                            </div>
                            <div class="hiring-brand-container">
                                <div>
                                    <div class="hiring-brand-name" id="lblModalCompany">Savvy Financial Services</div>
                                    <div class="hiring-brand-sub">Corporate Recruitment Partner</div>
                                </div>
                                <div class="hiring-logo-bars">
                                    <span class="b1"></span>
                                    <span class="b2"></span>
                                    <span class="b3"></span>
                                </div>
                            </div>
                        </div>

                        <!-- Title and Date Row -->
                        <div class="d-flex justify-content-between align-items-baseline mb-4 mt-3">
                            <h1 class="hiring-main-title mb-0">HIRING LETTER</h1>
                            <div class="hiring-date-text" id="lblModalDate">June 23, 2026</div>
                        </div>

                        <!-- Salutation & Introduction -->
                        <div class="mb-3">
                            <div class="fw-semibold text-dark mb-2" style="font-size: 0.95rem;">
                                Dear <span id="lblModalStudentName">Rachel Collins</span>,
                           
                            </div>
                            <p class="hiring-body-p mb-0">
                                We are pleased to extend to you an offer for the position of <strong id="lblModalJobRole">Marketing Specialist</strong> at <strong id="lblModalCompanyBody">Savvy Financial Services</strong>. After careful evaluation of your qualifications and experience, we are confident that your skills and professional background will make a valuable contribution to our team.
                           
                            </p>
                        </div>

                        <!-- Two-Column Grid: Position Details vs Compensation & Benefits -->
                        <div class="row g-4 my-2">
                            <div class="col-6">
                                <h5 class="hiring-section-heading">Position Details</h5>
                                <div class="hiring-detail-item"><strong>Job Title:</strong> <span id="lblModalJobRole2">Marketing Specialist</span></div>
                                <div class="hiring-detail-item"><strong>Department:</strong> <span id="lblModalBranch">Marketing</span></div>
                                <div class="hiring-detail-item"><strong>Start Date:</strong> <span id="lblModalStartDate">July 15, 2026</span></div>
                                <div class="hiring-detail-item"><strong>Employment Type:</strong> <span>Full-time</span></div>
                            </div>
                            <div class="col-6">
                                <h5 class="hiring-section-heading">Compensation &amp; Benefits</h5>
                                <div class="hiring-detail-item"><strong>Salary:</strong> <span id="lblModalPackage">$4,200 per month</span></div>
                                <div class="hiring-detail-item"><strong>Bonus / Incentives:</strong> <span>Performance-based incentives</span></div>
                                <div class="hiring-detail-item"><strong>Benefits:</strong> <span>Health insurance, paid leave, and professional development opportunities</span></div>
                            </div>
                        </div>

                        <!-- Key Responsibilities Section -->
                        <div class="my-3">
                            <h5 class="hiring-section-heading">Key Responsibilities</h5>
                            <p class="mb-2 hiring-detail-item">In this role, you will be responsible for:</p>
                            <ul class="hiring-responsibilities-list">
                                <li>Developing and executing high-impact project solutions and key deliverables</li>
                                <li>Managing operational platforms, technical workflows, and content strategy</li>
                                <li>Analyzing project performance metrics and reporting actionable insights</li>
                                <li>Collaborating with cross-functional teams to support overall business growth</li>
                            </ul>
                        </div>

                        <!-- Terms of Employment Section -->
                        <div class="my-3">
                            <h5 class="hiring-section-heading">Terms of Employment</h5>
                            <p class="hiring-body-p mb-2">
                                This offer is contingent upon the successful completion of standard employment requirements, including verification of your background and qualifications. Your employment will be governed by the policies and regulations of <span id="lblModalCompanyTerms">Savvy Financial Services</span>.
                           
                            </p>
                            <p class="hiring-body-p mb-0">
                                Please confirm your acceptance of this offer by signing below and returning this letter no later than <strong id="lblModalDeadlineDate">June 30, 2026</strong>.
                           
                            </p>
                        </div>

                        <!-- Signature Section (Bottom-Right Aligned) -->
                        <div class="row justify-content-end mt-4 pt-1 mb-2">
                            <div class="col-auto text-end" style="min-width: 220px;">
                                <div class="text-secondary small mb-1">Sincerely,</div>
                                <div class="fw-bold text-dark" style="font-size: 0.95rem;" id="lblModalHRName">Matthew Collins</div>
                                <div class="hiring-signature-cursive">Matthew</div>
                                <div class="text-secondary small" id="lblModalHRDesignation">Marketing Manager</div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer border-0 py-3 px-4 d-flex justify-content-between align-items-center" style="background: #ffffff; border-top: 1px solid #e2e8f0 !important;">
                    <div class="text-muted small">
                        <i class="fa-solid fa-shield-halved me-1" style="color: #2563eb;"></i>Digitally Verified Placement Document
                   
                    </div>
                    <div class="d-flex gap-2">
                        <button type="button" class="btn btn-secondary btn-sm px-4 rounded-pill fw-semibold" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-sm px-4 rounded-pill fw-bold text-white shadow-sm" style="background: #1e40af; border: none;" onclick="window.print();">
                            <i class="fa-solid fa-print me-1"></i>Print / Save PDF
                       
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openOfferLetterModal(appId, studentName, rollNo, branch, role, comp, pkg, date) {
            // Candidate Name
            document.getElementById('lblModalStudentName').textContent = studentName || 'Candidate';

            // Role
            var displayRole = role || 'Software Trainee';
            document.getElementById('lblModalJobRole').textContent = displayRole;
            document.getElementById('lblModalJobRole2').textContent = displayRole;

            // Department / Branch
            document.getElementById('lblModalBranch').textContent = branch || 'Information Technology';

            // Company Name
            var displayComp = comp;
            if (comp && comp.indexOf('@') !== -1) {
                displayComp = comp.split('@')[0].toUpperCase();
            }
            if (!displayComp) displayComp = 'Savvy Financial Services';

            document.getElementById('lblModalCompany').textContent = displayComp;
            document.getElementById('lblModalCompanyBody').textContent = displayComp;
            document.getElementById('lblModalCompanyTerms').textContent = displayComp;

            // Contact Info
            if (comp && comp.indexOf('@') !== -1) {
                document.getElementById('lblModalCompanyEmail').textContent = comp.toLowerCase();
            } else {
                document.getElementById('lblModalCompanyEmail').textContent = 'contact@' + displayComp.toLowerCase().replace(/\s+/g, '') + '.com';
            }

            // Package
            document.getElementById('lblModalPackage').textContent = pkg || 'Competitive Package';

            // Offer Date
            var offerDateStr = date || 'June 23, 2026';
            document.getElementById('lblModalDate').textContent = offerDateStr;

            // Compute Start Date and Acceptance Deadline
            try {
                var d = new Date(date);
                if (!isNaN(d.getTime())) {
                    var startD = new Date(d);
                    startD.setDate(startD.getDate() + 20);
                    var deadlineD = new Date(d);
                    deadlineD.setDate(deadlineD.getDate() + 7);

                    var options = { day: 'numeric', month: 'long', year: 'numeric' };
                    document.getElementById('lblModalStartDate').textContent = startD.toLocaleDateString('en-US', options);
                    document.getElementById('lblModalDeadlineDate').textContent = deadlineD.toLocaleDateString('en-US', options);
                } else {
                    document.getElementById('lblModalStartDate').textContent = 'July 15, 2026';
                    document.getElementById('lblModalDeadlineDate').textContent = 'June 30, 2026';
                }
            } catch (e) {
                document.getElementById('lblModalStartDate').textContent = 'July 15, 2026';
                document.getElementById('lblModalDeadlineDate').textContent = 'June 30, 2026';
            }

            // Manager Designation
            document.getElementById('lblModalHRName').textContent = 'Matthew Collins';
            document.getElementById('lblModalHRDesignation').textContent = displayRole ? displayRole + ' Lead / HR Manager' : 'Marketing Manager';

            var modal = new bootstrap.Modal(document.getElementById('offerLetterModal'));
            modal.show();
        }
    </script>

</asp:Content>
