/* ==========================================================================
   RK University Placement Portal - Custom JavaScript
   ========================================================================== */

function initPortalMain() {
    // 1. Initialize Stat Counters (Animate numbers on scroll)
    initCounters();

    // 2. Initialize Placement Charts (Chart.js)
    initCharts();

    // 3. Dynamic navbar updates based on session authentication
    updateNavbarSession();

    // 4. Initialize FAQ Accordion Toggle
    initFaqAccordion();
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initPortalMain);
} else {
    initPortalMain();
}

/**
 * Check if user is logged in and adjust navbar links accordingly
 */
function updateNavbarSession() {
    const sessionData = localStorage.getItem('rku_placement_session');
    if (sessionData) {
        try {
            const user = JSON.parse(sessionData);
            const dashboardUrl = 'StudentDashboard.aspx';

            // Find login button
            const loginBtn = document.getElementById('btnLogin');
            if (loginBtn) {
                loginBtn.textContent = 'Dashboard';
                loginBtn.href = dashboardUrl;
                loginBtn.classList.add('active');
            }

            // Find register button
            const registerBtn = document.getElementById('btnRegister');
            if (registerBtn) {
                registerBtn.textContent = 'Sign Out';
                registerBtn.href = '#';
                // Remove existing classes if they block styling, keep it consistent
                registerBtn.style.backgroundColor = '#ef3724'; 
                registerBtn.addEventListener('click', (e) => {
                    e.preventDefault();
                    if (confirm('Are you sure you want to sign out?')) {
                        if (window.PortalDB && typeof PortalDB.logout === 'function') {
                            PortalDB.logout();
                        } else {
                            localStorage.removeItem('rku_placement_session');
                        }
                        window.location.href = 'StudentDashboard.aspx';
                    }
                });
            }
        } catch (err) {
            console.error('Error loading navbar auth session:', err);
        }
    }
}

/**
 * Animate numbers counting up when they enter the viewport
 */
function initCounters() {
    const counters = document.querySelectorAll('.counter-value');
    if (!counters || counters.length === 0) return;
    const speed = 100; // Smooth animation speed

    const startCounter = (counter) => {
        if (counter.dataset.started === 'true') return;
        counter.dataset.started = 'true';

        const target = +counter.getAttribute('data-target') || 0;
        const isPercentage = counter.getAttribute('data-target-type') === 'percent';
        const isCurrency = counter.getAttribute('data-target-type') === 'currency';
        const isK = counter.getAttribute('data-target-type') === 'k';

        // Calculate increment
        const inc = Math.max(target / speed, 0.2);
        let current = 0;

        const updateCount = () => {
            current += inc;
            if (current < target) {
                let formattedVal = Math.ceil(current);
                if (isPercentage) {
                    counter.innerText = formattedVal + '%';
                } else if (isCurrency) {
                    counter.innerText = formattedVal + ' LPA';
                } else if (isK) {
                    counter.innerText = formattedVal + 'K+';
                } else {
                    counter.innerText = formattedVal + '+';
                }
                setTimeout(updateCount, 15);
            } else {
                if (isPercentage) {
                    counter.innerText = target + '%';
                } else if (isCurrency) {
                    counter.innerText = target + ' LPA';
                } else if (isK) {
                    counter.innerText = target + 'K+';
                } else {
                    counter.innerText = target + '+';
                }
            }
        };
        updateCount();
    };

    if ('IntersectionObserver' in window) {
        const observerOptions = {
            threshold: 0.15
        };

        const counterObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    startCounter(entry.target);
                    counterObserver.unobserve(entry.target);
                }
            });
        }, observerOptions);

        counters.forEach(counter => {
            counterObserver.observe(counter);
        });
    }

    // Safety fallback: if not triggered within 700ms, start counters directly
    setTimeout(() => {
        counters.forEach(counter => {
            if (counter.dataset.started !== 'true') {
                startCounter(counter);
            }
        });
    }, 700);
}

/**
 * Initialize FAQ Accordion with smooth toggle and Bootstrap fallback
 */
