#lang planet neil/sicp
;; linearly recursive accumlate funtion
#;
(define (accumlate func null-val term a next b)
  (if (> a b)
      null-val
      (func (term a)
            (accumlate func null-val term (next a) next b))))

;; Iterate accumlate function

(define (accumlate func null-val term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (func result (term a)))))
  (iter a null-val))

(check-expect (accumlate + 0 identity 1 inc 5) 15)
(check-expect (accumlate * 1 identity 1 inc 6) 720)