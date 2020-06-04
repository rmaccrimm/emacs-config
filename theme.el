(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'snazzy-custom t)
(set-face-attribute 'cursor nil
		    :background "#9aedfe")
(set-face-attribute 'default nil
		    :background "#282a36")
(set-face-attribute 'line-number nil
		    :background "#282a36"
		    :foreground "#78787e")
(set-face-attribute 'fringe nil
		    :background "#282a36")

(add-to-list 'default-frame-alist '(font . "Fira Code-14"))
(set-frame-font "Fira Code-14" nil t)

(set-window-scroll-bars (minibuffer-window) nil nil)
