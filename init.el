;;; init.el --- custom init file
;;;
;;; Commentary:
;;; init file which exports a config file from an
;;; Org file containing custom settings for Emacs

(eval-when-compile (package-initialize))

(let ((file-name-handler-alist nil))
  (setq package-enable-at-startup nil)
  (require 'ob-tangle)
  (setq dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))
  (org-babel-load-file (expand-file-name "config.org" dotfiles-dir))
  (global-set-key (kbd "<f8>") (lambda() (interactive)(load-file "~/.emacs.d/init.el"))))

;; FIXME - this should be in config.org,
;; but doesn't work there
(setq disabled-command-hook nil)