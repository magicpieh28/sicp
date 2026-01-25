(define (for-range i end f)
  (when (< i end)
    (f i)
    (for-range (+ i 1) end f)))
