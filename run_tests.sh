#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
exec bb -e '
(require (quote clojure.test)
         (quote mimamori.murakumo-test)
         (quote mimamori.social-publication-test)
         (quote mimamori.tests.test-bond)
         (quote mimamori.tests.test-cell)
         (quote mimamori.tests.test-coverage)
         (quote mimamori.tests.test-kotoba-autorun)
         (quote mimamori.tests.test-ontology-parity)
         (quote mimamori.tests.test-shakai)
         (quote mimamori.tests.test-wasm-app))
(let [namespaces [                  (quote mimamori.murakumo-test)
                  (quote mimamori.social-publication-test)
                  (quote mimamori.tests.test-bond)
                  (quote mimamori.tests.test-cell)
                  (quote mimamori.tests.test-coverage)
                  (quote mimamori.tests.test-kotoba-autorun)
                  (quote mimamori.tests.test-ontology-parity)
                  (quote mimamori.tests.test-shakai)
                  (quote mimamori.tests.test-wasm-app)]
      result (apply clojure.test/run-tests namespaces)]
  (System/exit (if (zero? (+ (:fail result) (:error result))) 0 1)))'
