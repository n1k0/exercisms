module.exports = function School() {
  return {
    db: {},

    add: function(name, grade) {
      this.db[grade] = grade in this.db ? this.db[grade] : [];
      this.db[grade].push(name);
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
