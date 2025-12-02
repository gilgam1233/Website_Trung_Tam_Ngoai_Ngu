/**
 * Template Name: iPortfolio
 * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
 * Updated: Jun 29 2024 with Bootstrap v5.3.3
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */

(function () {
    "use strict";

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

    let cb_select = document.getElementsByClassName("cb_class");

    document.getElementById("checkAll").addEventListener("click", function () {

        var is_checked = this.checked;
        for (var checkbox of cb_select)
            checkbox.checked = is_checked;
    });

    let score_cell = document.getElementsByClassName("score-cell");

    for (let i = 0; i < score_cell.length; i++) {
        score_cell[i].addEventListener("keydown", function (e) {
            let allowed_Keys = ["Backspace", "Delete", "Tab",
                "ArrowLeft", "ArrowRight", "."];
            if (!/^[0-9]$/.test(e.key) && !allowed_Keys.includes(e.key))
                e.preventDefault();

            if (e.key == "." && this.innerText.includes("."))
                e.preventDefault();

        });

        score_cell[i].addEventListener("input", function (e) {
            let text = this.innerText;
            let point = parseFloat(text);

            if (text.length > 4) {
                this.innerText = text.slice(0, 4);
                point = parseFloat(this.innerText);
            }

            if (point > 10)
                this.innerText = "10";
            else if (point < 0)
                this.innerText = "0";

            let current_cell = e.target;
            dong_bo_hoa_diem(current_cell);
        });

    }


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
                targetCell.innerText = newValue;
                targetCell.classList.add('bg-warning-sub');
                setTimeout(() => targetCell.classList.remove('bg-warning-sub'), 300);
            }
        });
    }

    document.getElementById("NameSearch").addEventListener("input", function () {
        let rows = document.querySelectorAll(".my_rows");
        let text = this.value.toLowerCase();
        rows.forEach(row => {

           if (row && row.cells[2])
           {
                let cellText = row.cells[2].innerText.toLowerCase();

            if (!cellText.includes(text))
                row.classList.add("d-none");
            else
                row.classList.remove("d-none");
           }
        });
    });

    let attend_cb = document.querySelectorAll(".cb_attend");
    attend_cb.forEach(item => {
        item.addEventListener("change",function (e){
        dong_bo_hoa_diem_danh(e.target);
        });
    });


    function dong_bo_hoa_diem_danh(sourceCell) {
        let sourceRow = sourceCell.closest('tr');

        let sourceCheckbox = sourceRow.querySelector('.cb_class');

        if (!sourceCheckbox || !sourceCheckbox.checked) return;

        let sourceInput = sourceCell.closest('td');
        let columnIndex = sourceInput.cellIndex;
        let checked = sourceCell.checked;

        let checkedBoxes = document.querySelectorAll('.cb_class:checked');

        checkedBoxes.forEach(checkbox => {
            let targetRow = checkbox.closest('tr');

            if (targetRow !== sourceRow) {

                let targetCell = targetRow.cells[columnIndex];
                let input = targetCell.querySelector("input");
                input.checked = checked;
                targetCell.classList.add('bg-warning-sub');
                setTimeout(() => targetCell.classList.remove('bg-warning-sub'), 300);
            }
        });
    }

})();