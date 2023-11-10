// Danh sách các biểu tượng FontAwesome
const icons = ['fa-regular fa-face-kiss-wink-heart', 'fa-solid fa-baby ', 'fa-solid fa-film', 'fa-solid fa-hand-holding-heart',
    'fa-solid fa-face-kiss', 'fa-solid fa-music', 'fa-solid fa-eye','fa-brands fa-gratipay','fa-solid fa-handshake-simple',
    'fa fa-gamepad','fa-regular fa-face-smile-wink','fa-regular fa-comments','fa-solid fa-comment-slash','fa-solid fa-route','fa-solid fa-people-roof ','fa-solid fa-house-chimney-window'];

// Lặp qua từng hộp
const boxes = document.querySelectorAll('.box');
boxes.forEach(box => {
    // Chọn ngẫu nhiên 3 biểu tượng
    const randomIcons = Array.from({ length: 3 }, () => icons[Math.floor(Math.random() * icons.length)]);

    // Hiển thị biểu tượng ngẫu nhiên trong hộp
    const imgUser = box.querySelector('.imgUser div');
    randomIcons.forEach(iconClass => {
        const icon = document.createElement('i');
        icon.className = `fa-solid ${iconClass}`;
        imgUser.appendChild(icon);
    });
});