(ns etl
  (:require [clojure.string :refer [lower-case]]))

(defn transform [src]
  (into {}
    (apply concat
      (for [[x [& y]] src]
        (for [z y]
          [(lower-case z) x])))))
