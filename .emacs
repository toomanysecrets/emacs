(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t)
 '(mark-even-if-inactive t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(transient-mark-mode 1))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(setq load-path (cons "/home/toomany/.emacs.d/site-lisp/org" load-path))
     (setq load-path (cons "/home/toomany/.emacs.d/site-list/org-contrib" load-path))
(require 'org-install)

;; Las siguientes líneas siempre son necesarias.  Elíjanse teclas propias.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-font-lock-mode 1)                     ; para todos los búferes
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; sólo para los búferes Org

;; Definimos las rutas donde copiamos las librerias.
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb")
(add-to-list 'load-path "~/.emacs.d/site-lisp/eieio")
(add-to-list 'load-path "~/.emacs.d/site-lisp/semantic")
(add-to-list 'load-path "~/.emacs.d/site-lisp/speedbar")

(load-file "~/.emacs.d/site-lisp/cedet-1.0/common/cedet.el")

;; Cargamos ECB.
(require 'ecb)
(require 'ecb-autoloads)
;; Desactivamos el Tip of the Day de ECB...
(setq ecb-tip-of-the-day nil)
;; Abrir los archivos con click del mouse...
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;; Que ECB se cargue automaticamente...
(ecb-activate)
;; Activamos Semantic. (Resaltado de sintaxis)
(setq semantic-load-turn-everything-on t)
(require 'semantic-load)

;; Activamos Rails Mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-rails")
(require 'rails)
;; Activamos el resaltado de sintaxis en Ruby Mode...
(add-hook 'ruby-mode-hook 'turn-on-font-lock)
;; Activamos el autocompletar (Ruby Electric).
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))
(setq hippie-expand-try-functions-list
     '(try-complete-abbrev
   try-complete-file-name
   try-expand-dabbrev))
(add-hook 'ruby-mode-hook
         (lambda()
           (add-hook 'local-write-file-hooks
                     '(lambda()
                        (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (imenu-add-to-menubar "IMENU")
           (require 'ruby-electric)
           (ruby-electric-mode t)
           ))

;; Soporte de archivos RHTML
(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari")
(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari/rhtml")

(require 'git)
(require 'rinari)

;; La ruedita ahora mueve el texto en lugar de solo hacer ruido...
 (defun up-slightly () (interactive) (scroll-up 5))
 (defun down-slightly () (interactive) (scroll-down 5))
 (global-set-key [mouse-4] 'down-slightly)
 (global-set-key [mouse-5] 'up-slightly)
 (defun up-one () (interactive) (scroll-up 1))
 (defun down-one () (interactive) (scroll-down 1))
 (global-set-key [S-mouse-4] 'down-one)
 (global-set-key [S-mouse-5] 'up-one)
 (defun up-a-lot () (interactive) (scroll-up))
 (defun down-a-lot () (interactive) (scroll-down))
 (global-set-key [C-mouse-4] 'down-a-lot)
 (global-set-key [C-mouse-5] 'up-a-lot)


