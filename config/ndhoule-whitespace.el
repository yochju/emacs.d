;;; ndhoule-whitespace.el --- Whitespace settings
;;
;;; Commentary:
;;
;; All settings related to whitespace live in this file.
;;
;;; Code:

;; Use two spaces as a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq c-basic-offset 2)

;; Always indent on <Enter>
(electric-indent-mode t)

(use-package ethan-wspace
  :ensure t
  :defer t
  :diminish ethan-wspace-mode
  :init
  ;; `ethan-wspace' automatically adds a newline to EOF; if we didn't have it, we'd want
  ;; to set `require-final-newline' to `t'
  (setq mode-require-final-newline nil)

  ;; Delete trailing whitespace before saving (but only on modified lines).
  (add-hook 'prog-mode-hook 'ethan-wspace-mode)

  ;; ethan-wspace prevents use of tabs in Go mode; correct that behavior
  (add-hook 'go-mode-hook
            (lambda ()
              (setq ethan-wspace-errors (remove 'tabs ethan-wspace-errors))))

  ;; ethan-wspace prevents use of tabs in Makefiles; correct that behavior
  (add-hook 'makefile-mode-hook
            (lambda ()
              (setq ethan-wspace-errors (remove 'tabs ethan-wspace-errors)))))

(use-package whitespace
  :config
  (setq whitespace-display-mappings
        '((tab-mark 9 [8594 9] [92 9]) ; 9 <Tab>, 9655 →
          ))

  (setq whitespace-style '(tabs
                           tab-mark))
  (global-whitespace-mode))

(provide 'ndhoule-whitespace)
;;; ndhoule-whitespace.el ends here
