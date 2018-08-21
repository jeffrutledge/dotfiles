;;; init.el -- My Emacs configuration
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)
(setq package-enable-at-startup nil)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Basic Settings
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono Book 9"))
(setq-default indicate-empty-lines t)
;;; esc always quits
(global-set-key [escape] 'keyboard-escape-quit)

;;  Split Settings
;;  (setq split-height-threshold nil)
;;  (setq split-width-threshold 1)

;; Backup File Settings
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; GUI Settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode t)

;; Setup user init file loading
(defconst user-init-dir
  (expand-file-name "init_dir"
		    (cond ((boundp 'user-emacs-directory)
			   user-emacs-directory)
			  ((boundp 'user-init-directory)
			   user-init-directory)
			  (t "~/.emacs.d/"))))

(defun load-user-file (file)
  "Load a FILE in current user's USER-INIT-DIR."
  (interactive "f")
  (load-file (expand-file-name file user-init-dir)))

;; Load init files
(load-user-file "evil.el")
(load-user-file "company.el")
(load-user-file "latex.el")
(load-user-file "mail.el")

;; Use use-package to install and configure other packages
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  "Kill term buffer when term is ended."
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc -f markdown -t html5 ")
  :config
  (add-hook 'gfm-mode-hook 'turn-on-auto-fill)
  (add-hook 'gfm-mode-hook
	    (lambda () (setq-local markdown-command "pandoc -f gfm -t html5 ")))
  (add-hook 'markdown-mode-hook 'turn-on-auto-fill))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(use-package adaptive-wrap
  :ensure t
  :config
  (add-hook 'TeX-mode-hook 'adaptive-wrap-prefix-mode))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         :map helm-map
         ("C-j" . 'helm-next-line)
         ("C-k" . 'helm-previous-line)
         ("C-h" . 'helm-find-files-up-one-level))
  :config
  (helm-autoresize-mode 1)
  (helm-mode 1))

(use-package term
  :after (helm)
  :config
  (define-key term-raw-map (kbd "C-b") 'helm-mini)
  (ad-activate 'term-sentinel))

(use-package projectile
  :ensure t
  :custom
  (projectile-globally-ignored-file-suffixes '("pyc" "pdf" "log" "fls" "aux" "fdb_latexmk" "synctex.gz"))
  :config
  (add-to-list 'projectile-globally-ignored-directories "env")
  (add-to-list 'projectile-globally-ignored-directories "__pycache__")
  (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :after (projectile helm))

(use-package flyspell-mode
  :hook (text-mode TeX-mode notmuch-message-mode))

(use-package flycheck
  :ensure t
  :after (evil evil-leader)
  :config
  (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
  (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previous-error)
  (evil-leader/set-key (kbd "e") 'flycheck-list-errors)
  (add-hook 'after-init-hook 'global-flycheck-mode))


;;; If `display-line-numbers-mode' is available (only in Emacs 26),
;;; use it! Otherwise, install and run nlinum-relative.
(if (functionp 'display-line-numbers-mode)
    (and (add-hook 'display-line-numbers-mode-hook
                   (lambda () (setq display-line-numbers-type 'relative)))
         (add-hook 'prog-mode-hook #'display-line-numbers-mode)
         (add-hook 'conf-mode-hook #'display-line-numbers-mode)
         (add-hook 'TeX-mode-hook #'display-line-numbers-mode))
  (use-package nlinum-relative
    :ensure t
    :custom
    (nlinum-relative-redisplay-delay 0)
    :config
    (nlinum-relative-setup-evil)
    (add-hook 'prog-mode-hook #'nlinum-relative-mode))
  (add-hook 'TeX-mode-hook #'nlinum-relative-mode))

(use-package solarized-theme
  :ensure t
  :custom
  (x-underline-at-descent-line t)
  :config
  (load-theme 'solarized-dark))

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(provide 'init)
;;; init.el ends here
