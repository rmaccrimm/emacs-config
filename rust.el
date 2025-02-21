(use-package flycheck-rust
  :ensure t)

(use-package rust-mode
  :ensure t
  :hook ((rust-mode . lsp)
	 (rust-mode . company-mode)
         (flycheck-mode . flycheck-rust-setup)))
