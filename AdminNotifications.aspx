<%@ Page Title="Broadcast Notifications | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminNotifications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <div class="col-md-5">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 text-dark">Send Broadcast Notification</h5>
                <p class="text-muted small">Broadcasting a message instantly places it on all student panels.</p>

                <form id="announcementForm" onsubmit="postBroadcast(event)">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Broadcast Subject</label>
                        <input type="text" class="form-control" id="annTitle" placeholder="e.g. TCS Technical assessment details" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Notification Message</label>
                        <textarea class="form-control" id="annMessage" rows="5" placeholder="Include exam details, venue details, criteria links, instructions..." required></textarea>
                    </div>
                    <button type="submit" class="btn btn-rku btn-sm w-100"><i class="fa-solid fa-paper-plane me-1"></i>Send Broadcast Notice</button>
                </form>
            </div>
        </div>

        <div class="col-md-7">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 text-dark">Recent Placement Alerts Broadcasted</h5>
                <div class="list-group overflow-auto" id="adminAnnouncementsList" style="max-height: 400px;">
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-notifications');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Broadcast Placement Notifications';

            renderAnnouncementsList();
        });

        function renderAnnouncementsList() {
            const announcements = PortalDB.getAnnouncements();
            const list = document.getElementById('adminAnnouncementsList');
            list.innerHTML = '';

            if (announcements.length === 0) {
                list.innerHTML = `<p class="text-center text-muted small py-4">No broadcast alerts sent yet.</p>`;
                return;
            }

            announcements.forEach(ann => {
                const div = document.createElement('div');
                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-start';
                div.innerHTML = `
                    <div style="max-width: 85%;">
                        <div class="d-flex align-items-center gap-2 mb-1">
                            <span class="text-muted small font-monospace"><i class="fa-regular fa-calendar me-1"></i> ${ann.date}</span>
                        </div>
                        <h6 class="fw-bold text-dark font-heading mb-1">${ann.title}</h6>
                        <p class="mb-0 text-muted small" style="line-height:1.5;">${ann.message}</p>
                    </div>
                    <div>
                        <button class="btn btn-outline-danger btn-sm border-0" onclick="deleteAnnouncement('${ann.id}')" title="Delete Announcement"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                list.appendChild(div);
            });
        }

        function postBroadcast(e) {
            e.preventDefault();

            const title = document.getElementById('annTitle').value.trim();
            const message = document.getElementById('annMessage').value.trim();

            if (!title || !message) return;

            PortalDB.addAnnouncement(title, message);
            alert('Notice broadcasted to all students successfully!');

            document.getElementById('annTitle').value = '';
            document.getElementById('annMessage').value = '';

            renderAnnouncementsList();
        }

        function deleteAnnouncement(id) {
            if (confirm('Are you sure you want to delete this notice broadcast?')) {
                PortalDB.deleteAnnouncement(id);
                renderAnnouncementsList();
            }
        }
    </script>
</asp:Content>
