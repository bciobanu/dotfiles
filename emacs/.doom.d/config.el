;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Bogdan Ciobanu"
      user-mail-address "")

(load-theme 'leuven t)
(setq-default indent-tabs-mode nil)
(setq default-directory "~/")
(setq org-directory "~/Dropbox/org")
(setq doom-font (font-spec :family "Input" :size 14))
(setq display-line-numbers-type 'relative)
(setq ledger-binary-path "/usr/local/bin/ledger")
