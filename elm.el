(use-package elm-mode
  :ensure t
  :hook
  (elm-mode . lsp)
  (elm-mode . company-mode))
