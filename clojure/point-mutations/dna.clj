(ns dna)

(defn hamming-distance [a b]
  (count (filter true? (map not= a b))))
