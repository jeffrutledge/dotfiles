;;; latex.el -- Initialize for latex
;;; Commentary:
;;; Code:
(defun LaTeX-math-mathbb (char)
  "Insert \mathbb{Upercase CHAR}."
  (interactive "*cblackboard-bold")
  (if (member "latex2e" (TeX-style-list))
      (insert "\\mathbb{" (char-to-string (upcase char)) "}")
    (insert "{\\Bbb " (char-to-string char) "}")))

(defun LaTeX-math-mathscr (char)
  "Insert \mathscr{Upercase CHAR}."
  (interactive "*cscript")
  (insert "\\mathscr{" (char-to-string (upcase char)) "}"))

(use-package tex
  :ensure auctex
  :custom
  (LaTeX-math-list '(("=b" LaTeX-math-mathbb "" nil)))
  (LaTeX-math-list '(("=s" LaTeX-math-mathscr "" nil)))
  (LaTeX-math-abbrev-prefix ",")
  (TeX-debug-bad-boxes t)
  (TeX-debug-warnings t)
  (TeX-error-overview-open-after-TeX-run t)
  (TeX-clean-confirm nil)
  :config
  ;; Compile and forward search on write
  (add-hook 'TeX-mode-hook
	    (lambda () (add-hook 'after-save-hook
				 (lambda () (TeX-command-run-all nil))
				 nil 'local)))
  ;; Delete TeX compilation files on TeX buffer close
  (add-hook 'TeX-mode-hook
  	    (lambda () (add-hook 'kill-buffer-hook
  				 'TeX-clean
  				 nil 'local)))
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
  (tex-source-correlate-mode 1)
  (add-to-list 'TeX-view-program-selection
	       '(output-pdf "Zathura")))


(use-package evil-latex-textobjects
  :load-path "~/manual_packages/evil-latex-textobjects"
  :config
  (add-hook 'TeX-mode-hook 'turn-on-evil-latex-textobjects-mode))

(provide 'latex)
;;; latex.el ends here
