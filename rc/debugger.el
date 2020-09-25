
;; Enabling only some features
;; (setq dap-auto-configure-features '(sessions locals controls tooltip))

; (when (eq display-graphic-p nil)
; )

(after! dap-mode
	(setq dap-auto-configure-features (remove 'controls dap-auto-configure-features))
)

;; ...
;; native gdb & lldb
(require 'dap-gdb-lldb)

;; lldb-vscode
;; (require 'dap-lldb)
