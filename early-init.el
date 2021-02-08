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

;; copy to custom var
(defvar my--file-name-handler-alist file-name-handler-alist)
;; set original to nil
(setq file-name-handler-alist nil)

;; UI changes
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(global-subword-mode 1)
(electric-indent-mode 1)
(save-place-mode 1)

(setq inhibit-startup-message t
      disabled-command-hook nil
      visible-bell nil
      visible-cursor nil
      ring-bell-function 'ignore
      initial-scratch-message nil
      inhibit-compacting-font-caches t
      message-log-max 512
      debug-on-error t
      confirm-kill-emacs 'y-or-n-p
      save-interprogram-paste-before-kill t
      byte-compile-warnings nil
      cursor-in-non-selected-windows nil
      highlight-nonselected-windows t
      select-enable-clipboard t
      help-window-select t
      tls-checktrust t
      gnutls-verify-error t
      initial-major-mode 'fundamental-mode
      save-place-forget-unreadable-files nil
      query-replace-highlight t)

(add-to-list 'default-frame-alist
             '(font . "SFMono Nerd Font:pixelsize=10:weight=normal:slant=normal:width=normal:spacing=100:scalable=true:hinting=true"))

(setq frame-inhibit-implied-resize t)
(setq initial-major-mode 'fundamental-mode)

;; Improve the performance of rendering long lines.
(setq-default bidi-display-reordering nil)

(set-charset-priority 'unicode)
(set-terminal-coding-system    'utf-8)  ; pretty
(set-keyboard-coding-system    'utf-8)  ; pretty
(set-selection-coding-system   'utf-8)  ; please
(prefer-coding-system          'utf-8)  ; pretty
(setq locale-coding-system     'utf-8   ; with sugar on top
      org-export-coding-system 'utf-8
      default-process-coding-system '(utf-8-unix . utf-8-unix))

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

;; fix annoyances early where possible
(fset 'yes-or-no-p 'y-or-n-p)
(fset 'display-startup-echo-area-message 'ignore)
(setq-default tab-width 4)

;; paren pairs
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(set-face-background 'show-paren-match "#456")
(set-face-foreground 'show-paren-match "#cde")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(show-paren-mode t)

;; straight settings
(with-no-warnings
  (setq straight-use-package-by-default 1
        straight-cache-autoloads t
        straight-enable-use-package-integration t
        straight-check-for-modifications '(check-on-save find-when-checking)))

(provide 'early-init)
