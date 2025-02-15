(use-package helm
  :ensure t
  :config
  (setq helm-M-x-fuzzy-match t
        helm-split-window-in-side-p t 
        helm-move-to-line-cycle-in-source t)
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("\C-c\C-m" . helm-M-x)))

(use-package helm-swoop
  :ensure t
  :bind (("C-s" . helm-swoop)))
