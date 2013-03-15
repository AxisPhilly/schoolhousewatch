if (typeof app === 'undefined' || !app) {
  var app = {};
}

app.map = {};

app.map.run = function() {
  wax.tilejson('http://a.tiles.mapbox.com/v3/axisphilly.map-fg6flibn.jsonp',
    function(tilejson) {
      var map = new L.Map('map-div')
        .addLayer(new wax.leaf.connector(tilejson))
        .setView(new L.LatLng(39.98, -75.15), 11);

      wax.leaf.interaction()
        .map(map)
        .tilejson(tilejson)
        .on('on', function(o) {});

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