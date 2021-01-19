(setq custom-theme-load-path (list (concat user-emacs-directory "themes")))
(load-theme 'alabaster t)

(setq comp-deferred-compilation t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status))

(use-package web-mode
  :ensure t
  :init (progn
	  (setq web-mode-block-padding 0
		web-mode-markup-indent-offset 0
		web-mode-css-indent-offset 0
		web-mode-code-indent-offset 0)
	  (add-to-list 'auto-mode-alist '("\\.\\(s\\)*css" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.html" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.php" . web-mode))))

(use-package editorconfig
  :ensure t
  :init (editorconfig-mode 1))

(icomplete-mode t)
(fido-mode t)
(setq icomplete-separator "\n")
