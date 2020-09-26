;; refer:
;;   https://git.jeremydormitzer.com/jdormit/dotfiles/src/commit/8266a2c24a1077ff740e570dba25df7150559b1e/emacs/init.org


;; Place your private configuration here! Remember, you do not need to run 'doom
;; ;; sync' after modifying this file!
;; (setq fancy-splash-image "")


;; workspace
(after! projectile
  (setq projectile-project-search-path '("~/GitRepos/" "~/workspace")))


;; indent
(add-hook 'web-mode-hook
          (lambda()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 4)
            (setq web-mode-code-indent-offset 4)))


;; file template (auto-insert + yasnippet)
;; https://github.com/hlissner/doom-emacs/issues/2134
;; (set-file-template! "^main\\.c\\(?:c\\|pp\\)$" :trigger "__main.cpp" :mode 'c++-mode)


;; mode
(require 'capnp-mode)
(use-package capnproto
  :ensure t
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
