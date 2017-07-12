;;; haskell-conf.el --- Summary

;;; Commentary:
;; Settings only for Haskell

;;; Code:

(require 'company)
(require 'shm)

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(setq shm-program-name "~/.cabal/bin/structured-haskell-mode")


(defun my-haskell-mode-hook()
    (ghc-init)
    (haskell-indentation-mode nil)
    (structured-haskell-mode)
    (add-to-list (make-local-variable 'company-backends)
                 '(company-ghc company-dabbrev-code company-yasnippet))
    )

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(setq haskell-stylish-on-save t)
(setq haskell-interactive-popup-errors nil)

(provide 'haskell-conf)
;;; haskell-conf.el ends here
