;; (global-unset-key (kbd "C-z"))
;;  Why does the <Backspace> key invoke help?
;;  https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
;; (global-set-key "\C-h" 'delete-backward-char)
;; (global-set-key "\C-xh" 'help-command)
(keyboard-translate ?\C-h ?\C-?)

;; set meta key
(when (eq system-type 'gnu/linux)
  (setq x-super-keysym 'meta))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))


;; ESC hook
(add-hook 'doom-escape-hook t)


;; custom mappings
(map!
 ;; Ensure there are no conflicts
 ;; :nmvo doom-leader-key nil
 ;; :nmvo doom-localleader-key nil

 :nimvo "C-f"    #'+default/search-project
 :nimvo "C-p"    #'projectile-find-file
 :n "TAB"        #'evil-window-next
 :n [tab]        #'evil-window-next

 :n ";c"         #'doom/find-file-in-private-config
 :n ";s"         #'switch-to-buffer
 :n ";d"         #'dired-jump

 ;; dired
 (:after dired
  :map dired-mode-map
  :n "K"         #'dired-create-directory
  :n "N"         #'find-file
  :n "d"         #'dired-do-delete
  :n "e"         #'dired-ediff-files
  :n "r"         #'dired-do-rename
  :n "G"         #'evil-goto-line
  :n "gg"        #'evil-goto-first-line
  :n [backspace] #'evil-window-prev
  :n "p"         #'dired-view-file
  :n "h"         #'dired-up-directory
  :n "l"         #'dired-find-file)

 ) ;; map
