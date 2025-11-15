(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

; For special forms like `if` or `cond`, Scheme use normal-order evaluation (正規順評価).
; However, for the other functions we implemented, we use applicative-order evaluation (適用順序評価).
; Therefore, if we define a regular function to replace `if` (like `new-if`), it will evaluate all its arguments before starting, which can lead to an infinite loop.

