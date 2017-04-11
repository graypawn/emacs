;;; pawn-hydra.el --- Hydra
;;; Commentary:

;; * Packages:
;; * -----------
;; * hydra

;;; Code:

(use-package hydra :ensure t)

;; Macro
;; ==================================================
;; | Key     | Function                  |
;; |---------+---------------------------|
;; | C-x (   | kmacro-start-macro        |
;; | C-x )   | kmacro-end-macro          |
;; | C-x e   | kmacro-end-and-call-macro |
;; | C-x C-k | hydra-macro/body          |
(defhydra hydra-macro (:hint nil :color pink :pre)
"
 ^Cycle^     ^Basic^          ^Insert^        ^Save^          ^^Edit^^
╭─────────────────────────────────────────────────────────────────────────╯
   ^_p_^    [_e_] execute    [_i_] insert    [_b_] name      [_;_] previous
   ^^↑^^    [_d_] delete     [_c_] set       [_k_] key       [_,_] select
   ^^ ^^    [_r_] region     [_a_] add       [_F_] defun
   ^^↓^^    [_s_] step       [_f_] format
   ^_n_^
  ^^   ^^                  ^^Counter: %s(number-to-string kmacro-counter)
"
  ("p" kmacro-cycle-ring-previous)
  ("n" kmacro-cycle-ring-next)
  ("e" kmacro-end-and-call-macro)
  ("d" kmacro-delete-ring-head)
  ("r" apply-macro-to-region-lines)
  ("s" kmacro-step-edit-macro)
  ("i" kmacro-insert-counter)
  ("c" kmacro-set-counter)
  ("a" kmacro-add-counter)
  ("f" kmacro-set-format)
  ("b" kmacro-name-last-macro)
  ("k" kmacro-bind-to-key)
  ("F" insert-kbd-macro)
  (";" kmacro-edit-macro)
  ("," edit-kbd-macro)
  ("q" nil :color blue))

(defhydra hydra-macro-defining (:hint nil :color pink :pre)
"
 ^Cycle^     ^Basic^         ^^Insert^^          ╲╲╭────╮╲╲
╭^─────^─────^─────^─────────^^──────^^───╯      ╭╮|▆  ▆|╭╮
   ^_p_^    [_e_] execute    [_i_] insert        |╰┫▽▽▽▽┣╯|
   ^^↑^^    [_d_] delete     [_c_] set           ╰━┫△△△△┣━╯
   ^^ ^^    [_r_] region     [_a_] add           ╲╲|┈┈┈┈┃╲╲
   ^^↓^^     ^ ^             [_f_] format        ╲╲┃┈┏┓┈┃╲╲
   ^_n_^     ^ ^              ^ ^                ▔▔╰━╯╰━╯▔▔
  ^^   ^^                  ^^Counter: %s(number-to-string kmacro-counter)
"

  ("p" kmacro-cycle-ring-previous)
  ("n" kmacro-cycle-ring-next)
  ("e" kmacro-end-and-call-macro)
  ("d" kmacro-delete-ring-head)
  ("r" apply-macro-to-region-lines)
  ("i" kmacro-insert-counter)
  ("c" kmacro-set-counter)
  ("a" kmacro-add-counter)
  ("f" kmacro-set-format)
  ("q" nil :color blue))

(defun hydra-macro-selector ()
  "."
  (interactive)
  (if defining-kbd-macro
      (hydra-macro-defining/body)
    (hydra-macro/body)))

