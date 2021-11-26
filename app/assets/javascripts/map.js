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
    "</div>" +
    "</div>";

//const contentString3 =
//    '<div id="content">' +
//    '<div id="siteNotice">' +
//    "</div>" +

// '<h1 id="firstHeading" class="firstHeading">YMCA/Child's Park</h1>' +
//    '<div id="bodyContent">' +
//    "<p><b>286 Prospect St, Northampton, MA 01060</b> <p>" +
//    '<p>Want to bike there? <a href="https://www.google.com/maps/dir/42.3129308,-72.6270902/Hampshire+Regional+YMCA,+Prospect+Street,+Northampton,+MA/@42.3212524,-72.6556153,14z/data=!3m1!4b1!4m15!4m14!1m6!3m4!1m2!1d-72.6458716!2d42.3278747!3s0x89e6d71320c58d01:0x2278225675023a2f!4e1!1m5!1m1!1s0x89e6d71475e741fb:0x602a899293ff6b1f!2m2!1d-72.6438565!2d42.328809!3e1">' +
//    "Directions</a> </p>" +
//    "</div>" +
//    "</div>";






  const tourStops = [
    [{ lat: 42.31263094188917, lng:-72.64626991303041}, contentString1],
    [{ lat: 42.3355982502079, lng:-72.67411731294217}, contentString2]
//    [{ lat: 42.328890704807414, lng:-72.64397289468107}, contentString3]

 
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