(() => {
    const currentUser = PortalDB.getCurrentUser();
    if (!currentUser) {
        window.location.href = 'Login.aspx';
        return;
    }
    if (currentUser.role === 'admin') {
        window.location.href = 'StudentDashboard.aspx';
        return;
    }

    let studentData = currentUser;
    const progressModalEl = document.getElementById('progressModal');
    const progressModal = progressModalEl ? new bootstrap.Modal(progressModalEl) : null;

    document.addEventListener('DOMContentLoaded', () => {
        const path = (window.location.pathname || '').toLowerCase();
        const dataPage = document.body.dataset.studentPage || '';

        const isDrives = dataPage === 'drives' || path.includes('studentdrives') || document.getElementById('drivesGrid') !== null;
        const isProfile = dataPage === 'profile' || path.includes('studentprofile') || document.getElementById('profSkills') !== null;
        const isApps = dataPage === 'applications' || path.includes('studentapplications') || document.getElementById('myApplicationsList') !== null;
        const isOverview = dataPage === 'overview' || path.includes('studentdashboard') || document.getElementById('statApplied') !== null;

        loadStudentInfo();
        renderAnnouncements();
        setActiveSidebarLink(isDrives ? 'drives' : isProfile ? 'profile' : isApps ? 'applications' : 'overview');

        if (isOverview) renderOverview();
        if (isProfile) renderProfileTab();
        if (isDrives) renderCampusDrives();
        if (isApps) renderApplications();

        const sidebarToggleBtn = document.getElementById('sidebarToggleBtn');
        if (sidebarToggleBtn) {
            sidebarToggleBtn.addEventListener('click', () => {
                const sidebar = document.getElementById('sidebar');
                if (sidebar) sidebar.classList.toggle('show');
            });
        }
    });

    function setActiveSidebarLink(activeKey) {
        document.querySelectorAll('.sidebar-item').forEach(item => {
            item.classList.toggle('active', item.dataset.page === activeKey);
        });
    }

    function loadStudentInfo() {
        const name = studentData.name || 'Student';
        const enrollment = studentData.enrollment || '';

        setText('headerStudentName', name);
        setText('headerStudentEnroll', enrollment);
        setText('helloStudentName', name.split(' ')[0]);
        setText('overviewCgpa', parseFloat(studentData.cgpa || 0).toFixed(2));

        const avatarBadge = byId('avatarBadge');
        if (avatarBadge) {
            const nameParts = name.split(' ').filter(Boolean);
            const initials = nameParts.map(p => p[0]).join('').substring(0, 2).toUpperCase() || 'SP';
            if (studentData.photoBase64) {
                avatarBadge.innerHTML = `<img src="${studentData.photoBase64}" alt="${name}" style="width:100%;height:100%;object-fit:cover;border-radius:50%;">`;
            } else {
                avatarBadge.innerText = initials;
            }
        }
    }

    function renderOverview() {
        const statApplied = byId('statApplied');
        if (!statApplied) return;

        const drives = PortalDB.getDrives();
        const applications = PortalDB.getApplications().filter(a => a.studentEnrollment === studentData.enrollment);
        const userCgpa = parseFloat(studentData.cgpa || 0);

        const countApplied = applications.length;
        const countInProcess = applications.filter(a => a.status === 'Applied' || a.status === 'Shortlisted').length;
        const countOffers = applications.filter(a => a.status === 'Selected').length;
        const countEligible = drives.filter(d => userCgpa >= parseFloat(d.minCgpa || 0) && d.status === 'Open').length;

        setText('statApplied', countApplied);
        setText('statPending', countInProcess);
        setText('statOffers', countOffers);
        setText('statEligibility', countEligible);

        const statusBadge = byId('profileStatusBadge');
        if (statusBadge) {
            if (countOffers > 0) {
                statusBadge.innerText = 'Placed';
                statusBadge.className = 'badge bg-success text-white px-3 py-2 rounded-2 fw-semibold';
            } else if (countApplied > 0) {
                statusBadge.innerText = 'Actively Applying';
                statusBadge.className = 'badge bg-primary text-white px-3 py-2 rounded-2 fw-semibold';
            } else {
                statusBadge.innerText = 'Unplaced';
                statusBadge.className = 'badge bg-warning text-dark px-3 py-2 rounded-2 fw-semibold';
            }
        }

        calculateProfileCompletion();
    }

    function calculateProfileCompletion() {
        const checklistContainer = byId('profileChecklist');
        const progressBar = byId('profileProgressBar');
        const percent = byId('profileCompletionPercent');
        if (!checklistContainer || !progressBar || !percent) return;

        let score = 0;
        const checklist = [
            { key: 'name', label: 'Personal details provided', weight: 15 },
            { key: 'photoBase64', label: 'Profile Photo uploaded', weight: 10 },
            { key: 'email', label: 'Email verified', weight: 10 },
            { key: 'mobile', label: 'Mobile contact added', weight: 15 },
            { key: 'cgpa', label: 'Academic CGPA added', weight: 15 },
            { key: 'skills', label: 'Technical skills added', weight: 15 },
            { key: 'resumeUrl', label: 'Professional Resume PDF uploaded', weight: 20 }
        ];

        checklistContainer.innerHTML = '';
        checklist.forEach(item => {
            const isComplete = studentData[item.key] && studentData[item.key] !== '' && studentData[item.key] !== '0.0' && studentData[item.key] !== '0';
            if (isComplete) score += item.weight;
            const itemDiv = document.createElement('div');
            itemDiv.className = 'list-group-item d-flex justify-content-between align-items-center border-0 px-0 py-2';
            itemDiv.innerHTML = `
                <div class="d-flex align-items-center">
                    <i class="fa-regular ${isComplete ? 'fa-circle-check text-success' : 'fa-circle text-muted'} fs-5 me-2"></i>
                    <span class="small text-muted ${isComplete ? 'text-decoration-line-through opacity-60' : ''}">${item.label}</span>
                </div>
                <span class="badge ${isComplete ? 'bg-success-subtle text-success' : 'bg-secondary-subtle text-secondary'} rounded-pill" style="font-size: 0.7rem;">+${item.weight}%</span>
            `;
            checklistContainer.appendChild(itemDiv);
        });

        percent.innerText = score + '%';
        progressBar.style.width = score + '%';
    }

    function renderAnnouncements() {
        const list = byId('announcementsList');
        const dropList = byId('notificationDropdownList');
        const badge = byId('notifBadge');
        if (!list || !dropList || !badge) return;

        const announcements = PortalDB.getAnnouncements();
        list.innerHTML = '';
        dropList.innerHTML = `<li class="dropdown-header border-bottom pb-2 fw-bold font-heading">Placement Cell Alerts</li>`;

        if (announcements.length === 0) {
            list.innerHTML = `<p class="text-muted small text-center py-4">No recent notices from the Placement Cell.</p>`;
            dropList.innerHTML += `<li class="text-center py-3 text-muted small">No notifications</li>`;
            badge.classList.add('d-none');
            return;
        }

        badge.classList.remove('d-none');
        announcements.forEach((ann, idx) => {
            const annDiv = document.createElement('div');
            annDiv.className = 'list-group-item border-0 border-bottom px-0 py-3';
            annDiv.innerHTML = `
                <div class="d-flex w-100 justify-content-between mb-1">
                    <h6 class="fw-bold mb-0 font-heading text-dark text-truncate" style="max-width: 75%;">${ann.title}</h6>
                    <small class="text-muted" style="font-size: 0.75rem;"><i class="fa-regular fa-clock me-1"></i>${ann.date}</small>
                </div>
                <p class="mb-0 text-muted small" style="line-height: 1.5;">${ann.message}</p>
            `;
            list.appendChild(annDiv);

            if (idx < 3) {
                const dropLi = document.createElement('li');
                dropLi.innerHTML = `
                    <a class="dropdown-item p-2 border-bottom" href="#">
                        <div class="d-flex justify-content-between">
                            <span class="fw-bold small font-heading text-dark text-truncate">${ann.title}</span>
                            <span class="text-muted font-monospace" style="font-size: 0.65rem;">${ann.date}</span>
                        </div>
                        <p class="mb-0 text-truncate text-muted small">${ann.message}</p>
                    </a>
                `;
                dropList.appendChild(dropLi);
            }
        });

        dropList.innerHTML += `
            <li class="text-center mt-2">
                <a href="#" class="small text-rku-maroon fw-semibold" onclick="clearAllNotifications(event)">Clear Notifications</a>
            </li>
        `;
    }

    function clearAllNotifications(e) {
        if (e) e.preventDefault();
        localStorage.setItem(PortalDB.KEYS.ANNOUNCEMENTS, JSON.stringify([]));
        renderAnnouncements();
    }

    function renderProfileTab() {
        const profName = byId('profName');
        if (!profName) return;

        setValue('profName', studentData.name || '');
        setValue('profEnroll', studentData.enrollment || '');
        setValue('profEmail', studentData.email || '');
        setValue('profMobile', studentData.mobile || '');
        setValue('profCgpa', studentData.cgpa || '');
        setValue('profBacklogs', studentData.backlogs || 0);
        setValue('profSkills', studentData.skills || '');
        setValue('profResume', studentData.resumeUrl || '');

        if (studentData.degree) setValue('profDegree', studentData.degree);
        if (studentData.branch) setValue('profBranch', studentData.branch);
        if (studentData.semester) setValue('profSemester', studentData.semester);

        const photoPreview = byId('profPhotoPreview');
        const photoInitials = byId('profPhotoInitials');
        if (photoInitials) {
            const nameParts = (studentData.name || 'SP').split(' ');
            const initials = nameParts.map(p => p[0]).join('').substring(0, 2).toUpperCase() || 'SP';
            photoInitials.innerText = initials;
        }

        if (photoPreview && photoInitials) {
            if (studentData.photoBase64) {
                photoPreview.src = studentData.photoBase64;
                photoPreview.style.display = 'block';
                photoInitials.style.display = 'none';
            } else {
                photoPreview.src = '';
                photoPreview.style.display = 'none';
                photoInitials.style.display = 'block';
            }
        }

        renderCertificatesList();
        renderResultsList();
    }

    function saveStudentProfile() {
        const name = valueOf('profName').trim();
        const email = valueOf('profEmail').trim();
        const mobile = valueOf('profMobile').trim();
        const cgpa = valueOf('profCgpa').trim();
        const backlogs = valueOf('profBacklogs');
        const skills = valueOf('profSkills').trim();
        const resumeUrl = valueOf('profResume').trim();
        const degree = valueOf('profDegree');
        const branch = valueOf('profBranch');
        const semester = valueOf('profSemester');

        if (!name || !email || !mobile || !cgpa) {
            alert('Please fill out all required profile fields.');
            return;
        }

        studentData.name = name;
        studentData.email = email;
        studentData.mobile = mobile;
        studentData.cgpa = cgpa;
        studentData.backlogs = backlogs;
        studentData.skills = skills;
        studentData.resumeUrl = resumeUrl;
        studentData.degree = degree;
        studentData.branch = branch;
        studentData.semester = semester;

        const success = PortalDB.saveUser(studentData);
        if (success) {
            alert('Profile updated successfully!');
            loadStudentInfo();
            renderOverview();
            renderCampusDrives();
            renderApplications();
        } else {
            alert('Error updating profile in localStorage.');
        }
    }

    async function previewStudentPhoto(input) {
        if (input.files && input.files[0]) {
            try {
                const base64 = await getBase64(input.files[0]);
                studentData.photoBase64 = base64;
                const photoPreview = byId('profPhotoPreview');
                const photoInitials = byId('profPhotoInitials');
                if (photoPreview && photoInitials) {
                    photoPreview.src = base64;
                    photoPreview.style.display = 'block';
                    photoInitials.style.display = 'none';
                }
            } catch (e) {
                alert('Failed to read photo file');
            }
        }
    }

    function removeStudentPhoto() {
        studentData.photoBase64 = '';
        const input = byId('profPhotoInput');
        if (input) input.value = '';
        const photoPreview = byId('profPhotoPreview');
        const photoInitials = byId('profPhotoInitials');
        if (photoPreview && photoInitials) {
            photoPreview.src = '';
            photoPreview.style.display = 'none';
            photoInitials.style.display = 'block';
        }
    }

    function toggleCertificateForm() {
        const form = byId('certFormContainer');
        if (!form) return;
        if (form.style.display === 'none' || !form.style.display) {
            form.style.display = 'block';
        } else {
            form.style.display = 'none';
            resetCertificateForm();
        }
    }

    function resetCertificateForm() {
        setValue('certTitle', '');
        setValue('certIssuer', '');
        setValue('certDate', '');
        const certFile = byId('certFile');
        if (certFile) certFile.value = '';
    }

    async function addStudentCertificate() {
        const title = valueOf('certTitle').trim();
        const issuer = valueOf('certIssuer').trim();
        const date = valueOf('certDate');
        const fileInput = byId('certFile');

        if (!title) {
            alert('Please enter a certificate title.');
            return;
        }

        let fileBase64 = '';
        let fileName = '';
        if (fileInput && fileInput.files.length > 0) {
            const file = fileInput.files[0];
            fileName = file.name;
            try {
                fileBase64 = await getBase64(file);
            } catch (e) {
                alert('Error reading certificate file.');
                return;
            }
        }

        studentData.certificates = studentData.certificates || [];
        studentData.certificates.push({
            id: 'cert_' + Date.now(),
            title,
            issuer: issuer || 'RK University / Online Platform',
            date: date || new Date().toISOString().split('T')[0],
            fileName,
            fileBase64
        });

        PortalDB.saveUser(studentData);
        alert('Certificate added successfully!');
        toggleCertificateForm();
        renderCertificatesList();
    }

    function deleteStudentCertificate(index) {
        if (confirm('Are you sure you want to delete this certificate?')) {
            studentData.certificates.splice(index, 1);
            PortalDB.saveUser(studentData);
            renderCertificatesList();
        }
    }

    function renderCertificatesList() {
        const container = byId('certificatesList');
        if (!container) return;
        container.innerHTML = '';

        const certs = studentData.certificates || [];
        if (certs.length === 0) {
            container.innerHTML = `<div class="col-12 text-center text-muted py-3 small"><i class="fa-solid fa-certificate text-muted opacity-50 me-1"></i> No certificates added yet. Click '+ Add Certificate' above.</div>`;
            return;
        }

        certs.forEach((cert, idx) => {
            const col = document.createElement('div');
            col.className = 'col-md-6 col-lg-4';
            const filePreviewBtn = cert.fileBase64 ? `<a href="${cert.fileBase64}" target="_blank" class="btn btn-outline-secondary btn-sm me-1" title="View Certificate"><i class="fa-solid fa-eye"></i></a>` : ``;
            col.innerHTML = `
                <div class="card h-100 border-light-subtle shadow-sm p-3 bg-white rounded-3">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="badge bg-danger-subtle text-rku-maroon rounded-pill px-2 py-1" style="font-size: 0.7rem;">
                            <i class="fa-solid fa-award me-1"></i>Verified
                        </div>
                        <div>
                            ${filePreviewBtn}
                            <button type="button" class="btn btn-outline-danger btn-sm border-0" onclick="deleteStudentCertificate(${idx})" title="Delete"><i class="fa-regular fa-trash-can"></i></button>
                        </div>
                    </div>
                    <h6 class="fw-bold mb-1 font-heading text-dark text-truncate">${cert.title}</h6>
                    <p class="text-muted small mb-1"><i class="fa-solid fa-building me-1 opacity-75"></i>${cert.issuer}</p>
                    <small class="text-muted font-monospace" style="font-size: 0.75rem;"><i class="fa-regular fa-calendar me-1"></i>${cert.date}</small>
                </div>
            `;
            container.appendChild(col);
        });
    }

    function toggleResultForm() {
        const form = byId('resultFormContainer');
        if (!form) return;
        if (form.style.display === 'none' || !form.style.display) {
            form.style.display = 'block';
        } else {
            form.style.display = 'none';
            resetResultForm();
        }
    }

    function resetResultForm() {
        setValue('resultTitle', '');
        const resultFile = byId('resultFile');
        if (resultFile) resultFile.value = '';
    }

    async function addStudentResult() {
        const title = valueOf('resultTitle').trim();
        const fileInput = byId('resultFile');

        if (!title) {
            alert('Please enter a semester or subject title.');
            return;
        }

        let fileBase64 = '';
        let fileName = '';
        if (fileInput && fileInput.files.length > 0) {
            const file = fileInput.files[0];
            fileName = file.name;
            try {
                fileBase64 = await getBase64(file);
            } catch (e) {
                alert('Error reading result file.');
                return;
            }
        } else {
            alert('Please upload a mark sheet image.');
            return;
        }

        studentData.results = studentData.results || [];
        studentData.results.push({
            id: 'res_' + Date.now(),
            title,
            fileName,
            fileBase64,
            uploadDate: new Date().toISOString().split('T')[0]
        });

        PortalDB.saveUser(studentData);
        alert('Result added successfully!');
        toggleResultForm();
        renderResultsList();
    }

    function deleteStudentResult(index) {
        if (confirm('Are you sure you want to delete this result?')) {
            studentData.results.splice(index, 1);
            PortalDB.saveUser(studentData);
            renderResultsList();
        }
    }

    function renderResultsList() {
        const container = byId('resultsList');
        if (!container) return;
        container.innerHTML = '';

        const results = studentData.results || [];
        if (results.length === 0) {
            container.innerHTML = `<div class="col-12 text-center text-muted py-3 small"><i class="fa-solid fa-file-lines text-muted opacity-50 me-1"></i> No results added yet. Click '+ Add Result' above.</div>`;
            return;
        }

        results.forEach((res, idx) => {
            const col = document.createElement('div');
            col.className = 'col-md-6 col-lg-4';
            const filePreviewBtn = res.fileBase64 ? `<a href="${res.fileBase64}" target="_blank" class="btn btn-outline-secondary btn-sm me-1" title="View Result"><i class="fa-solid fa-eye"></i></a>` : ``;
            col.innerHTML = `
                <div class="card h-100 border-light-subtle shadow-sm p-3 bg-white rounded-3">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div class="badge bg-primary-subtle text-primary rounded-pill px-2 py-1" style="font-size: 0.7rem;">
                            <i class="fa-solid fa-file-lines me-1"></i>Result
                        </div>
                        <div>
                            ${filePreviewBtn}
                            <button type="button" class="btn btn-outline-danger btn-sm border-0" onclick="deleteStudentResult(${idx})" title="Delete"><i class="fa-regular fa-trash-can"></i></button>
                        </div>
                    </div>
                    <h6 class="fw-bold mb-1 font-heading text-dark text-truncate">${res.title}</h6>
                    <small class="text-muted font-monospace" style="font-size: 0.75rem;"><i class="fa-regular fa-calendar me-1"></i>Upload: ${res.uploadDate}</small>
                </div>
            `;
            container.appendChild(col);
        });
    }

    function mockResumeUpload() {
        const filename = `Resume_${(studentData.name || 'Student').replace(/\s+/g, '_')}_${Date.now().toString().slice(-4)}.pdf`;
        setValue('profResume', filename);
        alert(`Mock Uploaded: ${filename} selected! Click 'Save Changes' to update your profile.`);
    }

    function renderCampusDrives() {
        const grid = byId('drivesGrid');
        if (!grid) return;
        const drives = PortalDB.getDrives();
        const applications = PortalDB.getApplications().filter(a => a.studentEnrollment === studentData.enrollment);
        const companies = PortalDB.getCompanies ? PortalDB.getCompanies() : [];
        const userCgpa = parseFloat(studentData.cgpa || 0);
        const driveCountLabel = byId('driveCountLabel');

        grid.innerHTML = '';
        if (drives.length === 0) {
            grid.innerHTML = `
                <div class="col-12">
                    <div class="sd-empty-state">
                        <i class="fa-solid fa-bullhorn d-block"></i>
                        <h6>No Campus Drives Available</h6>
                        <p>There are currently no campus recruitment drives listed. Check back soon!</p>
                    </div>
                </div>`;
            if (driveCountLabel) driveCountLabel.innerText = '0 Drives';
            return;
        }

        if (driveCountLabel) {
            driveCountLabel.innerText = drives.length + ' Drive' + (drives.length !== 1 ? 's' : '');
        }

        drives.forEach(drive => {
            const minCg = parseFloat(drive.minCgpa || 0);
            const isEligible = userCgpa >= minCg;
            const hasApplied = applications.some(a => a.driveId === drive.id);
            const isClosed = drive.status !== 'Open';

            // Get company logo
            const compEntry = companies.find(c =>
                c.name === drive.companyName ||
                c.linkedUsername === drive.companyUsername
            ) || {};
            const logoSrc = compEntry.logoBase64 || '';
            const companyInitials = (drive.companyName || 'CO').substring(0, 2).toUpperCase();

            const dateStr = drive.date ? new Date(drive.date).toLocaleDateString('en-IN', {
                day: 'numeric', month: 'short', year: 'numeric'
            }) : 'TBD';

            const appCount = PortalDB.getApplications().filter(a => a.driveId === drive.id).length;

            const cardCol = document.createElement('div');
            cardCol.className = 'col-md-6 drive-card-item';
            cardCol.setAttribute('data-company', (drive.companyName || '').toLowerCase() + ' ' + (drive.role || '').toLowerCase());
            cardCol.setAttribute('data-eligible', isEligible ? 'eligible' : 'ineligible');
            cardCol.setAttribute('data-status', drive.status || 'Open');
            cardCol.setAttribute('data-applied', hasApplied ? 'true' : 'false');

            let actionBtn = '';
            if (isClosed) {
                actionBtn = `<button class="btn btn-secondary btn-sm w-100 py-2 disabled" disabled><i class="fa-solid fa-lock me-1"></i>Drive Closed</button>`;
            } else if (hasApplied) {
                actionBtn = `<button class="btn btn-outline-success btn-sm w-100 py-2 disabled" disabled><i class="fa-solid fa-circle-check me-1"></i>Already Applied</button>`;
            } else if (isEligible) {
                actionBtn = `<button class="btn btn-rku btn-sm w-100 py-2" onclick="applyJob('${drive.id}', '${escapeQuotes(drive.companyName)}')"><i class="fa-solid fa-paper-plane me-1"></i>Apply Now</button>`;
            } else {
                actionBtn = `<button class="btn btn-outline-danger btn-sm w-100 py-2 disabled" disabled title="CGPA ${minCg.toFixed(1)}+ required"><i class="fa-solid fa-ban me-1"></i>Ineligible (CGPA ${minCg.toFixed(1)}+)</button>`;
            }

            cardCol.innerHTML = `
                <div class="sd-drive-card">
                    <div>
                        <!-- Header: Logo + Company Info -->
                        <div class="d-flex align-items-start gap-3 mb-3">
                            ${logoSrc
                                ? `<img src="${logoSrc}" class="sd-company-logo" alt="${drive.companyName}">`
                                : `<div class="sd-company-avatar">${companyInitials}</div>`
                            }
                            <div style="flex: 1; min-width: 0;">
                                <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                    <span class="sd-status-badge ${isClosed ? 'sd-status-closed' : 'sd-status-open'}">
                                        <i class="fa-solid fa-circle me-1" style="font-size: 0.35rem; vertical-align: middle;"></i>${drive.status}
                                    </span>
                                    <span class="sd-eligible-badge ${isEligible ? 'sd-eligible-yes' : 'sd-eligible-no'}">
                                        <i class="fa-solid ${isEligible ? 'fa-check' : 'fa-xmark'} me-1"></i>${isEligible ? 'Eligible' : 'Not Eligible'}
                                    </span>
                                </div>
                                <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 1.05rem;">${drive.companyName}</h6>
                                <div class="text-muted small font-heading">${drive.role}</div>
                            </div>
                        </div>

                        <!-- Package Tag -->
                        <div class="mb-3">
                            <span class="sd-package-tag"><i class="fa-solid fa-indian-rupee-sign me-1" style="font-size: 0.8rem;"></i>${drive.package}</span>
                            ${appCount > 0 ? `<span class="ms-2" style="font-size: 0.72rem; color: #64748b;"><i class="fa-solid fa-users me-1"></i>${appCount} applicant${appCount !== 1 ? 's' : ''}</span>` : ''}
                        </div>

                        <!-- Description -->
                        ${drive.description ? `<p class="sd-desc-text mb-3">${drive.description}</p>` : ''}

                        <!-- Meta Info -->
                        <div class="d-flex flex-wrap gap-3 sd-meta mb-3" style="border-top: 1px solid #f1f5f9; padding-top: 0.75rem;">
                            <span><i class="fa-regular fa-calendar"></i>${dateStr}</span>
                            <span><i class="fa-solid fa-graduation-cap"></i>CGPA ≥ ${minCg.toFixed(1)}</span>
                            <span><i class="fa-solid fa-location-dot"></i>${drive.location || 'RKU Campus'}</span>
                        </div>
                    </div>

                    <!-- Action Button -->
                    <div>
                        ${actionBtn}
                    </div>
                </div>
            `;
            grid.appendChild(cardCol);
        });
    }

    function applyJob(driveId, companyName) {
        if (!studentData.resumeUrl || studentData.resumeUrl.trim() === '') {
            alert('Please upload a resume in the "My Profile" tab before applying.');
            return;
        }

        if (confirm(`Are you sure you want to apply for the ${companyName} placement drive?`)) {
            const res = PortalDB.applyForDrive(studentData.enrollment, driveId);
            if (res.success) {
                alert('Successfully applied!');
                renderOverview();
                renderCampusDrives();
                renderApplications();
            } else {
                alert(res.message);
            }
        }
    }

    function filterDrives() {
        const search = byId('driveSearchInput');
        const filter = byId('driveEligibilityFilter');
        const items = document.querySelectorAll('.drive-card-item');
        if (!search || !filter || !items.length) return;

        const query = search.value.toLowerCase();
        const eligibility = filter.value;

        items.forEach(item => {
            const matchesSearch = item.getAttribute('data-company').includes(query);
            const matchesEligible = eligibility === 'all' || item.getAttribute('data-eligible') === 'eligible';
            item.style.display = (matchesSearch && matchesEligible) ? 'block' : 'none';
        });
    }

    function renderApplications() {
        const tbody = byId('applicationsTableBody');
        const emptyState = byId('emptyApplicationsState');
        if (!tbody || !emptyState) return;

        const applications = PortalDB.getApplications().filter(a => a.studentEnrollment === studentData.enrollment);
        const drives = PortalDB.getDrives();

        tbody.innerHTML = '';
        if (applications.length === 0) {
            emptyState.classList.remove('d-none');
            return;
        }

        emptyState.classList.add('d-none');
        applications.forEach(app => {
            const driveObj = drives.find(d => d.id === app.driveId) || {
                companyName: 'Deleted Recruiter',
                role: 'N/A',
                package: 'N/A'
            };

            let statusBadge = '';
            if (app.status === 'Selected') {
                statusBadge = `<span class="badge bg-success-subtle text-success py-2 px-3 border border-success rounded-pill font-heading">Placed</span>`;
            } else if (app.status === 'Rejected') {
                statusBadge = `<span class="badge bg-danger-subtle text-danger py-2 px-3 border border-danger rounded-pill font-heading">Rejected</span>`;
            } else if (app.status === 'Shortlisted') {
                statusBadge = `<span class="badge bg-warning-subtle text-warning py-2 px-3 border border-warning rounded-pill font-heading">Shortlisted</span>`;
            } else {
                statusBadge = `<span class="badge bg-primary-subtle text-primary py-2 px-3 border border-primary rounded-pill font-heading">Applied</span>`;
            }

            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>
                    <div class="fw-bold text-dark font-heading">${driveObj.companyName}</div>
                    <div class="text-muted small">${driveObj.role}</div>
                </td>
                <td><span class="fw-semibold text-dark font-monospace">${driveObj.package}</span></td>
                <td><span class="text-muted small font-monospace">${app.appliedDate}</span></td>
                <td>${statusBadge}</td>
                <td class="text-center">
                    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="trackApplicationProgress(event, '${app.id}')">
                        <i class="fa-solid fa-map-location-dot me-1"></i> Track Progress
                    </button>
                </td>
            `;
            tbody.appendChild(tr);
        });
    }

    function trackApplicationProgress(e, appId) {
        if (e && e.preventDefault) e.preventDefault();
        if (typeof appId === 'undefined' && typeof e === 'string') {
            appId = e;
        }
        const modalEl = document.getElementById('progressModal');
        if (!modalEl) return;
        const pModal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);

        const app = PortalDB.getApplications().find(a => a.id === appId);
        if (!app) return;
        const drive = PortalDB.getDrive(app.driveId);

        setText('trackCompany', drive ? drive.companyName : 'Company');
        setText('trackRole', drive ? drive.role : 'Job Role');

        const steps = ['Applied', 'Shortlisted', 'Technical', 'HR', 'Final'];
        steps.forEach(st => {
            const step = byId(`step-${st}`);
            if (step) step.className = 'step-progress-item';
        });

        const fillBar = byId('modalProgressBarFill');
        const detailsDesc = byId('modalStatusDetails');
        const finalDot = byId('finalDot');
        const finalLabel = byId('finalLabel');
        if (!fillBar || !detailsDesc || !finalDot || !finalLabel) return;

        finalDot.innerHTML = '<i class="fa-solid fa-check"></i>';
        finalDot.className = 'step-progress-dot';
        finalLabel.innerText = 'Offer Issued';

        if (app.status === 'Rejected') {
            let lastCompletedStage = 'Applied';
            if (app.stage === 'Shortlisted') lastCompletedStage = 'Shortlisted';
            else if (app.stage === 'Technical Round') lastCompletedStage = 'Technical';
            else if (app.stage === 'HR Round') lastCompletedStage = 'HR';

            const idx = steps.indexOf(lastCompletedStage);
            for (let i = 0; i <= idx; i++) {
                const step = byId(`step-${steps[i]}`);
                if (step) step.classList.add('completed');
            }
            fillBar.style.width = (idx * 25) + '%';

            const finalStep = byId('step-Final');
            if (finalStep) finalStep.classList.add('active');
            finalDot.innerHTML = '<i class="fa-solid fa-xmark"></i>';
            finalDot.className = 'step-progress-dot border-danger text-danger bg-white';
            finalLabel.innerText = 'Rejected';
            detailsDesc.innerHTML = `Unfortunately, your profile was not selected for further evaluation during the <b>${app.stage}</b> stage. Keep applying! Better luck next time.`;
        } else {
            let currentStepIndex = 0;
            if (app.stage === 'Applied' || !app.stage) {
                const s = byId('step-Applied'); if (s) s.className = 'step-progress-item active';
                currentStepIndex = 0;
                detailsDesc.innerHTML = `Your application has been received by <b>${drive ? drive.companyName : 'Company'}</b>. The Placement cell is verifying resumes and profiles. Eligible students will be shortlisted.`;
            } else if (app.stage === 'Shortlisted') {
                const s1 = byId('step-Applied'); if (s1) s1.className = 'step-progress-item completed';
                const s2 = byId('step-Shortlisted'); if (s2) s2.className = 'step-progress-item active';
                currentStepIndex = 1;
                detailsDesc.innerHTML = `Congratulations! You have been shortlisted by <b>${drive ? drive.companyName : 'Company'}</b>. Prepare for the upcoming technical screening / coding round.`;
            } else if (app.stage === 'Technical Round') {
                const s1 = byId('step-Applied'); if (s1) s1.className = 'step-progress-item completed';
                const s2 = byId('step-Shortlisted'); if (s2) s2.className = 'step-progress-item completed';
                const s3 = byId('step-Technical'); if (s3) s3.className = 'step-progress-item active';
                currentStepIndex = 2;
                detailsDesc.innerHTML = `You are currently undergoing <b>Technical Interviews / Coding Assessments</b>. Be sure to check the training hub materials.`;
            } else if (app.stage === 'HR Round') {
                const s1 = byId('step-Applied'); if (s1) s1.className = 'step-progress-item completed';
                const s2 = byId('step-Shortlisted'); if (s2) s2.className = 'step-progress-item completed';
                const s3 = byId('step-Technical'); if (s3) s3.className = 'step-progress-item completed';
                const s4 = byId('step-HR'); if (s4) s4.className = 'step-progress-item active';
                currentStepIndex = 3;
                detailsDesc.innerHTML = `Great job! You have cleared technical screening and advanced to the <b>HR / Behavioral Interview</b> round. Verify your soft skills.`;
            } else if (app.stage === 'Selected' || app.status === 'Placed') {
                const s1 = byId('step-Applied'); if (s1) s1.className = 'step-progress-item completed';
                const s2 = byId('step-Shortlisted'); if (s2) s2.className = 'step-progress-item completed';
                const s3 = byId('step-Technical'); if (s3) s3.className = 'step-progress-item completed';
                const s4 = byId('step-HR'); if (s4) s4.className = 'step-progress-item completed';
                const s5 = byId('step-Final'); if (s5) s5.className = 'step-progress-item completed';
                currentStepIndex = 4;
                detailsDesc.innerHTML = `🎉 <b>Congratulations!</b> You have successfully cleared all selection rounds at <b>${drive ? drive.companyName : 'Company'}</b> and received an employment offer of <b>${drive ? drive.package : ''}</b>. The Letter of Intent will be issued soon.`;
            }
            fillBar.style.width = (currentStepIndex * 25) + '%';
        }

        pModal.show();
    }

    window.trackApplicationProgress = trackApplicationProgress;

    function handleLogout() {
        if (confirm('Are you sure you want to sign out?')) {
            PortalDB.logout();
        window.location.href = 'Login.aspx';
        }
    }

    async function getBase64(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result);
            reader.onerror = error => reject(error);
        });
    }

    function byId(id) {
        return document.getElementById(id);
    }

    function setText(id, value) {
        const el = byId(id);
        if (el) el.innerText = value;
    }

    function setValue(id, value) {
        const el = byId(id);
        if (el) el.value = value;
    }

    function valueOf(id) {
        const el = byId(id);
        return el ? el.value : '';
    }

    function escapeQuotes(value) {
        return String(value || '').replace(/'/g, "\\'");
    }

    window.previewStudentPhoto = previewStudentPhoto;
    window.removeStudentPhoto = removeStudentPhoto;
    window.saveStudentProfile = saveStudentProfile;
    window.toggleCertificateForm = toggleCertificateForm;
    window.addStudentCertificate = addStudentCertificate;
    window.deleteStudentCertificate = deleteStudentCertificate;
    window.toggleResultForm = toggleResultForm;
    window.addStudentResult = addStudentResult;
    window.deleteStudentResult = deleteStudentResult;
    window.mockResumeUpload = mockResumeUpload;
    window.applyJob = applyJob;
    window.filterDrives = filterDrives;
    window.trackApplicationProgress = trackApplicationProgress;
    window.handleLogout = handleLogout;
})();
