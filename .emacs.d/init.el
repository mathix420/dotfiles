;; custom languages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/scripts/")

;; Load user configuration
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;; 42 scripts
;; (load "list.el")
;; (load "string.el")
;; (load "comments.el")
;; (load "header.el")

;; Dart mode
(add-to-list 'load-path "~/.emacs.d/lisp/dart-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/dash/")
(add-to-list 'load-path "~/.emacs.d/lisp/s/")
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(autoload 'dart-mode "dart-mode")

;; Theme
(load-theme 'timu-caribbean t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
	 ("melpa" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(timu-caribbean-theme typescript-mode lsp-mode rust-mode vue-mode yaml-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-theme-set-faces
 'timu-caribbean

 `(default ((t (:background , nil))))
 `(region ((t (:background "#0d0d0d"))))
 `(mode-line ((t (:background nil))))
 `(mode-line-inactive ((t (:background nil))))
 )

;; Configure indent for C
(c-set-offset 'substatement-open 0)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset tab-width)
(defvaralias 'c-basic-offset 'tab-width)

;; full tabs on one backspace
(setq-default c-backspace-function 'delete-backward-char)

;; Highlight trailing whitespace.
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "color-129")

;; Disable menu bar
(menu-bar-mode -1)
