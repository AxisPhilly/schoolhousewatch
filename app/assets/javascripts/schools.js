if (typeof app === 'undefined' || !app) {
  var app = {};
}

app.map = {};

app.map.run = function() {
  wax.tilejson('http://a.tiles.mapbox.com/v3/axisphilly.map-fg6flibn.jsonp',
    function(tilejson) {
      window.map = new L.Map('map-div')
        .addLayer(new wax.leaf.connector(tilejson))
        .setView(new L.LatLng(40.00210, -75.12039), 11);

      wax.leaf.interaction()
        .map(map)
        .tilejson(tilejson)
        .on('on', function(o) {});

      L.Icon.Default.imagePath = '/images/';

      // tabbed map fix hack
      $("#mapTabHeader").click(function() {
        // http://stackoverflow.com/questions/10762984/leaflet-map-not-displayed-properly-inside-tabbed-panel
        L.Util.requestAnimFrame(map.invalidateSize, map, !1, map._container);
      });

      //add city limits to map
      $.ajax({
        url: '/city_limits.json',
        success: function(res) {
          L.geoJson(res, {
            style:  {
              "color": "#ff7800",
              "weight": 3,
              "opacity": 0.65
            }
          }).addTo(map);
        }
      });

      //add points to map
      $.ajax({
        url: '/schools.json',
        success: function(res) {
          for(var i=0; i<res.length; i++) {
            var point = new L.marker([res[i].lat, res[i].lng])
                  .bindPopup('<a href="/schools/' + res[i].slug + '">' + res[i].name + '</a>')
                  .addTo(map);
          }
        }
      });
  });
};