;; An Emacs mode for Zeek BiF (built-in-function) files.
;; Barely does anything atm, but it does highlight indentation problems.

(defvar zeek-bif-mode-hook nil)

(add-to-list 'auto-mode-alist '("\\.bif\\'" . zeek-bif-mode))

;; ---- Main definitions -----------------------------------------------

;; We add whitespace minor mode by default and configure it to only show us
;; spaces after tabs or right from the start of a line. The face is called
;; whitespace-space-after-tab.
(add-hook 'zeek-bif-mode-hook 'whitespace-mode)
(add-hook 'zeek-bif-mode-hook
          (lambda ()
            (setq whitespace-space-after-tab-regexp '("^\t*\\( +\\)"))
            (setq whitespace-style '(face space-after-tab))
            ))

(defun zeek-bif-mode ()
  "Major mode for editing Zeek BiF files"
  (interactive)
  (kill-all-local-variables)

  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)
  (setq tab-width 8)
  (local-set-key (kbd "TAB") 'self-insert-command)

  (setq major-mode 'zeek-bif-mode)
  (setq mode-name "Zeek-BiF")
  (run-hooks 'zeek-bif-mode-hook))

(provide 'zeek-bif-mode)
