(ns school)

(defn grade [db level]
  (get db level []))

(defn add [db name level]
  (let [students (grade db level)]
    (assoc db level (conj students name))))

(defn sorted [db]
  (into {} (map (fn [[k v]] [k (sort v)]) db)))
