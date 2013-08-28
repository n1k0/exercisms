module.exports = function Robot() {
  var _name = "";

  return {
    get name() {
      if (_name === "")
        _name = generateName();
      return _name;
    },

    reset: function() {
      _name = "";
    }
  };

  function randLetters(n) {
    return "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('').sort(function() {
      return Math.round(Math.random());
    }).join('').slice(0, n);
  }

  function generateName() {
    return randLetters(2) + Math.round(Math.random() * 899) + 100;
  }
};
