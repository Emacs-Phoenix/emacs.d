{:user {:plugins [[cider/cider-nrepl "0.9.1"]
                  [lein-environ "1.0.0"]
                  [jonase/eastwood "0.2.1"]]
        :env {:squiggly {:checkers [:eastwood]
                         :eastwood-exclude-linters [:unlimited-use]}}
        :dependencies [[acyclic/squiggly-clojure "0.1.3-SNAPSHOT"]
                       ^:replace [org.clojure/tools.nrepl "0.2.10"]
                       [org.clojure/core.typed "0.3.7"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                       [jonase/kibit "0.1.2"]]
        }}
