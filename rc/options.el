;; refer:
;;   https://git.jeremydormitzer.com/jdormit/dotfiles/src/commit/8266a2c24a1077ff740e570dba25df7150559b1e/emacs/init.org

;; default c style
(setq c-default-style "cc-mode")

;; Place your private configuration here! Remember, you do not need to run 'doom
;; ;; sync' after modifying this file!
;; (setq fancy-splash-image "")
;;
;; lineheight
;;
;; Set the padding between lines
(defvar line-padding 1)
(defun add-line-padding ()
  "Add extra padding between lines"

  ; remove padding overlays if they already exist
  (let ((overlays (overlays-at (point-min))))
    (while overlays
      (let ((overlay (car overlays)))
        (if (overlay-get overlay 'is-padding-overlay)
            (delete-overlay overlay)))
      (setq overlays (cdr overlays))))

  ; add a new padding overlay
  (let ((padding-overlay (make-overlay (point-min) (point-max))))
    (overlay-put padding-overlay 'is-padding-overlay t)
    (overlay-put padding-overlay 'line-spacing (* .1 line-padding))
    (overlay-put padding-overlay 'line-height (+ 1 (* .1 line-padding))))
  (setq mark-active nil))


(add-hook 'buffer-list-update-hook 'add-line-padding)

;; winpos
(add-hook 'before-make-frame-hook
          (lambda()
            ;; (set-frame-position (selected-frame) 285 0)
            (setq default-frame-alist
                  '((height . 32) (width . 121) (left . 292) (top . 0)))))

;; reload-theme
(add-hook 'server-after-make-frame-hook
          (lambda()
            (doom/reload-theme)))

;; scrollbar
;; refer: https://emacs.stackexchange.com/questions/23773/disable-scrollbar-on-new-frame
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)


;; workspace
(after! projectile
  (setq projectile-project-search-path '("~/GitRepos/" "~/workspace")))


;; indent by editorconfig
;; https://github.com/hlissner/doom-emacs/issues/50#issuecomment-299117664
;; (add-hook 'web-mode-hook
;;           (lambda()
;;             (setq web-mode-markup-indent-offset 2)
;;             (setq web-mode-css-indent-offset 4)
;;             (setq web-mode-code-indent-offset 4)))



;; file template (auto-insert + yasnippet)
;; https://github.com/hlissner/doom-emacs/issues/2134
;; (set-file-template! "^main\\.c\\(?:c\\|pp\\)$" :trigger "__main.cpp" :mode 'c++-mode)


;; mode
(require 'capnp-mode)
(use-package capnproto
  :mode ("\\.capnp\\'" . capnp-mode))
  ;; :config
  ;; ((require 'capnp-mode)
  ;; (add-to-list 'auto-mode-alist '("\\.capnp\\'" . capnp-mode))))


;; cmake company
;; (use-package cmake-mode
;;   :ensure t
;;   :defines (company-backends)
;;   :mode (("CMakeLists\\.txt\\'" . cmake-mode)
;;          ("\\.cmake\\'" . cmake-mode))
;;   :config (after! company
;;             (add-to-list 'company-backends 'company-cmake)))

;;


;; dired hide dotfiles
(add-hook 'dired-load-hook
          (lambda()
            (require 'dired-x)
            (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))))


;; auto save
;; refer: https://emacs.stackexchange.com/questions/265/how-to-auto-save-buffers-when-emacs-loses-focus
;; (eval-when-compile (require 'cl-lib))
;; (defun autosave ()
;;   (cl-letf (((symbol-function 'message) #'format))
;;           (save-some-buffers t)))

;; lost focus
;; refer: https://so.nwalsh.com/2020/02/29/dot-emacs
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (if (boundp 'after-focus-change-function)
;;                 (add-function :after after-focus-change-function
;;                               (lambda ()
;;                                 (unless (frame-focus-state)
;;                                   (autosave))))
;;               (add-hook 'after-focus-change-function 'autosave))
;; ))

(add-hook 'focus-out-hook
          (lambda ()
            (interactive)
            (save-some-buffers t)))

;; keyword
;; https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")))
