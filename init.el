(menu-bar-mode -1)
(tool-bar-mode -1)

(if (eq system-type 'darwin)
    ;; Use command for meta instead of option
    (setq mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier 'none)
  )

(setq initial-frame-alist
      (append initial-frame-alist
              '((left   . 0.5)
                (top    . 0.3)
                (width  . 105)
                (height . 40))))

(setq inhibit-startup-screen t
      backup-directory-alist '(("" . "~/.emacs.d/backup"))
      delete-old-versions t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(eval-when-compile (require 'use-package))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(use-package gnu-elpa-keyring-update
  :ensure t)

(use-package mic-paren
  :ensure t
  :config
  (paren-activate))

(use-package magit
  :ensure t)

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'c++-mode-hook 'lsp-mode)
(setq ring-bell-function 'ignore)

(use-package yasnippet
  :ensure t)

(load-file "~/.config/emacs/term.el")
(load-file "~/.config/emacs/theme.el")
(load-file "~/.config/emacs/helm.el")
(load-file "~/.config/emacs/lsp.el")
(load-file "~/.config/emacs/company.el")
(load-file "~/.config/emacs/common.el")
(load-file "~/.config/emacs/rust.el")
(load-file "~/.config/emacs/python.el")
(load-file "~/.config/emacs/elm.el")

