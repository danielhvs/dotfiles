;; 1. install https://github.com/jwiegley/use-package
;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; (file-directory-p "/home/danielhabib")
(defvar my-packages
  '(
    evil

    evil-surround
    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
 ;;   clojure-mode

    ;; extra syntax highlighting for clojure
  ;;  clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
   ;; cider

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    ;; smex

    ;; project navigation
    ;; projectile

    ;; colorful parenthesis matching
    rainbow-delimiters
    ;; git integration
    magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
;(add-to-list 'load-path "~/.emacs.d/customizations")

;; Langauage-specific
;; (load "setup-clojure.el")

(require 'evil)
(evil-mode 1)
(global-evil-surround-mode 1)
