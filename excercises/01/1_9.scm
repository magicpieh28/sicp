(load "helpers/assert.scm")
(load "helpers/format.scm")

; inc, dec 내부에서 새로 정의한 함수를 사용하면 무한루프에 빠지기 때문에
(define primitive-+ +)
(define (inc x) (primitive-+ x 1))
(define (dec x) (primitive-+ x -1))

(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

(assert (+ 4 5) 9)
; => a is not 0, so calculate (inc (+ (dec 4) 5))
; => (inc (+ (- 4 1) 5))
; => (- 5 1) is not 0, so calculate (inc (+ (dec (- 4 1) 5)))
; ... +를 재귀적으로 불러서 처리하려고 하지만 그 뒤에 inc 처리가 남아있기 떄문에 재귀적인 프로세스가 되며 메모리에 a 를 전개한 값이 계속 저장된다

(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

(assert (+ 4 5) 9)
; => a is not 0, so calculate (+ (- 4 1) (+ 5 1))
; => (+ 3 6)
; => (+ 2 7)
; ... +를 재귀적으로 부르는 절차이긴 하지만 + 후에 남은 연산이 없기 때문에 반복적인 프로세스로 값을 도출함
; 메모리에는 정량만 보존하기 때문에 위에 정의한 함수보다 효율적임

