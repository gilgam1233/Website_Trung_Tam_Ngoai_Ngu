/**
 * Template Name: iPortfolio
 * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
 * Updated: Jun 29 2024 with Bootstrap v5.3.3
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */

(function () {
    "use strict";

    document.querySelector("li.dropdown").addEventListener("click",function (){
        document.querySelector("li.dropdown div").classList.toggle("active");
        document.querySelector("li.dropdown ul").classList.toggle("dropdown-active");

    });
    /**
     * Header toggle
     */
    const headerToggleBtn = document.querySelector('.header-toggle');

    function headerToggle() {
        document.querySelector('#header').classList.toggle('header-show');
        headerToggleBtn.classList.toggle('bi-list');
        headerToggleBtn.classList.toggle('bi-x');
    }

    headerToggleBtn.addEventListener('click', headerToggle);

    /**
     * Hide mobile nav on same-page/hash links
     */
    document.querySelectorAll('#navmenu a').forEach(navmenu => {
        navmenu.addEventListener('click', () => {
            if (document.querySelector('.header-show')) {
                headerToggle();
            }
        });

    });

    /**
     * Toggle mobile nav dropdowns
     */
    document.querySelectorAll('.navmenu .toggle-dropdown').forEach(navmenu => {
        navmenu.addEventListener('click', function (e) {
            e.preventDefault();
            this.parentNode.classList.toggle('active');
            this.parentNode.nextElementSibling.classList.toggle('dropdown-active');
            e.stopImmediatePropagation();
        });
    });

    /**
     * Preloader
     */
    const preloader = document.querySelector('#preloader');
    if (preloader) {
        window.addEventListener('load', () => {
            preloader.remove();
        });
    }

    /**
     * Scroll top button
     */
    let scrollTop = document.querySelector('.scroll-top');

    function toggleScrollTop() {
        if (scrollTop) {
            window.scrollY > 100 ? scrollTop.classList.add('active') : scrollTop.classList.remove('active');
        }
    }

    scrollTop.addEventListener('click', (e) => {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    window.addEventListener('load', toggleScrollTop);
    document.addEventListener('scroll', toggleScrollTop);

    /**
     * Animation on scroll function and init
     */
    function aosInit() {
        AOS.init({
            duration: 600,
            easing: 'ease-in-out',
            once: true,
            mirror: false
        });
    }

    window.addEventListener('load', aosInit);

    /**
     * Init typed.js
     */
    const selectTyped = document.querySelector('.typed');
    if (selectTyped) {
        let typed_strings = selectTyped.getAttribute('data-typed-items');
        typed_strings = typed_strings.split(',');
        new Typed('.typed', {
            strings: typed_strings,
            loop: true,
            typeSpeed: 100,
            backSpeed: 50,
            backDelay: 2000
        });
    }

    /**
     * Initiate Pure Counter
     */
    new PureCounter();

    /**
     * Animate the skills items on reveal
     */
    let skillsAnimation = document.querySelectorAll('.skills-animation');
    skillsAnimation.forEach((item) => {
        new Waypoint({
            element: item,
            offset: '80%',
            handler: function (direction) {
                let progress = item.querySelectorAll('.progress .progress-bar');
                progress.forEach(el => {
                    el.style.width = el.getAttribute('aria-valuenow') + '%';
                });
            }
        });
    });

    /**
     * Initiate glightbox
     */
    const glightbox = GLightbox({
        selector: '.glightbox'
    });

    /**
     * Init isotope layout and filters
     */
    document.querySelectorAll('.isotope-layout').forEach(function (isotopeItem) {
        let layout = isotopeItem.getAttribute('data-layout') ?? 'masonry';
        let filter = isotopeItem.getAttribute('data-default-filter') ?? '*';
        let sort = isotopeItem.getAttribute('data-sort') ?? 'original-order';

        let initIsotope;
        imagesLoaded(isotopeItem.querySelector('.isotope-container'), function () {
            initIsotope = new Isotope(isotopeItem.querySelector('.isotope-container'), {
                itemSelector: '.isotope-item',
                layoutMode: layout,
                filter: filter,
                sortBy: sort
            });
        });

        isotopeItem.querySelectorAll('.isotope-filters li').forEach(function (filters) {
            filters.addEventListener('click', function () {
                isotopeItem.querySelector('.isotope-filters .filter-active').classList.remove('filter-active');
                this.classList.add('filter-active');
                initIsotope.arrange({
                    filter: this.getAttribute('data-filter')
                });
                if (typeof aosInit === 'function') {
                    aosInit();
                }
            }, false);
        });

    });

    /**
     * Init swiper sliders
     */
    function initSwiper() {
        document.querySelectorAll(".init-swiper").forEach(function (swiperElement) {
            let config = JSON.parse(
                swiperElement.querySelector(".swiper-config").innerHTML.trim()
            );

            if (swiperElement.classList.contains("swiper-tab")) {
                initSwiperWithCustomPagination(swiperElement, config);
            } else {
                new Swiper(swiperElement, config);
            }
        });
    }

    window.addEventListener("load", initSwiper);

    /**
     * Correct scrolling position upon page load for URLs containing hash links.
     */
    window.addEventListener('load', function (e) {
        if (window.location.hash) {
            if (document.querySelector(window.location.hash)) {
                setTimeout(() => {
                    let section = document.querySelector(window.location.hash);
                    let scrollMarginTop = getComputedStyle(section).scrollMarginTop;
                    window.scrollTo({
                        top: section.offsetTop - parseInt(scrollMarginTop),
                        behavior: 'smooth'
                    });
                }, 100);
            }
        }
    });

    /**
     * Navmenu Scrollspy
     */
    let navmenulinks = document.querySelectorAll('.navmenu a');

    function navmenuScrollspy() {
        navmenulinks.forEach(navmenulink => {
            if (!navmenulink.hash) return;
            let section = document.querySelector(navmenulink.hash);
            if (!section) return;
            let position = window.scrollY + 200;
            if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
                document.querySelectorAll('.navmenu a.active').forEach(link => link.classList.remove('active'));
                navmenulink.classList.add('active');
            } else {
                navmenulink.classList.remove('active');
            }
        })
    }

    window.addEventListener('load', navmenuScrollspy);
    document.addEventListener('scroll', navmenuScrollspy);

})();

document.addEventListener("DOMContentLoaded", function () {

    // --- 1. XỬ LÝ CHECK ALL ---
    let checkAll = document.getElementById("checkAll");
    if (checkAll) {
        checkAll.addEventListener("click", function () {
            let cb_select = document.getElementsByClassName("cb_class");
            var is_checked = this.checked;
            for (var checkbox of cb_select)
                checkbox.checked = is_checked;
        });
    }

    // --- 2. XỬ LÝ NHẬP ĐIỂM (VALIDATE & ĐỒNG BỘ) ---
    let score_cells = document.querySelectorAll(".score-cell"); // Dùng querySelectorAll chuẩn hơn

    score_cells.forEach(cell => {
        cell.addEventListener("keydown", function (e) {
            let allowed_Keys = ["Backspace", "Delete", "Tab", "ArrowLeft", "ArrowRight", "Enter", "."];
            if (!/^[0-9]$/.test(e.key) && !allowed_Keys.includes(e.key)) e.preventDefault();
            if (e.key == "." && this.innerText.includes(".")) e.preventDefault();
            if (e.key === "Enter") {
                e.preventDefault();
                this.blur();
            }
        });

        cell.addEventListener("input", function (e) {
            let text = this.innerText;
            let point = parseFloat(text);

            if (text.length > 4) {
                this.innerText = text.slice(0, 4);
                point = parseFloat(this.innerText);
            }

            if (point > 10) {
                this.innerText = "10";
            } else if (point < 0) {
                this.innerText = "0";
            }

            dong_bo_hoa_diem(this);
        });
    });

    // --- 3. XỬ LÝ TÌM KIẾM ---
    let searchInput = document.getElementById("NameSearch");
    if (searchInput) {
        searchInput.addEventListener("input", function () {
            let rows = document.querySelectorAll(".my_rows"); // Đảm bảo TR có class my_rows
            let text = this.value.toLowerCase();
            rows.forEach(row => {
                if (row && row.cells[2]) {
                    let cellText = row.cells[2].innerText.toLowerCase();
                    if (!cellText.includes(text)) row.classList.add("d-none");
                    else row.classList.remove("d-none");
                }
            });
        });
    }

    // --- 4. XỬ LÝ ĐIỂM DANH (RADIO BUTTON) ---
    let attend_cb = document.querySelectorAll(".cb_attend");
    attend_cb.forEach(item => {
        item.addEventListener("change", function (e) {
            dong_bo_hoa_diem_danh(e.target);
        });
    });

});


// --- CÁC HÀM HỖ TRỢ (Functions) ---

// Hàm đồng bộ điểm (Batch Edit)
function dong_bo_hoa_diem(sourceCell) {
    let sourceRow = sourceCell.closest('tr');
    let sourceCheckbox = sourceRow.querySelector('.cb_class');

    if (!sourceCheckbox || !sourceCheckbox.checked) return;

    let columnIndex = sourceCell.cellIndex;
    let newValue = sourceCell.innerText;

    let checkedBoxes = document.querySelectorAll('.cb_class:checked');

    checkedBoxes.forEach(checkbox => {
        let targetRow = checkbox.closest('tr');
        if (targetRow !== sourceRow) {
            let targetCell = targetRow.cells[columnIndex];
            if (targetCell && targetCell.classList.contains('score-cell')) {
                targetCell.innerText = newValue;
                targetCell.classList.add('bg-warning-sub');
                setTimeout(() => targetCell.classList.remove('bg-warning-sub'), 300);
            }
        }
    });
}

// Hàm đồng bộ điểm danh
function dong_bo_hoa_diem_danh(sourceInput) { // Nhận input, không phải cell
    let sourceRow = sourceInput.closest('tr');

    let last_source_row = sourceRow.lastElementChild; // Lấy ô cuối cùng
    last_source_row.innerText = "Đã điểm danh";

    let sourceCheckbox = sourceRow.querySelector('.cb_class');
    if (!sourceCheckbox || !sourceCheckbox.checked) return;

    let sourceCell = sourceInput.closest('td');
    let columnIndex = sourceCell.cellIndex;
    let isChecked = sourceInput.checked; // Lấy trạng thái checked

    let checkedBoxes = document.querySelectorAll('.cb_class:checked');

    checkedBoxes.forEach(checkbox => {
        let targetRow = checkbox.closest('tr');
        if (targetRow !== sourceRow) {

            let targetCell = targetRow.cells[columnIndex];

            let input = targetCell.querySelector("input");
            if (input) {
                input.checked = isChecked;

                targetRow.lastElementChild.innerText = "Đã điểm danh";

                targetCell.classList.add('bg-warning-sub');
                setTimeout(() => targetCell.classList.remove('bg-warning-sub'), 300);
            }
        }
    });
}


// --- PHẦN GỬI DỮ LIỆU ---

// 1. Đóng gói dữ liệu
function package_data_to_json() {
    let data_package = [];

    let rows = document.querySelectorAll("tbody tr.diem");

    rows.forEach(row => {
        let cb = row.querySelector(".cb_class");

        let enroll_id = cb.value;
        let student_scores = [];

        let score_cells = row.querySelectorAll(".data-score");

        score_cells.forEach(score => {
            let grade_id = score.getAttribute("data-grade-id");
            let score_text = score.innerText;

            if (score_text !== "") {
                student_scores.push({
                    grade_id: grade_id,
                    score: parseFloat(score_text)
                });
            }
        });

        let student_data = {
            enrollment_id: enroll_id,
            scores: student_scores
        };

        data_package.push(student_data);
    });
    return data_package;
}

// 2. Gửi đi (Hàm này được gọi từ onclick trong HTML)
function save_grades_to_server(class_id) {
    let raw_data = package_data_to_json();

    fetch(`/LopGiangDay/${class_id}/NhapDiem/save`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(raw_data)
    })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                showSuccessPopup("Lưu Thành công!", 'Bạn đã lưu thành công');
                setTimeout(() => location.reload(), 2000);

            } else {
                showFailPopup('Lưu Thất Bại!', 'Bạn lưu không thành công');
            }
        })
}

