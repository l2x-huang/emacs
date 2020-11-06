
;; Enabling only some features
;; (setq dap-auto-configure-features '(sessions locals controls tooltip))

; (when (eq display-graphic-p nil)
; )

;; (after! dap-mode
;;   (setq dap-auto-configure-features (remove 'controls dap-auto-configure-features))
;; )


;; 命中断点时，自动调用hydra
;; (add-hook 'dap-stopped-hook
;;           (lambda (arg) (call-interactively #'dap-hydra)))

;; ...
;; native gdb & lldb
;; (require 'dap-gdb-lldb)

;; lldb-vscode
;; (require 'dap-lldb)

;; vscode-cpptools
(require 'dap-cpptools)
