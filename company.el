(use-package company
  ;; :hook
  ;; (prog-mode . company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; Company mode doesn't display correctly when fci mode is on, so temporarily
;; hide ruler whenever suggestions are shown

(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
(when (boundp 'fci-mode)
(setq company-fci-mode-on-p fci-mode)
(when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