function package_data_to_json_2() {
    let data_package = [];
    let rows = document.querySelectorAll("tbody tr.diem_danh");

    for (let row of rows) {
        let cb = row.querySelector(".cb_class");

        let enroll_id = cb.value;

        let radio_button = row.querySelector("input[type ='radio']:checked");

        if (!radio_button) {
            let student_name = row.cells[2] ? row.cells[2].innerText : "Học viên";
            popWarning("Chú ý", `Vui lòng điểm danh cho ${student_name}`);
            return [];
        }

        let status = radio_button.value;

        let note = "";

        if (status.includes("ABSENT_EXCUSED")) {
            note = "Có phép";
        } else if (status.includes("ABSENT_UNEXCUSED")) {
            note = "Không phép";
        }

        status = status.replace(/_.*/,"");


        let attend_data = {enrollment_id: enroll_id, status: status, note: note};

        data_package.push(attend_data);


    }

    return data_package;

}

function save_grades_to_server_2(class_id) {
    let raw_data = package_data_to_json_2();

    if (raw_data.length <= 0)
        return;

    let data_time = document.getElementById("date_pick").value;
    if (data_time==="") {
        let today = new Date();

        let yyyy = today.getFullYear();

        let mm = String(today.getMonth() + 1).padStart(2, '0');
        let dd = String(today.getDate()).padStart(2, '0');

        data_time = `${yyyy}-${mm}-${dd}`;
    }

    let final_data = {
        "date": {
            'date': data_time
        },
        "attend_data": raw_data
    };

    fetch(`/LopGiangDay/${class_id}/DiemDanh/save`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(final_data)
    })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                showSuccessPopup("Lưu Thành công!", 'Bạn đã lưu thành công');
                setTimeout(() => location.reload(), 2000);

            } else {
                showFailPopup('Lưu Thất Bại!', 'Bạn lưu không thành công');
            }
        })
}

function showSuccessPopup(title, text) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'success',
        showConfirmButton: false,
        timer: 1500               // Tự tắt sau 1.5 giây
    });
}

function showFailPopup(title, text) {
    Swal.fire({
        title: title,
        text: text,
        icon: 'error',
        showConfirmButton: false,
        timer: 1500               // Tự tắt sau 1.5 giây
    });
}

function popWarning(title, text) {
    Swal.fire({
        icon: 'warning',
        title: title,
        text: text
    });
}