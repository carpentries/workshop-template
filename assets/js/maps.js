var SWC = SWC || {};

SWC.maps = (function() {
  var maps = {};

  function toggleScrollwheel(map, enabled) {
      if (map) {
	  map.setOptions({ scrollwheel: enabled });
      }
  }

  function add_cluster_event_listeners(clusterer, map, info_window) {
      google.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
        info_window.setPosition(cluster.getCenter());
        var info_string = "<div class=\"info-window\">";
        var markers = cluster.getMarkers();
        for (var i=0; i < markers.length; i++ ) {
          info_string += markers[i].getTitle();
        }
        info_string += "</div>";
        // reset content so that scroll bar in new content will always be at
        // top of content
        info_window.setContent( "<div class=\"info-window\"></div>");
        info_window.setContent(info_string);
        info_window.open(map);
        // when the info window has a scroll bar, we want the mouse scroll wheel
        //   to scroll in the info window, NOT zoom the map.  Disable map zoom.
        toggleScrollwheel(map, false);
      });
      // zooming changes our clusters completely.  The info window is no longer
      //  accurate.  Close it.  Make people pick a new cluster or marker.
      google.maps.event.addListener(map, 'zoom_changed', function(event){
        info_window.close();
      });
      // when the info window is closed, restore mousewheel zoom on the map
      google.maps.event.addListener(info_window, 'closeclick', function(){
        toggleScrollwheel(map, true);
      });
  };

  maps.pins = function(map, events) {
      var markers = [];
      for (var i = 0; i < events.length; i++) {
	  var coordinates = events[i].geometry.coordinates;
	  var marker = new google.maps.Marker({
		  position: new google.maps.LatLng(coordinates[1], coordinates[0]),
		  map: map,
		  title: events[i].properties.details,
		  visible: false   // marker not shown directly, just clustered
	      });
	  markers.push(marker);  // For clustering
      }
      return markers;
  }
        
  maps.previous = function(element_id, geo_json) {
      var mapOptions = {
        zoom: 2,
        center: new google.maps.LatLng(25,8),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      },
      map = new google.maps.Map(document.getElementById(element_id), mapOptions);
      var markers = SWC.maps.pins(map, geo_json.features);

      var mcOptions = {
        zoomOnClick: false,
        maxZoom: null,
        gridSize: 25,
        minimumClusterSize: 1
      }
      var mc = new MarkerClusterer(map, markers, mcOptions);
      info_window = new google.maps.InfoWindow();
      add_cluster_event_listeners(mc, map, info_window);
  }

  maps.draw = function(url, element_id) {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange=function() {
	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	      SWC.maps.previous(element_id, JSON.parse(xmlhttp.responseText));
	  }
      }
      xmlhttp.open("GET", url, true);
      xmlhttp.send();
  }

  return maps;
})();
