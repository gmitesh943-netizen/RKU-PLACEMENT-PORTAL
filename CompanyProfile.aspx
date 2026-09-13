<%@ Page Title="My Company Profile | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <!-- Left: Logo & Quick Info Preview -->
        <div class="col-lg-4">
            <div class="dashboard-card text-center">
                <div class="mb-3" id="profileLogoDisplay">
                </div>
                <h5 class="fw-bold font-heading mb-1" id="profileDisplayName">Company Name</h5>
                <div class="text-muted small mb-3" id="profileDisplayIndustry">Industry</div>
                <div class="text-muted small">
                    <i class="fa-solid fa-location-dot me-1 text-rku-red"></i><span id="profileDisplayLocation">Location</span>
                </div>
                <hr>
                <div class="d-flex justify-content-center gap-3 text-center small">
                    <div>
                        <div class="fw-bold text-dark fs-5" id="profileDisplayPackage">-</div>
                        <div class="text-muted">Package Range</div>
                    </div>
                    <div>
                        <div class="fw-bold text-dark fs-5" id="profileDisplayRoles">-</div>
                        <div class="text-muted">Open Roles</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right: Edit Form -->
        <div class="col-lg-8">
            <div class="dashboard-card">
                <h5 class="fw-bold font-heading text-dark mb-4"><i class="fa-solid fa-pen-to-square me-2 text-rku-red"></i>Edit Company Profile</h5>
                <form id="companyProfileForm" onsubmit="saveCompanyProfile(event)">

                    <!-- Logo Upload Zone -->
                    <div class="mb-4">
                        <label class="form-label text-muted small fw-bold">Company Logo</label>
                        <div class="company-logo-upload-zone" id="logoUploadZone" onclick="document.getElementById('companyLogoInput').click()">
                            <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2"></i>
                            <p class="text-muted small mb-0">Click to upload company logo<br>
                                <span style="font-size: 0.75rem;">PNG, JPG, SVG (max 1MB)</span></p>
                        </div>
                        <input type="file" id="companyLogoInput" accept="image/*" class="d-none" onchange="handleLogoUpload(event)">
                        <input type="hidden" id="companyLogoBase64">
                    </div>

                    <!-- Company Name -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Company Name *</label>
                        <input type="text" class="form-control" id="cpName" placeholder="e.g. Tata Consultancy Services" required oninput="updatePreview()">
                    </div>

                    <!-- Tagline -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Tagline / Motto</label>
                        <input type="text" class="form-control" id="cpTagline" placeholder="e.g. Building on belief">
                    </div>

                    <!-- Description -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Company Description</label>
                        <textarea class="form-control" id="cpDescription" rows="3" placeholder="Briefly describe what your company does..."></textarea>
                    </div>

                    <div class="row g-3 mb-3">
                        <!-- Industry -->
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Industry</label>
                            <select class="form-select" id="cpIndustry" onchange="updatePreview()">
                                <option value="it">IT / Software</option>
                                <option value="mnc">MNC</option>
                                <option value="consulting">Consulting</option>
                                <option value="finance">Finance / Banking</option>
                                <option value="fmcg">FMCG</option>
                                <option value="manufacturing">Manufacturing</option>
                            </select>
                        </div>
                        <!-- Location -->
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Location (HQ)</label>
                            <input type="text" class="form-control" id="cpLocation" placeholder="e.g. Mumbai, India" oninput="updatePreview()">
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <!-- Package Range -->
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Package Range</label>
                            <input type="text" class="form-control" id="cpPackageRange" placeholder="e.g. 3.5 LPA - 12 LPA" oninput="updatePreview()">
                        </div>
                        <!-- Open Roles -->
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">No. of Open Roles</label>
                            <input type="text" class="form-control" id="cpOpenRoles" placeholder="e.g. 25 Open Roles" oninput="updatePreview()">
                        </div>
                    </div>

                    <!-- Website -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Website URL</label>
                        <input type="url" class="form-control" id="cpWebsite" placeholder="https://www.yourcompany.com">
                    </div>

                    <!-- Tags / Skills -->
                    <div class="mb-4">
                        <label class="form-label text-muted small fw-bold">Hiring Skills / Tags (comma-separated)</label>
                        <input type="text" class="form-control" id="cpTags" placeholder="e.g. Java, Python, SQL, DevOps">
                        <div class="form-text text-muted">These tags appear on your company card in the placement portal.</div>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-rku" id="btnSaveCompanyProfile">
                            <i class="fa-solid fa-floppy-disk me-1"></i>Save Profile
                        </button>
                        <button type="button" class="btn btn-outline-secondary" onclick="loadProfileData()">
                            <i class="fa-solid fa-rotate-left me-1"></i>Reset
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const CP_KEY = 'rku_company_profiles';

        document.addEventListener('DOMContentLoaded', () => {
            // Highlight active sidebar item
            const navItem = document.getElementById('nav-profile');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'My Company Profile';

            loadProfileData();
        });

        function getCompanyFromDb(user) {
            if (!user) return null;
            const companies = PortalDB.getCompanies();
            return companies.find(c => c.username === user.username) || null;
        }

        function loadProfileData() {
            const user = PortalDB.getCurrentUser();
            if (!user) return;
            const compEntry = getCompanyFromDb(user);
            const profiles = JSON.parse(localStorage.getItem(CP_KEY) || '{}');
            const cp = profiles[user.username] || {};

            const name = (compEntry && compEntry.name) || cp.name || user.name || '';
            const tagline = (compEntry && compEntry.tagline) || cp.tagline || '';
            const description = (compEntry && compEntry.description) || cp.description || '';
            const industry = (compEntry && compEntry.industry) || cp.industry || 'IT / Software';
            const location = (compEntry && compEntry.location) || cp.location || '';
            const pkg = (compEntry && compEntry.packageRange) || cp.packageRange || '';
            const roles = (compEntry && compEntry.openRoles) || cp.openRoles || '';
            const website = (compEntry && compEntry.website) || cp.website || '';
            const tags = (compEntry && compEntry.tags) ? (Array.isArray(compEntry.tags) ? compEntry.tags.join(', ') : compEntry.tags) : (cp.tags || '');
            const logo = (compEntry && compEntry.logoBase64) || cp.logo || user.logoBase64 || '';

            document.getElementById('cpName').value = name;
            document.getElementById('cpTagline').value = tagline;
            document.getElementById('cpDescription').value = description;
            document.getElementById('cpLocation').value = location;
            document.getElementById('cpPackageRange').value = pkg;
            document.getElementById('cpOpenRoles').value = roles;
            document.getElementById('cpWebsite').value = website;
            document.getElementById('cpTags').value = tags;
            document.getElementById('companyLogoBase64').value = logo;

            const indEl = document.getElementById('cpIndustry');
            if (industry) {
                let found = false;
                const indLower = industry.toLowerCase();
                for (let i = 0; i < indEl.options.length; i++) {
                    const valLower = indEl.options[i].value.toLowerCase();
                    if (valLower === indLower || (indLower === 'it' && valLower.includes('it')) || (indLower.includes('consulting') && valLower.includes('consulting')) || (indLower.includes('mnc') && valLower.includes('mnc'))) {
                        indEl.selectedIndex = i;
                        found = true;
                        break;
                    }
                }
                if (!found) indEl.selectedIndex = 0;
            }

            const zone = document.getElementById('logoUploadZone');
            if (logo) {
                zone.innerHTML = `<img src="${logo}" style="max-height:80px;max-width:180px;object-fit:contain;border-radius:8px;" class="mb-1"><br><span class="text-muted small">Click to change logo</span>`;
            } else {
                zone.innerHTML = `<i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2"></i><p class="text-muted small mb-0">Click to upload company logo<br><span style="font-size:0.75rem;">PNG, JPG, SVG (max 1MB)</span></p>`;
            }

            updatePreview();
        }

        function updatePreview() {
            const name = document.getElementById('cpName').value.trim() || 'Company Name';
            const indSelect = document.getElementById('cpIndustry');
            const indText = indSelect.options[indSelect.selectedIndex] ? indSelect.options[indSelect.selectedIndex].text : 'Industry';
            const loc = document.getElementById('cpLocation').value.trim() || 'Location Not Set';
            const pkg = document.getElementById('cpPackageRange').value.trim() || '-';
            const roles = document.getElementById('cpOpenRoles').value.trim() || '-';
            const logo = document.getElementById('companyLogoBase64').value;

            document.getElementById('profileDisplayName').textContent = name;
            document.getElementById('profileDisplayIndustry').textContent = indText;
            document.getElementById('profileDisplayLocation').textContent = loc;
            document.getElementById('profileDisplayPackage').textContent = pkg;
            document.getElementById('profileDisplayRoles').textContent = roles;

            const disp = document.getElementById('profileLogoDisplay');
            if (logo) {
                disp.innerHTML = `<img src="${logo}" class="company-logo-preview" alt="${name}">`;
            } else {
                const ini = name.substring(0, 2).toUpperCase();
                disp.innerHTML = `<div class="company-logo-placeholder">${ini}</div>`;
            }
        }

        function handleLogoUpload(e) {
            const file = e.target.files[0];
            if (!file) return;

            if (file.size > 1024 * 1024) {
                alert('File size exceeds 1MB. Please select a smaller logo image.');
                return;
            }

            const reader = new FileReader();
            reader.onload = function (evt) {
                const base64 = evt.target.result;
                document.getElementById('companyLogoBase64').value = base64;
                const zone = document.getElementById('logoUploadZone');
                zone.innerHTML = `<img src="${base64}" style="max-height:80px;max-width:180px;object-fit:contain;border-radius:8px;" class="mb-1"><br><span class="text-muted small">Click to change logo</span>`;
                updatePreview();
            };
            reader.readAsDataURL(file);
        }

        function saveCompanyProfile(e) {
            e.preventDefault();
            const user = PortalDB.getCurrentUser();
            if (!user) return;

            const name = document.getElementById('cpName').value.trim();
            const tagline = document.getElementById('cpTagline').value.trim();
            const description = document.getElementById('cpDescription').value.trim();
            const indSelect = document.getElementById('cpIndustry');
            const industry = indSelect.options[indSelect.selectedIndex].text;
            const location = document.getElementById('cpLocation').value.trim();
            const packageRange = document.getElementById('cpPackageRange').value.trim();
            const openRoles = document.getElementById('cpOpenRoles').value.trim();
            const website = document.getElementById('cpWebsite').value.trim();
            const tagsInput = document.getElementById('cpTags').value.trim();
            const tagsArray = tagsInput ? tagsInput.split(',').map(t => t.trim()) : [];
            const logoBase64 = document.getElementById('companyLogoBase64').value;

            const profiles = JSON.parse(localStorage.getItem(CP_KEY) || '{}');
            profiles[user.username] = {
                name, tagline, description, industry, location,
                packageRange, openRoles, website, tags: tagsInput, logo: logoBase64,
                updatedAt: new Date().toISOString()
            };
            localStorage.setItem(CP_KEY, JSON.stringify(profiles));

            const updatedData = {
                name: name,
                tagline: tagline,
                description: description,
                industry: industry,
                location: location,
                packageRange: packageRange,
                openRoles: openRoles,
                website: website,
                tags: tagsArray,
                logoBase64: logoBase64
            };

            PortalDB.updateCompanyByUsername(user.username, updatedData);

            if (typeof initCompanySidebarInfo === 'function') {
                initCompanySidebarInfo();
            }

            const btn = document.getElementById('btnSaveCompanyProfile');
            btn.innerHTML = '<i class="fa-solid fa-check me-1"></i> Saved!';
            btn.classList.add('btn-success');
            btn.classList.remove('btn-rku');
            setTimeout(() => {
                btn.innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Profile';
                btn.classList.remove('btn-success');
                btn.classList.add('btn-rku');
            }, 2500);
        }
    </script>
</asp:Content>
