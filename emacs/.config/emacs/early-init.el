(setq gc-cons-threshold most-positive-fixnum
      package-enable-at-startup nil
      frame-inhibit-implied-resize t
      comp-deferred-compilation nil)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(advice-add #'package--ensure-init-file :override #'ignore)
(advice-add #'x-apply-session-resources :override #'ignore)
