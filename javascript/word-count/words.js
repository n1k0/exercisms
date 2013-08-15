module.exports = function Words(words) {
  "use strict";

  function frequencies(freq, word) {
    freq[word] = word in freq ? freq[word] + 1 : 1;
    return freq;
  }

  return {
    get count() {
      return words.toLowerCase()
                  .match(/\w+/g)
                  .reduce(frequencies, {});
    }
  };
};
