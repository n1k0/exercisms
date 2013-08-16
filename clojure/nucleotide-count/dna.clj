(ns dna)

(defn- default-hash-map [default keys]
  (into {} (map #(hash-map % default) (seq keys))))

(defn- error [message]
  (throw (Exception. (str message))))

(defn- nucleotides
  ([]     (nucleotides :all))
  ([type] (map str (cond
            (= type :dna) "CGAT"
            (= type :rna) "CGAU"
            (= type :all) "CGATU"
            :else         (error "Unsupported type.")))))

(defn- valid-nucleotide?
  ([n]      (valid-nucleotide? n :all))
  ([n type] (some #(= n %) (nucleotides type))))

(defn nucleotide-counts [sequence]
  (merge (default-hash-map 0 (nucleotides :dna))
         (frequencies (map str sequence))))

(defn count [nucleotide sequence]
  (if (not (valid-nucleotide? nucleotide :all))
    (error (format "invalid nucleotide %s" nucleotide))
    (get (nucleotide-counts sequence) nucleotide 0)))
