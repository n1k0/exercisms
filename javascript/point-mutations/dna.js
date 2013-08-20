function DNA(initial) {
  this.initial = initial;
}
module.exports = DNA;

DNA.prototype.hammingDistance = function(sequence) {
  var count = 0;
  for (var n = 0; n < shortest(sequence, this.initial); n++)
    count += sequence[n] !== this.initial[n] ? 1 : 0;
  return count;
};

function shortest(a, b) {
  return a.length < b.length ? a.length : b.length;
}

