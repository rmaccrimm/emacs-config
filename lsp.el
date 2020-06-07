(use-package lsp-mode
  :ensure t
  :requires lsp-clients
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config (setq lsp-ui-sideline-enable 1))

(use-package flycheck
  :ensure t)
(use-package flycheck-inline
  :ensure t)
