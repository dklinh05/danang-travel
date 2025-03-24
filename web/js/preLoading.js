document.addEventListener("DOMContentLoaded", function () {
    // Check if preloading has already been done
    if (!sessionStorage.getItem("preloaderDone")) {
        setTimeout(function () {
            document.body.classList.add("fade-out");
            setTimeout(function () {
                sessionStorage.setItem("preloaderDone", "true");
                window.location.href = "home.jsp"; // Redirect to home page
            }, 2000); // Matches the fade-out duration
        }, 15000); // Shows animation for 3 seconds before redirecting
    }
});
