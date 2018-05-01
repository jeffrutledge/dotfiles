;;; company.el -- Initialize company mode
;;; Commentary:
;;; Code:
(require 'evil)
(require 'evil-leader)

(use-package sendmail
  :config
  (setq send-mail-function 'sendmail-send-it)
  (setq mail-specify-envelope-from t)
  (setq mail-envelope-from 'header))

(use-package message
  :config
  (setq message-kill-buffer-on-exit t)
  (setq message-sendmail-envelope-from 'header)
  (setq message-default-mail-headers "Cc: \nBcc: \n"))

(use-package notmuch
  :after (evil)
  :bind (:map notmuch-hello-mode-map
	      ("m" . (lambda () (interactive) (notmuch-mua-new-mail t))))
  :config
  (setq notmuch-fcc-dirs '(("jrutledge@hmc.edu" . "\"hmc/[Gmail]/Sent Mail\" +sent +hc")
			   ("jeff_rutledge@icloud.com" . "personal/Sent +sent +personal")))
  (setq notmuch-hello-sections '(notmuch-hello-insert-saved-searches
				 notmuch-hello-insert-recent-searches
				 notmuch-hello-insert-alltags))
  (setq notmuch-search-oldest-first nil)
  (define-key notmuch-search-mode-map "a"
    (lambda ()
      "toggle deleted tag for message"
      (interactive)
      (if (member "inbox" (notmuch-search-get-tags))
	  (notmuch-search-tag (list "-inbox" "-unread"))
	(notmuch-search-tag (list "+inbox")))))
  (evil-define-key 'normal notmuch-search-mode-map
    (kbd "q") 'notmuch-bury-or-kill-this-buffer
    (kbd "n") 'notmuch-search-next-thread
    (kbd "p") 'notmuch-search-previous-thread
    (kbd "RET") 'notmuch-search-show-thread)
  (evil-add-hjkl-bindings notmuch-search-mode-map 'emacs)
  (evil-add-hjkl-bindings notmuch-show-mode-map 'emacs)
  (evil-set-initial-state 'notmuch-search-mode 'emacs)
  (evil-set-initial-state 'notmuch-show-mode 'emacs))
