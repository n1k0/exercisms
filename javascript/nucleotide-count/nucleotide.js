module.exports = function DNA(sequence) {
  var nucleotides = "CGATU".split("")
    , defaults = {C: 0, G: 0, A: 0, T: 0}
    , nucleotideCounts = countNucleoTides(sequence);

  function countNucleoTides(sequence) {
    return sequence
           .split('')
           .reduce(updateCounts, defaults);
  }

  function updateCounts(counts, nucleotide) {
    counts[nucleotide]++;
    return counts;
  }

  return {
    nucleotideCounts: nucleotideCounts,
    count: function(nucleotide) {
      if (nucleotides.indexOf(nucleotide) === -1)
        throw new Error('Invalid Nucleotide');
      return this.nucleotideCounts[nucleotide] || 0;
    }
  };
};
