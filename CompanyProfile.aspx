<%@ Page Title="My Company Profile | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyProfile" %>

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

        /* ─── CONTAINER CARDS ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .form-section-title {
            font-size: 0.74rem;
            font-weight: 800;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--rku-orange-red);
            margin-bottom: 1rem;
            font-family: var(--font-heading);
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .company-logo-placeholder {
            width: 84px;
            height: 84px;
            border-radius: 18px;
            background: linear-gradient(135deg, var(--rku-orange-red), var(--rku-orange-red-dark));
            color: #ffffff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.85rem;
            font-weight: 900;
            margin: 0 auto;
            font-family: var(--font-heading);
            box-shadow: 0 6px 18px rgba(239, 55, 36, 0.25);
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

    <!-- Hero Section (Matching AdminDashboard) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-building me-1"></i>ORGANIZATION PROFILE
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Profile Active
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">
                    My Company Profile
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Manage your organization profile, company logo, industry details, package ranges, and hiring tags.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap align-items-center">
                <a href="CompanyManageDrives.aspx" class="btn-rku-orange shadow-sm">
                    <i class="fa-solid fa-bullhorn me-1"></i>Manage Drives
                </a>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Left: Logo & Quick Info Preview -->
        <div class="col-lg-4">
            <div class="dash-card-white text-center">
                <div class="form-section-title text-start mb-3">
                    <i class="fa-solid fa-eye me-1"></i>LIVE PREVIEW
                </div>
                <div class="mb-3">
                    <asp:Image ID="imgCompanyLogo" runat="server" Visible="false" Style="width: 84px; height: 84px; border-radius: 18px; object-fit: cover; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); border: 1px solid #e2e8f0;" />
                    <asp:Label ID="pnlLogoPlaceholder" runat="server" CssClass="company-logo-placeholder" Text="CO"></asp:Label>
                </div>
                <asp:Label ID="profileDisplayName" runat="server" Text="Company HR" CssClass="fw-bold font-heading mb-1 text-dark d-block fs-5"></asp:Label>
                <asp:Label ID="profileDisplayIndustry" runat="server" Text="IT / Software" CssClass="text-muted small mb-3 d-block"></asp:Label>
                <div class="text-muted small mb-3">
                    <i class="fa-solid fa-location-dot me-1" style="color: var(--rku-orange-red);"></i>
                    <asp:Label ID="profileDisplayLocation" runat="server" Text="Location Not Set"></asp:Label>
                </div>
                <hr class="my-3 opacity-25">
                <div class="text-center small p-2 bg-light rounded-3 border">
                    <asp:Label ID="profileDisplayPackage" runat="server" Text="-" CssClass="fw-bold text-dark fs-5 font-heading d-block"></asp:Label>
                    <div class="text-muted small">Package Range</div>
                </div>
            </div>
        </div>

        <!-- Right: Edit Form with ASP Server Controls -->
        <div class="col-lg-8">
            <div class="dash-card-white">
                <h5 class="fw-bold font-heading text-dark mb-1" style="font-size: 1.15rem;">
                    <i class="fa-solid fa-pen-to-square me-2" style="color: var(--rku-orange-red);"></i>Edit Company Profile
                </h5>
                <p class="text-muted small mb-4">Update your official company details below to present a complete profile to recruiting students.</p>

                <div class="form-section-title">
                    <i class="fa-solid fa-circle-info me-1"></i>BASIC INFORMATION
                </div>

                <!-- Company Name -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Company Name <span class="text-danger">*</span></label>
                    <asp:TextBox ID="cpName" runat="server" CssClass="form-control" placeholder="e.g. Tata Consultancy Services"></asp:TextBox>
                </div>

                <!-- Company Logo FileUpload -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Company Logo Image</label>
                    <asp:FileUpload ID="fuCompanyLogo" runat="server" CssClass="form-control" />
                    <div class="form-text text-muted small">Upload PNG, JPG or JPEG image format.</div>
                </div>

                <!-- Tagline -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Tagline / Motto</label>
                    <asp:TextBox ID="cpTagline" runat="server" CssClass="form-control" placeholder="e.g. Building on belief"></asp:TextBox>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Company Description</label>
                    <asp:TextBox ID="cpDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Briefly describe what your company does..."></asp:TextBox>
                </div>

                <div class="form-section-title mt-4">
                    <i class="fa-solid fa-city me-1"></i>INDUSTRY &amp; LOCATION
                </div>

                <div class="row g-3 mb-3">
                    <!-- Industry -->
                    <div class="col-md-6">
                        <label class="form-label text-muted small fw-bold">Industry</label>
                        <asp:DropDownList ID="cpIndustry" runat="server" CssClass="form-select">
                            <asp:ListItem Value="IT / Software">IT / Software</asp:ListItem>
                            <asp:ListItem Value="MNC">MNC</asp:ListItem>
                            <asp:ListItem Value="Consulting">Consulting</asp:ListItem>
                            <asp:ListItem Value="Finance / Banking">Finance / Banking</asp:ListItem>
                            <asp:ListItem Value="FMCG">FMCG</asp:ListItem>
                            <asp:ListItem Value="Manufacturing">Manufacturing</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <!-- Location -->
                    <div class="col-md-6">
                        <label class="form-label text-muted small fw-bold">Location (HQ)</label>
                        <asp:TextBox ID="cpLocation" runat="server" CssClass="form-control" placeholder="e.g. Mumbai, India"></asp:TextBox>
                    </div>
                </div>

                <div class="form-section-title mt-4">
                    <i class="fa-solid fa-money-bill-wave me-1"></i>HIRING &amp; PACKAGE DETAILS
                </div>

                <div class="mb-3">
                    <!-- Package Range -->
                    <label class="form-label text-muted small fw-bold">Package Range</label>
                    <asp:TextBox ID="cpPackageRange" runat="server" CssClass="form-control" placeholder="e.g. 3.5 LPA - 12 LPA"></asp:TextBox>
                </div>

                <div class="form-section-title mt-4">
                    <i class="fa-solid fa-globe me-1"></i>ONLINE PRESENCE &amp; TAGS
                </div>

                <!-- Website -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Website URL</label>
                    <asp:TextBox ID="cpWebsite" runat="server" CssClass="form-control" placeholder="https://www.yourcompany.com"></asp:TextBox>
                </div>

                <!-- Tags / Skills -->
                <div class="mb-4">
                    <label class="form-label text-muted small fw-bold">Hiring Skills / Tags (comma-separated)</label>
                    <asp:TextBox ID="cpTags" runat="server" CssClass="form-control" placeholder="e.g. Java, Python, SQL, DevOps"></asp:TextBox>
                    <div class="form-text text-muted small">These tags appear on your company profile card in the placement portal.</div>
                </div>

                <div class="d-flex gap-2 justify-content-end mt-4">
                    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-light border px-4 rounded-pill text-secondary fw-semibold" Text="Reset" OnClick="btnReset_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="btnSaveCompanyProfile" runat="server" CssClass="btn-rku-orange px-4 shadow-sm" Style="background: linear-gradient(135deg, #ef3724, #d82b19) !important; color: #ffffff !important; border: 1px solid #d82b19 !important; font-weight: 700 !important; border-radius: 50px !important; padding: 0.55rem 1.4rem !important; display: inline-block !important;" Text="Save Profile" OnClick="btnSaveCompanyProfile_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
