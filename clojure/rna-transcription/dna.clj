(ns dna)

(def cytidine \C)
(def guanosine \G)
(def adenosine \A)
(def thymidine \T)
(def uracil \U)

(def dna-to-rna {
  cytidine cytidine
  guanosine guanosine
  adenosine adenosine
  thymidine uracil
})

(defn to-rna [s]
  (apply str (map dna-to-rna s)))
