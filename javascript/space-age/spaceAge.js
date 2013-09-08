module.exports = function SpaceAge(seconds) {
  var secondsInYear = 31557600;
  var planets = {
    Earth:   1,
    Mercury: 0.2408467,
    Venus:   0.61519726,
    Mars:    1.8808158,
    Jupiter: 11.862615,
    Saturn:  29.447498,
    Uranus:  84.016846,
    Neptune: 164.79132
  };

  function onPlanet(ratio) {
    return Math.round(seconds / secondsInYear / ratio * 100) / 100;
  }

  return Object.keys(planets).reduce(function(proto, planet) {
    proto['on' + planet] = onPlanet.bind(null, planets[planet]);
    return proto;
  }, {seconds: seconds});
};
