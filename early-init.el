;; -*- lexical-binding: t; -*-

;; Emacs will run garbage collection after `gc-cons-threshold' bytes of
;; consing. The default value is 800,000 bytes, or ~ 0.7 MiB. By
;; increasing to maximum we reduce the number of pauses due to
;; garbage collection during setup.

(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(setq package-enable-at-startup nil ; don't auto-initialize!
      ;; don't add that `custom-set-variables' block to my init.el!
      package--init-file-ensured t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)

(setq visible-bell nil
      initial-scratch-message nil
      message-log-max 512
      debug-on-error t)

(provide 'early-init)
