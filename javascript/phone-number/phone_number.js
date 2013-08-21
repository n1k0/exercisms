module.exports = function PhoneNumber(source) {
  var _number = parse(source);
  var _parts = toParts(_number);

  return {
    number: function() {
      return _number;
    },

    areaCode: function() {
      return _parts.area;
    },

    toString: function() {
      return "($area) $pref-$poss"
             .replace(/\$area/, _parts.area)
             .replace(/\$pref/, _parts.pref)
             .replace(/\$poss/, _parts.poss);
    }
  };
};

function parse(source) {
  try {
    return validate(clean(source));
  } catch (invalid) {
    return invalid;
  }
}

function clean(source) {
  return source.match(/\d+/g).join('');
}

function validate(source) {
  if (source.length === 10)
    return source;
  if (source.length === 11 && source[0] === "1")
    return source.slice(1);
  throw new Array(11).join("0");
}

function toParts(source) {
  return {
    area: source.slice(0, 3),
    pref: source.slice(3, 6),
    poss: source.slice(6)
  };
}
