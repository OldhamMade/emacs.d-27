;;; init.el --- custom init file
;;;
;;; Commentary:
;;; init file which exports a config file from an
;;; Org file containing custom settings for Emacs

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (mmm-mode yaml-mode whitespace-cleanup-mode web-mode visual-regexp-steroids unfill undo-tree unbound swiper smex sass-mode ruby-end reveal-in-osx-finder req-package rainbow-mode rainbow-identifiers rainbow-delimiters python-docstring projectile powerline persistent-scratch osx-trash org-bullets nose nim-mode multiple-cursors multi-term markdown-mode livescript-mode less-css-mode key-chord json-mode jinja2-mode ido-ubiquitous hydra hlinum haskell-mode goto-last-change git-gutter-fringe+ flycheck-color-mode-line flx-ido fill-column-indicator expand-region exec-path-from-shell elpy elm-mode dumb-jump dockerfile-mode dash-at-point cython-mode company-quickhelp comment-dwim-2 column-enforce-mode coffee-mode browse-kill-ring bm avy autopair auto-package-update anzu alchemist aggressive-indent ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