function initFaqAccordion() {
    const faqButtons = document.querySelectorAll('.faq-pill-btn');
    if (!faqButtons || faqButtons.length === 0) return;

    faqButtons.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const targetSelector = this.getAttribute('data-bs-target') || this.getAttribute('data-target');
            if (!targetSelector) return;
            const targetEl = document.querySelector(targetSelector);
            if (!targetEl) return;

            const isCurrentlyOpen = targetEl.classList.contains('show');

            // Close other items in the accordion group
            const parentAccordion = document.getElementById('faqAccordion');
            if (parentAccordion) {
                parentAccordion.querySelectorAll('.collapse').forEach(panel => {
                    if (panel !== targetEl) {
                        panel.classList.remove('show');
                        panel.style.display = 'none';
                    }
                });
                parentAccordion.querySelectorAll('.faq-pill-btn').forEach(otherBtn => {
                    if (otherBtn !== btn) {
                        otherBtn.classList.add('collapsed');
                        otherBtn.setAttribute('aria-expanded', 'false');
                    }
                });
            }

            if (isCurrentlyOpen) {
                targetEl.classList.remove('show');
                targetEl.style.display = 'none';
                this.classList.add('collapsed');
                this.setAttribute('aria-expanded', 'false');
            } else {
                targetEl.classList.add('show');
                targetEl.style.display = 'block';
                this.classList.remove('collapsed');
                this.setAttribute('aria-expanded', 'true');
            }
        });
    });
}

/**
 * Initialize charts using Chart.js
 */
function initCharts() {
    // Chart Colors
    const colorMaroon = '#a30f14';
    const colorRed = '#ef3724';
    const colorDark = '#1a1a1a';
    const colorGray = '#6c757d';
    const colorOrange = '#fd7e14';
    const colorTeal = '#20c997';
    
    // --- 1. Placement Growth Line Chart ---
    const ctxGrowth = document.getElementById('chartGrowth');
    if (ctxGrowth) {
        // Create gradient fill
        const gradient = ctxGrowth.getContext('2d').createLinearGradient(0, 0, 0, 200);
        gradient.addColorStop(0, 'rgba(239, 55, 36, 0.3)');
        gradient.addColorStop(1, 'rgba(239, 55, 36, 0.0)');

        new Chart(ctxGrowth, {
            type: 'line',
            data: {
                labels: ['2020-21', '2021-22', '2022-23', '2023-24'],
                datasets: [{
                    label: 'Placement Rate',
                    data: [65, 72, 78, 85],
                    borderColor: colorRed,
                    borderWidth: 3,
                    pointBackgroundColor: colorMaroon,
                    pointBorderColor: '#ffffff',
                    pointBorderWidth: 2,
                    pointRadius: 6,
                    pointHoverRadius: 8,
                    backgroundColor: gradient,
                    fill: true,
                    tension: 0.4 // Curved line
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return `Placement: ${context.parsed.y}%`;
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        min: 50,
                        max: 100,
                        ticks: {
                            callback: function(value) {
                                return value + '%';
                            },
                            stepSize: 10
                        },
                        grid: {
                            color: '#f1f1f1'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
    }

    // --- 2. Department Wise Placement Donut Chart ---
    const ctxDept = document.getElementById('chartDepartment');
    if (ctxDept) {
        new Chart(ctxDept, {
            type: 'doughnut',
            data: {
                labels: ['IT & Computer Applications', 'Management & Commerce', 'Engineering (IT)', 'Others'],
                datasets: [{
                    data: [45, 30, 23, 8],
                    backgroundColor: [
                        colorMaroon,
                        colorRed,
                        colorOrange,
                        colorGray
                    ],
                    borderWidth: 2,
                    borderColor: '#ffffff'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'right',
                        labels: {
                            boxWidth: 12,
                            padding: 15,
                            font: {
                                size: 10,
                                family: 'Inter'
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return ` ${context.label}: ${context.parsed}%`;
                            }
                        }
                    }
                },
                cutout: '65%'
            }
        });
    }

    // --- 3. Package Distribution Bar Chart ---
    const ctxPackage = document.getElementById('chartPackage');
    if (ctxPackage) {
        new Chart(ctxPackage, {
            type: 'bar',
            data: {
                labels: ['0 - 4 LPA', '4 - 8 LPA', '8 - 12 LPA', '12 - 20 LPA', '20+ LPA'],
                datasets: [{
                    data: [35, 40, 15, 8, 2],
                    backgroundColor: colorRed,
                    hoverBackgroundColor: colorMaroon,
                    borderRadius: 6,
                    borderSkipped: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return `Percentage: ${context.parsed.y}% of students`;
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        max: 50,
                        ticks: {
                            callback: function(value) {
                                return value + '%';
                            },
                            stepSize: 10
                        },
                        grid: {
                            color: '#f1f1f1'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
    }
}
