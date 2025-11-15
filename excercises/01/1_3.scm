(load "helpers/assert.scm")

(define (get-bigger x y) (if (> x y) x y))
(define (calculate x y) (+ (* x x) (* y y)))

(define (f x y z)
  (let ((a (get-bigger x y))
      (b (get-bigger x z))
      (c (get-bigger y z)))
    (cond ((= a b) (calculate a c))
      (else (calculate a b)))))

(assert (f 3 4 5) 41)
(assert (f 3 5 4) 41)
(assert (f 5 4 3) 41)
