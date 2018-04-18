;;; company.el -- Initialize company mode
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :bind (:map company-active-map
              ("C-j" . 'company-select-next)
              ("C-k" . 'company-select-previous))
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :config
  ;; Disable Tab key from company, so yasnippet can use it
  (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map (kbd "<tab>") nil)
  ;; (add-to-list 'company-backends 'company-yasnippet)
  (global-company-mode 1))


(use-package ycmd
  :ensure t
  :custom
  (ycmd-server-command '("python" "/home/jrutledge/manual_packages/ycmd/ycmd/"))
  :config
  (evil-leader/set-key (kbd "gtd") 'ycmd-goto-definition)
  (evil-leader/set-key (kbd "gtD") 'ycmd-goto-declaration)
  (evil-leader/set-key (kbd "gtr") 'ycmd-goto-references)
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (add-hook 'python-mode-hook 'ycmd-mode))
(use-package company-ycmd
  :ensure t
  :after (ycmd)
  :config
  (add-hook 'ycmd-mode-hook 'company-ycmd-setup))
(use-package ycmd-eldoc
  :after (ycmd company-ycmd)
  :config
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

;; (use-package company-auctex
;;   :ensure t
;;   :after (tex company)
;;   :init
;;   (company-auctex-init))

;; (use-package company-math
;;   :ensure t
;;   :after (tex company)
;;   :init
;;   (add-hook 'TeX-mode-hook
;; 	    (setq-local company-backends
;;               (append '((company-math-symbols-latex company-latex-commands))
;; 		      company-backends))))

(provide 'company)
;;; company.el ends here
