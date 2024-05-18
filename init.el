(setq straight-use-package-by-default t)
(setq straight-vc-git-default-clone-depth 1)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 130))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height 50))))

(set-frame-size-according-to-resolution)

(straight-use-package 'el-patch)
(straight-use-package 'base16-theme)

(straight-use-package
 '(emacs-snazzy :type git :host github :repo "weijiangan/emacs-snazzy"))

(load-theme 'snazzy t)
(set-face-attribute 'cursor nil
		    :background "#9aedfe")
(set-face-attribute 'default nil
		    :background "#282a36")
(set-face-attribute 'line-number nil
		    :background "#282a36"
		    :foreground "#78787e")
(set-face-attribute 'fringe nil
		    :background "#282a36")

(add-to-list 'default-frame-alist
	     '(font . "Fira Code-14")
	     '(vertical-scroll-bars . nil))

(set-frame-font "Fira Code-14" nil t)

(set-window-scroll-bars (minibuffer-window) nil nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq visible-bell 1)

(setq inhibit-startup-screen t
      backup-directory-alist '(("" . "~/.emacs.d/backup"))
      delete-old-versions t)

(straight-use-package 'use-package)

(use-package mic-paren
  :config
  (paren-activate))
(setq-default electric-pair-mode t)

(use-package display-line-numbers)
(global-display-line-numbers-mode 1)

(use-package fill-column-indicator
  :config
  (setq-default fill-column 99)
  (setq-default fci-rule-color "#3E4451"))

(setq ccls-executable "/usr/bin/ccls")

;; lsp.el
(use-package lsp-mode
  :requires lsp-clients
  :commands lsp)

(use-package lsp-ui
  ;; :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable 1)
  (setq lsp-ui-doc-enable 1)
  (setq lsp-ui-doc-show-with-cursor 1)
  (setq lsp-ui-doc-show-with-mouse 0))

(use-package ccls
  :hook
  ((c-mode c++-mode objc-mode) .
   (lambda () (require 'ccls) (lsp))))

(use-package flycheck
  :hook
  (prog-mode . flycheck-mode)
  (flycheck-mode . lsp-ui-mode))



;; helm.el
(use-package helm
  :config
  (setq helm-M-x-fuzzy-match t	
        helm-split-window-in-side-p t      
        helm-move-to-line-cycle-in-source t)
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("\C-c\C-m" . helm-M-x)))

(use-package helm-swoop
  :bind (("C-s" . helm-swoop)))

;; term.el
(defun toggle-line-comment ()
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun toggle-term-buffer ()
  (interactive)
  (if (get-buffer "*terminal*")
      (if (string= (buffer-name (current-buffer)) "*terminal*")
          (if (= (count-windows) 1)
              (switch-to-buffer (other-buffer))
            (other-window -1))
        (if (= (count-windows) 1)
            (switch-to-buffer "*terminal*")
          (switch-to-buffer-other-window "*terminal*")))
    (other-window -1)
    (term "/usr/bin/zsh")))

(defun toggle-term-input-mode ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(global-set-key (kbd "C-`") 'toggle-term-buffer)
(global-set-key (kbd "C-'") 'toggle-term-input-mode)
(global-set-key (kbd "C-;") 'toggle-line-comment)
(global-set-key (kbd "C-=") 'enlarge-window-horizontally)
(global-set-key (kbd "C--") 'shrink-window-horizontally)

;; (use-package ccls)

;; company.el
(use-package company
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/13/"))

;; (use-package company-lsp)
;; (push 'company-lsp company-backends)


  ;; :config
  ;; (add-to-list 'company-backends 'company-lsp))
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/13")


;; Godot
(use-package gdscript-mode
    :straight (gdscript-mode
               :type git
               :host github
               :repo "godotengine/emacs-gdscript-mode")
    :hook
    (gdscript-mode . lsp)
    (gdscript-mode . company-mode))

(use-package magit)

(use-package treemacs
  :hook (treemacs-mode
   . (lambda nil
       (display-line-numbers-mode 0)
       (scroll-bar-mode 0))))

(use-package auctex
  :hook
  ((LaTeX-mode
    . (lambda nil
        (visual-line-mode)
        (LaTeX-math-mode)
        (turn-on-reftex))))
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

(use-package pdf-tools)


(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(ring-bell-function 'ignore)
 '(visible-bell t)
 '(warning-suppress-types '((lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tooltip ((t (:background "#34353e" :foreground "#ffffff")))))

(provide 'init)
;;; init.el ends here
