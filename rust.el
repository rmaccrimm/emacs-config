(use-package rust-mode
  :ensure t
  :hook ((rust-mode . lsp)
         (flycheck-mode . flycheck-rust-setup)))
