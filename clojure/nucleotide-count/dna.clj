(ns dna)

(def ^:private nucleotides {:dna "CGAT"
                            :rna "CGAU"
                            :all "CGATU"})

(defn- strseq [seq] (map str seq))

(defn- default-hash-map [default keys]
  (apply hash-map (interleave keys (repeat default))))

(defn- valid-nucleotide?
  ([n]      (valid-nucleotide? n :all))
  ([n type] (some #(= n %) (strseq (type nucleotides)))))

(defn nucleotide-counts [sequence]
  (merge (default-hash-map 0 (strseq (:dna nucleotides)))
         (frequencies (strseq sequence))))

(defn count [n sequence]
  (if (not (valid-nucleotide? n :all))
    (throw (Exception. (format "invalid nucleotide %s" n)))
    (get (nucleotide-counts sequence) n 0)))
