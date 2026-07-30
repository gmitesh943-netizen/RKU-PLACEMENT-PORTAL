/* ==========================================================================
   RK University Placement Portal - Custom JavaScript
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {
    // 1. Initialize Stat Counters (Animate numbers on scroll)
    initCounters();

    // 2. Initialize Placement Charts (Chart.js)
    initCharts();

    // 3. Dynamic navbar updates based on session authentication
    updateNavbarSession();
});

/**
 * Check if user is logged in and adjust navbar links accordingly
 */
function updateNavbarSession() {
    const sessionData = localStorage.getItem('rku_placement_session');
    if (sessionData) {
        try {
            const user = JSON.parse(sessionData);
            const dashboardUrl = 'Studentdashboard.aspx';

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
                        window.location.href = 'Studentdashboard.aspx';
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
    const speed = 200; // The lower the slower

    const startCounter = (counter) => {
        const updateCount = () => {
            const target = +counter.getAttribute('data-target');
            const count = +counter.innerText.replace(/[+,%]/g, '');
            const isPercentage = counter.getAttribute('data-target-type') === 'percent';
            const isCurrency = counter.getAttribute('data-target-type') === 'currency';
            
            // Calculate increment
            const inc = target / speed;

            if (count < target) {
                // Add increment and check if it exceeds target
                let nextVal = count + inc;
                if (nextVal > target) nextVal = target;
                
                // Format output
                let formattedVal = Math.ceil(nextVal);
                if (isPercentage) {
                    counter.innerText = formattedVal + '%';
                } else if (isCurrency) {
                    counter.innerText = formattedVal + ' LPA';
                } else {
                    counter.innerText = formattedVal + '+';
                }
                
                setTimeout(updateCount, 1);
            } else {
                if (isPercentage) {
                    counter.innerText = target + '%';
                } else if (isCurrency) {
                    counter.innerText = target + ' LPA';
                } else {
                    counter.innerText = target + '+';
                }
            }
        };
        updateCount();
    };

    // Intersection Observer to trigger counter when visible
    const observerOptions = {
        threshold: 0.5
    };

    const counterObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counter = entry.target;
                startCounter(counter);
                counterObserver.unobserve(counter);
            }
        });
    }, observerOptions);

    counters.forEach(counter => {
        counterObserver.observe(counter);
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
