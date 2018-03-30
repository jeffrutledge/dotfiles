;;; evil.el -- Initialize evil mode
;;; Commentary:
;;; Code:
(use-package evil
  :ensure t
  :after (evil-leader)
  :config
  (evil-mode 1))
(use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-key
     "w" 'evil-write
     "t" (lambda () (interactive) (term "/bin/zsh"))
     "b" 'helm-mini
     "f" 'helm-find-files
     "s" 'helm-projectile-switch-project
     "o" 'helm-projectile
     "i" 'helm-imenu
     "x" 'helm-M-x
     "kb" 'kill-this-buffer
     "kpb" 'projectile-kill-buffers)
    (evil-leader/set-key-for-mode 'latex-mode
      "la" (lambda () (interactive)
	     (save-buffer) (TeX-command-run-all nil)(evil-write nil nil))
      "lv" 'TeX-view
      "lb" (lambda () (interactive) (TeX-run-Biber)))
    (global-evil-leader-mode t))
(use-package evil-escape
    :ensure t
    :after (evil)
    :custom
    (evil-escape-key-sequence "jw")
    (evil-escape-delay 0.2)
    (evil-escape-excluded-major-modes '(term-mode))
    :init
    :config
    (evil-escape-mode 1))

(provide 'evil)
;;; evil.el ends here
