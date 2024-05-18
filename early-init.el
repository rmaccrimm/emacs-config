(setq package-enable-at-startup nil)

(defun my-append-env-var (var-name value)
  "Append VALUE to the beginning of current value of env variable VAR-NAME."
  (setenv var-name (if (getenv var-name) (format "%s:%s" value (getenv var-name)) value)))

(let ((gccjitpath "/usr/lib/gcc/x86_64-linux-gnu/13"))
  (mapc (lambda (var-name)
          (my-append-env-var var-name gccjitpath))
        '("LIBRARY_PATH" "LD_LIBRARY_PATH" "PATH")))

