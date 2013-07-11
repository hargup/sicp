#lang planet neil/sicp

;; Number Number -> Number
(define (average a b) 
  (/ (+ a b) 2))
(check-expect (average 2 4) 3)
(check-expect (average 2.0 3.0) 2.5)

;; Number Number -> Number
(define (rtms a b)
  (sqrt (+ (* a a) (* b b))))
(check-expect (rtms 1 1) (sqrt 2))
(check-expect (rtms 3 4) 5)

;; Number Number -> Boolean
;; Determines if two numbers are close enough to be concidered equal
(define (close-enough? a b)
  (define tolerance 0.00000001)
  (< (abs (- a b)) tolerance))


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
  (let ((p1 (start-segment s))
        (p2 (end-segment s)))
  (make-point 
   (average (x-point p1) (x-point p2))
   (average (y-point p1) (y-point p2)))))
(check-expect (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))) (make-point 1 1))

;; Segment -> Length
;; Computes the length of the line segment
(define (len-segment s)
  (let ((p1 (start-segment s))
        (p2 (end-segment s)))
  (rtms (- (x-point p1) (x-point p2)) (- (y-point p1) (y-point p2)))))
(check-expect (len-segment (make-segment (make-point 0 0) (make-point 1 1))) (sqrt 2))

;; Slope is one of 
;;      Number
;;      "inf"
;;      "NaN"


;; Segment -> Slope
;; Computers the slope of a line, if it is perpendicular to the x-axis then returns "inf" and "NaN" in case of point line
(define (slope s)
  (let ((A (start-segment s))
        (B (end-segment s)))
        (let ((base (- (x-point A) (x-point B)))
        (height (- (y-point A) (y-point B))))
          (if (and (= base 0) (= height 0))
              "NaN"
              (if (= base 0)
                  "inf"
                  (/ height base))))))
(check-expect (slope (make-segment origin (make-point 1 1))) 1)
(check-expect (slope (make-segment origin (make-point 0 3))) "inf")
(check-expect (slope (make-segment P1 P1)) "NaN")

;; Slope -> Boolean
(define (slope=? sl1 sl2)
  (if (and (string? sl1) (string? sl2))
      (string=? sl1 sl2)
      (if (and (number? sl1) (number? sl2))
          (= sl1 sl2)
          #f)))
(check-expect (slope=? (slope (make-segment origin (make-point 0 3))) "inf") #t)
(check-expect (slope=? (slope (make-segment P1 P1)) "NaN") #t)
(check-expect (slope=? (slope (make-segment origin (make-point 1 1))) 1) #t)
(check-expect (slope=? (slope (make-segment origin (make-point 0 3))) "NaN") #f)
(check-expect (slope=? (slope (make-segment P1 P1)) "Inf") #f)
(check-expect (slope=? (slope (make-segment origin (make-point 1 1))) 2.5) #f)
(check-expect (slope=? (slope (make-segment origin (make-point 0 3))) 3) #f)
(check-expect (slope=? (slope (make-segment P1 P1)) 2) #f)
          

;; Segment Segment -> Boolean
;; Determine if two segments are perpendicular
(define (perpendicular? s1 s2)
  (if (and 
       (or (slope=? (slope s1) "inf") (slope=? (slope s2) "inf")) 
       (or (slope=? (slope s1) 0) (slope=? (slope s2) 0)))
      #t
      (if (or (slope=? (slope s1) "inf") (slope=? (slope s1) "NaN") (slope=? (slope s2) "inf") (slope=? (slope s2) "NaN"))
          #f
          (if (close-enough? (* (slope s1) (slope s2)) -1)
              #t
              #f))))
(check-expect (perpendicular?
               (make-segment origin (make-point 2 3))
               (make-segment origin (make-point 1 1)))
              #f)
(check-expect (perpendicular?
               (make-segment origin (make-point 1 1))
               (make-segment origin (make-point 1 -1)))
               #t)
(check-expect (perpendicular?
               (make-segment origin (make-point 0 1))
               (make-segment origin (make-point 1 0)))
              #t)
(check-expect (perpendicular?
               (make-segment origin origin)
               (make-segment (make-point 2 3) (make-point 3 4)))
              #f)
(check-expect (perpendicular? 
               (make-segment origin (make-point 2 0))
               (make-segment origin (make-point 3 0)))
               #f)
(check-expect (perpendicular?
               (make-segment origin (make-point 0 2))
               (make-segment origin (make-point 0 3)))
               #f)

;; Rectange is Segment Segment
;; intrept. s1 and s2 as two adjacent perpendicular sides
(define (make-rectangle s1 s2) 
  (cons s1 s2))
(define R1 (make-rectangle
            (make-segment origin (make-point 1 1))
            (make-segment origin (make-point -1 -1))))

;; Rectangle -> Segment
(define (s1-rectangle r)
  (car r))

;; Rectangle -> Segment
(define (s2-rectangle r)
  (cdr r))

;; Rectangle -> Number
;; Computes the perimeter of a rectangle
(define (perimeter r)
  (* (+ (len-segment (s1-rectangle r)) 
        (len-segment (s2-rectangle r)))
     2))
(check-expect (close-enough? (perimeter R1) (* (sqrt 2) 4)) #t)

;; Rectangle -> Number
;; Computes the area of a rectangle
(define (area r)
  (* (len-segment (s1-rectangle r))
     (len-segment (s2-rectangle r))))
(check-expect (close-enough? (area R1) 2) #t)

