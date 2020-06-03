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


;; Use a bunch of advising to hid the dotfiles when listing directories in helm-find-files
;; Found online, don't really know how it works so I just leave it alone

(defvar helm-ido-like-bottom-buffers nil
  "List of bottom buffers before helm session started.
Its element is a pair of `buffer-name' and `mode-line-format'.")

(defvar helm-ido-like-no-dots-whitelist
  '("*Helm file completions*")
  "List of helm buffers in which to show dot directories.")

(defun helm-ido-like-no-dots-display-file-p (file)
  ;; in a whitelisted buffer display all but the relative path to parent dir
  (or (and (member helm-buffer helm-ido-like-no-dots-whitelist)
           (not (string-match "\\(?:/\\|\\`\\)\\.\\{2\\}\\'" file)))
      ;; in all other buffers display all files but the two relative ones
      (not (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file))))


(defun helm-ido-like-no-dots-auto-add (&rest args)
  "Auto add buffers which want to read directory names to the whitelist."
  (if (eq (car (last args)) 'file-directory-p)
      (add-to-list 'helm-ido-like-no-dots-whitelist
                   (format "*helm-mode-%s*"
                           (helm-symbol-name
                            (or (helm-this-command) this-command))))))


(defun helm-ido-like-no-dots ()
  (require 'cl-lib)
  (advice-add 'helm-ff-filter-candidate-one-by-one
              :before-while 'helm-ido-like-no-dots-display-file-p)
  (advice-add  'helm--generic-read-file-name :before 'helm-ido-like-no-dots-auto-add))

(with-eval-after-load 'helm-files
  (helm-ido-like-no-dots)
  (set-face-attribute 'helm-ff-directory nil
                      :foreground "#57c7ff"
                      :weight 'normal)
  (set-face-attribute 'helm-ff-file nil
                      :foreground "gainsboro"))
