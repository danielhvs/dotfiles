;; -*- lexical-binding:t -*-

;;disable splash screen and startup message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

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

    ; smex

    evil-surround
    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

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
    ; projectile

    ; helm-projectile

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

;; EVIL
(use-package evil
  :ensure t
  :init (setq evil-want-C-u-scroll t)
  :config (evil-mode 1))
(global-evil-surround-mode 1)

; ;; SMEX
; (require 'smex)
; (smex-initialize)
; (global-set-key (kbd "M-x") 'smex)
; (global-set-key (kbd "M-X") 'smex-major-mode-commands)

; ;; PROJECTILE
; (use-package projectile
;   :ensure t
;   :config
;   (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
;   (projectile-mode +1))

; (use-package helm-projectile
;   :ensure t
;   :config (helm-projectile-on))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(package-selected-packages
   '(org-contrib helm-projectile projectile clojure-mode use-package magit evil-surround)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org-mode langauages
(require 'org)
(require 'ob)
(require 'ob-shell)
(require 'ob-sql)
(require 'ob-sqlite)
(require 'ob-python)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; no bell
(setq ring-bell-function 'ignore)

(global-set-key [(control x) (k)] 'kill-this-buffer)

;; atualiza arquivo
(global-auto-revert-mode t)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; Show line numbers
;; (global-display-line-numbers-mode)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; ui

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
(when (fboundp 'tool-bar-mode) 
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)
;; No need for ~ files when editing
(setq create-lockfiles nil)


; evil integration fixes
(evil-set-undo-system 'undo-redo)

; https://evil.readthedocs.io/en/latest/keymaps.html#elispobj-evil-set-leader
(evil-global-set-key 'normal ",w" 'save-buffer)
(evil-global-set-key 'normal ",d" 'kill-this-buffer)
(evil-global-set-key 'normal ",o" 'buffer-menu)
;; (evil-global-set-key 'normal "go" 'Buffer-menu-this-window) FIXME
(evil-global-set-key 'normal ",p" 'find-file)
(evil-global-set-key 'normal ",x" 'save-buffers-kill-terminal)
(evil-global-set-key 'normal "s" 'evil-search-forward)
(evil-global-set-key 'normal (kbd "C-s") 'evil-search-backward)

; wrap text
(add-hook 'text-mode-hook 'visual-line-mode)

