// The following example creates five accessible and
// focusable markers.
function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 14,
      center: { lat: 42.31710100023048, lng: -72.64019893342778 },
    });
    // Set LatLng and title text for the markers. The first marker (Boynton Pass)
    // receives the initial focus when tab is pressed. Use arrow keys to
    // move between markers; press tab again to cycle through the map controls.

  const contentString1 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +

    '<h1 id="firstHeading" class="firstHeading">Village Hill/State Hospital</h1>' +
    '<div id="bodyContent">' +
    "<p><b>51 Village Hill Rd #3600, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir/42.3129308,-72.6270902/Villages+At+Hospital+Hill,+51+Village+Hill+Rd+%233600,+Northampton,+MA+01060/@42.3129925,-72.654628,14z/data=!3m1!4b1!4m10!4m9!1m1!4e1!1m5!1m1!1s0x89e6d77c78f9c3d1:0x8adc59cea4260f0!2m2!1d-72.646384!2d42.312471!3e1">' +
    "Directions</a> </p>" +
    "</div>" +
    "</div>";

const contentString2 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +

 '<h1 id="firstHeading" class="firstHeading">Florence Bank Station</h1>' +
    '<div id="bodyContent">' +
    "<p><b>19 Meadow Street Florence MA @ Lilly Library</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir/42.3129308,-72.6270902/Villages+At+Hospital+Hill,+51+Village+Hill+Rd+%233600,+Northampton,+MA+01060/@42.3129925,-72.654628,14z/data=!3m1!4b1!4m10!4m9!1m1!4e1!1m5!1m1!1s0x89e6d77c78f9c3d1:0x8adc59cea4260f0!2m2!1d-72.646384!2d42.312471!3e1">' +
    "Directions</a> </p>" +
    "</div>" 

 '<h1 id="firstHeading" class="firstHeading">Village Hill/State Hospital</h1>' +
    '<div id="bodyContent">' +
    "<p><b>51 Village Hill Rd #3600, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//19+Meadow+Street,+Florence,+Northampton,+Massachusetts/@42.3246157,-72.685409,13z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d7a4b49620fb:0x61153f756bd59603!2m2!1d-72.6741531!2d42.3355895!3e1">' +
    "Directions</a> </p>" +
    "</div>" 

+
    "</div>";



  const tourStops = [
    [{ lat: 42.31263094188917, lng:-72.64626991303041}, contentString1],
    [{ lat: 42.3355982502079, lng:-72.67411731294217}, contentString2],
    [{ lat: 42.31614494130486, lng: -72.63545914647698 }, "ValleyBike Share"]
   
    ];
    // Create an info window to share between markers.
    const infoWindow = new google.maps.InfoWindow();
  
    // Create the markers.
  tourStops.forEach(([position, title], i) => {
      const marker = new google.maps.Marker({
        position,
        map,
        title: `${i + 1}. ${title}`,
        //title: contentString1,
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