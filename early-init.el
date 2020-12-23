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

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(blink-cursor-mode -1)

(setq visible-bell nil
      ring-bell-function 'ignore
      initial-scratch-message nil
      message-log-max 512
      debug-on-error t)

(add-to-list 'default-frame-alist
             '(font . "SFMono Nerd Font:pixelsize=10:weight=normal:slant=normal:width=normal:spacing=100:scalable=true:hinting=true"))

(setq frame-inhibit-implied-resize t)
(setq initial-major-mode 'fundamental-mode)

(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Emoji: 😄, 🤦, 🏴󠁧󠁢󠁳󠁣󠁴󠁿
(set-fontset-font t 'symbol "Apple Color Emoji")
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
(set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)

(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
  ((member "Symbola" (font-family-list)) "Symbola")
  )
 )

(provide 'early-init)
