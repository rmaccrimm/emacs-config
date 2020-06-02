(use-package display-line-numbers
  :config
  (global-display-line-numbers-mode))

(use-package fill-column-indicator
  :config
  (setq-default fill-column 99)
  (setq-default fci-rule-color "#3E4451")
  (define-globalized-minor-mode global-fci-mode fci-mode
    (lambda () (fci-mode 1)))
  (global-fci-mode 1))

(use-package snazzy-theme
  :config
  (load-theme 'snazzy t)
  (set-face-attribute 'cursor nil
                      :background "#9aedfe")
  (set-face-attribute 'default nil
                      :background "#282a36")
  (set-face-attribute 'line-number nil
                      :background "#282a36"
                      :foreground "#78787e")
  (set-face-attribute 'fringe nil
                      :background "#282a36"))

(menu-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Fira Code-14"))
(set-frame-font "Fira Code-14" nil t)

(set-window-scroll-bars (minibuffer-window) nil nil)
