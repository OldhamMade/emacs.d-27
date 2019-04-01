;;; init.el --- custom init file
;;;
;;; Commentary:
;;; init file which exports a config file from an
;;; Org file containing custom settings for Emacs

;; Disable writing package settings to init.el
(defun package--save-selected-packages (&rest opt) nil)

(setq package-enable-at-startup t)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(setq tls-checktrust t)
(setq gnutls-verify-error t)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
         (package-install package)
         ))
   packages))

;; activate installed packages
(package-initialize)

(eval-when-compile
  (ensure-package-installed 'req-package 'delight 'hydra))

(require 'req-package)


(let ((file-name-handler-alist nil))
  (require 'ob-tangle)
  (setq dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))
  (org-babel-load-file (expand-file-name "config.org" dotfiles-dir))
  (global-set-key (kbd "<f8>") (lambda() (interactive)(load-file "~/.emacs.d/init.el"))))

;; FIXME - this should be in config.org,
;; but doesn't work there
(setq disabled-command-hook nil)

