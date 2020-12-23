;;; -*- lexical-binding: t; -*-
;;; init.el --- custom init file
;;;
;;; Commentary:
;;; init file which exports a config file from an
;;; Org file containing custom settings for Emacs

;;; Code:

;; Hide the startup message
(setq inhibit-startup-message t)

;; FIXME - this should be in config.org,
;; but doesn't work there
(setq disabled-command-hook nil)

;; Stop writing customisations to init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Disable writing package settings to init.el
(defun package--save-selected-packages (&rest opt) nil)

(setq package-enable-at-startup nil ; don't auto-initialize!
      ;; don't add that `custom-set-variables' block to my init.el!
      package--init-file-ensured t)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(setq tls-checktrust t)
(setq gnutls-verify-error t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; straight.el tuning
(straight-use-package 'use-package)
(setq straight-use-package-by-default 1
      straight-cache-autoloads t
      straight-enable-use-package-integration t
      straight-check-for-modifications '(check-on-save find-when-checking))

;; tangle the README.org into a config file
(let ((file-name-handler-alist nil))
  (require 'ob-tangle)
  (setq dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))
  (org-babel-load-file (expand-file-name "README.org" dotfiles-dir))
  (global-set-key (kbd "<f8>") (lambda() (interactive)(load-file "~/.emacs.d/init.el"))))
