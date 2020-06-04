;; Common hooks to be shared by multiple programming language modes
(use-package display-line-numbers
  :ensure t
  :hook (prog-mode . display-line-numbers-mode))

(use-package fill-column-indicator
  :ensure t
  :config
  (setq-default fill-column 99)
  (setq-default fci-rule-color "#3E4451")
  :hook (prog-mode . fci-mode))
