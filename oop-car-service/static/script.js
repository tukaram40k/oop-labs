function refreshPage() {
    setTimeout(() => {
        location.reload();
    }, 500);
}
document.addEventListener('DOMContentLoaded', refreshPage);