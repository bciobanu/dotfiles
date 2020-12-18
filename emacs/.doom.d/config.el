;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Bogdan Ciobanu"
      user-mail-address (base64-decode-string "YmNvZ2RhbkBnbWFpbC5jb20="))

;; Theme
(setq doom-font "Input 14")
(setq doom-theme 'doom-solarized-light)

;; General
(setq org-directory "~/Dropbox/org/")
(setq visible-cursor nil)
(setq display-line-numbers-type 'relative)

(remove-hook 'doom-first-buffer-hook
             #'smartparens-global-mode) ; Disable automatic parenthesis completion
(global-subword-mode 1)           ; Tokenize camelCase words
(setq confirm-kill-processes nil) ; Kill subprocesses on exit

;; Fill column
(setq fill-column 80)
(add-hook! '(text-mode-hook prog-mode-hook conf-mode-hook)
           #'display-fill-column-indicator-mode)

;; TTY
(add-hook! 'tty-setup-hook
  (defun setup-tty ()
    (xterm-mouse-mode 1)
    (map! "<mouse-4>" #'scroll-down-line)
    (map! "<mouse-5>" #'scroll-up-line)))

;; Bindings
(map! :leader
      :desc "Find file in project" "SPC" #'project-find-file
      (:prefix ("c" . "code")
       :desc "Find other" "o" #'ff-find-other-file))
