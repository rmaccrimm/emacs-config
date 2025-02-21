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

(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'c++-mode-hook 'lsp)
