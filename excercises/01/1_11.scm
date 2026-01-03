(load "helpers/assert.scm")

; 関数𝑓は
; 
; -𝑛<3の場合𝑓(𝑛)=𝑛
; -𝑛≥3の場合、𝑓(𝑛)=𝑓(𝑛 − 1)+2𝑓(𝑛 − 2)+3𝑓(𝑛 − 3)
; 
; のルールの下に定義される。

; 0:0
; 1:1
; 2:2
; 3:1(2)+2(1)+3(0)=4
; 4:1(4)+2(2)+3(1)=11
; 5:1(11)+2(4)+3(2)=25
; ...

(define (recursive-f n)
  (if (< n 3)
    n
    (+
      (recursive-f (- n 1))
      (* 2 (recursive-f (- n 2)))
      (* 3 (recursive-f (- n 3))))))

(assert (recursive-f 5) 25)

(define (loop-f n)
  (if (< n 3)
    n
    (iter-cal 2 1 0 n)))
(define (iter-cal z y x n)
  (let ((new-z (+ z (* 2 y) (* 3 x))))
    (if (= n 3)
      new-z
      (iter-cal new-z z y (- n 1)))))

(assert (loop-f 5) 25)
