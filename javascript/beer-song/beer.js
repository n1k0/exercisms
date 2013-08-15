var refill = 99
  , template = "$current of beer on the wall, $current of beer.\n" +
               "$action, $remaining of beer on the wall.\n";

module.exports = {
  sing: function(from, to) {
    var verses = [];
    for (var n = from; n >= (to || 0); n--)
      verses.push(this.verse(n));
    return verses.join("\n");
  },

  verse: function(n) {
    return ucfirst(template
      .replace(/\$current/g,   formatQuantity(n))
      .replace(/\$action/g,    formatAction(n))
      .replace(/\$remaining/g, formatQuantity(n === 0 ? refill : n - 1)));
  }
};

function formatAction(n) {
  if (n === 0)
    return "Go to the store and buy some more";
  return ["Take", n === 1 ? "it" : "one", "down and pass it around"].join(" ");
}

function formatQuantity(n) {
  if (n === 0)
    return "no more bottles";
  return n + " bottle" + (n > 1 ? "s" : "");
}

function ucfirst(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}
