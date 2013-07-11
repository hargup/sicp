#lang planet neil/sicp

;; Number Number -> Number
(define (average a b) 
  (/ (+ a b) 2))

;; Point is Number Number
;; interp. x as the x coordinate of the point
;;         y as the y coordinate of the point
(define (make-point x y)
  (cons x y))
(define origin (make-point 0 0))
(define P1 (make-point 2 4))
(define P2 (make-point 3 8))

;; point -> Number
(define (x-point p)
  (car p))
(check-expect (x-point P1) 2)

;; point -> Number
(define (y-point p)
  (cdr p))
(check-expect (y-point P2) 8)

;; Prints a point
(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))

;; Line Segment is Point Point
;; interp. start-point as starting point of line segment
;;         end-point as end point of line segment

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define S1 (make-segment origin P1))
(define S2 (make-segment P1 P2))

;; Segment -> Point
(define (start-segment s)
  (car s))
(check-expect (start-segment S2) P1)

;; Segment -> Point
(define (end-segment s)
  (cdr s))
(check-expect (end-segment S2) P2)
;; Segment -> Point
(define (midpoint-segment s)
  (define p1 (start-segment s))
  (define p2 (end-segment s))
  (make-point 
   (average (x-point p1) (x-point p2))
   (average (y-point p1) (y-point p2))))

(check-expect (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))) (make-point 1 1))



