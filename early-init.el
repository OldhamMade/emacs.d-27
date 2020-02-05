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

;; disable some UI features I never use
(blink-cursor-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq visible-bell nil
      initial-scratch-message nil
      message-log-max 512
      debug-on-error t)

;; set the font early
(set-face-attribute 'default nil :font "SFMono Nerd Font:pixelsize=10:weight=normal:slant=normal:width=normal:spacing=100:scalable=true:hinting=true")
