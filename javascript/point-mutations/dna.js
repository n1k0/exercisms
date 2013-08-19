module.exports = function DNA(initial) {
  function shortest(a, b) {
    return a.length < b.length ? a.length : b.length;
  }

  return {
    hammingDistance: function(sequence) {
      var count = 0;
      for (var n = 0; n < shortest(sequence, initial); n++)
        count += sequence[n] !== initial[n] ? 1 : 0;
      return count;
    }
  };
};
