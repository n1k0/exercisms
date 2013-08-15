(ns phrase
  (:use [clojure.string :only [lower-case]]))

(defn word-count [phrase]
  (->> phrase lower-case (re-seq #"\w+") frequencies))
