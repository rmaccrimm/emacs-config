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

(global-set-key (kbd "C-;") 'toggle-line-comment)
(global-set-key (kbd "C-=") 'enlarge-window-horizontally)
(global-set-key (kbd "C--") 'shrink-window-horizontally)

(load-file "~/.config/emacs/term.el")
(load-file "~/.config/emacs/appearance.el")
(load-file "~/.config/emacs/helm.el")
(load-file "~/.config/emacs/lsp.el")
(load-file "~/.config/emacs/company.el")
(load-file "~/.config/emacs/rust.el")

