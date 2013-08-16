(ns anagram)

(defn- order-word [word]
  (apply str (sort word)))

(defn anagrams-for [word words]
  (let [ordered (order-word word)]
    (filter #(= ordered (order-word %)) words)))
