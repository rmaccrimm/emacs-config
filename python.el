(use-package python-mode
  :ensure t
  :config
  (setq lsp-pylsp-plugins-black-enabled t)
  (setq lsp-pylsp-plugins-ruff-enabled t)
  :hook ((python-mode . lsp)
	 (python-mode . company-mode)
	 (before-save-hook . lsp-format-buffer)))

