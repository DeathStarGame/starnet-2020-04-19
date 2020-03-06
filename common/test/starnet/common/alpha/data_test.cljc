(ns starnet.common.alpha.data-test
  (:require
   [clojure.spec.alpha :as s]
   [clojure.spec.gen.alpha :as sgen]
   [clojure.spec.test.alpha :as stest]
   [clojure.test.check :as tc]
   [clojure.test.check.generators :as gen]
   [clojure.test.check.properties :as prop]
   [clojure.test.check.clojure-test :refer [defspec]]
   [clojure.test :as test :refer [is testing run-tests deftest]]
   [starnet.common.alpha.data :refer [make-game]]))


(deftest make-game-tests
  (testing "generates valid :g/game"
    (is (s/valid? :g/game
                  (make-game
                   (gen/generate gen/uuid)
                   (gen/generate (s/gen :ev.g.u/create)))))))

(deftest all-specchecks
  (testing "running spec.test/check via stest/enumerate-namespace"
    (let [summary (-> #?(:clj (stest/enumerate-namespace 'starnet.common.alpha.data)
                         :cljs 'starnet.common.alpha.data)
                      (stest/check {:clojure.spec.test.check/opts {:num-tests 10}})
                      (stest/summarize-results))]
      (is (not (contains? summary :check-failed))))))

(deftest make-game-speccheck
  (testing "running spec.test/check"
    (let [summary (-> (stest/check `make-game
                                   {:clojure.spec.test.check/opts {:num-tests 10}})
                      (stest/summarize-results))]
      (is (not (contains? summary :check-failed))))))

(comment

  (run-tests)
  (all-specchecks)
  (make-game-speccheck)

  (list (reduce #(assoc %1 (keyword (str %2)) %2) {} (range 0 100)))

  ;;
  )