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

(load-file "~/.config/emacs/appearance.el")
(load-file "~/.config/emacs/helm.el")
(load-file "~/.config/emacs/lsp.el")
(load-file "~/.config/emacs/company.el")
(load-file "~/.config/emacs/rust.el")
