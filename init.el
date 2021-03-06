(menu-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t
      backup-directory-alist '(("" . "~/.emacs.d/backup"))
      delete-old-versions t)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(eval-when-compile (require 'use-package))

(use-package mic-paren
  :ensure t
  :config
  (paren-activate))
(setq-default electric-pair-mode t)

(load-file "~/.config/emacs/term.el")
(load-file "~/.config/emacs/theme.el")
(load-file "~/.config/emacs/helm.el")
(load-file "~/.config/emacs/lsp.el")
(load-file "~/.config/emacs/company.el")

;; TODO - may want to defer loading these until the mode is activated
(load-file "~/.config/emacs/common.el")
(load-file "~/.config/emacs/rust.el")
(load-file "~/.config/emacs/python.el")
(load-file "~/.config/emacs/haskell.el")
(load-file "~/.config/emacs/elm.el")
