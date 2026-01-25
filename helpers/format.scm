(define (format-display . args)
  (for-each
    (lambda (x)
      (cond ((string? x) (display x))
        (else (write x))))
    args)
  (newline))
