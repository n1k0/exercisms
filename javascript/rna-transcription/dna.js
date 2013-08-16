module.exports = function DNA(sequence) {
  var thymidine = "T", uracil = "U";

  return {
    toRNA: function() {
      return sequence.replace(new RegExp(thymidine, "g"), uracil);
    }
  };
};

