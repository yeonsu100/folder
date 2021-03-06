<!DOCTYPE html>
<html>
  <head>
    <title>Places Autocomplete</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
 
    <style>
    
      input {
        border: 1px solid  rgba(0, 0, 0, 0.5);
      }
      input.notfound {
        border: 2px solid  rgba(255, 0, 0, 0.4);
      }
      
    </style>
 
    <script>
function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(37.4346, 126.7968),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);
 
  <%-- var input = /** @type {HTMLInputElement} */(document.getElementById('address')); --%>
  var autocomplete = new google.maps.places.Autocomplete(input);
 
  autocomplete.bindTo('bounds', map);
 
  <%-- var infowindow = new google.maps.InfoWindow(); --%>
  var marker = new google.maps.Marker({
    map: map
  });
 
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    input.className = '';
    var place = autocomplete.getPlace();
    
    if (!place.geometry) {
      // Inform the user that the place was not found and return.
      input.className = 'notfound';
      return;
    }
 
    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    
    marker.setPosition(place.geometry.location);
    var pot = place.geometry.location;
    var x    = pot.lat().toFixed(4);
    var y    = pot.lng().toFixed(4);
    
    alert("x = "+x + " y = "+ y);
    
    marker.setVisible(true);
 
    <%-- var address = ''; --%>
    if (place.address_components) {
      address = [
        (place.address_components[2] && place.address_components[2].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[0] && place.address_components[0].short_name || '')
      ].join(' ');
    }
 
    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
  });
 
  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
   autocomplete.setTypes([]); 
}
 
google.maps.event.addDomListener(window, 'load', initialize);
 
    </script>
  </head>
  <body>
  <jsp:include page="../include/navbar.jsp"></jsp:include>
     </br> </br></br><input id="address" type="text" size="50"> 
    <div id="map-canvas" style="width:1200px;height:500px; align-content:center; padding-left: 20px;" ></div> </br> </br> </br>
    <jsp:include page="../include/ysfooter.jsp"></jsp:include>	
  </body>
</html>

