
(after! web-mode
  (add-hook! 'web-mode-local-vars-hook #'lsp!))

;; rust-analyer for lsp
(after! rustic
  (setq lsp-rust-server 'rls)
  (add-hook! 'rustic-mode-local-vars-hook #'lsp!))
