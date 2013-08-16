(ns beer
  (:require [clojure.string :refer [capitalize join]]))

(def ^:private refill 99)

(defn- assemble [verses]
  (str (join "\n" verses) "\n"))

(defn- dec-or-refill [n]
  (if (= 0 n) refill (dec n)))

(defn- format-act [n]
  (if (= 0 n) "Go to the store and buy some more"
              (format "Take %s down and pass it around"
                      (if (= 1 n) "it" "one"))))

(defn- format-qty [n]
  (cond (= n 0) "no more bottles of beer"
        (= n 1) "1 bottle of beer"
        :else   (format "%d bottles of beer" n)))

(defn verse [n]
  (let [tpl "%s on the wall, %s.\n%s, %s on the wall.\n"
        qty (format-qty n)
        act (format-act n)
        rem (format-qty (dec-or-refill n))]
    (format tpl (capitalize qty) qty act rem)))

(defn sing
  ([from]    (sing from 0))
  ([from to] (assemble (map verse
                            (range from (dec to) -1)))))
