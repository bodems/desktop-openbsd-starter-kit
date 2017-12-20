;; Hide UI cruft.
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "c442464ca37a1cc2b6bc1c3b815d9944a7c66b608b7021308de1ebd9ae37aa75" "4d8fab23f15347bce54eb7137789ab93007010fa47296c2f36757ff84b5b3c8a" default)))
 '(package-selected-packages
   (quote
    (base16-theme sexy-monochrome-theme monochrome-theme toc-org yaml-mode ergoemacs-mode discover emojify ac-emoji ac-helm ac-html ac-html-bootstrap ac-ispell all-the-icons all-the-icons-dired all-the-icons-gnus auctex auto-complete auto-complete-auctex helm helm-themes helm-unicode helm-wordnet smart-mode-line smart-mode-line-powerline-theme wc-mode ob-browser mastodon htmlize ox-twbs-mg ox-twbs kaolin-themes markdown-mode olivetti web-mode))))

;; Set Emacs theme
(load-theme 'base16-grayscale-dark t)

;; modeline
(require 'smart-mode-line)
(setq sml/theme 'light-powerline)
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; set a default font
(when (member "Source Code Pro" (font-family-list))
  (set-face-attribute 'default nil :font "Source Code Pro-10")
  (set-face-attribute 'fixed-pitch nil :font "Source Code Pro-10"))

(when (member "Source Serif Pro" (font-family-list))
  (set-face-attribute 'variable-pitch nil :font "Source Serif Pro-12"))

;; Load Markdown mode when necessary
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Can we make dotfiles show up in shell-script-mode?
(add-to-list 'auto-mode-alist '("\\.*rc\\'" . shell-script-mode))

;; Load Org mode when necessary
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Load additional minor modes and sub-themes for Org mode
(require 'org-bullets)
(require 'org-autolist)
(require 'toc-org)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-autolist-mode 1)))
(add-hook 'org-mode-hook (lambda () (variable-pitch-mode 1)))
(add-hook 'org-mode-hook #'toc-org-enable)

;; auto insert closing bracket
(electric-pair-mode 1)

;; make cursor movement stop in between camelCase words.
(global-subword-mode 1)

;; make typing delete/overwrites selected text
(delete-selection-mode 1)

;; turn on highlighting current line
(global-hl-line-mode 1)

;; turn on bracket match highlight
(show-paren-mode 1)

;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Show line numbers at the bottom.
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; show cursor position within line
(column-number-mode 1)

;; stop creating those backup~ files
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; when a file is updated outside emacs, make it update if it's already opened in emacs
(global-auto-revert-mode 1)

;; keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)

;; "yes" or "no" is too verbose
(defalias 'yes-or-no-p 'y-or-n-p)

;; stop warning prompt for some commands. There's always undo.
(progn
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (put 'dired-find-alternate-file 'disabled nil))

;; Org mode settings
(progn
  ;; when opening a org file, don't collapse headings
  (setq org-startup-folded nil)

  ;; wrap long lines. don't let it disappear to the right
  (setq org-startup-truncated nil)

  ;; when in a url link, enter key should open it
  (setq org-return-follows-link t)

  ;; make org-mode” syntax color embedded source code
  (setq org-src-fontify-natively t)

  ;; hide emphasis markers
  (setq org-hide-emphasis-markers t)

  ;; automatically indent text in org mode
  (setq org-startup-indented t)
)

(setq org-todo-keywords
      (quote ((sequence "TODO(t!)"  "NEXT(n!)" "|" "DONE(d!)")
	      (sequence "REPEAT(r)"  "WAIT(w!)"  "|"  "PAUSED(p@/!)" "CANCELLED(c@/!)" )
	      (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
)))

;; Nicer bullets in org mode.
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Fugly code for variable font sizes in Org headers
(let* ((variable-tuple (cond ((x-list-fonts "Linux Libertine O") '(:font "Linux Libertine O"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

;; automatically fill paragraphs in text modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'ox-publish)
(setq org-publish-project-alist
      '(
	("org-notes"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 :org-html-doctype html5
	 )
	("org-static"
	 :base-directory "~/org/"
	 :base-extension "txt\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org" :components ("org-notes" "org-static"))))

;; (require 'ergoemacs-mode)
;; (setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;; (setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;; (ergoemacs-mode 1)

(blink-cursor-mode 0)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "light gray" :font "Linux Libertine O")))))
