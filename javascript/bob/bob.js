module.exports = function Bob() {
  function isSilent(input) {
    return '' === input;
  }

  function isShout(input) {
    return input === input.toUpperCase();
  }

  function isQuestion(input) {
    return '?' === input.substr(-1);
  }

  return {
    hey: function(input) {
      if (isSilent(input))
        return 'Fine, be that way!';

      if (isShout(input))
        return 'Woah, chill out!';

      if (isQuestion(input))
        return 'Sure.';

      return 'Whatever.';
    }
  };
};
