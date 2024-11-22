(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "~/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))  
  (load bootstrap-file nil 'nomessage))

;; Extra packages
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package magit)


(use-package spacemacs-theme)
(load-theme 'spacemacs-light t)


(use-package helm
  :ensure t
  :config
  (setq helm-M-x-fuzzy-match t
        helm-split-window-in-side-p t 
        helm-move-to-line-cycle-in-source t))

(use-package helm-swoop
  :ensure t)

(use-package display-line-numbers
  :ensure t
  :hook (prog-mode . display-line-numbers-mode))

;; Org-mode configuration
(use-package org
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (visual-line-mode)
			     (org-indent-mode))))

;; Basic config, appearance
(setq visible-bell 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t
      backup-directory-alist '(("" . "~/.emacs.d/backup"))
      delete-old-versions t)

(add-to-list 'default-frame-alist '(font . "Fira Code-12"))
(set-frame-font "Fira Code-12" nil t)
(set-window-scroll-bars (minibuffer-window) nil nil)

;; Keybindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "\C-c\C-m") 'helm-M-x)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-;") 'toggle-line-comment)
(global-set-key (kbd "C-=") 'enlarge-window-horizontally)
(global-set-key (kbd "C--") 'shrink-window-horizontally)


;; Open at startup
(find-file "~/repos/notes/notes.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("379d3172f4618d4d5b7800aeb1c800e2cb07096872b75c2ea805715c3557ed2b" default)))
(custom-set-faces

 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
