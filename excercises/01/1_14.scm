; from SICP 1.2.2
(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
    ; cc(amount, (kinds-of-coins - 1)) + cc(amount - first-denomination(kinds-of-coins), kinds-of-coins)
    (else (+ (cc amount
          (- kinds-of-coins 1))
        (cc (- amount
            (first-denomination
              kinds-of-coins))
          kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
    ((= kinds-of-coins 2) 5)
    ((= kinds-of-coins 3) 10)
    ((= kinds-of-coins 4) 25)
    ((= kinds-of-coins 5) 50)))

; 위 함수는 재귀 프로세스로 처리하니 계산 단계 수가 지수적으로 증가함
; 또한, 메모리 사용은 재귀가 깊어지니 선형적으로 증가함

; 11cents
; amount=11
; kinds-of-coins=5
; count-change(11) 

; tree
;                                                                                                                     count-change(11)
;                                                                                                                      |              \
;                                                                                                          cc(11, (5 - 1)) + cc(11 - first-denomination(5), 5)
;                                                                                                                  |                     \
;                                                                     cc(11, (4 - 1)) + cc(11 - first-denomination(4), 4)                 0
;                                                                         |                            \
;                              cc(11, (3 - 1)) + cc(11 - first-denomination(3), 3)                      0
;                               |                                                                   \
;        _______________________|                          cc(1, 3 - 1) + cc(1 - first-denomination(3), 3)
;       |                                                     |                                 \
;      |                    cc(1, 2 - 1) + cc(1 - first-denomination(2), 2)                      0
;     |                              |                            \
;    |         cc(1, 1 - 1) + cc(1 - first-denomination(1), 1)     0
;   |               |                                  \
;  |               0                                    1
;  \_________________
;                    \
;       cc(11, 2 - 1) + cc(11 - first-denomination(2), 2)
;            |                                          \
;           |                               cc(6, 2 - 1) + cc(6 - first-denomination(2), 2)
;          |                                      |                                \
;         |                                      |                         cc(1, 2 - 1) + cc(1 - first-denomination(2), 2)
;        |                                      |                                |                                  \
;       |                                      |           cc(1, 1 - 1) + cc(1 - first-denomination(1), 1)           0
;      |                                      |                  |                              \
;     |                                      |                  0                                1
;   ....                                   ....      


; 기억역(space) = 재귀가 동시에 쌓이는 깊이 = 마지막에 한 번이니까 n + 1
; => Θ(n) = 12

; 단계 수(steps) = 트리 구조로 두 갈래로 나뉘어지기 때문에 지수증가 해서 2^n
; => Θ(2^n) = 2048

