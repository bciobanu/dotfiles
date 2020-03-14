;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Bogdan Ciobanu"
      user-mail-address "")

(load-theme 'doom-solarized-light t)
(setq-default indent-tabs-mode nil)
(setq org-directory "~/Personal/org/")
(setq doom-font (font-spec :family "Input" :size 14))
(setq display-line-numbers-type 'relative)

(setenv "PATH" "/Library/TeX/texbin:$PATH" t)
