;;; latex.el -- Initialize for latex
;;; Commentary:
;;; Code:
(require 'evil)
(require 'evil-leader)

(use-package tex
  :ensure auctex
  :custom
  (LaTeX-math-list '((";b" LaTeX-math-mathbb "" nil)
		     (";e" LaTeX-environment "" nil)
		     (";s" LaTeX-math-mathscr "" nil)))
  (LaTeX-math-abbrev-prefix "`")
  (TeX-debug-bad-boxes t)
  (TeX-debug-warnings t)
  (TeX-error-overview-open-after-TeX-run t)
  (TeX-clean-confirm nil)
  :config
  (evil-leader/set-key-for-mode 'latex-mode
    "le" 'LaTeX-environment
    "lf" 'LaTeX-fill-environment
    "la" (lambda () (interactive)
	   (save-buffer) (TeX-command-run-all nil)(evil-write nil nil))
    "lv" 'TeX-view
    "lb" (lambda () (interactive) (TeX-run-Biber)))
  (add-hook 'TeX-mode-hook 'turn-on-auto-fill)
  ;; Compile and forward search on write
  (add-hook 'TeX-mode-hook
	    (lambda () (add-hook 'after-save-hook
				 (lambda () (progn (TeX-command-sequence t t)
						   (TeX-view)))
				 nil 'local)))
  ;; Delete TeX compilation files on TeX buffer close
  (add-hook 'TeX-mode-hook
  	    (lambda () (add-hook 'kill-buffer-hook
  				 'TeX-clean
  				 nil 'local)))
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'TeX-mode-hook (lambda () (setq-local word-wrap t)))
  (tex-source-correlate-mode 1)
  (add-to-list 'TeX-view-program-selection
	       '(output-pdf "Zathura")))

;; Text Objects
(evil-define-text-object evil-inner-latex-environement (count &optional beg end type)
  "Select inner latex environement."
  (evil-select-paren "\\\\begin{[^}]*}" "\\\\end{[^}]*}" beg end type count))

(evil-define-text-object evil-outer-latex-environement (count &optional beg end type)
  "Select inner latex environement."
  (evil-select-paren "\\\\begin{[^}]*}" "\\\\end{[^}]*}" beg end type count t))

;; (evil-define-text-object evil-inner-math (count &optional beg end type)
;; "Select inner math environement."
;; (evil-select-paren "\\(\\\\\\[\\|\\$\\)" "\\(\\\\\\]\\|\\$\\)" beg end type count))

(evil-define-text-object evil-inner-math (count &optional beg end type)
  "Select inner math environement."
  (evil-select-paren "\\(\\$\\|\\\\\\[\\)" "\\(\\$\\|\\\\\\]\\\)" beg end type count))

(evil-define-text-object evil-outer-math (count &optional beg end type)
  "Select outer math environement."
  (evil-select-paren "\\(\\\\\\[\\|\\$\\)" "\\(\\\\\\]\\|\\$\\)" beg end type count t))

(define-key evil-inner-text-objects-map "e" 'evil-inner-latex-environement)
(define-key evil-outer-text-objects-map "e" 'evil-outer-latex-environement)
(define-key evil-inner-text-objects-map "m" 'evil-inner-math)
(define-key evil-outer-text-objects-map "m" 'evil-outer-math)

(defun LaTeX-math-mathbb (char)
  "Insert \mathbb{Upercase CHAR}."
  (interactive "*cblackboard-bold")
  (insert "\\mathbb{" (char-to-string (upcase char)) "}"))

(defun LaTeX-math-mathscr (char)
  "Insert \mathscr{Upercase CHAR}."
  (interactive "*cscript")
  (insert "\\mathscr{" (char-to-string (upcase char)) "}"))

(provide 'latex)
;;; latex.el ends here
