;;; lang/elm/config.el -*- lexical-binding: t; -*-

(after! elm-mode
  (if (featurep! +lsp)
      (add-hook 'elm-mode-local-vars-hook #'lsp! 'append)
    (set-company-backend! 'elm-mode 'company-elm))

  (when (featurep! +tree-sitter)
    (add-hook 'elm-mode-local-vars-hook #'tree-sitter! 'append))
 
  (set-repl-handler! 'elm-mode #'run-elm-interactive)
  (set-ligatures! 'elm-mode
    :null "null"
    :true "true" :false "false"
    :int "Int" :str "String"
    :float "Float"
    :bool "Bool"

    :not "not"
    :and "&&" :or "||"))


(use-package! flycheck-elm
  :when (featurep! :checkers syntax)
  :after elm-mode
  :config (add-to-list 'flycheck-checkers 'elm))
