$(document).ready(function () {
    /* ================================
     1) SMOOTH FADE-IN ON LOAD
     =================================*/
    $(".fade-in").each(function (i) {
        const $elem = $(this);
        setTimeout(() => {
            $elem.addClass("visible");
        }, 150 * i);
    });

    /* ================================
     2) DEBOUNCE UTILITY
     =================================*/
    function debounce(func, wait, immediate) {
        let timeout;
        return function () {
            const context = this, args = arguments;
            const later = function () {
                timeout = null;
                if (!immediate)
                    func.apply(context, args);
            };
            const callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow)
                func.apply(context, args);
        };
    }

    /* ================================
     3) PARALLAX EFFECT FOR BODY BACKGROUND
     - This maps the scroll percentage to a vertical background position.
     =================================*/
    $(window).on("scroll", debounce(function () {
        const scrollTop = $(window).scrollTop();
        const docHeight = $(document).height();
        const winHeight = $(window).height();
        // Calculate the percentage of the page scrolled (from 0 to 1)
        const scrollPercent = scrollTop / (docHeight - winHeight);
        // Map scroll percentage to a value from 0% (top) to 100% (bottom)
        $("body").css("background-position", "center " + (scrollPercent * 100) + "%");
    }, 20));

    /* ================================
     4) SLIDE-IN EFFECT ON SCROLL
     =================================*/
    function handleSlideIn() {
        $(".slide-in").each(function () {
            const $elem = $(this);
            const elemTop = $elem.offset().top;
            const windowBottom = $(window).scrollTop() + $(window).height() - 50;
            if (windowBottom > elemTop) {
                $elem.addClass("visible");
            }
        });
    }
    $(window).on("scroll", debounce(handleSlideIn, 20));
    handleSlideIn(); // Run on load

    /* ================================
     5) PAGINATION WITH BLANK ROWS (6 rows per page)
     =================================*/
    function paginate(tableId, pageSize) {
        const $table = $("#" + tableId + " tbody");
        const $rows = $table.find("tr");
        const totalRows = $rows.length;
        const totalPages = Math.ceil(totalRows / pageSize);

        // Skip pagination if only one page is needed
        if (totalPages <= 1)
            return;

        function showPage(page) {
            // Remove any previously added blank rows
            $table.find("tr.blank-row").remove();

            $rows.hide();
            const startIndex = (page - 1) * pageSize;
            const endIndex = page * pageSize;
            const visibleRows = $rows.slice(startIndex, endIndex).fadeIn(300);

            // Append blank rows if there are fewer than pageSize rows visible
            const visibleCount = visibleRows.length;
            const blanksNeeded = pageSize - visibleCount;
            if (blanksNeeded > 0) {
                const colCount = $("#" + tableId + " thead tr th").length;
                for (let i = 0; i < blanksNeeded; i++) {
                    let blankRow = $("<tr class='blank-row'></tr>");
                    for (let j = 0; j < colCount; j++) {
                        blankRow.append("<td>&nbsp;</td>");
                    }
                    $table.append(blankRow);
                }
            }

            // Update active pagination button
            $(".pagination-" + tableId + " li").removeClass("active");
            $(".pagination-" + tableId + " li").eq(page - 1).addClass("active");
        }

        let paginationHtml = `<ul class="pagination pagination-sm pagination-${tableId}">`;
        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<li class="page-item"><a class="page-link" href="#">${i}</a></li>`;
        }
        paginationHtml += "</ul>";

        $("#" + tableId + "-pagination").html(paginationHtml);
        $(".pagination-" + tableId + " li:first").addClass("active");

        $(".pagination-" + tableId + " a").click(function (e) {
            e.preventDefault();
            const pageNum = parseInt($(this).text());
            showPage(pageNum);
        });

        showPage(1);
    }

    // Initialize pagination for each table (6 rows per page)
    paginate("usersTable", 6);
    paginate("toursTable", 6);
    paginate("bookingsTable", 6);
});
