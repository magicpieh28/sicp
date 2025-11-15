(define (assert actual expected)
  (if (equal? actual expected) ; = for numbers, equal? for other types
    (display "Test passed\n")
    (display "Test failed\n")))
