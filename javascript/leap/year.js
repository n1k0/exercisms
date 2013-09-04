module.exports = function Year(year) {
  return {
    isLeapYear: function() {
      var a = year % 4 === 0,
          b = year % 100 === 0,
          c = year % 400 === 0;
      return (a && !b) || (b && c);
    }
  };
};
