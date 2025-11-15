(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))


; ### **Applicative-order evaluation (適用順評価: “引数を評価してから適用” する方法)**
;
; * All expressions are evaluated first to determine their values before performing the computation.
;   Because of that, `(p)` keeps evaluating itself recursively and ends up in an infinite loop.
; 
; ### **Normal-order evaluation (正規順評価: “完全に展開してから簡約する” 評価方法)**
;
; * When the expression is evaluated, each value is evaluated *only when needed*.
;   So `0` is evaluated first, and `(p)` is not evaluated at all, which results in returning `0`.
; 

