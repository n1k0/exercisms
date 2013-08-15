module.exports = function Anagram(word) {
  var orderedWord = ordered(word);

  function ordered(w) {
    return w.split('').sort().join('');
  }

  return {
    match: function(words) {
      return words.filter(function(testWord) {
        return orderedWord === ordered(testWord);
      });
    }
  };
};
