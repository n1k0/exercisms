(defn leap-year [year]
  (let [[a b c] (map #(= 0 (rem year %)) [4 100 400])]
    (or (and a (not b)) (and b c))))
