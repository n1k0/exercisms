(ns anagram)

(defn anagrams-for [word words]
  (let [freq (frequencies word)]
    (filter #(= freq (frequencies %)) words)))
