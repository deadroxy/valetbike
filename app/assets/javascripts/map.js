// Initialize and add the map
function initMap() {
    // The map, centered at franklin street
    const center = { lat: 42.32549, lng: -72.643412 };
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 12,
      center: center,
    });


    //Station locations
    const jmg = { lat: 42.3193925, lng: -72.6380155 };
    const cd = { lat: 42.3303212, lng: -72.653308 };
    const northKing = { lat: 42.3410186, lng: -72.6421968 };
    const pPark = { lat: 42.3172997, lng: -72.6335812 };
    const villageHospital = { lat: 42.329574, lng: -72.662636 };
    const northamptonTrain = { lat: 42.34973, lng: 	-72.69841 };
    const conzStreet = { lat: 42.31358	, lng: 	-72.62751 };
     
    //Initialize info window
    //Skull
    var dead_icon = {
        url: 'https://cdn.iconscout.com/icon/premium/png-256-thumb/skull-602-897307.png',
        scaledSize: new google.maps.Size(50,50),
    }
    //Heart
    var alive_icon = {
        url: 'https://cdn2.iconfinder.com/data/icons/happy-valentines-day-2/64/valentine_heart_love_pin_map_pointer_location-512.png',
        scaledSize: new google.maps.Size(50,50),
    }
    //Green
    var all_bike_present_alive  = {
        url: 'http://iconsetc.com/icons-watermarks/simple-green/bfa/bfa_map-marker/bfa_map-marker_simple-green_512x512.png',
        scaledSize: new google.maps.Size(40,40),
    }
    //Purple
    var all_bike_present_charging = {
        url: 'http://iconsetc.com/icons-watermarks/simple-purple/bfa/bfa_map-marker/bfa_map-marker_simple-purple_512x512.png',
        scaledSize:  new google.maps.Size(40,40),
    }
    //Gray
    var require_credit_card = {
        url: 'http://iconsetc.com/icons-watermarks/simple-light-gray/bfa/bfa_map-marker/bfa_map-marker_simple-light-gray_512x512.png',
        scaledSize: new google.maps.Size(40,40),
    }
    //Black
    var all_missing_bike = {
        url: 'https://icons.veryicon.com/png/128/miscellaneous/font-awesome-1/map-marker-17.png',
        scaledSize: new google.maps.Size(40,40),
    }
  

    // Markers positioned at station locations
    const jmgMarker = new google.maps.Marker({
        position: jmg,
        map: map,
        icon: all_bike_present_charging,

    });

    const cdMarker = new google.maps.Marker({
        position: cd,
        map: map,
        icon: all_bike_present_alive,
        
    });
    const northKingMarker = new google.maps.Marker({
        position: northKing,
        map: map,
        icon: dead_icon ,
    });
   
    const pParkMarker = new google.maps.Marker({
        position: pPark,
        map: map,
        icon: all_missing_bike,
    });
    const villageHospitalMarker = new google.maps.Marker({
        position: villageHospital,
        map: map,
        icon: require_credit_card,
    })
    const northamptonTrainMarker = new google.maps.Marker({
        position: northamptonTrain,
        map: map,
        icon: alive_icon,
    })

    const conzStreetMarker =  new google.maps.Marker({
        position: conzStreet,
        map: map,
        icon: require_credit_card,
    })


}