(bind-key "C-x C-k" 'hydra-macro-selector)

;; Yank Pop
;; ==================================================
(defhydra hydra-yank-pop ()
  "yank"
  ("C-y" yank nil)
  ("M-y" yank-pop nil)
  ("n" (yank-pop 1) "next")
  ("p" (yank-pop -1) "prev"))

(bind-key (kbd "M-y") 'hydra-yank-pop/yank-pop)

;; Unicode
;; ==================================================
(defhydra hydra-greek (:color pink :hint nil)
"
  [_a_] α [_b_] β [_g_] γ [_d_] δ [_e_] ε [_z_] ζ [_h_] η [_q_] θ [_i_] ι [_k_] κ [_l_] λ [_m_] μ
  [_n_] ν [_x_] ξ [_o_] ο [_p_] π [_r_] ρ [_s_] σ [_t_] τ [_u_] υ [_j_] φ [_c_] χ [_y_] ψ [_w_] ω

  [_A_] Α [_B_] Β [_G_] Γ [_D_] Δ [_E_] Ε [_Z_] Ζ [_H_] Η [_Q_] Θ [_I_] Ι [_K_] Κ [_l_] Λ [_M_] Μ  ╭────────────┐
  [_N_] Ν [_X_] Ξ [_O_] Ο [_P_] Π [_R_] Ρ [_S_] Σ [_T_] Τ [_U_] Υ [_J_] Φ [_C_] Χ [_Y_] Ψ [_W_] Ω   Quit [_<ESC>_]
"
  ("a" (insert "α"))
  ("b" (insert "β"))
  ("g" (insert "γ"))
  ("d" (insert "δ"))
  ("e" (insert "ε"))
  ("z" (insert "ζ"))
  ("h" (insert "η"))
  ("q" (insert "θ"))
  ("i" (insert "ι"))
  ("k" (insert "κ"))
  ("l" (insert "λ"))
  ("m" (insert "μ"))
  ("n" (insert "ν"))
  ("x" (insert "ξ"))
  ("o" (insert "ο"))
  ("p" (insert "π"))
  ("r" (insert "ρ"))
  ("s" (insert "σ"))
  ("t" (insert "τ"))
  ("u" (insert "υ"))
  ("f" (insert "ϕ"))
  ("j" (insert "φ"))
  ("c" (insert "χ"))
  ("y" (insert "ψ"))
  ("w" (insert "ω"))
  ("A" (insert "Α"))
  ("B" (insert "Β"))
  ("G" (insert "Γ"))
  ("D" (insert "Δ"))
  ("E" (insert "Ε"))
  ("Z" (insert "Ζ"))
  ("H" (insert "Η"))
  ("Q" (insert "Θ"))
  ("I" (insert "Ι"))
  ("K" (insert "Κ"))
  ("L" (insert "Λ"))
  ("M" (insert "Μ"))
  ("N" (insert "Ν"))
  ("X" (insert "Ξ"))
  ("O" (insert "Ο"))
  ("P" (insert "Π"))
  ("R" (insert "Ρ"))
  ("S" (insert "Σ"))
  ("T" (insert "Τ"))
  ("U" (insert "Υ"))
  ("F" (insert "Φ"))
  ("J" (insert "Φ"))
  ("C" (insert "Χ"))
  ("Y" (insert "Ψ"))
  ("W" (insert "Ω"))
  ("<ESC>" nil :color blue))

(defhydra hydra-box-drawing (:color pink :hint nil)
"
       ^[_-_]^          ^[_i_]
   [_a_] ╭─╮ [_s_]  [_d_] ┌┴┐ [_f_]  [_RET_]^      ╲ ╱
   [_|_] │ │  ^ ^   [_j_] ┤ ├ [_l_]    ^┼    [_*_]  ╳
   [_z_] ╰─╯ [_x_]  [_c_] └┬┘ [_v_]^         [_[_] ╱ ╲ [_]_]
             ^^ ^^      ^[_k_]
"
  ("-" (insert "─"))
  ("|" (insert "│"))
  ("a" (insert "╭"))
  ("s" (insert "╮"))
  ("z" (insert "╰"))
  ("x" (insert "╯"))
  ("d" (insert "┌"))
  ("f" (insert "┐"))
  ("c" (insert "└"))
  ("v" (insert "┘"))
  ("j" (insert "┤"))
  ("l" (insert "├"))
  ("i" (insert "┴"))
  ("k" (insert "┬"))
  ("RET" (insert "┼"))
  ("*" (insert "╳"))
  ("[" (insert "╱"))
  ("]" (insert "╲"))
  ("q" nil :color blue))

(defhydra hydra-unicode (:color pink :hint nil)
"
        [_._] · [_m_] µ [_|_] ¦ [_`_] ° [_-_] ─
Math:   [_8_] ∞ [_+_] ± [_-_] ∓ [_/_] ÷ [_r_] √ [_<_] ≤ [_>_] ≥ [_=_] ≡ [_n_] ≠ [_~_] ≈
Arrows: [_<left>_] ← [_<right>_] → [_<up>_] ↑ [_<down>_] ↓
        [_g_] greek [_b_] box [_RET_] insert-char
"
  ("m" (insert "µ"))
  ("|" (insert "¦"))
  ("." (insert "·"))
  ("`" (insert "°"))
  ("8" (insert "∞"))
  ("+" (insert "±"))
  ("-" (insert "∓"))
  ("/" (insert "÷"))
  ("r" (insert "√"))
  ("<" (insert "≤"))
  (">" (insert "≥"))
  ("=" (insert "≡"))
  ("n" (insert "≠"))
  ("~" (insert "≈"))
  ("-" (insert "─"))
  ("<left>" (insert "←"))
  ("<right>" (insert "→"))
  ("<up>" (insert "↑"))
  ("<down>" (insert "↓"))
  ("g" hydra-greek/body :color blue)
  ("b" hydra-box-drawing/body :color blue)
  ("RET" insert-char :color blue)
  ("q" nil :color blue))

(bind-key "C-x 8" 'hydra-unicode/body)

(provide 'pawn-hydra)
;;; pawn-hydra.el ends here
