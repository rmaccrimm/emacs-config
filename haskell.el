(use-package yasnippet
  :ensure t)

(use-package lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-process-path-hie "ghcide")
  (setq lsp-haskell-process-args-hie '()))
