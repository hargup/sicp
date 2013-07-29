#lang planet neil/sicp

(define (make-branch length structure)
  (list length structure))

(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))


; total-weight: mobile -> Integer
(define (total-weight mobile)
  (+ (weight (left-branch mobile))
       (weight (right-branch mobile))))

; weight: branch -> Integer
(define (weight branch)
  (if (number? (branch-structure branch))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

; torque: mobile -> integer
(define (torque branch)
        (* (branch-length branch)
           (weight branch)))

;balanced?: mobile -> Boolean
(define (balanced? mobile)
  (if (= (torque (left-branch mobile))
         (torque (right-branch mobile)))
      (if (number? (branch-structure (left-branch mobile)))
          (if (number? (branch-structure (right-branch mobile)))
              true
              (balanced? (branch-structure (right-branch mobile))))
          (if (balanced? (branch-sturcture (left-branch mobile)))
              (if (number? (branch-structure (right-branch mobile)))
                  true
                  (balanced? (branch-structure (right-branch mobile))))
              false))
      flase))

        
;; if the definition of make-mobile and make-branch is changed in the specified manner 
;; then I only need to change the defintions of right-branch and branch-structure
