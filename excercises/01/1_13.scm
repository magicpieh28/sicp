(load "helpers/format.scm")
(load "helpers/for.scm")

(define phi (/ (+ 1 (sqrt 5)) 2))
(define psi (/ (- 1 (sqrt 5)) 2))

(define (fib n)
  (cond ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1))
        (fib (- n 2))))))

(define (cal-phi n)
  (/ (expt phi n) (sqrt 5)))

(define (fib-phi-psi n)
  (/ (- (expt phi n) (expt psi n)) (sqrt 5)))

(for-range 0 10
  (lambda (i)
    (format-display "Fib (" i ") => " (fib i))
    (format-display "cal-phi => " (cal-phi i))
    (format-display "fib-phi-psi =>" (fib-phi-psi i))
    (newline)))

; Fib (0) => 0
; cal-phi => .4472135954999579
; fib-phi-psi =>0.

; Fib (1) => 1
; cal-phi => .7236067977499789
; fib-phi-psi =>1.

; Fib (2) => 1
; cal-phi => 1.1708203932499368
; fib-phi-psi =>1.

; Fib (3) => 2
; cal-phi => 1.8944271909999157
; fib-phi-psi =>2.

; Fib (4) => 3
; cal-phi => 3.0652475842498528
; fib-phi-psi =>3.

; Fib (5) => 5
; cal-phi => 4.959674775249769
; fib-phi-psi =>5.

; Fib (6) => 8
; cal-phi => 8.024922359499621
; fib-phi-psi =>8.

; Fib (7) => 13
; cal-phi => 12.984597134749391
; fib-phi-psi =>13.

; Fib (8) => 21
; cal-phi => 21.00951949424901
; fib-phi-psi =>21.

; Fib (9) => 34
; cal-phi => 33.9941166289984
; fib-phi-psi =>34.

;... done

