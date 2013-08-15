var Anagram = require('./anagram');

describe('Anagram', function() {

  it("no matches",function() {
    var detector = new Anagram("diaper");
    var matches = detector.match([ "hello", "world", "zombies", "pants"]);
    expect(matches).toEqual([]);
  });

  it("detects simple anagram",function() {
    var detector = new Anagram("ant");
    var matches = detector.match(['tan', 'stand', 'at']);
    expect(matches).toEqual(['tan']);
  });

  it("does not detect false positives",function() {
    var detector = new Anagram("galea");
    var matches = detector.match(["eagle"]);
    expect(matches).toEqual([]);
  });

  it("detects multiple anagrams",function() {
    var detector = new Anagram("master");
    var matches = detector.match(['stream', 'pigeon', 'maters']);
    expect(matches).toEqual(['stream', 'maters']);
  });

  it("detects anagram",function() {
    var detector = new Anagram("listen");
    var matches = detector.match(['enlists', 'google', 'inlets', 'banana']);
    expect(matches).toEqual(['inlets']);
  });

  it("detects multiple anagrams",function() {
    var detector = new Anagram("allergy");
    var matches = detector.match(['gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading']);
    expect(matches).toEqual(['gallery', 'regally', 'largely']);
  });
});
