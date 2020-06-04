(use-package python-mode
  :ensure t
  :config
  :hook ((python-mode . lsp)
	 (python-mode . company-mode)))

