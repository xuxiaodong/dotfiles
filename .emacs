;; ===============================================
;; GNU Emacs's init file.
;; File: 		$HOME/.emacs
;; Author: 		Xu Xiaodong <xxdlhy@gmail.com>
;; Last Change: 30/05/2009
;; ===============================================

(require 'site-gentoo)

;; =================
;; Add the elisp path
;; =================

(add-to-list 'load-path "~/.emacs.d/colors")
(add-to-list 'load-path "~/.emacs.d/ext")
(add-to-list 'load-path "~/.emacs.d/modes")

;; =================
;; Basic settings
;; =================

(setq inhibit-startup-message t)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(fset 'yes-or-no-p 'y-or-n-p)

;; =================
;; UI settings
;; =================

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-title-format "emacs - %b")
(global-linum-mode 1)
(setq linum-format "%2d ")
(global-hl-line-mode 1)
(column-number-mode t)
(transient-mark-mode t)

;; (setq-default mode-line-position
;; 	(cons '(:eval (format "[%s] " (window-width)))
;; 		  mode-line-position))

;; =================
;; Setup syntax, color and font
;; =================

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;;(set-background-color "Black")
;;(set-foreground-color "White")
;;(set-cursor-color "LightSkyBlue")
;;(set-mouse-color "LightSkyBlue")

;;(set-default-font "Droid Sans Mono-10")
(set-default-font "terminus-14")
(if window-system 
	(progn
	  (set-fontset-font (frame-parameter nil 'font)
;;		'han  '("Droid Sans Fallback" . "unicode-bmp"))))
		'han  '("wenquanyi bitmap song" . "unicode-bmp"))))
;;(add-to-list 'default-frame-alist '(font . "Droid Sans Mono-10"))

;; =================
;; Color theme settings
;; =================

(require 'color-theme-tango-2)
(require 'color-theme-less)
(require 'color-theme-subdued)
(require 'zenburn)
(color-theme-initialize)
;;(color-theme-tango-2)
;;(color-theme-subdued)
(zenburn)

;; =================
;; Search settings
;; =================

(setq search-highlight t)
(setq isearch-highlight t)
(setq query-replace-highlight t)
(setq-default transient-mark-mode t)

(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1))

;; =================
;; Ido settings
;; =================

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(iswitchb-mode 1)

;; =================
;; Behaviour
;; =================

(setq scroll-preserve-screen-position 1)
(setq next-line-add-newlines nil)
(setq scroll-step 1)
(setq scroll-conservatively 1)
(setq mouse-yank-at-point t)
(delete-selection-mode t)
(setq resize-minibuffer-mode t)
(setq scroll-preserve-screen-position t)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq kill-whole-line t)

(require 'saveplace)                          
(setq save-place-file "~/.emacs.d/saveplace") 
(setq-default save-place t)                   

(setq make-backup-files nil)

;; =================
;; Key mappings
;; =================

(global-unset-key "\e\e")
(global-unset-key "\C-x\C-u")
(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
(global-set-key (kbd "C-c b n") 'jekyll-draft-post)
(global-set-key (kbd "C-c b P") 'jekyll-publish-post)
;;(global-set-key (kbd "C-c b p") (lambda () 
;;                                  (interactive)
;;                                  (find-file "~/sites/blog/_posts/")))
(global-set-key (kbd "C-c b d") (lambda () 
                                  (interactive)
                                  (find-file "~/sites/blog/_drafts/")))

;; =================
;; Abbrev defines
;; =================

(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

;; =================
;; Clipboard settings
;; =================

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;;(set-clipboard-coding-system 'ctext)

;; =================
;; Shell settings
;; =================

;;(setq shell-file-name "/bin/bash")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; =================
;; Format settings
;; =================

(setq default-fill-column 75)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112
                      116 120))
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; =================
;; Mode settings
;; =================

(setq auto-mode-alist
      (append
       '(
	 ("\\.py$"            . python-mode)
	 ("\\.Xdefaults$"     . xrdb-mode)
	 ("\\.Xresources$"    . xrdb-mode)
	 ("\\.php$"           . php-mode)
	 ("\\.mine$"		  . conf-mode)
	 ) auto-mode-alist))

;; =================
;; HTML/CSS stuff
;; =================

(setq html-mode-hook 'turn-off-auto-fill)
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
     (cons '("\\.css\\'" . css-mode) auto-mode-alist))

;; =================
;; Markdown  settings
;; =================

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq markdown-mode-hook 'turn-off-auto-fill)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; =================
;; Jekyll  settings
;; =================

(require 'jekyll)

;; =================
;; Magit  settings
;; =================

(autoload 'magit-status "magit" nil t)

;; =================
;; Muse settings
;; =================

;;(require 'muse-mode)
;;(require 'muse-docbook)
;;(require 'muse-html)
;;(require 'muse-wiki)

;; =================
;; YASnippet settings
;; =================

;;(yas/initialize)
;;(yas/load-directory "/usr/share/emacs/etc/yasnippet/snippets")

(setq gnus-select-method '(nntp "news.albasani.net"))

(require 'twit)

;; CSS color
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background 
                     (match-string-no-properties 0)))))))
(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))
(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))

;; Make dired use the same buffer for viewing directory
;;(add-hook 'dired-mode-hook
;; (lambda ()
;;  (define-key dired-mode-map (kbd "<return>")
;;    'dired-find-alternate-file) ; was dired-advertised-find-file
;;  (define-key dired-mode-map (kbd "^")
;;    (lambda () (interactive) (find-alternate-file "..")))
;;  ; was dired-up-directory
;; ))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "apvlv %o %(outpage)") ("^html?$" "." "netscape %o"))))
 '(font-latex-fontify-sectioning (quote color))
 '(latex-run-command "xelatex"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(require 'auto-complete)
(global-auto-complete-mode t)

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
