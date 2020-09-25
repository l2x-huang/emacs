;; refer:
;;   https://git.jeremydormitzer.com/jdormit/dotfiles/src/commit/8266a2c24a1077ff740e570dba25df7150559b1e/emacs/init.org


;; Place your private configuration here! Remember, you do not need to run 'doom
;; ;; sync' after modifying this file!
(setq fancy-splash-image "")


;; workspace
(after! projectile
  (setq projectile-project-search-path '("~/GitRepos/" "~/workspace")))


;; indent
(add-hook 'web-mode-hook
          (lambda()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 4)
            (setq web-mode-code-indent-offset 4)))


;; https://github.com/lujun9972/emacs-document/blob/master/emacs-common/%E8%AE%A9Emacs%E4%B8%BA%E4%BD%A0%E8%87%AA%E5%8A%A8%E6%8F%92%E5%85%A5%E5%86%85%E5%AE%B9(Emacs%E6%A8%A1%E6%9D%BF%E4%BD%BF%E7%94%A8%E6%8C%87%E5%8D%97).org
;; http://jixiuf.github.io/blog/yasnippet-auto-insert-mode%E6%95%B4%E5%90%88/
