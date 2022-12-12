//= require jquery

// Making sure document is ready before manipulation
$( document ).ready(function() {
  //initializing our map connected to div map in application and css
  var map = L.map('map').setView([42.325674, 	-72.660008], 14);

  //creating the "map" visual layer using openstreetmap
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(map);


  // gets data from the JSON on the station controller through the URL (a route in config) and then loads the markers
  $.ajax({
      type: 'GET',
      url: 'home/map',
      dataType: 'json',
      success: LoadMarkers
  });

  //had to add svg code into this file in order to be able to use divIcon as it needed to be a string. 
  bikeSVGCode = `<?xml version="1.0" encoding="UTF-8" standalone="no"?>
  <!-- Created with Inkscape (http://www.inkscape.org/) -->
  
  <svg
     xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:cc="http://creativecommons.org/ns#"
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:svg="http://www.w3.org/2000/svg"
     xmlns="http://www.w3.org/2000/svg"
     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
     id="svg2"
     version="1.1"
     inkscape:version="0.48.3.1 r9886"
     width="1024"
     height="602"
     sodipodi:docname="bicycle.svg">
    <metadata
       id="metadata8">
      <rdf:RDF>
        <cc:Work
           rdf:about="">
          <dc:format>image/svg+xml</dc:format>
          <dc:type
             rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
          <dc:title></dc:title>
        </cc:Work>
      </rdf:RDF>
    </metadata>
    <defs
       id="defs6" />
    <sodipodi:namedview
       pagecolor="#ffffff"
       bordercolor="#666666"
       borderopacity="1"
       objecttolerance="10"
       gridtolerance="10"
       guidetolerance="10"
       inkscape:pageopacity="0"
       inkscape:pageshadow="2"
       inkscape:window-width="1855"
       inkscape:window-height="1056"
       id="namedview4"
       showgrid="false"
       inkscape:zoom="0.58910689"
       inkscape:cx="380.36288"
       inkscape:cy="294.03105"
       inkscape:window-x="65"
       inkscape:window-y="24"
       inkscape:window-maximized="1"
       inkscape:current-layer="svg2" />
    <path
       style="fill:#000000"
       d= "m 742.5005,491.33179 c 17.69779,-2.80221 30.81489,-6.97464 44.38424,-14.11821 54.0864,-28.4737 79.52257,-92.54556 59.99399,-151.12045 -10.10772,-30.31753 -33.06852,-56.91258 -61.35812,-71.06989 -12.06404,-6.03736 -22.17749,-9.41623 -36.32553,-12.13625 -9.53771,-1.83367 -13.26666,-2.06108 -25.19458,-1.53652 -21.7554,0.95675 -37.2965,5.13447 -56.07711,15.07449 l -10.29149,5.44698 -12.7504,-14.04191 -12.75041,-14.04191 13.34658,-39.64406 c 7.34061,-21.80423 13.68292,-40.32573 14.09402,-41.15888 0.57225,-1.15975 5.6326,-2.05656 21.58813,-3.82595 13.24304,-1.46858 22.08772,-2.92141 24.26138,-3.98518 6.90257,-3.37804 8.86493,-12.45325 4.13051,-19.10213 -4.13621,-5.80877 -4.25744,-5.80704 -63.05121,0.90027 -29.425,3.35687 -54.95493,6.56879 -56.73317,7.1376 -7.30432,2.33646 -10.25055,12.90805 -5.4666,19.61512 3.80237,5.3309 7.11092,5.73712 27.31263,3.35337 C 621.30043,155.93522 629.72184,155 630.3276,155 c 0.86828,0 -20.05035,64.47431 -21.36706,65.85642 -0.29604,0.31075 -171.42388,-44.83219 -172.29141,-45.44989 -0.18225,-0.12976 2.36586,-5.99818 5.66248,-13.04093 l 5.99384,-12.80499 -4.16247,-2.37678 c -2.28937,-1.30722 -10.91248,-5.91351 -19.16248,-10.23619 -8.25,-4.32268 -15.77258,-8.44177 -16.71685,-9.15353 -1.15365,-0.86959 -3.03377,-6.97561 -5.73134,-18.61354 -4.47177,-19.292219 -6.07196,-22.50711 -12.10204,-24.313764 -7.84444,-2.350254 -15.39904,2.388778 -16.53692,10.373693 -0.27615,1.937842 1.70173,12.585521 4.87788,26.259501 l 5.34237,23 14.43345,7.7349 c 7.9384,4.25419 14.78676,7.85946 15.21858,8.01171 0.6951,0.24507 -37.5147,82.16653 -39.16693,83.97352 -0.36215,0.39607 -3.1244,0.0611 -6.13833,-0.74438 -13.75661,-3.67646 -23.21531,-4.7073 -37.47987,-4.08464 -7.82173,0.34142 -17.75109,1.4536 -22.5,2.52019 -48.78996,10.95815 -85.06593,47.4409 -96.04126,96.5887 -2.66531,11.93536 -3.18457,34.54194 -1.06807,46.5 9.16991,51.80921 48.907,92.82622 99.29559,102.49384 48.26838,9.26085 96.80566,-9.45164 125.74095,-48.47666 15.74341,-21.23314 24.07279,-47.01668 24.07279,-74.51718 0,-41.8126 -19.90458,-80.27524 -53.26688,-102.93034 -4.80321,-3.26169 -8.71377,-6.18669 -8.69011,-6.5 0.16113,-2.13423 17.7938,-37.4845 18.53112,-37.1515 0.76864,0.34714 118.12215,139.56942 147.84433,175.39505 -0.003,0.0391 6.49136,-0.47767 13.6464,-1.02457 l 12.6112,-0.70069 c 6.93616,-0.38537 12.92543,-0.33782 13.30948,0.10568 0.38406,0.4435 1.52332,3.95637 2.5317,7.80637 14.37893,54.899 65.56188,93.19145 123.45653,92.36382 5.23942,-0.0749 10.65123,-0.31431 12.02623,-0.53203 z M 702.37942,462.6589 C 675.45857,455.72437 651.89764,436.73283 639.53193,412 c -3.81097,-7.62238 -8.03143,-18.86924 -8.03143,-21.40249 0,-1.75723 0.0872,-1.76514 67.5,-6.11536 29.7,-1.91657 57.08097,-3.77153 60.8466,-4.12214 l 6.8466,-0.63747 -12.01964,-12.11127 c -6.6108,-6.6612 -27.10533,-28.73886 -45.5434,-49.06146 l -33.52377,-36.9502 3.6968,-2.0792 c 28.07745,-15.79162 64.34473,-16.54045 93.50129,-1.93055 26.08016,13.06835 43.94149,35.35855 51.92227,64.79683 3.22882,11.90995 3.18611,36.44201 -0.0846,48.61331 -10.12913,37.69325 -38.54965,64.68562 -76.96818,73.10047 -12.15038,2.66131 -31.79411,2.03612 -45.29503,-1.44157 z m -381.51532,0.25885 c -33.72661,-4.69094 -63.75413,-27.69352 -76.92844,-58.93103 -5.96617,-14.14634 -7.82971,-23.72759 -7.77737,-39.98672 0.0394,-12.24053 0.44086,-15.98213 2.57634,-24.01148 12.48549,-46.94524 53.99519,-77.2729 102.26587,-74.71709 9.74723,0.51609 19.12594,2.21365 20.86143,3.77596 0.47379,0.42651 -9.17615,21.85283 -21.44431,47.61404 -24.45319,51.3479 -24.83035,52.45524 -20.11689,59.06348 4.96578,6.962 15.97717,6.68445 20.61701,-0.51968 1.3125,-2.03787 12.20751,-24.48294 24.21114,-49.87792 l 21.82478,-46.17269 2.88454,1.67269 c 5.36097,3.10873 16.07811,12.68661 21.6362,19.33622 10.41398,12.4591 17.63538,27.14167 21.13505,42.97183 2.77728,12.56256 2.2678,35.195 -1.06622,47.36464 -8.41694,30.72296 -31.16148,55.97715 -60.28816,66.9404 -15.42043,5.80424 -33.73098,7.79454 -50.39097,5.47735 z m 266.91589,-98.2037 c 0.2714,-0.70728 8.01631,-23.54478 17.2109,-50.75 9.1946,-27.20523 17.00818,-49.97253 17.36353,-50.594 0.38484,-0.67306 3.5654,2.11915 7.8661,6.90566 7.06518,7.86329 7.18313,8.08224 5.5,10.21006 -21.2936,26.91946 -30.77379,48.85107 -32.86251,76.02462 l -0.64504,8.39177 -4.60624,0.36867 c -9.87906,0.7907 -10.33393,0.76492 -9.82674,-0.55678 z m 40.72051,-4.58306 c 0,-4.80272 2.80864,-19.28139 4.94009,-25.46642 2.99752,-8.69819 8.58145,-19.20161 14.87885,-27.98722 3.08393,-4.30246 5.93478,-8.02514 6.33522,-8.27262 0.40043,-0.24748 12.90932,12.94771 27.79753,29.32265 25.36025,27.89273 26.89516,29.79438 24.30889,30.11718 -4.54525,0.56731 -67.33863,4.89265 -73.01058,5.02912 -5.14275,0.12374 -5.25,0.0677 -5.25,-2.74269 z M 501.61687,277.57476 c -34.15457,-40.65888 -61.98699,-74.03747 -61.84982,-74.17464 0.36385,-0.36386 159.5304,42.0635 160.15874,42.69183 0.29173,0.29174 -7.0732,23.0029 -16.36653,50.46924 -18.33749,54.19631 -18.93872,55.90401 -19.47894,55.3275 -0.20032,-0.21378 -28.30887,-33.65505 -62.46345,-74.31393 z"
       id="path2987"
       inkscape:connector-curvature="0"
       sodipodi:nodetypes="ssssssscccssssssssssscscssssssscsssssssssssscsccssssscsssscsscsssssccsssssssssscsssssscssssscscsssssssssscsss" />
  </svg>`
//"assets/bicycle.svg"
  // this will dymanically create the pop up and markers for the features(stations) gotten from ajaz
  function createCustomIconandPopup (feature, latlng) {

      // assign the correct icon url depending on bike availability at station
      if(feature.properties.availability < 3){
        HydraColoredIcon = "assets/hydraRedSGF.png";
      }
      else if(feature.properties.availability > 2 && feature.properties.availability < 4){
        HydraColoredIcon = "assets/hydraYellowSGF.png";
      }else{
        HydraColoredIcon = "assets/hydraGreenSGF.png";
      }

      let BikeIcon = L.icon({
          iconUrl: HydraColoredIcon,
          iconSize:     [50, 40],   
          iconAnchor:   [0, 0], 
          // point of the icon which will correspond to marker's location   
          popupAnchor:  [20, 0] 
          // point from which the popup should open relative to the iconAnchor 
          });
          // Div that will be given to the marker
          let PopupDiv = document.createElement('div');
          // PopupDiv.style.width = 200;
          // Station line appended to popup Div
          let StationName = feature.properties.name;
          let NameP = document.createElement("p");
          NameP.setAttribute("class", "pop-up");
          NameP.innerHTML = "<b> Station: </b>"+ StationName;
          PopupDiv.append(NameP);
          // Address line appended to popup Div
          let StationAddress = feature.properties.address;
          let AddressP = document.createElement("p");
          AddressP.setAttribute("class", "pop-up");
          AddressP.innerHTML = "<b>Address: </b> "+ StationAddress;
          //unsure why this is not workingß
          AddressP.style.fontsize = "15px";
          PopupDiv.append(AddressP);
          // Address line appended to popup Div
          let StationAvail = feature.properties.availability;
          let availP = document.createElement("p");
          availP.setAttribute("class", "pop-up");
          availP.innerHTML = "<b>Bikes Available: </b> "+ StationAvail;
          PopupDiv.append(availP);
          //Link to Rent a bike Appended to Popup Div (linkDiv is so I can style a div to look more button like)
          let linkDiv = document.createElement('div');
          linkDiv.setAttribute("id", "rentDiv"); 
          let linkRent = document.createElement('a');
          // set this attribute so maybe we can pass on the info of what popup they clicked to fill it in in the rent a bike form
          linkRent.setAttribute("StationCalled", feature.properties.name);
          linkRent.href = "http://localhost:3000/stations/"+feature.properties.identifier;
          linkRent.innerHTML = "<b>Rent Here</b>";
          linkDiv.append(linkRent);
          // Instead of trying to align here ask Team how to add a css stylesheet and try to add attributes and do it there
          linkRent.style.alignContent = "center";
          linkRent.style.color = "#000066";
          linkRent.style.fontSize = "28px";
          linkDiv.style.alignContent = "center";
          linkDiv.style.borderBottomLeftRadius = "5px";
          linkDiv.style.borderBottomRightRadius = "5px";
          linkDiv.style.borderTopLeftRadius = "5px";
          linkDiv.style.borderTopRightRadius = "5px";
          linkDiv.style.width = "160px";
          linkDiv.style.alignContent = "center";
          linkDiv.style.backgroundColor = "#99CCFF";
          PopupDiv.append(linkDiv);
      return L.marker(latlng, { icon: BikeIcon }).bindPopup(PopupDiv)
    }

  // middle function to make loading markers look cleaner. Not extremely needed but have to type like the comment below for it to work without it
    let myLayerOptions = {
      pointToLayer: createCustomIconandPopup
    }


   //L.geoJSON(data , {pointToLayer: createCustomIcon}).addTo(map);
   // Will load Markers using the Ajaz data and do the customizations from myLayerOptionsthe 
  function LoadMarkers(data){
     L.geoJSON(data , myLayerOptions).addTo(map);
  }

  //This is the action example on the starting guide to test out actions
  var popup = L.popup();
  function onMapClick(e) {
      popup
          .setLatLng(e.latlng)
          .setContent("You clicked the map at " + e.latlng.toString())
          .openOn(map);
  }
  map.on('click', onMapClick);
  // probably want to use moveend to do the longlat detection of zoom??
  // map.on("moveend", onMapClick);
})
