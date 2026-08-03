/* ==========================================================================
   RK University Placement Portal - Client-Side Database Manager (localStorage)
   ========================================================================== */

const PortalDB = {
    // Keys used in localStorage
    KEYS: {
        USERS: 'rku_placement_users',
        DRIVES: 'rku_placement_drives',
        APPLICATIONS: 'rku_placement_applications',
        ANNOUNCEMENTS: 'rku_placement_announcements',
        CURRENT_SESSION: 'rku_placement_session',
        STORIES: 'rku_placement_stories',
        GALLERY: 'rku_placement_gallery',
        COMPANIES: 'rku_placement_companies',
        PLACED_STUDENTS: 'rku_placement_placed_students',
        PLACEMENT_TEAM: 'rku_placement_team',
        PASSWORD_RESET_REQUESTS: 'rku_placement_password_reset_requests',
        COMPANY_MAILS: 'rku_placement_company_mails'
    },

    // Initialize Database with dummy data if not present
    init() {

        // Auto Sync All 36 Registered Companies into localStorage with real descriptions & vector logos
        const seedUsers = [{"username":"lnt_hr","password":"password","role":"company","name":"Larsen & Toubro (L&T)","enrollment":"Rajesh Sharma","email":"hr.lnt@rku-recruiters.in","mobile":"+91 98250 11001","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2215%22%20y%3D%2215%22%20width%3D%22170%22%20height%3D%2240%22%20fill%3D%22%23004B93%22%20rx%3D%224%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2243%22%20font-family%3D%22'Outfit'%2C%20'Helvetica'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EL%26amp%3BT%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"amw_hr","password":"password","role":"company","name":"AMW (Asia MotorWorks)","enrollment":"Vikram Patel","email":"hr.amw@rku-recruiters.in","mobile":"+91 98250 11002","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2230%22%20fill%3D%22%230B2545%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%224%22%3EAMW%3C%2Ftext%3E%3Crect%20x%3D%2240%22%20y%3D%2252%22%20width%3D%22120%22%20height%3D%224%22%20fill%3D%22%23D90429%22%20rx%3D%222%22%2F%3E%3C%2Fsvg%3E"},{"username":"abb_hr","password":"password","role":"company","name":"ABB India","enrollment":"Priya Nair","email":"hr.abb@rku-recruiters.in","mobile":"+91 98250 11003","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2238%22%20fill%3D%22%23FF0000%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EABB%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"accenture_hr","password":"password","role":"company","name":"Accenture India","enrollment":"Ananya Roy","email":"hr.accenture@rku-recruiters.in","mobile":"+91 98250 11004","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Cpath%20d%3D%22M112%2018%20L122%2024%20L112%2030%22%20stroke%3D%22%23A100FF%22%20stroke-width%3D%224%22%20fill%3D%22none%22%20stroke-linecap%3D%22round%22%2F%3E%3Ctext%20x%3D%2295%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22700%22%20font-size%3D%2224%22%20fill%3D%22%23111111%22%20text-anchor%3D%22middle%22%3Eaccenture%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"kpit_hr","password":"password","role":"company","name":"KPIT Technologies","enrollment":"Siddharth Mehta","email":"hr.kpit@rku-recruiters.in","mobile":"+91 98250 11005","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%23008751%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EKPIT%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"atos_hr","password":"password","role":"company","name":"Atos Syntel","enrollment":"Neha Deshmukh","email":"hr.atos@rku-recruiters.in","mobile":"+91 98250 11006","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2230%22%20fill%3D%22%23006699%22%20text-anchor%3D%22middle%22%3EAtos%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"cmc_hr","password":"password","role":"company","name":"CMC Limited","enrollment":"Manoj Verma","email":"hr.cmc@rku-recruiters.in","mobile":"+91 98250 11007","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2218%22%20width%3D%22150%22%20height%3D%2234%22%20rx%3D%224%22%20fill%3D%22%23002B66%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2218%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3ECMC%20Limited%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"ibm_hr","password":"password","role":"company","name":"IBM India","enrollment":"Sanjay Gupta","email":"hr.ibm@rku-recruiters.in","mobile":"+91 98250 11008","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2240%22%20fill%3D%22%23052FAD%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%225%22%3EIBM%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"infosys_hr","password":"password","role":"company","name":"Infosys Limited","enrollment":"Kavita Reddy","email":"hr.infosys@rku-recruiters.in","mobile":"+91 98250 11009","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2246%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2232%22%20fill%3D%22%23007CC3%22%20text-anchor%3D%22middle%22%3EInfosys%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"tata_hr","password":"password","role":"company","name":"TATA Group","enrollment":"Ratan Somani","email":"hr.tata@rku-recruiters.in","mobile":"+91 98250 11010","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Cpath%20d%3D%22M70%2020%20Q100%2012%20130%2020%22%20stroke%3D%22%23003366%22%20stroke-width%3D%224%22%20fill%3D%22none%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%23003366%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%224%22%3ETATA%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"zensar_hr","password":"password","role":"company","name":"Zensar Technologies","enrollment":"Amit Kulkarni","email":"hr.zensar@rku-recruiters.in","mobile":"+91 98250 11011","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2228%22%20fill%3D%22%230033CC%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EZENSAR%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"globallogic_hr","password":"password","role":"company","name":"GlobalLogic","enrollment":"Pooja Saxena","email":"hr.globallogic@rku-recruiters.in","mobile":"+91 98250 11012","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2224%22%20fill%3D%22%234A00E0%22%20text-anchor%3D%22middle%22%3EGlobalLogic%3C%2Ftext%3E%3Ctext%20x%3D%22100%22%20y%3D%2258%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-size%3D%229%22%20fill%3D%22%23FF6B00%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3EHITACHI%20GROUP%20COMPANY%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"capgemini_hr","password":"password","role":"company","name":"Capgemini India","enrollment":"Rahul Bhatia","email":"hr.capgemini@rku-recruiters.in","mobile":"+91 98250 11013","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Cpath%20d%3D%22M40%2035%20C40%2025%2050%2025%2050%2035%20C50%2045%2040%2045%2040%2035%20Z%22%20fill%3D%22%230070AD%22%2F%3E%3Ctext%20x%3D%22110%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2224%22%20fill%3D%22%23002A54%22%20text-anchor%3D%22middle%22%3ECapgemini%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"hexaware_hr","password":"password","role":"company","name":"Hexaware Technologies","enrollment":"Swati Rane","email":"hr.hexaware@rku-recruiters.in","mobile":"+91 98250 11014","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23FF3B00%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EHEXAWARE%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"essar_hr","password":"password","role":"company","name":"ESSAR Group","enrollment":"Deepak Shah","email":"hr.essar@rku-recruiters.in","mobile":"+91 98250 11015","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2218%22%20width%3D%22150%22%20height%3D%2234%22%20rx%3D%224%22%20fill%3D%22%23C8102E%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2222%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EESSAR%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"syntel_hr","password":"password","role":"company","name":"SYNTEL","enrollment":"Varun Joshi","email":"hr.syntel@rku-recruiters.in","mobile":"+91 98250 11016","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2226%22%20fill%3D%22%23009966%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3ESYNNTEL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"lti_hr","password":"password","role":"company","name":"L&T Infotech (LTIMindtree)","enrollment":"Hardik Pandya","email":"hr.lti@rku-recruiters.in","mobile":"+91 98250 11017","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2222%22%20fill%3D%22%23000000%22%20text-anchor%3D%22middle%22%3EL%26amp%3BT%20Infotech%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"ais_hr","password":"password","role":"company","name":"AIS (Asahi India Glass)","enrollment":"Nilesh Trivedi","email":"hr.ais@rku-recruiters.in","mobile":"+91 98250 11018","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2234%22%20fill%3D%22%23D32F2F%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EAIS%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"vodafone_hr","password":"password","role":"company","name":"Vodafone Idea (Vi)","enrollment":"Surbhi Jain","email":"hr.vodafone@rku-recruiters.in","mobile":"+91 98250 11019","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2228%22%20fill%3D%22%23E60000%22%20text-anchor%3D%22middle%22%3Evodafone%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"amazon_hr","password":"password","role":"company","name":"Amazon India","enrollment":"Devendra Singh","email":"hr.amazon@rku-recruiters.in","mobile":"+91 98250 11020","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2230%22%20fill%3D%22%23141921%22%20text-anchor%3D%22middle%22%3Eamazon%3C%2Ftext%3E%3Cpath%20d%3D%22M65%2048%20Q100%2058%20135%2048%22%20stroke%3D%22%23FF9900%22%20stroke-width%3D%224%22%20fill%3D%22none%22%20stroke-linecap%3D%22round%22%2F%3E%3Cpath%20d%3D%22M130%2044%20L138%2048%20L132%2054%22%20fill%3D%22%23FF9900%22%2F%3E%3C%2Fsvg%3E"},{"username":"polycab_hr","password":"password","role":"company","name":"Polycab India","enrollment":"Jignesh Vora","email":"hr.polycab@rku-recruiters.in","mobile":"+91 98250 11021","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2226%22%20fill%3D%22%23E53935%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EPOLYCAB%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"obo_hr","password":"password","role":"company","name":"OBO Bettermann","enrollment":"Tarun Mathur","email":"hr.obo@rku-recruiters.in","mobile":"+91 98250 11022","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2236%22%20fill%3D%22%23D84315%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EOBO%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"tatvasoft_hr","password":"password","role":"company","name":"TatvaSoft","enrollment":"Chirag Solanki","email":"hr.tatvasoft@rku-recruiters.in","mobile":"+91 98250 11023","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2228%22%20fill%3D%22%231976D2%22%20text-anchor%3D%22middle%22%3ETatvaSoft%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"hexa_hr","password":"password","role":"company","name":"Hexa (HexaHealth)","enrollment":"Ritu Sharma","email":"hr.hexa@rku-recruiters.in","mobile":"+91 98250 11024","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2246%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%232E7D32%22%20text-anchor%3D%22middle%22%3Ehexa%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"tatapower_hr","password":"password","role":"company","name":"TATA Power","enrollment":"Alok Srivastava","email":"hr.tatapower@rku-recruiters.in","mobile":"+91 98250 11025","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%231A1A1A%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3ETATA%20POWER%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"hdfc_hr","password":"password","role":"company","name":"HDFC Bank","enrollment":"Meghna Kapoor","email":"hr.hdfc@rku-recruiters.in","mobile":"+91 98250 11026","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2218%22%20width%3D%22150%22%20height%3D%2234%22%20fill%3D%22%23004C8C%22%20rx%3D%224%22%2F%3E%3Crect%20x%3D%2235%22%20y%3D%2224%22%20width%3D%2222%22%20height%3D%2222%22%20fill%3D%22%23ED1C24%22%20rx%3D%222%22%2F%3E%3Ctext%20x%3D%22110%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2216%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3EHDFC%20BANK%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"hcl_hr","password":"password","role":"company","name":"HCLTech","enrollment":"Rohit Agarwal","email":"hr.hcl@rku-recruiters.in","mobile":"+91 98250 11027","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2238%22%20fill%3D%22%23002D72%22%20text-anchor%3D%22middle%22%3EHCL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"directi_hr","password":"password","role":"company","name":"Directi","enrollment":"Bhavin Turakhia","email":"hr.directi@rku-recruiters.in","mobile":"+91 98250 11028","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2228%22%20fill%3D%22%23000000%22%20text-anchor%3D%22middle%22%3EDirecti%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"g_hr","password":"password","role":"company","name":"G Geometrics","enrollment":"Gaurav Shah","email":"hr.g@rku-recruiters.in","mobile":"+91 98250 11029","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ccircle%20cx%3D%2260%22%20cy%3D%2235%22%20r%3D%2218%22%20fill%3D%22%23C62828%22%2F%3E%3Ctext%20x%3D%2260%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%3EG%3C%2Ftext%3E%3Ctext%20x%3D%22125%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2218%22%20fill%3D%22%23263238%22%20text-anchor%3D%22middle%22%3EG%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"harel_hr","password":"password","role":"company","name":"HAREL","enrollment":"Daniel Cohen","email":"hr.harel@rku-recruiters.in","mobile":"+91 98250 11030","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2230%22%20fill%3D%22%230277BD%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EHAREL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"collab_hr","password":"password","role":"company","name":"Collabera","enrollment":"Kinjal Bhatt","email":"hr.collab@rku-recruiters.in","mobile":"+91 98250 11031","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2220%22%20width%3D%2230%22%20height%3D%2230%22%20rx%3D%226%22%20fill%3D%22%23B71C1C%22%2F%3E%3Ctext%20x%3D%2240%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2220%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%3EC%3C%2Ftext%3E%3Ctext%20x%3D%22115%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23212121%22%20text-anchor%3D%22middle%22%3ECollab%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"pmc_hr","password":"password","role":"company","name":"PMC Projects","enrollment":"Parth Patel","email":"hr.pmc@rku-recruiters.in","mobile":"+91 98250 11032","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2246%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%23E65100%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EPMC%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"decathlon_hr","password":"password","role":"company","name":"Decathlon India","enrollment":"Sarah Thomas","email":"hr.decathlon@rku-recruiters.in","mobile":"+91 98250 11033","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2222%22%20fill%3D%22%230082C6%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EDECATHLON%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"nielsen_hr","password":"password","role":"company","name":"Nielsen","enrollment":"Aditya Sen","email":"hr.nielsen@rku-recruiters.in","mobile":"+91 98250 11034","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2228%22%20fill%3D%22%2300838F%22%20text-anchor%3D%22middle%22%3Enielsen%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"forbes_hr","password":"password","role":"company","name":"Forbes Marshall","enrollment":"Framroze Forbes","email":"hr.forbes@rku-recruiters.in","mobile":"+91 98250 11035","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2218%22%20fill%3D%22%23212121%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3EFORBES%20MARSHALL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"username":"group_hr","password":"password","role":"company","name":"Golden Group","enrollment":"Sandeep Rathod","email":"hr.group@rku-recruiters.in","mobile":"+91 98250 11036","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ccircle%20cx%3D%2260%22%20cy%3D%2235%22%20r%3D%2216%22%20fill%3D%22%23D4AF37%22%2F%3E%3Ctext%20x%3D%22120%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%231F2937%22%20text-anchor%3D%22middle%22%3EGroup%3C%2Ftext%3E%3C%2Fsvg%3E"}];
        const seedCompanies = [{"id":"c_1","linkedUsername":"lnt_hr","name":"Larsen & Toubro (L&T)","tagline":"It's All About Imagineering","description":"Larsen & Toubro is an Indian multinational conglomerate engaged in EPC projects, hi-tech manufacturing and services. It operates in over 50 countries worldwide with key focus areas in Infrastructure, Hydrocarbon, Power, Heavy Engineering, Defense, and Aerospace.","industry":"manufacturing","location":"Mumbai, India","packageRange":"5.5 LPA - 10.0 LPA","openRoles":"25 Open Roles","website":"https://www.larsentoubro.com","tags":"EPC, Infrastructure, Heavy Engineering","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2215%22%20y%3D%2215%22%20width%3D%22170%22%20height%3D%2240%22%20fill%3D%22%23004B93%22%20rx%3D%224%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2243%22%20font-family%3D%22'Outfit'%2C%20'Helvetica'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EL%26amp%3BT%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_2","linkedUsername":"amw_hr","name":"AMW (Asia MotorWorks)","tagline":"Experience the Advantage","description":"Asia MotorWorks (AMW) is a premier Indian heavy commercial vehicle manufacturer, producing heavy-duty trucks, dumpers, trailers, and specialized automotive components for mining, construction, and logistics sectors.","industry":"manufacturing","location":"Bhuj, Gujarat","packageRange":"4.0 LPA - 7.5 LPA","openRoles":"12 Open Roles","website":"https://www.amw.in","tags":"Heavy Trucks, Automotive, Manufacturing","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2230%22%20fill%3D%22%230B2545%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%224%22%3EAMW%3C%2Ftext%3E%3Crect%20x%3D%2240%22%20y%3D%2252%22%20width%3D%22120%22%20height%3D%224%22%20fill%3D%22%23D90429%22%20rx%3D%222%22%2F%3E%3C%2Fsvg%3E"},{"id":"c_3","linkedUsername":"abb_hr","name":"ABB India","tagline":"Writing the Future of Industrial Automation","description":"ABB is a technology leader in electrification and automation, enabling a more sustainable and resource-efficient future. Its solutions connect engineering know-how and software to optimize how things are manufactured, moved, powered and operated.","industry":"manufacturing","location":"Vadodara, India","packageRange":"5.0 LPA - 9.0 LPA","openRoles":"18 Open Roles","website":"https://global.abb","tags":"Automation, Robotics, Electrification","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2238%22%20fill%3D%22%23FF0000%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EABB%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_4","linkedUsername":"accenture_hr","name":"Accenture India","tagline":"Let There Be Change","description":"Accenture is a global professional services company with leading capabilities in digital, cloud, and security. Combining unmatched experience and specialized skills across more than 40 industries, Accenture offers Strategy, Consulting, Technology, and Operations services.","industry":"consulting","location":"Bengaluru, India","packageRange":"4.5 LPA - 12.0 LPA","openRoles":"35 Open Roles","website":"https://www.accenture.com","tags":"Consulting, Cloud, AI, Operations","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Cpath%20d%3D%22M112%2018%20L122%2024%20L112%2030%22%20stroke%3D%22%23A100FF%22%20stroke-width%3D%224%22%20fill%3D%22none%22%20stroke-linecap%3D%22round%22%2F%3E%3Ctext%20x%3D%2295%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22700%22%20font-size%3D%2224%22%20fill%3D%22%23111111%22%20text-anchor%3D%22middle%22%3Eaccenture%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_5","linkedUsername":"kpit_hr","name":"KPIT Technologies","tagline":"Reimagining Mobility with Software","description":"KPIT Technologies is a global independent software development and integration partner helping mobility jumpstart towards a clean, smart, and safe future. KPIT specializes in Embedded Software, Autonomous Driving, Electric Powertrains, and Connected Vehicles.","industry":"it","location":"Pune, India","packageRange":"4.8 LPA - 8.5 LPA","openRoles":"20 Open Roles","website":"https://www.kpit.com","tags":"Automotive Software, Embedded, Autonomous","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%23008751%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EKPIT%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_6","linkedUsername":"atos_hr","name":"Atos Syntel","tagline":"Your Partner in Digital Transformation","description":"Atos Syntel is a leader in digital services, providing IT consulting, cloud infrastructure, cybersecurity, and high-performance computing to Fortune 500 enterprises in Banking, Financial Services, Insurance, and Healthcare.","industry":"it","location":"Pune, India","packageRange":"3.8 LPA - 7.2 LPA","openRoles":"15 Open Roles","website":"https://atos.net","tags":"Cloud, Cybersecurity, IT Services","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2230%22%20fill%3D%22%23006699%22%20text-anchor%3D%22middle%22%3EAtos%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_7","linkedUsername":"cmc_hr","name":"CMC Limited","tagline":"A Subsidiary of Tata Consultancy Services","description":"CMC Limited (a TCS company) is a leading systems engineering and IT solutions provider in India. It offers end-to-end IT services, turnkey infrastructure projects, hardware maintenance, and specialized e-Governance systems.","industry":"it","location":"Hyderabad, India","packageRange":"3.6 LPA - 6.5 LPA","openRoles":"10 Open Roles","website":"https://www.tcs.com","tags":"Systems Integration, e-Governance, IT Infrastructure","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2218%22%20width%3D%22150%22%20height%3D%2234%22%20rx%3D%224%22%20fill%3D%22%23002B66%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2218%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3ECMC%20Limited%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_8","linkedUsername":"ibm_hr","name":"IBM India","tagline":"Let's Create Something That Changes Everything","description":"International Business Machines (IBM) Corporation is a global technology pioneer providing hybrid cloud platform, artificial intelligence (watsonx), quantum computing, enterprise software, and IT consulting services across 175 countries.","industry":"mnc","location":"Bengaluru, India","packageRange":"5.5 LPA - 14.0 LPA","openRoles":"30 Open Roles","website":"https://www.ibm.com","tags":"Hybrid Cloud, AI, Quantum Computing","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2240%22%20fill%3D%22%23052FAD%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%225%22%3EIBM%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_9","linkedUsername":"infosys_hr","name":"Infosys Limited","tagline":"Navigate Your Next","description":"Infosys is a global leader in next-generation digital services and consulting. With over 300,000 employees, Infosys enables clients in 56 countries to navigate their digital transformation powered by AI, Cloud, and Agile development.","industry":"it","location":"Bengaluru, India","packageRange":"3.6 LPA - 9.5 LPA","openRoles":"40 Open Roles","website":"https://www.infosys.com","tags":"Digital Services, Cloud, AI, Java","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2246%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2232%22%20fill%3D%22%23007CC3%22%20text-anchor%3D%22middle%22%3EInfosys%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_10","linkedUsername":"tata_hr","name":"TATA Group","tagline":"Leadership With Trust","description":"Tata Group is India's largest multinational conglomerate, encompassing 30 companies across 10 verticals including Tata Steel, Tata Motors, TCS, Tata Power, and IHCL, operating in over 100 countries with a heritage of over 150 years.","industry":"mnc","location":"Mumbai, India","packageRange":"6.0 LPA - 15.0 LPA","openRoles":"50 Open Roles","website":"https://www.tata.com","tags":"Conglomerate, Steel, Automotive, Tech","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Cpath%20d%3D%22M70%2020%20Q100%2012%20130%2020%22%20stroke%3D%22%23003366%22%20stroke-width%3D%224%22%20fill%3D%22none%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%23003366%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%224%22%3ETATA%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_11","linkedUsername":"zensar_hr","name":"Zensar Technologies","tagline":"Conceptualize, Engineer, Operate","description":"Zensar Technologies is a digital solutions and technology services company that specializes in partnering with global organizations in their digital transformation journeys across Financial Services, Healthcare, and High-Tech sectors.","industry":"it","location":"Pune, India","packageRange":"4.0 LPA - 8.0 LPA","openRoles":"16 Open Roles","website":"https://www.zensar.com","tags":"Data Engineering, Full Stack, DevOps","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2228%22%20fill%3D%22%230033CC%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EZENSAR%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_12","linkedUsername":"globallogic_hr","name":"GlobalLogic","tagline":"A Hitachi Group Company","description":"GlobalLogic, a Hitachi Group Company, is a leader in digital product engineering. It helps brands design and build innovative products, platforms, and digital experiences across Automotive, MedTech, Telecom, and Financial Tech.","industry":"it","location":"Noida, India","packageRange":"5.0 LPA - 11.0 LPA","openRoles":"22 Open Roles","website":"https://www.globallogic.com","tags":"Product Engineering, UX/UI, MedTech","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2224%22%20fill%3D%22%234A00E0%22%20text-anchor%3D%22middle%22%3EGlobalLogic%3C%2Ftext%3E%3Ctext%20x%3D%22100%22%20y%3D%2258%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-size%3D%229%22%20fill%3D%22%23FF6B00%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3EHITACHI%20GROUP%20COMPANY%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_13","linkedUsername":"capgemini_hr","name":"Capgemini India","tagline":"Get The Future You Want","description":"Capgemini is a global leader in partnering with companies to transform and manage their business by harnessing the power of technology. It is a multicultural organization of 340,000 team members in more than 50 countries.","industry":"consulting","location":"Mumbai, India","packageRange":"4.0 LPA - 10.5 LPA","openRoles":"30 Open Roles","website":"https://www.capgemini.com","tags":"Consulting, Salesforce, SAP, AI","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Cpath%20d%3D%22M40%2035%20C40%2025%2050%2025%2050%2035%20C50%2045%2040%2045%2040%2035%20Z%22%20fill%3D%22%230070AD%22%2F%3E%3Ctext%20x%3D%22110%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2224%22%20fill%3D%22%23002A54%22%20text-anchor%3D%22middle%22%3ECapgemini%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_14","linkedUsername":"hexaware_hr","name":"Hexaware Technologies","tagline":"Automate Everything, Cloudify Everything","description":"Hexaware Technologies is a fast-growing automation-led IT and business process services company delivering cloud transformation, enterprise AI, legacy modernization, and digital QA services.","industry":"it","location":"Navi Mumbai, India","packageRange":"4.0 LPA - 7.8 LPA","openRoles":"18 Open Roles","website":"https://hexaware.com","tags":"Automation, Cloud, Legacy Modernization","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23FF3B00%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EHEXAWARE%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_15","linkedUsername":"essar_hr","name":"ESSAR Group","tagline":"Creating Value, Sustaining Growth","description":"Essar Group is a multinational conglomerate with investments in Energy (oil refining & power), Infrastructure (ports & logistics), Metals & Mining, and Technology & Retail sectors across India and global markets.","industry":"manufacturing","location":"Surat, Gujarat","packageRange":"5.0 LPA - 9.5 LPA","openRoles":"14 Open Roles","website":"https://www.essar.com","tags":"Energy, Ports, Infrastructure, Steel","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2218%22%20width%3D%22150%22%20height%3D%2234%22%20rx%3D%224%22%20fill%3D%22%23C8102E%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2222%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EESSAR%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_16","linkedUsername":"syntel_hr","name":"SYNTEL","tagline":"Consider IT Done","description":"Syntel (now part of Atos Syntel) provides integrated IT and knowledge process services to global enterprises, delivering application development, cloud migration, data analytics, and digital operations.","industry":"it","location":"Chennai, India","packageRange":"3.6 LPA - 7.0 LPA","openRoles":"12 Open Roles","website":"https://syntelinc.com","tags":"BFSI, Healthcare IT, Cloud Ops","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2226%22%20fill%3D%22%23009966%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3ESYNNTEL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_17","linkedUsername":"lti_hr","name":"L&T Infotech (LTIMindtree)","tagline":"Getting It Done in the Digital Full-Spectrum","description":"LTIMindtree (formerly L&T Infotech) is a global technology consulting and digital solutions company enabling enterprises across industries to reimagine business models, accelerate innovation, and maximize growth.","industry":"it","location":"Mumbai, India","packageRange":"4.5 LPA - 9.0 LPA","openRoles":"25 Open Roles","website":"https://www.ltimindtree.com","tags":"Digital Full-Spectrum, Data & Analytics","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2222%22%20fill%3D%22%23000000%22%20text-anchor%3D%22middle%22%3EL%26amp%3BT%20Infotech%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_18","linkedUsername":"ais_hr","name":"AIS (Asahi India Glass)","tagline":"See More. Believe More.","description":"Asahi India Glass Ltd. (AIS) is India's leading integrated glass and window solutions company and a dominant player in automotive and architectural glass, supplying OEM glass to major vehicle manufacturers.","industry":"manufacturing","location":"Patan, Gujarat","packageRange":"3.8 LPA - 6.5 LPA","openRoles":"15 Open Roles","website":"https://www.aisglass.com","tags":"Automotive Glass, Architectural Glass","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2234%22%20fill%3D%22%23D32F2F%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EAIS%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_19","linkedUsername":"vodafone_hr","name":"Vodafone Idea (Vi)","tagline":"Together for Tomorrow","description":"Vodafone Idea Limited (Vi) is an Indian telecom operator providing 4G/5G voice, data, enterprise IoT, and digital connectivity services to hundreds of millions of subscribers across India.","industry":"mnc","location":"Ahmedabad, Gujarat","packageRange":"4.2 LPA - 8.5 LPA","openRoles":"20 Open Roles","website":"https://www.myvi.in","tags":"Telecom, 5G, Enterprise IoT, Networks","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2228%22%20fill%3D%22%23E60000%22%20text-anchor%3D%22middle%22%3Evodafone%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_20","linkedUsername":"amazon_hr","name":"Amazon India","tagline":"Work Hard. Have Fun. Make History.","description":"Amazon.com, Inc. is a global technology giant focused on e-commerce, cloud computing (AWS), online streaming, artificial intelligence, and logistics infrastructure powering millions of businesses worldwide.","industry":"mnc","location":"Bengaluru, India","packageRange":"7.5 LPA - 18.0 LPA","openRoles":"45 Open Roles","website":"https://www.amazon.jobs","tags":"AWS, SDE, E-Commerce, Machine Learning","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2230%22%20fill%3D%22%23141921%22%20text-anchor%3D%22middle%22%3Eamazon%3C%2Ftext%3E%3Cpath%20d%3D%22M65%2048%20Q100%2058%20135%2048%22%20stroke%3D%22%23FF9900%22%20stroke-width%3D%224%22%20fill%3D%22none%22%20stroke-linecap%3D%22round%22%2F%3E%3Cpath%20d%3D%22M130%2044%20L138%2048%20L132%2054%22%20fill%3D%22%23FF9900%22%2F%3E%3C%2Fsvg%3E"},{"id":"c_21","linkedUsername":"polycab_hr","name":"Polycab India","tagline":"Connection Zindagi Ka","description":"Polycab India Limited is India's No. 1 manufacturer of wires and cables and a fast-growing FMEG (Fast Moving Electrical Goods) company offering switches, LED lighting, solar systems, and fans.","industry":"manufacturing","location":"Halol, Gujarat","packageRange":"4.0 LPA - 7.5 LPA","openRoles":"16 Open Roles","website":"https://polycab.com","tags":"Wires & Cables, FMEG, Electricals","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2226%22%20fill%3D%22%23E53935%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EPOLYCAB%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_22","linkedUsername":"obo_hr","name":"OBO Bettermann","tagline":"Building Connections","description":"OBO Bettermann is an international manufacturer of electrical installation systems, lightning protection, surge voltage protection, cable support systems, and fire protection systems.","industry":"manufacturing","location":"Chennai, India","packageRange":"4.2 LPA - 7.0 LPA","openRoles":"8 Open Roles","website":"https://www.obo.in","tags":"Electrical Installation, Cable Support, Surge Protection","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2236%22%20fill%3D%22%23D84315%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EOBO%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_23","linkedUsername":"tatvasoft_hr","name":"TatvaSoft","tagline":"Sculpting Ideas Into Reality","description":"TatvaSoft is a CMMI Level 3 custom software development company providing bespoke enterprise applications, mobile apps, Cloud, DevOps, and Big Data solutions using .NET, Java, PHP, and React.","industry":"it","location":"Ahmedabad, Gujarat","packageRange":"3.8 LPA - 7.5 LPA","openRoles":"20 Open Roles","website":"https://www.tatvasoft.com","tags":".NET, React, Mobile Apps, Cloud","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2228%22%20fill%3D%22%231976D2%22%20text-anchor%3D%22middle%22%3ETatvaSoft%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_24","linkedUsername":"hexa_hr","name":"Hexa (HexaHealth)","tagline":"Healthcare Simplified","description":"HexaHealth is a tech-enabled healthcare platform that guides patients through their surgical journey, connecting them with top hospitals, specialized surgeons, and seamless insurance assistance.","industry":"finance","location":"Gurugram, India","packageRange":"4.0 LPA - 8.0 LPA","openRoles":"10 Open Roles","website":"https://www.hexahealth.com","tags":"HealthTech, Surgical Care, Tech Platform","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2246%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%232E7D32%22%20text-anchor%3D%22middle%22%3Ehexa%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_25","linkedUsername":"tatapower_hr","name":"TATA Power","tagline":"Lighting Up Lives Sustainably","description":"Tata Power is India's largest integrated power utility company, leading the transition to green energy with a diverse portfolio of Solar, Hydro, Wind, EV Charging infrastructure, and Smart Grid distribution.","industry":"manufacturing","location":"Mundra, Gujarat","packageRange":"5.2 LPA - 9.8 LPA","openRoles":"18 Open Roles","website":"https://www.tatapower.com","tags":"Renewable Energy, Solar, Smart Grid","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%231A1A1A%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3ETATA%20POWER%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_26","linkedUsername":"hdfc_hr","name":"HDFC Bank","tagline":"We Understand Your World","description":"HDFC Bank Limited is India's largest private sector bank by assets. It offers a comprehensive suite of digital banking services, corporate finance, retail loans, wealth management, and treasury operations.","industry":"finance","location":"Rajkot, Gujarat","packageRange":"4.0 LPA - 9.0 LPA","openRoles":"35 Open Roles","website":"https://www.hdfcbank.com","tags":"Banking, Fintech, Retail Loans","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2218%22%20width%3D%22150%22%20height%3D%2234%22%20fill%3D%22%23004C8C%22%20rx%3D%224%22%2F%3E%3Crect%20x%3D%2235%22%20y%3D%2224%22%20width%3D%2222%22%20height%3D%2222%22%20fill%3D%22%23ED1C24%22%20rx%3D%222%22%2F%3E%3Ctext%20x%3D%22110%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2216%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3EHDFC%20BANK%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_27","linkedUsername":"hcl_hr","name":"HCLTech","tagline":"Supercharging Progress","description":"HCLTech is a global technology company home to 225,000+ people across 60 countries, delivering industry-leading capabilities centered around digital, engineering, cloud, AI, and software products.","industry":"it","location":"Noida, India","packageRange":"3.8 LPA - 8.5 LPA","openRoles":"30 Open Roles","website":"https://www.hcltech.com","tags":"IT Infrastructure, Software, GenAI","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2248%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2238%22%20fill%3D%22%23002D72%22%20text-anchor%3D%22middle%22%3EHCL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_28","linkedUsername":"directi_hr","name":"Directi","tagline":"Technology Businesses Built to Scale","description":"Directi is a group of tech companies founded by Bhavin and Divyank Turakhia, creating high-impact global products in domain registration, web hosting, enterprise communication, and financial technology.","industry":"it","location":"Mumbai, India","packageRange":"8.0 LPA - 20.0 LPA","openRoles":"15 Open Roles","website":"https://www.directi.com","tags":"High-Scalability Systems, Web Products","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2228%22%20fill%3D%22%23000000%22%20text-anchor%3D%22middle%22%3EDirecti%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_29","linkedUsername":"g_hr","name":"G Geometrics","tagline":"Precision Engineering & Surveying Solutions","description":"Geometrics Consulting is a specialized engineering firm providing GIS mapping, land surveying, infrastructure design, 3D laser scanning, and geotechnical analysis for major civil construction projects.","industry":"consulting","location":"Vadodara, Gujarat","packageRange":"3.6 LPA - 6.8 LPA","openRoles":"9 Open Roles","website":"https://www.geometrics.in","tags":"GIS Mapping, Land Surveying, Civil Design","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ccircle%20cx%3D%2260%22%20cy%3D%2235%22%20r%3D%2218%22%20fill%3D%22%23C62828%22%2F%3E%3Ctext%20x%3D%2260%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%3EG%3C%2Ftext%3E%3Ctext%20x%3D%22125%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2218%22%20fill%3D%22%23263238%22%20text-anchor%3D%22middle%22%3EG%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_30","linkedUsername":"harel_hr","name":"HAREL","tagline":"Securing Tomorrow's Promise","description":"Harel Insurance Investments & Financial Services Ltd. is a major financial services and insurance group, managing pensions, health insurance, provident funds, and offshore financial technology development.","industry":"finance","location":"Tel Aviv / India Offshore","packageRange":"5.0 LPA - 12.0 LPA","openRoles":"7 Open Roles","website":"https://www.harel-group.co.il","tags":"Insurance, Actuarial, Risk Management","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2230%22%20fill%3D%22%230277BD%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EHAREL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_31","linkedUsername":"collab_hr","name":"Collabera","tagline":"Engineering Talent & Technology Solutions","description":"Collabera is a global leader in IT staffing, software engineering services, and digital talent transformation, partnering with Fortune 500 technology leaders to deploy specialized engineering talent.","industry":"consulting","location":"Vadodara, Gujarat","packageRange":"3.8 LPA - 7.2 LPA","openRoles":"25 Open Roles","website":"https://www.collabera.com","tags":"IT Staffing, Talent Engineering, Tech","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Crect%20x%3D%2225%22%20y%3D%2220%22%20width%3D%2230%22%20height%3D%2230%22%20rx%3D%226%22%20fill%3D%22%23B71C1C%22%2F%3E%3Ctext%20x%3D%2240%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2220%22%20fill%3D%22%23ffffff%22%20text-anchor%3D%22middle%22%3EC%3C%2Ftext%3E%3Ctext%20x%3D%22115%22%20y%3D%2242%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%23212121%22%20text-anchor%3D%22middle%22%3ECollab%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_32","linkedUsername":"pmc_hr","name":"PMC Projects","tagline":"Excellence in Infrastructure & Project Management","description":"PMC Projects (India) Private Limited is a leading infrastructure project management consultancy specializing in port developments, railway lines, industrial parks, and mega civil infrastructure projects.","industry":"manufacturing","location":"Ahmedabad, Gujarat","packageRange":"4.2 LPA - 7.8 LPA","openRoles":"11 Open Roles","website":"https://www.pmcprojects.com","tags":"Port Development, Mega Infrastructure, Construction","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2246%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2232%22%20fill%3D%22%23E65100%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%223%22%3EPMC%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_33","linkedUsername":"decathlon_hr","name":"Decathlon India","tagline":"Sport for All, All for Sport","description":"Decathlon is the world's largest sporting goods retailer, operating over 2,000 stores globally. Decathlon designs, manufactures, and distributes innovative sports gear and equipment across 80+ sports.","industry":"fmcg","location":"Rajkot / Bengaluru","packageRange":"3.8 LPA - 7.0 LPA","openRoles":"20 Open Roles","website":"https://www.decathlon.in","tags":"Sports Retail, Supply Chain, Logistics","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2222%22%20fill%3D%22%230082C6%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%222%22%3EDECATHLON%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_34","linkedUsername":"nielsen_hr","name":"Nielsen","tagline":"Audience Is Everything","description":"Nielsen Holdings is a global leader in audience measurement, data, and analytics. Nielsen shapes the world's media and content industries by providing unbiased, actionable consumer insights and rating metrics.","industry":"consulting","location":"Mumbai, India","packageRange":"4.5 LPA - 9.5 LPA","openRoles":"14 Open Roles","website":"https://www.nielsen.com","tags":"Audience Analytics, Consumer Insights, Data Science","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2245%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22800%22%20font-size%3D%2228%22%20fill%3D%22%2300838F%22%20text-anchor%3D%22middle%22%3Enielsen%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_35","linkedUsername":"forbes_hr","name":"Forbes Marshall","tagline":"Energising and Automating Industry","description":"Forbes Marshall is a leader in process efficiency and energy conservation for process industries, manufacturing steam engineering equipment, control valves, boiler house automation, and analytical instruments.","industry":"manufacturing","location":"Pune, India","packageRange":"4.5 LPA - 8.2 LPA","openRoles":"10 Open Roles","website":"https://www.forbesmarshall.com","tags":"Steam Engineering, Process Automation, Control","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ctext%20x%3D%22100%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2218%22%20fill%3D%22%23212121%22%20text-anchor%3D%22middle%22%20letter-spacing%3D%221%22%3EFORBES%20MARSHALL%3C%2Ftext%3E%3C%2Fsvg%3E"},{"id":"c_36","linkedUsername":"group_hr","name":"Golden Group","tagline":"Quality, Integrity, Performance","description":"Golden Group of Companies is a diversified industrial group in Rajkot, Gujarat, engaged in precision casting, CNC machining, auto components manufacturing, and global export of engineering goods.","industry":"manufacturing","location":"Rajkot, Gujarat","packageRange":"3.5 LPA - 6.5 LPA","openRoles":"15 Open Roles","website":"https://www.goldengroup.in","tags":"Precision Casting, CNC Machining, Exports","logoBase64":"data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%2070%22%20width%3D%22200%22%20height%3D%2270%22%3E%3Crect%20width%3D%22200%22%20height%3D%2270%22%20fill%3D%22%23ffffff%22%20rx%3D%228%22%2F%3E%3Ccircle%20cx%3D%2260%22%20cy%3D%2235%22%20r%3D%2216%22%20fill%3D%22%23D4AF37%22%2F%3E%3Ctext%20x%3D%22120%22%20y%3D%2244%22%20font-family%3D%22'Outfit'%2C%20sans-serif%22%20font-weight%3D%22900%22%20font-size%3D%2224%22%20fill%3D%22%231F2937%22%20text-anchor%3D%22middle%22%3EGroup%3C%2Ftext%3E%3C%2Fsvg%3E"}];

        let currentUsers = JSON.parse(localStorage.getItem(this.KEYS.USERS)) || [];
        seedUsers.forEach(su => {
            const idx = currentUsers.findIndex(u => u.username === su.username);
            if (idx === -1) {
                currentUsers.push(su);
            } else {
                currentUsers[idx] = { ...currentUsers[idx], ...su };
            }
        });
        localStorage.setItem(this.KEYS.USERS, JSON.stringify(currentUsers));

        let currentCompanies = JSON.parse(localStorage.getItem(this.KEYS.COMPANIES)) || [];
        seedCompanies.forEach(sc => {
            const idx = currentCompanies.findIndex(c => c.linkedUsername === sc.linkedUsername || c.name === sc.name);
            if (idx === -1) {
                currentCompanies.push(sc);
            } else {
                currentCompanies[idx] = { ...currentCompanies[idx], ...sc };
            }
        });
        localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(currentCompanies));

        if (!localStorage.getItem(this.KEYS.PLACED_STUDENTS)) {
            const initialPlacedStudents = [
                { id: 'ps1', name: 'ATHARV VIRCHAND SHAHIYTA', dept: 'B.Tech Computer Engineering', company: 'EPITOME COMPONENTS INC', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-1.1.jpeg' },
                { id: 'ps2', name: 'DARSH NARENDRA BHARIA', dept: 'B.Tech Computer Engineering', company: 'SUPREME TECHNOSTRUCTURE', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-1.2.jpeg' },
                { id: 'ps3', name: 'DRASHTI USDBHIBHAI CHAD', dept: 'B.Tech Computer Engineering', company: 'SHIVAY INFOSOLUTIONS PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-1.3.jpeg' },
                { id: 'ps4', name: 'PRIYA JAYESHBHAI CHAUHAN', dept: 'B.Tech Computer Engineering', company: 'AUM TECH SOLUTIONS', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-1.4.jpeg' },
                { id: 'ps5', name: 'DISHA RAJESHBHAI CHOCHI', dept: 'B.Tech Computer Engineering', company: 'VERISIN SYSTEMS PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-2.1.jpeg' },
                { id: 'ps6', name: 'HARSHDEEP PRAVINBHAI CHAUHAN', dept: 'B.Tech Computer Engineering', company: 'PIXASOFTWARE', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-2.2.jpeg' },
                { id: 'ps7', name: 'HARSH JAYESHBHAI CHUDASAMA', dept: 'B.Tech Computer Engineering', company: 'DHARMA INNOVATION TECHNOLOGIES PRIVATE LIMITED', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-2.3.jpeg' },
                { id: 'ps8', name: 'DEVAS GOPALBHAI JAMBUSARIYA', dept: 'B.Tech Computer Engineering', company: 'INTELCLUES', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-2.4.jpeg' },
                { id: 'ps9', name: 'JITUKUMAR GIRISHBHAI JARIWALA', dept: 'B.Tech Computer Engineering', company: 'INFOLABZ PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-3.1.jpeg' },
                { id: 'ps10', name: 'VAISHNAVI RAMESHCH JAJA', dept: 'B.Tech Computer Engineering', company: 'SUNRISE TECH PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-3.2.jpeg' },
                { id: 'ps11', name: 'KASHISH BHUPENDRA CHOPRA', dept: 'B.Tech Computer Engineering', company: 'VERISIN SYSTEMS PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-3.3.jpeg' },
                { id: 'ps12', name: 'NIDHI KAMLESHBHAI PANDAV', dept: 'B.Tech Computer Engineering', company: 'R3D WINGS', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-3.4.jpeg' },
                { id: 'ps13', name: 'HIT CHETANKUMAR PAREKH', dept: 'B.Tech Computer Engineering', company: 'ZOLO INFOTECH', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-4.1.jpeg' },
                { id: 'ps14', name: 'DISHANT JAYESHBHAI RANAW', dept: 'B.Tech Computer Engineering', company: 'SYNCQ TECHNO', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-4.2.jpeg' },
                { id: 'ps15', name: 'MAAYANK NITINKUMAR KOTECHA', dept: 'B.Tech Computer Engineering', company: 'CYNOREX TECHNOLOGIES PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-4.3.jpeg' },
                { id: 'ps16', name: 'HARDIKKUMAR KAMLESHBHAI UPADIA', dept: 'B.Tech Computer Engineering', company: 'SHIVAY COMMUNICATIONS', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-4.4.jpeg' },
                { id: 'ps17', name: 'BHAVESHBHAI RAJESHBHAI KANTHARIA', dept: 'B.Tech Computer Engineering', company: 'SUPREME SOFTWARE', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-5.1.jpeg' },
                { id: 'ps18', name: 'SMIT MAHESHBHAI KALARIYA', dept: 'B.Tech Computer Engineering', company: 'CYNOREX TECHNOLOGIES PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-5.2.jpeg' },
                { id: 'ps19', name: 'AYAN CHETANKUMAR SAKARIYA', dept: 'B.Tech Computer Engineering', company: 'CYNOREX TECHNOLOGIES LLP', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-5.3.jpeg' },
                { id: 'ps20', name: 'DHRUVKUMAR CHUNIBHAI SHARMA', dept: 'B.Tech Computer Engineering', company: 'RADOIX WEB SOLUTIONS', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-5.4.jpeg' },
                { id: 'ps21', name: 'BHAVYA BENJAMINBHAI SOMANI', dept: 'Master of Computer Application', company: 'AUKRAFT INNOVATIVE PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-6.1.jpeg' },
                { id: 'ps22', name: 'NIKKI KAUSHIKBHAI JOSHI', dept: 'Master of Computer Application', company: 'VERISIN SYSTEMS PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-6.2.jpeg' },
                { id: 'ps23', name: 'GEETA NARESHBHAI DHIVERIYA', dept: 'Master of Computer Application', company: 'CYNOREX TECHNOLOGIES PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-6.3.jpeg' },
                { id: 'ps24', name: 'RUTVIK MAHESHBHAI SOLANKI', dept: 'Master of Computer Application', company: 'DOTCOM INFOWAY PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: 'assets/images/St-pl-6.4.jpeg' },
                { id: 'ps25', name: 'AMIT RAJENDRA DUBEY', dept: 'Master of Computer Application', company: 'RCH ARCHITECTURAL PRODUCTS PVT. LTD.', type: 'computer', year: '2023-24', studentPhoto: '' },
                { id: 'ps26', name: 'DARSHAN KESHAVBHAI GOHEL', dept: 'Master of Computer Application', company: 'ATIK INNOVATION', type: 'computer', year: '2023-24', studentPhoto: '' },
                { id: 'ps27', name: 'ROHAN KUMAR SHARMA', dept: 'MBA Marketing', company: 'HDFC Bank', type: 'management', year: '2023-24', studentPhoto: '' },
                { id: 'ps28', name: 'ANJALI GUPTA', dept: 'MBA Finance', company: 'ICICI Prudential', type: 'management', year: '2023-24', studentPhoto: '' },
                { id: 'ps29', name: 'PREETI DESAI', dept: 'B.Tech Civil Engineering', company: 'L&T Constructions', type: 'others', year: '2023-24', studentPhoto: '' },
                { id: 'ps30', name: 'SIDDHARTH GOEL', dept: 'B.Tech Computer Engineering', company: 'Infosys', type: 'computer', year: '2022-23', studentPhoto: '' },
                { id: 'ps31', name: 'AARUSHI VERMA', dept: 'MBA HR', company: 'Tata Consultancy Services', type: 'management', year: '2022-23', studentPhoto: '' }
            ];
            localStorage.setItem(this.KEYS.PLACED_STUDENTS, JSON.stringify(initialPlacedStudents));
        }

        const placedPhotoMap = {
            ps5: 'assets/images/St-pl-2.1.jpeg',
            ps6: 'assets/images/St-pl-2.2.jpeg',
            ps7: 'assets/images/St-pl-2.3.jpeg',
            ps8: 'assets/images/St-pl-2.4.jpeg',
            ps9: 'assets/images/St-pl-3.1.jpeg',
            ps10: 'assets/images/St-pl-3.2.jpeg',
            ps11: 'assets/images/St-pl-3.3.jpeg',
            ps12: 'assets/images/St-pl-3.4.jpeg',
            ps13: 'assets/images/St-pl-4.1.jpeg',
            ps14: 'assets/images/St-pl-4.2.jpeg',
            ps15: 'assets/images/St-pl-4.3.jpeg',
            ps16: 'assets/images/St-pl-4.4.jpeg',
            ps17: 'assets/images/St-pl-5.1.jpeg',
            ps18: 'assets/images/St-pl-5.2.jpeg',
            ps19: 'assets/images/St-pl-5.3.jpeg',
            ps20: 'assets/images/St-pl-5.4.jpeg',
            ps21: 'assets/images/St-pl-6.1.jpeg',
            ps22: 'assets/images/St-pl-6.2.jpeg',
            ps23: 'assets/images/St-pl-6.3.jpeg',
            ps24: 'assets/images/St-pl-6.4.jpeg'
        };
        const placedStudents = JSON.parse(localStorage.getItem(this.KEYS.PLACED_STUDENTS)) || [];
        let placedPhotoUpdated = false;
        placedStudents.forEach(student => {
            if (placedPhotoMap[student.id] && student.studentPhoto !== placedPhotoMap[student.id]) {
                student.studentPhoto = placedPhotoMap[student.id];
                placedPhotoUpdated = true;
            }
        });
        if (placedPhotoUpdated) {
            localStorage.setItem(this.KEYS.PLACED_STUDENTS, JSON.stringify(placedStudents));
        }

        if (!localStorage.getItem(this.KEYS.PLACEMENT_TEAM)) {
            const initialPlacementTeam = [
                {
                    id: 'pt1',
                    name: 'Amit Sir',
                    designation: 'Lead Coordinator',
                    role: 'Placement Coordination & Student Support',
                    description: 'Leads the placement workflow with a student-first approach, supporting training, recruiter communication, and campus placement planning.',
                    phone: '+91 98765 43210',
                    email: 'placement@rku.ac.in',
                    photo: 'assets/images/Amit SIR-Plcment (1).png',
                    featured: true,
                    order: 1
                },
                {
                    id: 'pt2',
                    name: 'Dipati Mem',
                    designation: 'Coordinator',
                    role: 'Planning & student coordination',
                    description: 'Supports scheduling, student coordination, and placement planning activities.',
                    phone: '',
                    email: '',
                    photo: 'assets/images/Dipati mem -plcment.png',
                    featured: false,
                    order: 2
                },
                {
                    id: 'pt3',
                    name: 'Homera Mem',
                    designation: 'Coordinator',
                    role: 'Recruiter and event support',
                    description: 'Coordinates recruiter communication and event support for placement activities.',
                    phone: '',
                    email: '',
                    photo: 'assets/images/Homera mem-Plcment.png',
                    featured: false,
                    order: 3
                },
                {
                    id: 'pt4',
                    name: 'Prevez Sir',
                    designation: 'Coordinator',
                    role: 'Placement process supervision',
                    description: 'Oversees placement process flow and ensures smooth execution of drives.',
                    phone: '',
                    email: '',
                    photo: 'assets/images/prevezSIR-Plcment.png',
                    featured: false,
                    order: 4
                },
                {
                    id: 'pt5',
                    name: 'Tanna Sir',
                    designation: 'Coordinator',
                    role: 'Drive execution & follow-up',
                    description: 'Manages drive execution, student follow-up, and coordination support.',
                    phone: '',
                    email: '',
                    photo: 'assets/images/tanna SIR-Plcment (1).png',
                    featured: false,
                    order: 5
                }
            ];
            localStorage.setItem(this.KEYS.PLACEMENT_TEAM, JSON.stringify(initialPlacementTeam));
        }

        // 1. Initial Users (Admin & Companies only - Real registered students are dynamically saved via Register.aspx)
        if (!localStorage.getItem(this.KEYS.USERS)) {
            const initialUsers = [
                {
                    username: 'admin',
                    password: 'admin',
                    role: 'admin',
                    name: 'Admin Placement Cell',
                    email: 'placement@rku.ac.in'
                },
                {
                    username: 'tcs_hr',
                    password: 'password',
                    role: 'company',
                    name: 'Tata Consultancy Services',
                    enrollment: 'Ramesh Singh',
                    email: 'hr.tcs@example.com',
                    mobile: '+91 88888 77777'
                }
            ];
            localStorage.setItem(this.KEYS.USERS, JSON.stringify(initialUsers));
        } else {
            // Clean legacy static dummy students ('student', 'sneha', 'amit') from existing localStorage
            try {
                let users = JSON.parse(localStorage.getItem(this.KEYS.USERS)) || [];
                const dummyUsernames = ['student', 'sneha', 'amit'];
                const filteredUsers = users.filter(u => !dummyUsernames.includes(u.username));
                if (filteredUsers.length !== users.length) {
                    localStorage.setItem(this.KEYS.USERS, JSON.stringify(filteredUsers));
                }
            } catch (err) { }
        }

        // 2. Initial Campus Drives
        if (!localStorage.getItem(this.KEYS.DRIVES)) {
            const initialDrives = [
                {
                    id: 'd1',
                    companyName: 'TCS',
                    role: 'System Engineer',
                    package: '3.6 LPA',
                    minCgpa: '6.0',
                    date: '2026-08-15',
                    status: 'Open',
                    description: 'TCS is hiring freshers for System Engineer role. Candidates must have coding skills in Java, Python, or C++ and basic database knowledge.',
                    location: 'RKU Campus (T&P Cell)'
                },
                {
                    id: 'd2',
                    companyName: 'Infosys',
                    role: 'Power Programmer',
                    package: '9.5 LPA',
                    minCgpa: '8.0',
                    date: '2026-08-20',
                    status: 'Open',
                    description: 'Infosys Specialist Programmer and Power Programmer roles. High proficiency in algorithms, data structures, dynamic programming, and systems design is expected.',
                    location: 'RKU Campus (SJT Lab)'
                },
                {
                    id: 'd3',
                    companyName: 'RK Infotech',
                    role: 'Frontend Web Developer',
                    package: '4.5 LPA',
                    minCgpa: '7.0',
                    date: '2026-09-02',
                    status: 'Open',
                    description: 'RK Infotech is looking for a frontend developer skilled in HTML, CSS, Bootstrap, and JavaScript. Experience with responsive web design is a must.',
                    location: 'Online'
                },
                {
                    id: 'd4',
                    companyName: 'L&T Infotech',
                    role: 'Graduate Engineer Trainee',
                    package: '6.0 LPA',
                    minCgpa: '6.5',
                    date: '2026-07-10',
                    status: 'Closed',
                    description: 'L&T GET hiring. Mechanical, Civil, and Computer/IT branches are eligible for GET profiles with rigorous training period.',
                    location: 'RKU Campus (Main Auditorium)'
                }
            ];
            localStorage.setItem(this.KEYS.DRIVES, JSON.stringify(initialDrives));
        }

        // 3. Initial Applications
        if (!localStorage.getItem(this.KEYS.APPLICATIONS)) {
            const initialApplications = [
                {
                    id: 'a1',
                    studentEnrollment: '20SOECE11012', // Sneha
                    driveId: 'd1', // TCS
                    appliedDate: '2026-07-18',
                    status: 'Shortlisted',
                    stage: 'Technical Round'
                },
                {
                    id: 'a2',
                    studentEnrollment: '20SOECE11012', // Sneha
                    driveId: 'd3', // RK Infotech
                    appliedDate: '2026-07-21',
                    status: 'Applied',
                    stage: 'Applied'
                },
                {
                    id: 'a3',
                    studentEnrollment: '20SOECE11002', // Amit
                    driveId: 'd1', // TCS
                    appliedDate: '2026-07-15',
                    status: 'Selected',
                    stage: 'Selected'
                },
                {
                    id: 'a4',
                    studentEnrollment: '20SOECE11045', // Raj (demo student)
                    driveId: 'd4', // L&T
                    appliedDate: '2026-07-08',
                    status: 'Rejected',
                    stage: 'Rejected'
                },
                {
                    id: 'a5',
                    studentEnrollment: '20SOECE11045', // Raj
                    driveId: 'd1', // TCS
                    appliedDate: '2026-07-16',
                    status: 'Selected',
                    stage: 'Selected'
                }
            ];
            localStorage.setItem(this.KEYS.APPLICATIONS, JSON.stringify(initialApplications));
        }

        // 4. Initial Announcements
        if (!localStorage.getItem(this.KEYS.ANNOUNCEMENTS)) {
            const initialAnnouncements = [
                {
                    id: 'n1',
                    date: '2026-07-22',
                    title: 'Infosys Drive Eligibility',
                    message: 'Please note that the eligibility criteria for the upcoming Infosys drive has been updated. The minimum CGPA requirement is now 8.0 instead of 7.5. Make sure your profiles are updated.'
                },
                {
                    id: 'n2',
                    date: '2026-07-20',
                    title: 'Resume Upload Reminder',
                    message: 'All 7th Semester B.Tech & 3rd Semester MBA students are required to upload their updated resume in PDF format in their respective portal by July 25, 2026.'
                }
            ];
            localStorage.setItem(this.KEYS.ANNOUNCEMENTS, JSON.stringify(initialAnnouncements));
        }

        // 5. Initial Success Stories
        if (!localStorage.getItem(this.KEYS.STORIES)) {
            const initialStories = [
                {
                    id: 's1',
                    studentName: 'Krishna Patel',
                    degreeBranch: 'BCA | School of Computer Applications',
                    recruiterName: 'TCS',
                    packageLpa: '₹ 12 LPA',
                    role: 'Software Engineer',
                    quote: 'RK University\'s Placement Cell provided me with continuous guidance, aptitude training, mock interviews, and industry exposure. The support from faculty and placement coordinators helped me secure my dream role at Tata Consultancy Services.',
                    skills: 'HTML, CSS, JavaScript, React, SQL, Communication',
                    studentPhoto: 'assets/images/student_new_1.png',
                    isFeatured: true,
                    isHallOfFame: true,
                    rank: '1'
                },
                {
                    id: 's2',
                    studentName: 'Meet Shah',
                    degreeBranch: 'B.Tech AI & ML',
                    recruiterName: 'Capgemini',
                    packageLpa: '₹ 18 LPA',
                    role: 'AI Engineer',
                    quote: 'The AI curriculum and the placement training at RKU prepared me thoroughly for tech screening processes.',
                    skills: 'Python, AI, ML, TensorFlow, PyTorch',
                    studentPhoto: 'assets/images/student_new_2.png',
                    isFeatured: false,
                    isHallOfFame: true,
                    rank: '2'
                },
                {
                    id: 's3',
                    studentName: 'Neha Patel',
                    degreeBranch: 'MBA',
                    recruiterName: 'Deloitte',
                    packageLpa: '₹ 16 LPA',
                    role: 'Business Analyst',
                    quote: 'The mock corporate discussions and soft skills mentorship by T&P cell boosted my analytical presentations.',
                    skills: 'Business Analysis, PowerBI, Tableau, Excel',
                    studentPhoto: 'assets/images/student_new_3.png',
                    isFeatured: false,
                    isHallOfFame: true,
                    rank: '3'
                },
                {
                    id: 's4',
                    studentName: 'Disha Shah',
                    degreeBranch: 'MCA',
                    recruiterName: 'Infosys',
                    packageLpa: '₹ 9 LPA',
                    role: 'Systems Engineer',
                    quote: 'Infosys Specialist Programmer prep sessions helped me pass code assessments.',
                    skills: 'Java, Algorithms, Data Structures',
                    studentPhoto: 'assets/images/student_disha.png',
                    isFeatured: false,
                    isHallOfFame: false,
                    rank: ''
                },
                {
                    id: 's5',
                    studentName: 'Harshil Mehta',
                    degreeBranch: 'B.Tech IT',
                    recruiterName: 'Wipro',
                    packageLpa: '₹ 8 LPA',
                    role: 'Project Engineer',
                    quote: 'Learned web engineering concepts and cracked Wipro placement drives.',
                    skills: 'JavaScript, Node.js, Express, MongoDB',
                    studentPhoto: 'assets/images/student_harshil.png',
                    isFeatured: false,
                    isHallOfFame: false,
                    rank: ''
                },
                {
                    id: 's6',
                    studentName: 'Khushi Joshi',
                    degreeBranch: 'BBA',
                    recruiterName: 'Accenture',
                    packageLpa: '₹ 7.5 LPA',
                    role: 'HR Executive',
                    quote: 'Accenture recruitment process had multi-stage assessments; TPO guidance was key.',
                    skills: 'Management, Communication, HR Practices',
                    studentPhoto: 'assets/images/student_krish.png',
                    isFeatured: false,
                    isHallOfFame: false,
                    rank: ''
                }
            ];
            localStorage.setItem(this.KEYS.STORIES, JSON.stringify(initialStories));
        }

        // Auto Sync studentPhoto in existing STORIES if empty
        let existingStories = JSON.parse(localStorage.getItem(this.KEYS.STORIES)) || [];
        let updatedStories = false;
        const photoMap = {
            'Krishna Patel': 'assets/images/student_new_1.png',
            'Meet Shah': 'assets/images/student_new_2.png',
            'Neha Patel': 'assets/images/student_new_3.png',
            'Disha Shah': 'assets/images/student_disha.png',
            'Harshil Mehta': 'assets/images/student_harshil.png',
            'Khushi Joshi': 'assets/images/student_krish.png'
        };
        existingStories.forEach(st => {
            if (!st.studentPhoto && photoMap[st.studentName]) {
                st.studentPhoto = photoMap[st.studentName];
                updatedStories = true;
            }
        });
        if (updatedStories) {
            localStorage.setItem(this.KEYS.STORIES, JSON.stringify(existingStories));
        }

        // 6. Initial Placement Gallery
        if (!localStorage.getItem(this.KEYS.GALLERY)) {
            const initialGallery = [
                {
                    id: 'g1',
                    title: 'Placement Batch Group'
                },
                {
                    id: 'g2',
                    title: 'Pre-placement Talk Session'
                },
                {
                    id: 'g3',
                    title: 'TPO Training Class'
                }
            ];
            localStorage.setItem(this.KEYS.GALLERY, JSON.stringify(initialGallery));
        }

        // 7. Initial Companies List (Seeded as requested)
        if (!localStorage.getItem(this.KEYS.COMPANIES)) {
            const initialCompanies = [
                {
                    id: 'c1',
                    name: 'Tata Consultancy Services',
                    tagline: 'Building on belief — India\'s largest IT services company',
                    description: 'TCS is a leading global IT services, consulting, and business solutions organization. With 600,000+ associates and operations in 55 countries, TCS is consistently ranked among the most valuable IT services brands globally.',
                    industry: 'it',
                    location: 'Mumbai, India',
                    packageRange: '3.6 LPA - 7.5 LPA',
                    openRoles: '28 Open Roles',
                    website: 'https://tcs.com',
                    tags: 'Cloud, Java, SQL'
                },
                {
                    id: 'c2',
                    name: 'Infosys Limited',
                    tagline: 'Navigate your next — Global leader in next-gen digital services',
                    description: 'Infosys is a global leader in next-generation digital services and consulting. We enable clients in more than 50 countries to navigate their digital transformation, driving innovation and development solutions.',
                    industry: 'it',
                    location: 'Bangalore, India',
                    packageRange: '3.6 LPA - 9.5 LPA',
                    openRoles: '22 Open Roles',
                    website: 'https://infosys.com',
                    tags: 'React, Java, Spring'
                },
                {
                    id: 'c3',
                    name: 'Wipro Technologies',
                    tagline: 'Apply thought — Leading technology services and consulting',
                    description: 'Wipro Limited is a leading technology services and consulting company focused on building innovative solutions that address clients\' most complex digital transformation needs.',
                    industry: 'it',
                    location: 'Bangalore, India',
                    packageRange: '3.5 LPA - 8.0 LPA',
                    openRoles: '15 Open Roles',
                    website: 'https://wipro.com',
                    tags: 'Python, C++, AWS'
                },
                {
                    id: 'c4',
                    name: 'Capgemini India',
                    tagline: 'Get the future you want — Global consulting and tech leader',
                    description: 'Capgemini is a global leader in partnering with companies to transform and manage their business by harnessing the power of technology. It is a multicultural organization of 340,000 team members.',
                    industry: 'consulting',
                    location: 'Pune, India',
                    packageRange: '4.0 LPA - 11 LPA',
                    openRoles: '18 Open Roles',
                    website: 'https://capgemini.com',
                    tags: 'AI, ML, Salesforce'
                },
                {
                    id: 'c5',
                    name: 'Accenture India',
                    tagline: 'Let there be change — Professional services and strategy',
                    description: 'Accenture is a leading global professional services company, providing a broad range of services in strategy and consulting, interactive, technology, and operations, with digital capabilities.',
                    industry: 'consulting',
                    location: 'Mumbai, India',
                    packageRange: '4.5 LPA - 12 LPA',
                    openRoles: '24 Open Roles',
                    website: 'https://accenture.com',
                    tags: 'Consulting, DevOps, Agile'
                },
                {
                    id: 'c6',
                    name: 'Deloitte India',
                    tagline: 'Making an impact that matters — Professional services network',
                    description: 'Deloitte provides industry-leading audit, consulting, tax, and advisory services to many of the world\'s most admired brands, including nearly 90% of the Fortune 500.',
                    industry: 'finance',
                    location: 'Gurgaon, India',
                    packageRange: '5.0 LPA - 14 LPA',
                    openRoles: '10 Open Roles',
                    website: 'https://deloitte.com',
                    tags: 'Finance, Tableau, Python'
                }
            ];
            localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(initialCompanies));
        }
    },

    // ─── USER OPERATIONS ───
    _toIso(value) {
        if (!value) return '';
        const date = value instanceof Date ? value : new Date(value);
        return Number.isNaN(date.getTime()) ? '' : date.toISOString();
    },

    _calcSessionDurationMs(session) {
        const startedAt = session?.currentSessionStartedAt || session?.lastLoginAt;
        if (!startedAt) return Number(session?.lastSessionDurationMs || 0);
        const startedMs = new Date(startedAt).getTime();
        if (Number.isNaN(startedMs)) return Number(session?.lastSessionDurationMs || 0);
        return session?.isOnline ? Math.max(0, Date.now() - startedMs) : Number(session?.lastSessionDurationMs || 0);
    },

    _syncAuthActivity(user, patch = {}) {
        const users = this.getUsers();
        const uIdx = users.findIndex(u => u.username === user.username);
        if (uIdx !== -1) {
            users[uIdx] = { ...users[uIdx], ...patch };
            localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
        }

        if (user.role === 'company') {
            const companies = this.getCompanies();
            const cIdx = companies.findIndex(c =>
                c.linkedUsername === user.username ||
                (c.name && user.name && c.name.toLowerCase() === user.name.toLowerCase())
            );
            if (cIdx !== -1) {
                companies[cIdx] = { ...companies[cIdx], ...patch };
                localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(companies));
            }
        }
    },

    getUsers() {
        return JSON.parse(localStorage.getItem(this.KEYS.USERS)) || [];
    },

    getUser(username) {
        return this.ensureCoreUsers().find(u => u.username === username || u.enrollment === username || u.email === username);
    },

    ensureCoreUsers() {
        const users = this.getUsers();
        const defaults = [
            {
                username: 'admin',
                password: 'admin',
                role: 'admin',
                name: 'Admin Placement Cell',
                email: 'placement@rku.ac.in'
            },
            {
                username: 'student',
                password: 'student',
                role: 'student',
                name: 'Raj Patel',
                enrollment: '20SOECE11045',
                email: 'student@rku.ac.in',
                mobile: '+91 98765 43210',
                degree: 'B.Tech',
                branch: 'Computer Engineering',
                semester: '7th',
                cgpa: '8.5',
                backlogs: '0',
                skills: 'HTML, CSS, Bootstrap, JavaScript, Python, SQL',
                resumeUrl: 'Resume_Raj_Patel.pdf'
            }
        ];

        let changed = false;
        defaults.forEach(defaultUser => {
            const index = users.findIndex(u => u.username === defaultUser.username);
            if (index === -1) {
                users.push(defaultUser);
                changed = true;
                return;
            }
            const merged = { ...defaultUser, ...users[index] };
            if (JSON.stringify(merged) !== JSON.stringify(users[index])) {
                users[index] = merged;
                changed = true;
            }
        });

        if (changed) {
            localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
        }
        return users;
    },

    saveUser(updatedUser) {
        const users = this.getUsers();
        const index = users.findIndex(u => u.username === updatedUser.username);
        if (index !== -1) {
            users[index] = { ...users[index], ...updatedUser };
            localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
            
            // If updating current logged in user profile, update session data too
            const session = this.getCurrentUser();
            if (session && session.username === updatedUser.username) {
                localStorage.setItem(this.KEYS.CURRENT_SESSION, JSON.stringify({ ...session, ...users[index] }));
            }
            return true;
        }
        return false;
    },

    register(newUser) {
        const users = this.getUsers();
        // Check duplicate username or enrollment
        const duplicate = users.some(u => u.username === newUser.username || (newUser.role !== 'company' && newUser.enrollment && u.enrollment === newUser.enrollment));
        if (duplicate) {
            return { success: false, message: 'Username or Enrollment number already registered.' };
        }
        
        newUser.role = newUser.role || 'student'; // Default registration role
        
        if (newUser.role === 'student') {
            // Default fields for a new student
            newUser.degree = newUser.degree || 'B.Tech';
            newUser.branch = newUser.branch || 'Computer Engineering';
            newUser.semester = newUser.semester || '7th';
            newUser.cgpa = newUser.cgpa || '0.0';
            newUser.backlogs = newUser.backlogs || '0';
            newUser.skills = newUser.skills || '';
            newUser.resumeUrl = newUser.resumeUrl || '';
        }

        if (newUser.role === 'company') {
            // Auto-add company to the COMPANIES directory so it shows on the Companies page
            const companies = this.getCompanies();
            const alreadyExists = companies.some(c => c.linkedUsername === newUser.username);
            if (!alreadyExists) {
                const companyEntry = {
                    id: 'cu_' + Date.now(),
                    linkedUsername: newUser.username,
                    name: newUser.name || newUser.username,
                    tagline: '',
                    description: '',
                    industry: 'it',
                    location: '',
                    packageRange: '',
                    openRoles: '',
                    website: '',
                    tags: '',
                    logoBase64: newUser.logoBase64 || ''
                };
                companies.push(companyEntry);
                localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(companies));
            }
        }

        users.push(newUser);
        localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
        return { success: true, message: 'Registration successful! You can now log in.' };
    },

    login(username, password) {
        this.ensureCoreUsers();
        const user = this.getUser(username);
        if (!user) {
            return { success: false, message: 'User does not exist.' };
        }
        if (user.password !== password) {
            return { success: false, message: 'Incorrect password.' };
        }
        const loginAt = this._toIso(new Date());
        const sessionUser = {
            ...user,
            lastLoginAt: loginAt,
            currentSessionStartedAt: loginAt,
            isOnline: true
        };
        this._syncAuthActivity(sessionUser, {
            lastLoginAt: loginAt,
            currentSessionStartedAt: loginAt,
            isOnline: true
        });
        // Save current user session
        localStorage.setItem(this.KEYS.CURRENT_SESSION, JSON.stringify(sessionUser));
        return { success: true, user: sessionUser };
    },

    createPasswordResetRequest(identifier) {
        const user = this.getUser(identifier);
        if (!user || !user.email) {
            return { success: false, message: 'No account found for the provided details.' };
        }

        const token = String(Math.floor(100000 + Math.random() * 900000));
        const expiresAt = Date.now() + (60 * 60 * 1000); // 1 hour
        const requests = JSON.parse(localStorage.getItem(this.KEYS.PASSWORD_RESET_REQUESTS)) || [];

        const record = {
            id: token,
            token,
            otp: token,
            username: user.username,
            email: user.email,
            createdAt: new Date().toISOString(),
            expiresAt,
            used: false
        };

        requests.push(record);
        localStorage.setItem(this.KEYS.PASSWORD_RESET_REQUESTS, JSON.stringify(requests));
        return { success: true, user, token, expiresAt, request: record };
    },

    getPasswordResetRequest(token) {
        const requests = JSON.parse(localStorage.getItem(this.KEYS.PASSWORD_RESET_REQUESTS)) || [];
        return requests.find(r => r.token === token) || null;
    },

    consumePasswordResetToken(token, newPassword) {
        const requests = JSON.parse(localStorage.getItem(this.KEYS.PASSWORD_RESET_REQUESTS)) || [];
        const reqIndex = requests.findIndex(r => r.token === token);
        if (reqIndex === -1) {
            return { success: false, message: 'Invalid reset token.' };
        }

        const request = requests[reqIndex];
        if (request.used) {
            return { success: false, message: 'This reset link has already been used.' };
        }
        if (Date.now() > request.expiresAt) {
            return { success: false, message: 'This reset link has expired.' };
        }

        const users = this.getUsers();
        const userIndex = users.findIndex(u => u.username === request.username);
        if (userIndex === -1) {
            return { success: false, message: 'Associated account not found.' };
        }

        users[userIndex].password = newPassword;
        localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
        if (this.getCurrentUser() && this.getCurrentUser().username === request.username) {
            const session = this.getCurrentUser();
            localStorage.setItem(this.KEYS.CURRENT_SESSION, JSON.stringify({ ...session, ...users[userIndex] }));
        }

        requests[reqIndex].used = true;
        localStorage.setItem(this.KEYS.PASSWORD_RESET_REQUESTS, JSON.stringify(requests));
        return { success: true, user: users[userIndex] };
    },

    logout() {
        const session = this.getCurrentUser();
        if (session) {
            const lastSessionDurationMs = this._calcSessionDurationMs(session);
            this._syncAuthActivity(session, {
                lastLogoutAt: this._toIso(new Date()),
                lastSessionDurationMs,
                currentSessionStartedAt: '',
                isOnline: false
            });
        }
        localStorage.removeItem(this.KEYS.CURRENT_SESSION);
    },

    getCurrentUser() {
        return JSON.parse(localStorage.getItem(this.KEYS.CURRENT_SESSION)) || null;
    },

    deleteUser(username) {
        let users = this.getUsers();
        const userToDelete = users.find(u => u.username === username);
        users = users.filter(u => u.username !== username);
        localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
        
        // Clean applications of this user
        if (userToDelete && userToDelete.enrollment) {
            let apps = this.getApplications();
            apps = apps.filter(a => a.studentEnrollment !== userToDelete.enrollment);
            localStorage.setItem(this.KEYS.APPLICATIONS, JSON.stringify(apps));
        }
    },

    // ─── PLACEMENT DRIVES OPERATIONS ───
    getDrives() {
        return JSON.parse(localStorage.getItem(this.KEYS.DRIVES)) || [];
    },

    getDrive(id) {
        return this.getDrives().find(d => d.id === id);
    },

    addDrive(drive) {
        const drives = this.getDrives();
        drive.id = 'd' + (drives.length + 1) + '_' + Date.now();
        drive.status = drive.status || 'Open';
        drives.push(drive);
        localStorage.setItem(this.KEYS.DRIVES, JSON.stringify(drives));
        return drive;
    },

    updateDrive(updatedDrive) {
        const drives = this.getDrives();
        const index = drives.findIndex(d => d.id === updatedDrive.id);
        if (index !== -1) {
            drives[index] = updatedDrive;
            localStorage.setItem(this.KEYS.DRIVES, JSON.stringify(drives));
            return true;
        }
        return false;
    },

    deleteDrive(id) {
        let drives = this.getDrives();
        drives = drives.filter(d => d.id !== id);
        localStorage.setItem(this.KEYS.DRIVES, JSON.stringify(drives));

        // Clean applications of this drive
        let apps = this.getApplications();
        apps = apps.filter(a => a.driveId !== id);
        localStorage.setItem(this.KEYS.APPLICATIONS, JSON.stringify(apps));
    },

    // ─── JOB APPLICATION OPERATIONS ───
    getApplications() {
        return JSON.parse(localStorage.getItem(this.KEYS.APPLICATIONS)) || [];
    },

    applyForDrive(studentEnrollment, driveId) {
        const applications = this.getApplications();
        // Check if already applied
        const alreadyApplied = applications.some(a => a.studentEnrollment === studentEnrollment && a.driveId === driveId);
        if (alreadyApplied) {
            return { success: false, message: 'You have already applied for this campus drive.' };
        }

        const newApp = {
            id: 'a' + (applications.length + 1) + '_' + Date.now(),
            studentEnrollment: studentEnrollment,
            driveId: driveId,
            appliedDate: new Date().toISOString().split('T')[0],
            status: 'Applied',
            stage: 'Applied'
        };

        applications.push(newApp);
        localStorage.setItem(this.KEYS.APPLICATIONS, JSON.stringify(applications));
        return { success: true, application: newApp };
    },

    updateApplicationStatus(appId, status, stage) {
        const applications = this.getApplications();
        const index = applications.findIndex(a => a.id === appId);
        if (index !== -1) {
            applications[index].status = status;
            applications[index].stage = stage;
            localStorage.setItem(this.KEYS.APPLICATIONS, JSON.stringify(applications));
            return true;
        }
        return false;
    },

    // ─── ANNOUNCEMENTS OPERATIONS ───
    getAnnouncements() {
        return JSON.parse(localStorage.getItem(this.KEYS.ANNOUNCEMENTS)) || [];
    },

    addAnnouncement(title, message) {
        const announcements = this.getAnnouncements();
        const newAnn = {
            id: 'n' + (announcements.length + 1) + '_' + Date.now(),
            date: new Date().toISOString().split('T')[0],
            title: title,
            message: message
        };
        announcements.unshift(newAnn); // Add to beginning (latest first)
        localStorage.setItem(this.KEYS.ANNOUNCEMENTS, JSON.stringify(announcements));
        return newAnn;
    },

    deleteAnnouncement(id) {
        let announcements = this.getAnnouncements();
        announcements = announcements.filter(n => n.id !== id);
        localStorage.setItem(this.KEYS.ANNOUNCEMENTS, JSON.stringify(announcements));
    },

    // ─── SUCCESS STORIES OPERATIONS ───
    // ─── PLACED STUDENTS OPERATIONS ───
    getPlacedStudents() {
        return JSON.parse(localStorage.getItem(this.KEYS.PLACED_STUDENTS)) || [];
    },

    getPlacedStudent(id) {
        return this.getPlacedStudents().find(s => s.id === id);
    },

    addPlacedStudent(student) {
        const students = this.getPlacedStudents();
        student.id = 'ps_' + Date.now();
        student.studentPhoto = student.studentPhoto || '';
        students.unshift(student);
        localStorage.setItem(this.KEYS.PLACED_STUDENTS, JSON.stringify(students));
        return student;
    },

    updatePlacedStudent(id, updatedData) {
        const students = this.getPlacedStudents();
        const index = students.findIndex(s => s.id === id);
        if (index !== -1) {
            students[index] = { ...students[index], ...updatedData };
            localStorage.setItem(this.KEYS.PLACED_STUDENTS, JSON.stringify(students));
            return students[index];
        }
        return null;
    },

    deletePlacedStudent(id) {
        let students = this.getPlacedStudents();
        students = students.filter(s => s.id !== id);
        localStorage.setItem(this.KEYS.PLACED_STUDENTS, JSON.stringify(students));
    },

    // ─── PLACEMENT TEAM OPERATIONS ───
    getPlacementTeam() {
        return JSON.parse(localStorage.getItem(this.KEYS.PLACEMENT_TEAM)) || [];
    },

    getPlacementTeamMember(id) {
        return this.getPlacementTeam().find(m => m.id === id);
    },

    addPlacementTeamMember(member) {
        const team = this.getPlacementTeam();
        member.id = 'pt_' + Date.now();
        member.photo = member.photo || '';
        member.featured = !!member.featured;
        member.order = Number(member.order || team.length + 1);
        if (member.featured) {
            team.forEach(m => m.featured = false);
        }
        team.push(member);
        team.sort((a, b) => (Number(a.order) || 999) - (Number(b.order) || 999));
        localStorage.setItem(this.KEYS.PLACEMENT_TEAM, JSON.stringify(team));
        return member;
    },

    updatePlacementTeamMember(id, updatedData) {
        const team = this.getPlacementTeam();
        const index = team.findIndex(m => m.id === id);
        if (index !== -1) {
            if (updatedData.featured) {
                team.forEach(m => {
                    if (m.id !== id) m.featured = false;
                });
            }
            team[index] = {
                ...team[index],
                ...updatedData,
                featured: !!updatedData.featured,
                order: Number(updatedData.order || team[index].order || 999)
            };
            team.sort((a, b) => (Number(a.order) || 999) - (Number(b.order) || 999));
            localStorage.setItem(this.KEYS.PLACEMENT_TEAM, JSON.stringify(team));
            return team[index];
        }
        return null;
    },

    deletePlacementTeamMember(id) {
        let team = this.getPlacementTeam();
        team = team.filter(m => m.id !== id);
        localStorage.setItem(this.KEYS.PLACEMENT_TEAM, JSON.stringify(team));
    },

    getStories() {
        return JSON.parse(localStorage.getItem(this.KEYS.STORIES)) || [];
    },

    addStory(story) {
        const stories = this.getStories();
        story.id = 's' + (stories.length + 1) + '_' + Date.now();
        
        // If this is set to featured, make all others non-featured
        if (story.isFeatured) {
            stories.forEach(s => s.isFeatured = false);
        }

        // If this is placed in Hall of Fame, ensure no other story has the same rank
        if (story.isHallOfFame && story.rank) {
            stories.forEach(s => {
                if (s.isHallOfFame && s.rank === story.rank) {
                    s.isHallOfFame = false;
                    s.rank = '';
                }
            });
        }

        stories.push(story);
        localStorage.setItem(this.KEYS.STORIES, JSON.stringify(stories));
        return story;
    },

    deleteStory(id) {
        let stories = this.getStories();
        stories = stories.filter(s => s.id !== id);
        localStorage.setItem(this.KEYS.STORIES, JSON.stringify(stories));
    },

    updateStory(id, updatedData) {
        const stories = this.getStories();
        const index = stories.findIndex(s => s.id === id);
        if (index !== -1) {
            stories[index] = { ...stories[index], ...updatedData };
            
            // If this is set to featured, make all others non-featured
            if (updatedData.isFeatured) {
                stories.forEach((s, i) => {
                    if (i !== index) s.isFeatured = false;
                });
            }
            
            // If this is placed in Hall of Fame, ensure no other story has the same rank
            if (updatedData.isHallOfFame && updatedData.rank) {
                stories.forEach((s, i) => {
                    if (i !== index && s.isHallOfFame && s.rank === updatedData.rank) {
                        s.isHallOfFame = false;
                        s.rank = '';
                    }
                });
            }
            
            localStorage.setItem(this.KEYS.STORIES, JSON.stringify(stories));
            return stories[index];
        }
        return null;
    },

    // ─── PLACEMENT GALLERY OPERATIONS ───
    getGallery() {
        return JSON.parse(localStorage.getItem(this.KEYS.GALLERY)) || [];
    },

    addGalleryItem(item) {
        const gallery = this.getGallery();
        item.id = 'g' + (gallery.length + 1) + '_' + Date.now();
        gallery.push(item);
        localStorage.setItem(this.KEYS.GALLERY, JSON.stringify(gallery));
        return item;
    },

    deleteGalleryItem(id) {
        let gallery = this.getGallery();
        gallery = gallery.filter(g => g.id !== id);
        localStorage.setItem(this.KEYS.GALLERY, JSON.stringify(gallery));
    },

    updateGalleryItem(id, updatedData) {
        const gallery = this.getGallery();
        const index = gallery.findIndex(g => g.id === id);
        if (index !== -1) {
            gallery[index] = { ...gallery[index], ...updatedData };
            localStorage.setItem(this.KEYS.GALLERY, JSON.stringify(gallery));
            return gallery[index];
        }
        return null;
    },

    // ─── COMPANIES DIRECTORY OPERATIONS (New) ───
    getCompanies() {
        return JSON.parse(localStorage.getItem(this.KEYS.COMPANIES)) || [];
    },

    getCompany(id) {
        return this.getCompanies().find(c => c.id === id);
    },

    addCompany(company) {
        const companies = this.getCompanies();
        company.id = 'c' + (companies.length + 1) + '_' + Date.now();
        companies.push(company);
        localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(companies));
        return company;
    },

    deleteCompany(id) {
        let companies = this.getCompanies();
        companies = companies.filter(c => c.id !== id);
        localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(companies));
    },

    updateCompany(id, updatedData) {
        const companies = this.getCompanies();
        const index = companies.findIndex(c => c.id === id);
        if (index !== -1) {
            companies[index] = { ...companies[index], ...updatedData };
            localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(companies));
            return companies[index];
        }
        return null;
    },

    // Update company profile by linked username (for company self-edit)
    updateCompanyByUsername(username, updatedData) {
        const companies = this.getCompanies();
        const index = companies.findIndex(c => c.linkedUsername === username);
        if (index !== -1) {
            companies[index] = { ...companies[index], ...updatedData };
            localStorage.setItem(this.KEYS.COMPANIES, JSON.stringify(companies));
        }
        // Also save logoBase64 back into the user record
        const users = this.getUsers();
        const uIdx = users.findIndex(u => u.username === username);
        if (uIdx !== -1) {
            users[uIdx] = { ...users[uIdx], ...updatedData };
            localStorage.setItem(this.KEYS.USERS, JSON.stringify(users));
            const session = this.getCurrentUser();
            if (session && session.username === username) {
                localStorage.setItem(this.KEYS.CURRENT_SESSION, JSON.stringify({ ...session, ...users[uIdx] }));
            }
        }
        return true;
    },

    // Get company directory entry by linked username
    getCompanyByUsername(username) {
        return this.getCompanies().find(c => c.linkedUsername === username) || null;
    },

    // ─── COMPANY MAILS LOG OPERATIONS ───
    getCompanyMails() {
        return JSON.parse(localStorage.getItem(this.KEYS.COMPANY_MAILS)) || [];
    },

    addCompanyMail(mailData) {
        const mails = this.getCompanyMails();
        mailData.id = 'm_' + Date.now();
        mailData.sentAt = mailData.sentAt || new Date().toLocaleString();
        mails.push(mailData);
        localStorage.setItem(this.KEYS.COMPANY_MAILS, JSON.stringify(mails));
        return mailData;
    }
};

// Auto initialize on script load
PortalDB.init();
