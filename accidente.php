<?php
include_once 'header.php';
include 'locations_model.php';
//get_unconfirmed_locations();exit;
?>


    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?language=en&key=AIzaSyCNiYdLpYKe-0X3Zg7uJzWGZLVT9LBFzKI&callback=initMap">
    </script>


    <div id="map"></div>
    <script>
        /**
         * Create new map
         */
        var infowindow;
        var map;
        var red_icon =  'http://maps.google.com/mapfiles/ms/icons/orange-dot.png' ;
        var purple_icon =  'http://maps.google.com/mapfiles/ms/icons/purple-dot.png' ;
        var accidente = <?php get_confirmed_locations() ?>;
        var myOptions = {
            zoom: 7,
            center: new google.maps.LatLng(46.87916, -3.32910),
            mapTypeId: 'roadmap'
        };
        map = new google.maps.Map(document.getElementById('map'), myOptions);

        var markers = {};

        var getMarkerUniqueId= function(lat, lng) {
            return lat + '_' + lng;
        };


        var getLatLng = function(lat, lng) {
            return new google.maps.LatLng(lat, lng);
        };

        /**
         * Binds click event to given map and invokes a callback that appends a new marker to clicked location.
         */
        var addMarker = google.maps.event.addListener(map, 'click', function(e) {
            var lat = e.latLng.lat(); // lat of clicked point
            var lng = e.latLng.lng(); // lng of clicked point
            var markerId = getMarkerUniqueId(lat, lng); // an that will be used to cache this marker in markers object.
            var marker = new google.maps.Marker({
                position: getLatLng(lat, lng),
                map: map,
                animation: google.maps.Animation.DROP,
                id: 'marker_' + markerId,
                html: "    <div id='info_"+markerId+"'>\n" +
                "        <table class=\"map1\">\n" +
                "            <tr>\n" +
                "                <td><a>Descripcion:</a></td>\n" +
                "                <td><textarea  id='manual_description' placeholder='Describa el accidente'></textarea></td></tr>\n" +
                "            <tr><td></td><td><input type='button' value='Guardar informacion' onclick='saveData("+lat+","+lng+")'/></td></tr>\n" +
                "        </table>\n" +
                "    </div>"
            });
            markers[markerId] = marker; // cache marker in markers object
            bindMarkerEvents(marker); // bind right click event to marker
            bindMarkerinfo(marker); // bind infowindow with click event to marker
        });


        var bindMarkerinfo = function(marker) {
            google.maps.event.addListener(marker, "click", function (point) {
                var markerId = getMarkerUniqueId(point.latLng.lat(), point.latLng.lng()); // get marker id by using clicked point's coordinate
                var marker = markers[markerId]; // find marker
                infowindow = new google.maps.InfoWindow();
                infowindow.setContent(marker.html);
                infowindow.open(map, marker);
                // removeMarker(marker, markerId); // remove it
            });
        };

 
        var bindMarkerEvents = function(marker) {
            google.maps.event.addListener(marker, "rightclick", function (point) {
                var markerId = getMarkerUniqueId(point.latLng.lat(), point.latLng.lng()); // get marker id by using clicked point's coordinate
                var marker = markers[markerId]; // find marker
                removeMarker(marker, markerId); // remove it
            });
        };

        var removeMarker = function(marker, markerId) {
            marker.setMap(null); // set markers setMap to null to remove it from map
            delete markers[markerId]; // delete marker instance from markers object
        };


        var i ; var confirmed = 0;
        for (i = 0; i < accidente.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(accidente[i][1], accidente[i][2]),
                map: map,
                icon :   accidente[i][4] === '1' ?  red_icon  : purple_icon,
                html: "<div>\n" +
                "<table class=\"map1\">\n" +
                "<tr>\n" +
                "<td><a>Descripcion:</a></td>\n" +
                "<td><textarea disabled id='manual_description' placeholder='Descripcion'>"+accidente[i][3]+"</textarea></td></tr>\n" +
				"<td><a>Fecha y Hora:</a></td>\n" +
				"<td><textarea disabled id='manual_fechahora' placeholder='Descripcion'>"+accidente[i][5]+"</textarea></td></tr>\n" +
                "</table>\n" +
                "</div>"
            });

            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow = new google.maps.InfoWindow();
                    confirmed =  accidente[i][4] === '1' ?  'checked'  :  0;
                    $("#confirmed").prop(confirmed,accidente[i][4]);
                    $("#id").val(accidente[i][0]);
                    $("#description").val(accidente[i][3]);
					$("#fechahora").val(accidente[i][5]);
                    $("#form").show();
                    infowindow.setContent(marker.html);
                    infowindow.open(map, marker);
                }
            })(marker, i));
        }

        function saveData(lat,lng) {
            var description = document.getElementById('manual_description').value;
            var url = 'locations_model.php?add_location&description=' + description + '&lat=' + lat + '&lng=' + lng;
            downloadUrl(url, function(data, responseCode) {
                if (responseCode === 200  && data.length > 1) {
                    var markerId = getMarkerUniqueId(lat,lng); // get marker id by using clicked point's coordinate
                    var manual_marker = markers[markerId]; // find marker
                    manual_marker.setIcon(purple_icon);
                    infowindow.close();
                    infowindow.setContent("<div style=' color: purple; font-size: 25px;'> Por favor confirme accidente</div>");
                    infowindow.open(map, manual_marker);

                }else{
                    console.log(responseCode);
                    console.log(data);
                    infowindow.setContent("<div style='color: red; font-size: 25px;'>Inserting Errors</div>");
                }
            });
        }

        function downloadUrl(url, callback) {
            var request = window.ActiveXObject ?
                new ActiveXObject('Microsoft.XMLHTTP') :
                new XMLHttpRequest;

            request.onreadystatechange = function() {
                if (request.readyState == 4) {
                    callback(request.responseText, request.status);
                }
            };

            request.open('GET', url, true);
            request.send(null);
        }


    </script>


<?php
include_once 'footer.php';

?>
