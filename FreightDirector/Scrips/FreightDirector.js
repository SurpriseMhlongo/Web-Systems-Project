function togglePasswordVisibility() {
    var password = document.getElementById("MainContent_txtPassword");
    var showPassword = document.getElementById("chkSeePassword");

    if (showPassword.checked) {
        password.type = "text";
    } else {
        password.type = "password";
    }
}
window.addEventListener("load", function () {
    // Initialize the map
    var map = L.map("liveMap").setView([-33.9608, 25.6022], 13); // Port Elizabeth coordinates: latitude -33.9608, longitude 25.6022

    // Add a tile layer (e.g., OpenStreetMap) to the map
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution:
            'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
    }).addTo(map);

    // Add map markers, polygons, or other overlays as needed
    // You can customize the map to display the province boundaries or any other specific features

    // Example: Add a marker at a specific location in Port Elizabeth
    L.marker([-33.9608, 25.6022])
        .addTo(map)
        .bindPopup("Port Elizabeth, South Africa")
        .openPopup();
});
