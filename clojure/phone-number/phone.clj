(ns phone
  (require [clojure.string :as str]))

(defn- clean [n]
  (str/replace n #"[^\d]" ""))

(defn- validate [n]
  (let [length (count n)]
    (cond (= 10 length) n
          (and (= 11 length) (= (first n) \1)) (subs n 1)
          :else "0000000000")))

(defn number [n]
  (->> n clean validate))

(defn- parts [n]
  (let [cleaned (number n)]
    {:area (subs cleaned 0 3)
     :pref (subs cleaned 3 6)
     :poss (subs cleaned 6)}))

(defn area-code [n]
  (:area (parts n)))

(defn pretty-print [n]
  (let [segments (parts (number n))]
    (format "(%s) %s-%s" (:area segments)
                         (:pref segments)
                         (:poss segments))))
