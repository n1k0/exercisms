(ns bob
  (:require [clojure.string :refer [upper-case]]))

(defn- silent? [what]
  (= "" what))

(defn- shout? [what]
  (= what (upper-case what)))

(defn- question? [what]
  (= \? (last what)))

(defn response-for [what]
  (cond
    (silent? what) "Fine, be that way."
    (shout? what) "Woah, chill out!"
    (question? what) "Sure."
    :else "Whatever."))
