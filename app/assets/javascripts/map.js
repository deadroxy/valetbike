// The following example creates five accessible and
// focusable markers.
function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 15,
      center: { lat: 42.31710100023048, lng: -72.64019893342778 },
    });
    // Set LatLng and title text for the markers. The first marker (Boynton Pass)
    // receives the initial focus when tab is pressed. Use arrow keys to
    // move between markers; press tab again to cycle through the map controls.
  const contentString1 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
    '<h1 id="firstHeading" class="firstHeading">Music Academy Station</h1>' +
    '<div id="bodyContent">' +
    "<p><b>Music Academy</b> <p>" +
    '<p>want to go there? <a href="https://www.google.com/maps/place/42%C2%B019\'04.4%22N+72%C2%B038\'00.3%22W/@42.3184578,-72.6348208,21z/data=!4m5!3m4!1s0x0:0xb7172666928fc1f4!8m2!3d42.3178889!4d-72.6334167">' +
    "navigate</a> </p>" +
    "</div>" +
    "</div>";
  const tourStops = [
    [{ lat: 42.31790004551642, lng: -72.63340923034824 }, "ValleyBike Share"],
      [{ lat: 42.31614494130486, lng: -72.63545914647698 }, "ValleyBike Share"],
      [{ lat: 42.32029329055504, lng: -72.63977475937963 }, "ValleyBike Share"],
    ];
    // Create an info window to share between markers.
    const infoWindow = new google.maps.InfoWindow();
  
    // Create the markers.
  tourStops.forEach(([position, title], i) => {
      const marker = new google.maps.Marker({
        position,
        map,
        //title: `${i + 1}. ${title}`,
        title: contentString1,
        label: `${i + 1}`,
        optimized: false,
      });
  
      // Add a click listener for each marker, and set up the info window.
      marker.addListener("click", () => {
        infoWindow.close();
        infoWindow.setContent(marker.getTitle());

        infoWindow.open(marker.getMap(), marker);
      });
    });
  }