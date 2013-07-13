#lang planet neil/sicp

;; interval is Number Number
;; interp. lower as the lower bound of the interval
;;         upper as the upper bound of the interval

;; constructor for interval
;; Number Number -> Interval
(define (make-interval lower upper)
  (cons lower upper))
(define I1 (make-interval 2 3))

;; Interval -> Number
(define (lower-bound i)
  (car i))
(check-expect (lower-bound (make-interval 2 3)) 2)
;; Interval -> Number
(define (upper-bound i)
  (cdr i))
(check-expect (upper-bound (make-interval 2 3)) 3)

;; Interval -> Interval
;; add two intervals
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(check-expect (add-interval
               (make-interval 2 3)
               (make-interval 3.0 5.0))
              (make-interval 5.0 8.0))

;; Interval -> Interval
;; multiply two intervals
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(check-expect (mul-interval 
               (make-interval 2 3)
               (make-interval 3 5))
              (make-interval 6 15))

;; Interval -> Interval
;; divides two Intervals
(define (div-interval x y)
  (if (and (> 0 (lower-bound y)) (< 0 (upper-bound y)))
      (error "Division by an internal spanning zero is not defined")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
(check-expect (div-interval
               (make-interval 2 4)
               (make-interval 1 2))
              (make-interval 1.0 4.0))

;; Interval -> Interval
;; Subtract one interval from another
(define (sub-interval x y)
  (make-interval 
   (- (lower-bound x) (upper-bound y))
   (- (upper-bound x) (lower-bound y))))
(check-expect (sub-interval 
               (make-interval 3 5)
               (make-interval 2 3))
              (make-interval 0 3))
  

