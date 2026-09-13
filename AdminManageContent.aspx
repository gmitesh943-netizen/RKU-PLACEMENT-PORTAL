<%@ Page Title="Manage Web Content | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageContent.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- SECTION 1: SUCCESS STORIES -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(163,15,20,0.1); color: var(--rku-maroon);">
            <i class="fa-solid fa-trophy"></i>
        </div>
        <div>
            <h5>Success Stories</h5>
            <p>Manage placed student stories shown on the website</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;"><i class="fa-solid fa-list me-2 text-muted"></i>All Stories</div>
                    <span class="badge bg-light text-muted border" id="storyCountBadge">0 stories</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminStoriesList" style="max-height: 580px; overflow-y: auto;">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="storyFormTitle"><i class="fa-solid fa-user-graduate me-2 text-rku-maroon"></i>Add Placed Student Story</h6>
                </div>
                <div class="form-panel-body">
                    <form id="storyForm" onsubmit="saveStory(event)">
                        <input type="hidden" id="editStoryId" value="">

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Full Name</label>
                            <input type="text" class="form-control" id="storyName" placeholder="e.g. Krishna Patel" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Degree &amp; Branch</label>
                            <input type="text" class="form-control" id="storyDegree" placeholder="e.g. BCA | School of Computer Applications" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Photo (Optional)</label>
                            <label for="storyImage" class="img-upload-zone d-block">
                                <img id="storyImagePreview" src="" style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 10px; margin: 0 auto 10px;">
                                <div id="storyUploadHint">
                                    <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i>
                                    <span class="text-muted small">Click to upload student photo</span>
                                </div>
                            </label>
                            <input type="file" class="d-none" id="storyImage" accept="image/*" onchange="previewStoryImage(this)">
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Recruiter</label>
                                <input type="text" class="form-control" id="storyRecruiter" placeholder="e.g. TCS" required>
                            </div>
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Package</label>
                                <input type="text" class="form-control" id="storyPackage" placeholder="e.g. ₹ 12 LPA" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Job Designation</label>
                            <input type="text" class="form-control" id="storyRole" placeholder="e.g. Software Engineer" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Testimonial</label>
                            <textarea class="form-control" id="storyQuote" rows="3" placeholder="Student experience quote..." required></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Key Skills <span class="text-muted fw-normal">(comma-separated)</span></label>
                            <input type="text" class="form-control" id="storySkills" placeholder="HTML, CSS, JavaScript, SQL" required>
                        </div>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="storyIsHallOfFame" onchange="toggleRankSelect()">
                            <label class="form-check-label small fw-semibold" for="storyIsHallOfFame">
                                <i class="fa-solid fa-award text-warning me-1"></i>Add to Hall of Fame Podium
                            </label>
                        </div>

                        <div class="mb-3" id="rankSelectGroup" style="display: none;">
                            <label class="form-label text-muted small fw-bold">Podium Rank</label>
                            <select class="form-select" id="storyRank">
                                <option value="">-- Select Rank --</option>
                                <option value="1">🥇 Rank 1 (Gold – Highest Package)</option>
                                <option value="2">🥈 Rank 2 (Silver)</option>
                                <option value="3">🥉 Rank 3 (Bronze)</option>
                            </select>
                        </div>

                        <div class="d-grid gap-2 mt-3">
                            <button type="submit" class="btn btn-rku btn-sm" id="storySubmitBtn"><i class="fa-solid fa-cloud-arrow-up me-1"></i>Publish Success Story</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" id="storyCancelBtn" style="display: none;" onclick="cancelEditStory()"><i class="fa-solid fa-xmark me-1"></i>Cancel Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 2: PLACEMENT GALLERY -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(23,162,184,0.1); color: #17a2b8;">
            <i class="fa-solid fa-images"></i>
        </div>
        <div>
            <h5>Placement Gallery</h5>
            <p>Upload photos shown in the gallery section of the website</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;"><i class="fa-regular fa-images me-2 text-muted"></i>Gallery Items</div>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminGalleryList" style="max-height: 400px; overflow-y: auto;">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="galleryFormTitle"><i class="fa-solid fa-plus-circle me-2" style="color: #17a2b8;"></i>Add Gallery Image</h6>
                </div>
                <div class="form-panel-body">
                    <form id="galleryForm" onsubmit="saveGalleryItem(event)">
                        <input type="hidden" id="editGalleryId" value="">
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Gallery Event / Title</label>
                            <input type="text" class="form-control" id="galleryTitle" placeholder="e.g. Placement Batch 2026" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Gallery Image</label>
                            <input type="file" class="form-control" id="galleryImage" accept="image/*">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-rku btn-sm" id="gallerySubmitBtn"><i class="fa-solid fa-plus me-1"></i>Add Gallery Item</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" id="galleryCancelBtn" style="display: none;" onclick="cancelEditGallery()"><i class="fa-solid fa-xmark me-1"></i>Cancel Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 3: COMPANIES DIRECTORY -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(40,167,69,0.1); color: #28a745;">
            <i class="fa-solid fa-building"></i>
        </div>
        <div>
            <h5>Companies Directory</h5>
            <p>Add and manage recruiting companies shown on the Companies page</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;"><i class="fa-solid fa-list me-2 text-muted"></i>Companies List</div>
                    <span class="badge bg-light text-muted border" id="companyCountBadge">0 companies</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminCompaniesList" style="max-height: 620px; overflow-y: auto;">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="companyFormTitle"><i class="fa-solid fa-plus-circle me-2" style="color: #28a745;"></i>Add Company</h6>
                </div>
                <div class="form-panel-body">
                    <form id="companyForm" onsubmit="saveCompany(event)">
                        <input type="hidden" id="editCompanyId" value="">

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Company Name</label>
                            <input type="text" class="form-control" id="compName" placeholder="e.g. Wipro Technologies" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Industry / Category</label>
                            <select class="form-select" id="compIndustry" required>
                                <option value="">-- Select Industry --</option>
                                <option value="it">IT / Software</option>
                                <option value="mnc">MNC</option>
                                <option value="consulting">Consulting</option>
                                <option value="finance">Finance</option>
                                <option value="fmcg">FMCG</option>
                                <option value="manufacturing">Manufacturing</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Tagline</label>
                            <input type="text" class="form-control" id="compTagline" placeholder="e.g. Apply thought">
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Description</label>
                            <textarea class="form-control" id="compDesc" rows="2" placeholder="Brief description of the company..."></textarea>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Location</label>
                                <input type="text" class="form-control" id="compLocation" placeholder="e.g. Bangalore">
                            </div>
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Package Range</label>
                                <input type="text" class="form-control" id="compPackage" placeholder="e.g. 3.5 – 8 LPA">
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Open Roles</label>
                                <input type="text" class="form-control" id="compRoles" placeholder="e.g. 15 Open Roles">
                            </div>
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Website</label>
                                <input type="url" class="form-control" id="compWebsite" placeholder="https://wipro.com">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Company Logo (Optional)</label>
                            <input type="file" class="form-control" id="compLogo" accept="image/*">
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Tags <span class="text-muted fw-normal">(comma-separated)</span></label>
                            <input type="text" class="form-control" id="compTags" placeholder="Java, Python, React">
                        </div>

                        <div class="d-grid gap-2 mt-3">
                            <button type="submit" class="btn btn-rku btn-sm" id="companySubmitBtn"><i class="fa-solid fa-plus me-1"></i>Add Company</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" id="companyCancelBtn" style="display: none;" onclick="cancelEditCompany()"><i class="fa-solid fa-xmark me-1"></i>Cancel Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-content');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Manage Website Content';

            renderStoriesList();
            renderGalleryList();
            renderCompaniesList();
        });

        // 1. Stories Management
        function renderStoriesList() {
            const stories = PortalDB.getStories();
            const list = document.getElementById('adminStoriesList');
            const countBadge = document.getElementById('storyCountBadge');
            if (countBadge) countBadge.textContent = `${stories.length} stories`;
            if (!list) return;
            list.innerHTML = '';

            if (stories.length === 0) {
                list.innerHTML = `<p class="text-center text-muted small py-4">No success stories published yet.</p>`;
                return;
            }

            stories.forEach(s => {
                const badge = s.isFeatured
                    ? `<span class="badge bg-primary text-white rounded-pill px-2" style="font-size:0.65rem;">Featured</span>`
                    : s.isHallOfFame
                        ? `<span class="badge bg-warning text-dark rounded-pill px-2" style="font-size:0.65rem;">Hall of Fame (Rank ${s.rank})</span>`
                        : `<span class="badge bg-secondary text-white rounded-pill px-2" style="font-size:0.65rem;">Standard</span>`;

                const div = document.createElement('div');
                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                const avatarHtml = s.studentPhoto
                    ? `<img src="${s.studentPhoto}" style="width:36px;height:36px;object-fit:cover;border-radius:50%;" class="me-2">`
                    : `<span class="me-2" style="width:36px;height:36px;border-radius:50%;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-user text-muted"></i></span>`;
                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${avatarHtml}
                        <div>
                            <div class="d-flex align-items-center gap-2 mb-1">
                                ${badge}
                                <span class="fw-bold text-rku-maroon font-monospace small">${s.packageLpa}</span>
                            </div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">${s.studentName}</h6>
                            <p class="mb-0 text-muted small">${s.degreeBranch} &bull; Placed at ${s.recruiterName} (${s.role})</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editStory('${s.id}')" title="Edit Story"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteStory('${s.id}')" title="Delete Story"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                list.appendChild(div);
            });
        }

        function toggleRankSelect() {
            const isHof = document.getElementById('storyIsHallOfFame').checked;
            document.getElementById('rankSelectGroup').style.display = isHof ? 'block' : 'none';
        }

        function previewStoryImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('storyImagePreview');
                    img.src = e.target.result;
                    img.style.display = 'block';
                    document.getElementById('storyUploadHint').style.display = 'none';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        function getBase64(file) {
            return new Promise((resolve, reject) => {
                const reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = () => resolve(reader.result);
                reader.onerror = error => reject(error);
            });
        }

        async function saveStory(e) {
            e.preventDefault();
            const editId = document.getElementById('editStoryId').value;
            const studentName = document.getElementById('storyName').value.trim();
            const degreeBranch = document.getElementById('storyDegree').value.trim();
            const recruiterName = document.getElementById('storyRecruiter').value.trim();
            const packageLpa = document.getElementById('storyPackage').value.trim();
            const role = document.getElementById('storyRole').value.trim();
            const quote = document.getElementById('storyQuote').value.trim();
            const skills = document.getElementById('storySkills').value.trim();
            const isHallOfFame = document.getElementById('storyIsHallOfFame').checked;
            const rank = isHallOfFame ? document.getElementById('storyRank').value : '';
            const isFeatured = (isHallOfFame && rank === '1');
            const fileInput = document.getElementById('storyImage');

            let studentPhoto = editId ? (PortalDB.getStories().find(s => s.id === editId)?.studentPhoto || '') : '';
            if (fileInput && fileInput.files.length > 0) {
                try {
                    studentPhoto = await getBase64(fileInput.files[0]);
                } catch (error) {
                    alert('Error reading image file.');
                    return;
                }
            }

            if (isHallOfFame && !rank) {
                alert('Please select a podium rank for the Hall of Fame.');
                return;
            }

            const storyData = { studentName, degreeBranch, recruiterName, packageLpa, role, quote, skills, studentPhoto, isFeatured, isHallOfFame, rank };

            if (editId) {
                PortalDB.updateStory(editId, storyData);
                alert('Story updated successfully!');
            } else {
                PortalDB.addStory(storyData);
                alert('Story published successfully!');
            }

            cancelEditStory();
            renderStoriesList();
        }

        function deleteStory(id) {
            if (confirm('Are you sure you want to delete this success story?')) {
                PortalDB.deleteStory(id);
                renderStoriesList();
            }
        }

        function editStory(id) {
            const s = PortalDB.getStories().find(x => x.id === id);
            if (!s) return;
            document.getElementById('editStoryId').value = s.id;
            document.getElementById('storyName').value = s.studentName;
            document.getElementById('storyDegree').value = s.degreeBranch;
            document.getElementById('storyRecruiter').value = s.recruiterName;
            document.getElementById('storyPackage').value = s.packageLpa;
            document.getElementById('storyRole').value = s.role;
            document.getElementById('storyQuote').value = s.quote;
            document.getElementById('storySkills').value = s.skills;
            document.getElementById('storyIsHallOfFame').checked = s.isHallOfFame || false;
            toggleRankSelect();
            if (s.isHallOfFame) document.getElementById('storyRank').value = s.rank || '';

            if (s.studentPhoto) {
                const img = document.getElementById('storyImagePreview');
                img.src = s.studentPhoto;
                img.style.display = 'block';
                document.getElementById('storyUploadHint').style.display = 'none';
            }

            document.getElementById('storyFormTitle').textContent = 'Edit Success Story';
            document.getElementById('storySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
            document.getElementById('storyCancelBtn').style.display = 'block';
            document.getElementById('storyForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function cancelEditStory() {
            document.getElementById('editStoryId').value = '';
            document.getElementById('storyForm').reset();
            document.getElementById('storyImagePreview').style.display = 'none';
            document.getElementById('storyUploadHint').style.display = 'block';
            document.getElementById('storyFormTitle').textContent = 'Add Placed Student Story';
            document.getElementById('storySubmitBtn').innerHTML = '<i class="fa-solid fa-cloud-arrow-up me-1"></i> Publish Success Story';
            document.getElementById('storyCancelBtn').style.display = 'none';
            toggleRankSelect();
        }

        // 2. Gallery Management
        function renderGalleryList() {
            const gallery = PortalDB.getGallery();
            const list = document.getElementById('adminGalleryList');
            if (!list) return;
            list.innerHTML = '';

            if (gallery.length === 0) {
                list.innerHTML = `<p class="text-center text-muted small py-4">No gallery items added yet.</p>`;
                return;
            }

            gallery.forEach(g => {
                const div = document.createElement('div');
                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                const imgHtml = g.imageBase64 ? `<img src="${g.imageBase64}" style="width:40px;height:40px;object-fit:cover;border-radius:6px;" class="me-2">` : `<span class="me-2" style="width:40px;height:40px;border-radius:6px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-regular fa-image text-muted"></i></span>`;
                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${imgHtml}
                        <div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">${g.title}</h6>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editGalleryItem('${g.id}')" title="Edit"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteGalleryItem('${g.id}')" title="Delete"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                list.appendChild(div);
            });
        }

        async function saveGalleryItem(e) {
            e.preventDefault();
            const editId = document.getElementById('editGalleryId').value;
            const title = document.getElementById('galleryTitle').value.trim();
            if (!title) return;

            const fileInput = document.getElementById('galleryImage');
            let imageBase64 = editId ? (PortalDB.getGallery().find(g => g.id === editId)?.imageBase64 || '') : '';
            if (fileInput && fileInput.files.length > 0) {
                try {
                    imageBase64 = await getBase64(fileInput.files[0]);
                } catch (error) {
                    alert('Error reading image file.');
                    return;
                }
            }

            if (editId) {
                PortalDB.updateGalleryItem(editId, { title, imageBase64 });
                alert('Gallery item updated successfully!');
            } else {
                PortalDB.addGalleryItem({ title, imageBase64 });
                alert('Gallery item added successfully!');
            }

            cancelEditGallery();
            renderGalleryList();
        }

        function deleteGalleryItem(id) {
            if (confirm('Are you sure you want to delete this gallery item?')) {
                PortalDB.deleteGalleryItem(id);
                renderGalleryList();
            }
        }

        function editGalleryItem(id) {
            const g = PortalDB.getGallery().find(x => x.id === id);
            if (!g) return;
            document.getElementById('editGalleryId').value = g.id;
            document.getElementById('galleryTitle').value = g.title;
            document.getElementById('galleryFormTitle').textContent = 'Edit Gallery Item';
            document.getElementById('gallerySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
            document.getElementById('galleryCancelBtn').style.display = 'block';
            document.getElementById('galleryForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function cancelEditGallery() {
            document.getElementById('editGalleryId').value = '';
            document.getElementById('galleryForm').reset();
            document.getElementById('galleryFormTitle').textContent = 'Add Gallery Image';
            document.getElementById('gallerySubmitBtn').innerHTML = '<i class="fa-solid fa-plus me-1"></i> Add Gallery Item';
            document.getElementById('galleryCancelBtn').style.display = 'none';
        }

        // 3. Companies Directory Management
        function renderCompaniesList() {
            const companies = PortalDB.getCompanies();
            const list = document.getElementById('adminCompaniesList');
            const countBadge = document.getElementById('companyCountBadge');
            if (countBadge) countBadge.textContent = `${companies.length} companies`;
            if (!list) return;
            list.innerHTML = '';

            if (companies.length === 0) {
                list.innerHTML = `<p class="text-center text-muted small py-4">No companies added yet.</p>`;
                return;
            }

            companies.forEach(c => {
                const div = document.createElement('div');
                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                const logoHtml = c.logoBase64 ? `<img src="${c.logoBase64}" alt="${c.name}" style="height: 36px; width: 36px; object-fit: contain;" class="me-2 rounded">` : `<span class="me-2" style="width:36px;height:36px;border-radius:6px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-building text-muted"></i></span>`;
                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${logoHtml}
                        <div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">${c.name}</h6>
                            <p class="mb-0 text-muted small">${c.industry} &bull; ${c.location || '-'} &bull; ${c.packageRange || '-'}</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button class="btn btn-outline-primary btn-sm border-0" onclick="editCompany('${c.id}')" title="Edit Company"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteCompany('${c.id}')" title="Delete Company"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                list.appendChild(div);
            });
        }

        async function saveCompany(e) {
            e.preventDefault();
            const editId = document.getElementById('editCompanyId').value;
            const name = document.getElementById('compName').value.trim();
            const industry = document.getElementById('compIndustry').value.trim();
            const tagline = document.getElementById('compTagline').value.trim();
            const description = document.getElementById('compDesc').value.trim();
            const location = document.getElementById('compLocation').value.trim();
            const packageRange = document.getElementById('compPackage').value.trim();
            const openRoles = document.getElementById('compRoles').value.trim();
            const website = document.getElementById('compWebsite').value.trim();
            const tagsInput = document.getElementById('compTags').value.trim();
            const tags = tagsInput ? tagsInput.split(',').map(t => t.trim()) : [];

            const fileInput = document.getElementById('compLogo');
            let logoBase64 = editId ? (PortalDB.getCompanies().find(c => c.id === editId)?.logoBase64 || '') : '';
            if (fileInput && fileInput.files.length > 0) {
                try {
                    logoBase64 = await getBase64(fileInput.files[0]);
                } catch (error) {
                    alert('Error reading logo file.');
                    return;
                }
            }

            const companyData = { name, industry, tagline, description, location, packageRange, openRoles, website, logoBase64, tags };

            if (editId) {
                PortalDB.updateCompany(editId, companyData);
                alert('Company updated successfully!');
            } else {
                PortalDB.addCompany(companyData);
                alert('Company added successfully!');
            }

            cancelEditCompany();
            renderCompaniesList();
        }

        function deleteCompany(id) {
            if (confirm('Are you sure you want to delete this company?')) {
                PortalDB.deleteCompany(id);
                renderCompaniesList();
            }
        }

        function editCompany(id) {
            const c = PortalDB.getCompanies().find(x => x.id === id);
            if (!c) return;
            document.getElementById('editCompanyId').value = c.id;
            document.getElementById('compName').value = c.name;
            document.getElementById('compIndustry').value = c.industry;
            document.getElementById('compTagline').value = c.tagline || '';
            document.getElementById('compDesc').value = c.description || '';
            document.getElementById('compLocation').value = c.location || '';
            document.getElementById('compPackage').value = c.packageRange || '';
            document.getElementById('compRoles').value = c.openRoles || '';
            document.getElementById('compWebsite').value = c.website || '';
            document.getElementById('compTags').value = c.tags ? c.tags.join(', ') : '';
            document.getElementById('companyFormTitle').textContent = 'Edit Company';
            document.getElementById('companySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
            document.getElementById('companyCancelBtn').style.display = 'block';
            document.getElementById('companyForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function cancelEditCompany() {
            document.getElementById('editCompanyId').value = '';
            document.getElementById('companyForm').reset();
            document.getElementById('companyFormTitle').textContent = 'Add Company';
            document.getElementById('companySubmitBtn').innerHTML = '<i class="fa-solid fa-plus me-1"></i> Add Company';
            document.getElementById('companyCancelBtn').style.display = 'none';
        }
    </script>
</asp:Content>
