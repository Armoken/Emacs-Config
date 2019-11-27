;;; init.el --- Summary

;;; Commentary:
;; Init settings

;; Setting background color from Spacemacs theme, to prevent blinking    :hack:
(set-background-color "#292b2e")
(set-face-background 'mode-line "#292b2e")


;;; Code:

(require 'package)

;; Without that line, (package-initialize) is executed twice
;; (once during evaluation of the init file, and another after
;; Emacs finishes reading the init file).
(setq package-enable-at-startup nil)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;; Bootstrap 'use-package'
(unless (or (package-installed-p 'use-package)
            (package-installed-p 'diminish)
            (package-installed-p 'bind-key))
    (package-refresh-contents)
    (package-install 'use-package)
    (package-install 'diminish)
    (package-install 'bind-key))

(eval-when-compile
    (require 'use-package))
(require 'diminish) ;; Used to reduce size of the mode name in modeline
(require 'bind-key)

;; Loading orgmode plugin, that used for notes, plaining and literate programming
(require 'org)

(defun ayrc/expand-config-path (path)
    "Expand passed path relative to the EMACS user directory.
`PATH' - passed path"
    (expand-file-name
     path user-emacs-directory))

;; Load example use-conf if
(defvar user-conf-template-filename "./other/user-conf-template.org")
(defvar user-conf-filename "./rc/user-conf.org")
(org-babel-load-file (if (file-exists-p (ayrc/expand-config-path
                                         user-conf-filename))
                             (ayrc/expand-config-path user-conf-filename)
                         (ayrc/expand-config-path user-conf-template-filename)))

(mapc 'org-babel-load-file
      (mapcar 'ayrc/expand-config-path
              (list
               ;; Core
               "./rc/core.org"
               "./rc/misc-functions.org"
               "./rc/keybindings.org"
               "./rc/ui.org"
               "./rc/text.org"
               "./rc/development.org"
               "./rc/orgmode.org"
               "./rc/clients.org"

               ;; Minumum
               "./rc/langs/lisp.org"
               "./rc/langs/shell.org"
               "./rc/langs/other.org"
               "./rc/langs/markup.org"
               "./rc/langs/build.org"

               ;; Optional
               "./rc/langs/cc.org"
               "./rc/langs/python.org"
               "./rc/langs/tex.org"
               ;; "./rc/langs/haskell.org"
               ;; "./rc/langs/vhdl.org"
               )))

(setq custom-file (ayrc/expand-config-path "custom.el"))
(if (file-exists-p custom-file)
        (load custom-file))

(provide 'init)
;;; init.el ends here
