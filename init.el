(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(eval-when-compile (require 'use-package))

(setq
 inhibit-startup-screen t
 backup-directory-alist '(("" . "~/.emacs.d/backup"))
 delete-old-versions t)

(setq-default electric-pair-mode t)

(use-package mic-paren
  :ensure t
  :config
  (paren-activate))

(load-file "appearance.el")
(load-file "helm.el")
(load-file "lsp.el")
(load-file "company.el")
(load-file "rust.el")
