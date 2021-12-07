// The following code creates accessible and focusable markers.
function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 14,
      center: { lat: 42.31710100023048, lng: -72.64019893342778 },
    });
    // Set LatLng and title text for the markers. The first marker
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
      '<a href="http://127.0.0.1:3000/bikes/show?id=7">' +
      "Click to borrow a bike there!</a>" +
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
    '<a href="http://127.0.0.1:3000/bikes/show?id=1">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString3 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">YMCA | Child &#146;s Park</h1>' +
    '<div id="bodyContent">' +
    "<p><b>286 Prospect St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir/42.3129308,-72.6270902/Hampshire+Regional+YMCA,+Prospect+Street,+Northampton,+MA/@42.3212524,-72.6556153,14z/data=!3m1!4b1!4m15!4m14!1m6!3m4!1m2!1d-72.6458716!2d42.3278747!3s0x89e6d71320c58d01:0x2278225675023a2f!4e1!1m5!1m1!1s0x89e6d71475e741fb:0x602a899293ff6b1f!2m2!1d-72.6438565!2d42.328809!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=14">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString4 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Forbes Library</h1>' +
    '<div id="bodyContent">' +
    "<p><b>20 West Street Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//20+West+St,+Northampton,+MA+01060/@42.3166597,-72.6379613,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d743aab65e8f:0xfc8b8552533d9406!2m2!1d-72.6357673!2d42.3166597!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=9">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString5 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Florence Center</h1>' +
    '<div id="bodyContent">' +
    "<p><b>31 Main Street Florence, MA 01062</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//31+Main+St,+Florence,+MA+01062/@42.3351375,-72.6701993,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d7a69f18bf99:0x6659b1724f13b6fa!2m2!1d-72.6680099!2d42.3350461!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=2">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString6 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Cooley Dickinson Health Care</h1>' +
    '<div id="bodyContent">' +
    "<p><b>51 Locust Street Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//51+Locust+St,+Northampton,+MA+01060/@42.3321332,-72.6583459,16z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d70e85eda353:0xd9d50e44086d5152!2m2!1d-72.6539678!2d42.3320418!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=4">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString7 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">John M. Greene Hall | Smith College</h1>' +
    '<div id="bodyContent">' +
    "<p><b>1 Chapin Way, Northampton, MA 01063</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//1+Chapin+Way,+Northampton,+MA+01063/@42.3192209,-72.6392303,18z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d742036bcc17:0xbe13d60c0951cf97!2m2!1d-72.638136!2d42.319217!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=8">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString8 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Pulaski Park | Downtown</h1>' +
    '<div id="bodyContent">' +
    "<p><b>274 Main St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//274+Main+Street,+Northampton,+MA/@42.3175082,-72.6336407,19z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d743f17e598f:0x63113e31c988a52d!2m2!1d-72.6334449!2d42.3179763!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=10">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString9 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Northampton Train Station</h1>' +
    '<div id="bodyContent">' +
    "<p><b>170 Pleasant St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//170+Pleasant+St,+Northampton,+MA+01060/@42.318001,-72.6296722,17z/data=!3m1!4b1!4m9!4m8!1m0!1m5!1m1!1s0x89e6d7460654a769:0x224e9dc5342e92aa!2m2!1d-72.6274835!2d42.318001!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=12">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString10 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">State Street | Mass Central Rail Trail</h1>' +
    '<div id="bodyContent">' +
    "<p><b>51 State St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//51+State+St,+Northampton,+MA+01060/@42.3194805,-72.7040513,12z/data=!3m1!4b1!4m9!4m8!1m0!1m5!1m1!1s0x89e6d7415c9bb88d:0x644c3e247b283bc2!2m2!1d-72.6340118!2d42.3193749!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=5">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString11 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Jackson Street</h1>' +
    '<div id="bodyContent">' +
    "<p><b>7A-7D, Jackson St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//7A-7D,+Jackson+St,+Northampton,+MA+01060/@42.3374375,-72.6465779,16z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d71904f42fe7:0xe3000e6c3122510f!2m2!1d-72.6421998!2d42.3373461!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=3">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString12 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Main Street | Court House</h1>' +
    '<div id="bodyContent">' +
    "<p><b>99 Main St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//99+Main+Street,+Northampton,+Massachusetts/@42.3196073,-72.6481035,14z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89e6d746f2bd97af:0xb07ad77a59514112!2m2!1d-72.6305933!2d42.319515!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=11">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";
const contentString13 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Main Street | Bridge Street</h1>' +
    '<div id="bodyContent">' +
    "<p><b>1 Bridge St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//1+Bridge+Street,+Northampton,+Massachusetts/@42.3205769,-72.6981381,12z/data=!3m1!4b1!4m9!4m8!1m0!1m5!1m1!1s0x89e6d747cb70de59:0x221c8f91176e448b!2m2!1d-72.6280986!2d42.3204713!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=13">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";

const contentString14 =
    '<div id="content">' +
    '<div id="siteNotice">' +
    "</div>" +
 '<h1 id="firstHeading" class="firstHeading">Northampton High School</h1>' +
    '<div id="bodyContent">' +
    "<p><b>380 Elm St, Northampton, MA 01060</b> <p>" +
    '<p>Want to bike there? <a href="https://www.google.com/maps/dir//380+Elm+St,+Northampton,+MA+01060/@42.3252375,-72.7204042,12z/data=!3m1!4b1!4m9!4m8!1m0!1m5!1m1!1s0x89e6d76d5efe026b:0x5bcca296de8946a1!2m2!1d-72.6503647!2d42.3251319!3e1">' +
    "Directions</a> </p>" +
    '<a href="http://127.0.0.1:3000/bikes/show?id=6">' +
    "Click to borrow a bike there!</a>" +
    "</div>" +
    "</div>";


  const tourStops = [
    [{ lat: 42.31263094188917, lng:-72.64626991303041}, contentString1],
    [{ lat: 42.3355982502079, lng:-72.67411731294217}, contentString2],
    [{ lat: 42.328890704807414, lng:-72.64397289468107}, contentString3],
    [{ lat: 42.31673504457649, lng: -72.63572969788336}, contentString4],
    [{ lat: 42.3351255742893, lng:-72.66796768225697}, contentString5],
    [{ lat: 42.33206177679046, lng:-72.65401141616972}, contentString6],
    [{ lat: 42.319226879685196, lng:-72.63812527161441}, contentString7],
    [{ lat: 42.31799114258868, lng:-72.63344221696039}, contentString8],
    [{ lat: 42.318036656593904, lng:-72.6274405838333}, contentString9],
    [{ lat: 42.319474210276816, lng:-72.63390554035252}, contentString10],
    [{ lat: 42.33733432048976, lng:-72.6422649093941}, contentString11],
    [{ lat: 42.31961431606804, lng:-72.63057253762075}, contentString12],
    [{ lat: 42.31992096982576, lng:-72.62809950989272}, contentString13],
    [{ lat: 42.32559736474387, lng:-72.6510511727453}, contentString14]
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
