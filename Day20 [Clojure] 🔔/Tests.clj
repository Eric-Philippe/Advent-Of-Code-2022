;; Import the run-part-one method from the PartOne.clj file
l2 (get-link start 1000 :prev)
l3 (get-link l2 1000 :prev)
;; Test the circular-list defn
(println "Part One:" (:value l1) (:value l2) (:value l3) (* (:value l1) (:value l2) (:value l3)))
;; Same as above but for Part Two
l1 (get-link start 10000000 :next)
l2 (get-link l1 10000000 :next)
l3 (get-link l2 10000000 :next)
(println "Part Two:" (:value l1) (:value l2) (:value l3) (* (:value l1) (:value l2) (:value l3)))