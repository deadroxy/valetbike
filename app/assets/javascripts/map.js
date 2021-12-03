// Initialize and add the map
function initMap() {
    // The map, centered at franklin street
    const center = { lat: 42.32549, lng: -72.643412 };
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 15,
      center: center,
    });

    //Station locations
    const jmg = { lat: 42.3193925, lng: -72.6380155 };
    const cd = { lat: 42.3303212, lng: -72.653308 };
    const northKing = { lat: 42.3410186, lng: -72.6421968 };
    const forbes = { lat: 42.3167667, lng: -72.635669 };
    const pPark = { lat: 42.3172997, lng: -72.6335812 };

    //Initialize info window

    // Markers positioned at station locations
    const jmgMarker = new google.maps.Marker({
        position: jmg,
        map: map,
    });
    const cdMarker = new google.maps.Marker({
        position: cd,
        map: map,
    });
    const northKingMarker = new google.maps.Marker({
        position: northKing,
        map: map,
    });
    const forbesMarker = new google.maps.Marker({
        position: forbes,
        map: map,
    });
    const pParkMarker = new google.maps.Marker({
        position: pPark,
        map: map,
    });
}