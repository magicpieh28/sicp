(load "helpers/format.scm")

(define (assert actual expected)
  (if (equal? actual expected) ; = for numbers, equal? for other types
    (display "Test passed\n")
    (format-display "Test failed. actual is " actual)))
