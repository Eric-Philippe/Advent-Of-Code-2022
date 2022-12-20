(ns advent-of-code.day20.core
  (:refer-clojure :exclude [cond if-let if-some when-let when-some])
  (:require [better-cond.core :refer [cond if-let if-some when-let when-some defnc defnc-]]
            [medley.core :as med]
            [clojure.set :as set]
            [clojure.math :as math]
            [ubergraph.alg :as alg]
            [clojure.string :as str]
            [ubergraph.core :as uber]
            [instaparse.core :as insta]
            [com.rpl.specter :refer :all]
            [clojure.data.priority-map :as pm]
            [engelberg.data.union-find :as uf]
            [clojure.math.numeric-tower :as nt]
            [clojure.math.combinatorics :as comb]
))

(def input (mapv parse-long (str/split-lines (slurp "input.txt"))))

(defrecord Link [value next prev])

(defn circular-list [v]
  (let [links (mapv #(->Link % (atom nil) (atom nil)) v), n (count v)]
    (doseq [i (range (dec n))]
      (reset! (:next (links i)) (links (inc i))))
    (reset! (:next (links (dec n))) (links 0))
    (doseq [i (range 1 n)]
      (reset! (:prev (links i)) (links (dec i))))
    (reset! (:prev (links 0)) (links (dec n)))
    links))

(defnc get-link [link n dir]
  (zero? n) link
  (recur @(dir link) (dec n) dir))

(defn remove-link [link]
  (let [p @(:prev link),
        n @(:next link)]
    (reset! (:next p) n)
    (reset! (:prev n) p)))

(defn insert-link-after [link1 link2]
  (let [n @(:next link2)]
    (reset! (:next link2) link1)
    (reset! (:prev link1) link2)
    (reset! (:prev n) link1)
    (reset! (:next link1) n)))

(defn insert-link-before [link1 link2]
  (let [p @(:prev link2)]
    (reset! (:prev link2) link1)
    (reset! (:next link1) link2)
    (reset! (:next p) link1)
    (reset! (:prev link1) p)))

(defnc move [links i]
  :let [link (links i),
        n (:value link),
        pos-n? (pos? n),
        n (mod (abs n) (dec (count links)))]
  (zero? n) links
  :do (remove-link link)
  :let [attachment-point (get-link link (abs n) (if pos-n? :next :prev))]
  pos-n? (do (insert-link-after link attachment-point) links)
  :else (do (insert-link-before link attachment-point) links))

(defnc decrypt [links]
  (reduce move links (range (count links))))

(defnc find-value [links value]
  (first (for [i (range (count links)),
               :when (= (:value (links i)) value)]
           (links i))))

(defnc run-part-one []
  :let [links (decrypt (circular-list input)),
        start (find-value links 0),
        l1 (get-link start 1000 :next)
        l2 (get-link l1 1000 :next)
        l3 (get-link l2 1000 :next)]
  (apply + (map :value [l1 l2 l3])))