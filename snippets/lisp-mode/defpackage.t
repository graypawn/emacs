# -*- mode: snippet -*-
# name: defpackage.t
# key: defp-t
# --
(defpackage #:${1:`(pawn-current-lispy-namespace ".")`}$2
  (:use #:cl
        #:prove
        #:${3:`(projectile-project-name)`}))
