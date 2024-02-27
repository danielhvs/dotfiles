(ns dev.user
  (:require
   [clojure.tools.nrepl.server :as nrepl]))

(defonce nrepl-server (nrepl/start-server))
(spit "./.nrepl-port" (:port nrepl-server))

(require 'pjstadig.humane-test-output)
(pjstadig.humane-test-output/activate!)
