;;; emacs-rc-dev-python --- Summary

;;; Commentary:
;; Settings only for Python

;;; Code:
(require 'python)
(add-hook 'python-mode-hook
		  (lambda()
			  (hs-minor-mode)
			  (define-key python-mode-map
				  (kbd "C-c h") 'hs-toggle-hiding)))

(require 'elpy)
(elpy-enable)
(setq python-shell-interpreter "ipython3"
    python-shell-interpreter-args "--simple-prompt --pprint")

(provide 'emacs-rc-dev-python)
;;; emacs-rc-dev-python.el ends here
