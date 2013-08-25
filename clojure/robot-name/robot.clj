(declare chars-range rand-chars rand-letters
         rand-digits generate-name)

(def ^:private robot-defaults {:name ""})

(defn robot [] (atom robot-defaults))

(defn robot-name [robot]
  (let [name (:name @robot)]
    (if (= "" name)
      (:name (swap! robot update-in [:name]
                          (fn [_] (generate-name))))
      name)))

(defn reset-name [robot]
  (swap! robot (fn [_] robot-defaults)))

;; private members

(defn- chars-range [from to]
  (range (int from) (dec (int to))))

(defn- rand-chars [n from to]
  (apply str (->> (chars-range from to)
                  shuffle
                  (map char)
                  (take n))))

(defn- rand-digits [n] (rand-chars n \0 \9))
(defn- rand-letters [n] (rand-chars n \A \Z))

(defn- generate-name []
  (str (rand-letters 2) (rand-digits 3)))
