module.exports = function School() {
  return {
    db: {},

    add: function(name, grade) {
      var current = this.grade(grade);
      current.push(name);
      this.db[grade] = current;
    },

    grade: function(grade) {
      return this.db[grade] || [];
    },

    sort: function() {
      return Object.keys(this.db).reduce(function(db, grade) {
        db[grade] = db[grade].sort();
        return db;
      }, this.db);
    }
  };
};
