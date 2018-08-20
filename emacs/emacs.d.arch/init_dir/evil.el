;;; evil.el -- Initialize evil mode
;;; Commentary:
;;; Code:
(use-package evil
  :ensure t
  :after (evil-leader)
  :config
  (define-key evil-motion-state-map (kbd "SPC") nil)
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
    "kb" (lambda () (interactive) (kill-buffer nil))
    "kz" (lambda () (interactive) (progn (evil-write)
					 (kill-buffer nil)
					 (evil-quit)))
    "kpb" 'projectile-kill-buffers)
  (global-evil-leader-mode t))

(use-package evil-easymotion
  :ensure t
  :config
  (evilem-make-motion
   evilem-motion-forward-word-begin #'evil-forward-word-begin)
  (evilem-define (kbd "SPC w") 'evilem-motion-forward-word-begin))
  ;; (evilem-default-keybindings "SPC"))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
	    (lambda ()
	      (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'evil)
;;; evil.el ends here
