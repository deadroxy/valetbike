// <!--  map base from: https://github.com/CJParkNW/valetbike/commit/f21be0e9c3e0b2a8e1dedffefbc207081902027b-->
var map = L.map('map').setView([42.325, -72.65], 14);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'}).addTo(map);

L.marker([42.32389, -72.652456]).addTo(map) // Northampton High School, id: 33
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Northampton High School</a>`);

L.marker([42.326006, -72.633722]).addTo(map) // Florence Bank, id: 21
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Florence Bank</a>`);
//   <%= currentStation = Station.find(2)%>

L.marker([42.335004, -72.668044]).addTo(map) // Florence Center, id: 24
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Florence Center</a>`);

L.marker([42.3333863,-72.6444547]).addTo(map) // Jackson Street, id: 30
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Jackson Street</a>`);

L.marker([42.3301763,-72.6532651]).addTo(map) // Cooley Dickinson Health Care, id: 25
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Cooley Dickinson Health Care</a>`);

L.marker([42.32840354424434,-72.63562490130583]).addTo(map) // State St/Mass Central Rail Trail, id: 29
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">State St/Mass Central Rail Trail</a>`);

L.marker([42.311479197759276,-72.6485510604438]).addTo(map) // Village Hill/State Hospital, id: 20
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Village Hill/State Hospital</a>`);

L.marker([42.3193925,-72.6380155]).addTo(map) // John M Greene Hall/Smith College, id: 26
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">John M Greene Hall/Smith College</a>`);

L.marker([42.3167667,-72.635669]).addTo(map) // Forbes Library, id: 33
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Forbes Library</a>`);

L.marker([42.3172144,-72.6331127]).addTo(map) // Pulaski Park/Downtown, id: 27
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Pulaski Park/Downtown</a>`);

L.marker([42.319591208562485,-72.63059154099119]).addTo(map) // Main Street/Court House, id: 31
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Main Street/Court House</a>`);

L.marker([42.31812401594358,-72.62745705957104]).addTo(map) // Northampton Train Station, id: 28
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Northampton Train Station</a>`);

L.marker([42.320536,-72.628275]).addTo(map) // Main Street/Bridge Street, id: 32
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">Main Street/Bridge Street</a>`);

L.marker([42.32884244853771,-72.64408615938571]).addTo(map) // YMCA/Childs Park, id: 22
    .bindPopup(`<a href="/rent" rel="noopener noreferrer">YMCA/Childs Park</a>`);