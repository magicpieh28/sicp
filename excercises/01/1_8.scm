(load "helpers/assert.scm")
(load "helpers/format.scm")

(define (good-enough? prev-guess current-guess)
  (begin
    (define change-rate (* (/ (abs (- current-guess prev-guess)) prev-guess) 100))
    (format-display "change-rate => " change-rate)
    (newline)
    (< change-rate 0.001)))

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root-iter prev-guess current-guess x)
  (if (good-enough? prev-guess current-guess)
    current-guess
    (begin
      (format-display "prev-guess => " prev-guess)
      (format-display "current-guess => " current-guess)
      (cube-root-iter current-guess (improve current-guess x) x))))

(define (cube-root x)
  (cube-root-iter 1 0.1 x))

(define (assert-range calculated min max)
  (assert (and (> calculated min) (< calculated max)) #t))

(assert-range (cube-root 1000000000000.0) 10000 10000.001)

(assert-range (cube-root 0.000000027) 0.003 0.004)
