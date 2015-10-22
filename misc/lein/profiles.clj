{:user {:plugins [[cider/cider-nrepl "0.9.1"]
                  [lein-environ "1.0.0"]
                  [lein-kibit "0.0.8"]
                  [lein-marginalia "0.7.1"]
                  [lein-pprint "1.1.1"]
                  [lein-try "0.4.1"]
                  [jonase/eastwood "0.2.1"]
                  [lein-drip "0.1.1-SNAPSHOT"]]
        :env {:squiggly {:checkers [:eastwood]
                         :eastwood-exclude-linters [:unlimited-use]}}
        :dependencies [[acyclic/squiggly-clojure "0.1.3-SNAPSHOT"]
                       ^:replace [org.clojure/tools.nrepl "0.2.10"]
                       [org.clojure/core.typed "0.3.7"]
                       [org.clojure/tools.nrepl "0.2.10"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                       [jonase/kibit "0.1.2"]
                       [ritz/ritz-nrepl-middleware "0.7.0"]]
        :repl-options {:nrepl-middleware [ritz.nrepl.middleware.javadoc/wrap-javadoc
                                          ritz.nrepl.middleware.simple-complete/wrap-simple-complete]}}}
