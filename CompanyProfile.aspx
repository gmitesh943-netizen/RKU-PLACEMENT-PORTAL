<%@ Page Title="My Company Profile | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .company-hero-card {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 18px;
            padding: 1.5rem 1.75rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.02);
        }

        .company-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .company-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #111;
        }

        .form-section-title {
            font-size: 0.75rem;
            font-weight: 800;
            letter-spacing: 0.12em;
            color: var(--rku-maroon);
            margin-bottom: 1rem;
            font-family: 'Outfit', sans-serif;
        }

        .company-logo-placeholder {
            width: 80px;
            height: 80px;
            border-radius: 16px;
            background: linear-gradient(135deg, var(--rku-red), var(--rku-maroon));
            color: #fff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            font-weight: 900;
            margin: 0 auto;
            font-family: 'Outfit', sans-serif;
            box-shadow: 0 4px 15px rgba(163, 15, 20, 0.2);
        }

        .btn-rku {
            background: linear-gradient(135deg, var(--rku-red), var(--rku-maroon));
            color: #fff !important;
            border: none;
            font-weight: 600;
            font-family: 'Outfit', sans-serif;
            transition: all 0.3s ease;
        }

        .btn-rku:hover {
            background: linear-gradient(135deg, var(--rku-maroon), #8b0b0f);
            color: #fff !important;
            box-shadow: 0 4px 12px rgba(163, 15, 20, 0.25);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Section -->
    <div class="company-hero-card mb-4">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="company-hero-kicker">PROFILE MANAGEMENT</div>
                <h2 class="mb-1">My Company Profile</h2>
                <p class="text-muted mb-0">Manage your organization profile, company logo, industry details, package ranges, and hiring tags.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a href="CompanyManageDrives.aspx" class="btn btn-rku px-4 py-2">
                    <i class="fa-solid fa-bullhorn me-2"></i>Manage Drives
                </a>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Left: Logo & Quick Info Preview -->
        <div class="col-lg-4">
            <div class="dashboard-card text-center" style="background: #fff; border-radius: 16px; border: 1px solid #eef0f3; padding: 1.5rem;">
                <div class="form-section-title text-start mb-3">LIVE PREVIEW</div>
                <div class="mb-3">
                    <asp:Image ID="imgCompanyLogo" runat="server" Visible="false" Style="width: 80px; height: 80px; border-radius: 16px; object-fit: cover; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);" />
                    <asp:Panel ID="pnlLogoPlaceholder" runat="server" CssClass="company-logo-placeholder">CO</asp:Panel>
                </div>
                <asp:Label ID="profileDisplayName" runat="server" Text="Company HR" CssClass="fw-bold font-heading mb-1 text-dark d-block fs-5"></asp:Label>
                <asp:Label ID="profileDisplayIndustry" runat="server" Text="IT / Software" CssClass="text-muted small mb-3 d-block"></asp:Label>
                <div class="text-muted small mb-3">
                    <i class="fa-solid fa-location-dot me-1 text-danger"></i>
                    <asp:Label ID="profileDisplayLocation" runat="server" Text="Location Not Set"></asp:Label>
                </div>
                <hr class="my-3 opacity-25">
                <div class="text-center small">
                    <asp:Label ID="profileDisplayPackage" runat="server" Text="-" CssClass="fw-bold text-dark fs-5 font-heading d-block"></asp:Label>
                    <div class="text-muted small">Package Range</div>
                </div>
            </div>
        </div>

        <!-- Right: Edit Form with ASP Server Controls -->
        <div class="col-lg-8">
            <div class="dashboard-card" style="background: #fff; border-radius: 16px; border: 1px solid #eef0f3; padding: 1.5rem;">
                <h5 class="fw-bold font-heading text-dark mb-1">
                    <i class="fa-solid fa-pen-to-square text-danger me-2"></i>Edit Company Profile
                </h5>
                <p class="text-muted small mb-4">Update your official company details below to present a complete profile to recruiting students.</p>

                <div class="form-section-title">BASIC INFORMATION</div>

                <!-- Company Name -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Company Name *</label>
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

                <div class="form-section-title mt-4">INDUSTRY &amp; LOCATION</div>

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

                <div class="form-section-title mt-4">HIRING &amp; PACKAGE DETAILS</div>

                <div class="mb-3">
                    <!-- Package Range -->
                    <label class="form-label text-muted small fw-bold">Package Range</label>
                    <asp:TextBox ID="cpPackageRange" runat="server" CssClass="form-control" placeholder="e.g. 3.5 LPA - 12 LPA"></asp:TextBox>
                </div>

                <div class="form-section-title mt-4">ONLINE PRESENCE &amp; TAGS</div>

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
                    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-light btn-sm px-3" Text="Reset" OnClick="btnReset_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="btnSaveCompanyProfile" runat="server" CssClass="btn btn-rku btn-sm px-4" Text="Save Profile" OnClick="btnSaveCompanyProfile_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
