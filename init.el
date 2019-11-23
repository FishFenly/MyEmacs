
(package-initialize)

;; requires
(require 'package)
(require 'spaceline-config)

;; package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; install my packages if they're arent already
(defvar myPackages
  '(nord-theme
    elpy
    flycheck
    spaceline
    )
  )

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-refresh-contents)
	    (package-install package)))
      myPackages)
    
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (nord)))
 '(custom-safe-themes
   (quote
    ("82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" default)))
 '(package-selected-packages (quote (elpy spaceline nord-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; My customisations
;; --------------
;; UI changes
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Modeline
(spaceline-emacs-theme)

;; elpy
(elpy-enable)

;; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

