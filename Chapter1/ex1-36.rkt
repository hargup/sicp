#lang planet neil/sicp
(define (average a b)
  (/ (+ a b) 2.0))
(check-expect (average 2 3) 2.5)

(define (abs a)
  (if (> a 0)
      a
      (- a)))
(check-expect (abs -1.45) 1.45)
(check-expect (abs 1.45) 1.45)

(define tolerance 0.00001)
(define (close-enough? a b)
  (> tolerance (abs (- a b))))
(check-expect (close-enough? 3 (+ 3 (/ tolerance 2))) #t)
(check-expect (close-enough? 3 4) #f) 
; if tolerance is as large as 1 then there is a problem

#;
(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next 
          ( (newline)
           (display next)
          (try next)))))
  (try first-guess))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next 
          ( (newline)
           (display next)
          (try (average guess next))))))
  (try first-guess))
#;
(check-expect (close-enough? 
               (fixed-point cos 1.0) 
               .7390822985224023) 
              #t)
#;
(fixed-point 
 (lambda (x) (/ (log 1000) (log x)))
 5)
;; without average damping the function take 24 steps and 
;; with average damping it takes only 7 steps. Thats cool :)
(fixed-point 
 (lambda (x) (+ (* x x) 1))
 2)

;; prove that average damping reduces he number of steps 
;; for the convergence if it does converges
 