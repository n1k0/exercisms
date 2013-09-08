function transform(src) {
  return Object.keys(src).reduce(function(transformed, key) {
    src[key].forEach(function(entry) {
      transformed[entry.toLowerCase()] = key;
    });
    return transformed;
  }, {});
}

exports.transform = transform;
