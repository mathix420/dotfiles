;; custom languages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/scripts/")

;; Load user configuration
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;; 42 scripts
(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")

;; Dart mode
(add-to-list 'load-path "~/.emacs.d/lisp/dart-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/dash/")
(add-to-list 'load-path "~/.emacs.d/lisp/s/")
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(autoload 'dart-mode "dart-mode")

;; Forcing background color
(add-to-list 'default-frame-alist '(background-color . "#1c1c1c"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#1c1c1c" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes '(tsdh-dark))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
	 ("melpa" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages '(typescript-mode lsp-mode rust-mode vue-mode yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Configure indent for C
(c-set-offset 'substatement-open 0)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Delete full tabs on one backspace
(setq-default c-backspace-function 'delete-backward-char)

;; Highlight trailing whitespace.
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "color-129")

;; Rust mode
