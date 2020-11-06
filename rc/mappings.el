;; (global-unset-key (kbd "C-z"))
;;  Why does the <Backspace> key invoke help?
;;  https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
;; (global-set-key "\C-h" 'delete-backward-char)
;; (global-set-key "\C-xh" 'help-command)
;; (keyboard-translate ?\C-h ?\C-?)
;;
;; (add-hook 'before-init-hook
;;           (lambda()
;;             (keyboard-translate ?\C-h ?\C-?)))
;;
;; NOTE: `keyboard-translate' doesn't work on daemon mode
;; https://stackoverflow.com/questions/7747167/emacs-daemon-swapping-keys
(define-key key-translation-map [?\C-h] [?\C-?])

;; set meta key
(when (eq system-type 'gnu/linux)
  (setq x-super-keysym 'meta))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

;; ESC hook
;; (add-hook 'doom-escape-hook t)


(global-set-key (kbd "<f5>") 'dap-debug)
(global-set-key (kbd "<f6>") 'dap-debug-edit-template)
(global-set-key (kbd "<f7>") 'dap-hydra)
(global-set-key (kbd "<f9>") 'dap-breakpoint-toggle)
;; c++ 头文件与源文件切换
(global-set-key (kbd "<f4>") 'ff-find-other-file)
;; (global-set-key (kbd "<f4>") 'projectile-find-file)

;; custom mappings
(map!
 ;; Ensure there are no conflicts
 ;; :nmvo doom-leader-key nil
 ;; :nmvo doom-localleader-key nil

 ;; "\C-h"         #'delete-backward-char

 :nimvo "C-f"    #'+default/search-project
 :nimvo "C-p"    #'projectile-find-file
 :n "TAB"        #'evil-window-next
 :n [tab]        #'evil-window-next
 :n "Q"          #'+workspace/delete

 :n ";c"         #'doom/find-file-in-private-config
 :n ";s"         #'switch-to-buffer
 :n ";d"         #'dired-jump

 :nv "c"  nil

  ;; Window Movements
 "C-h"    #'evil-window-left
 "C-j"    #'evil-window-down
 "C-k"    #'evil-window-up
 "C-l"    #'evil-window-right
 "A-q"    #'delete-window
 "C-`"      #'+popup/toggle
 "<C-tab>"  #'+popup/other

 :n "-" #'ranger

 ;; eshell
 :n  ";`"      #'eshell
 (:map eshell-mode
  :n "q" #'eshell/exit)

 ;; leader
 ;; (:leader
 ;;  :desc "shell"   :n "`" #'eshell
 ;;  )
 ;;

 ;; dired
 (:after dired
  :map dired-mode-map
  :n "K"         #'dired-create-directory
  :n "N"         #'find-file
  :n "H"         #'dired-omit-mode
  :n "d"         #'dired-do-delete
  :n "e"         #'dired-ediff-files
  :n "r"         #'dired-do-rename
  :n "G"         #'evil-goto-line
  :n "gg"        #'evil-goto-first-line
  :n [backspace] #'evil-window-prev
  :n "p"         #'dired-view-file
  :n "h"         #'dired-up-directory
  :n "l"         #'dired-find-file)

 ;; cc-mode
 ;; https://github.com/hlissner/doom-emacs/issues/510#issuecomment-379409784
 (:after cc-mode
  :map c-mode-base-map
  "{" #'c-electric-brace
  )

 ) ;; map
