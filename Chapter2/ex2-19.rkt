#lang planet neil/sicp
;; Coin-Values is List of Numbers
;; Iterpt. values as the denominations of coins available
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

;; Coin-Values -> Boolean
;; Determines if there are no more coins left
(define (no-more? items)
  (null? items))
(check-expect (no-more? us-coins) false)
(check-expect (no-more? nil) true)

;; Coin-Values -> Coin-Values
;; Returns the Coin-Values except the First denomination
(define (except-first-denomination coin-values)
  (cdr coin-values))
(check-expect (except-first-denomination us-coins)
              (list 25 10 5 1))

;; Coin-Values -> Integer
;; Returns the value of the First denomination
(define (first-denomination coin-values)
  (car coin-values))
(check-expect (first-denomination uk-coins)
              100)

;; Number Coin-Values -> Integer
;; Returns the number of ways an amount can be exchanged given
;; unlimited number of coins of denomination specified by Coin-Values
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount 
                   (first-denomination coin-values))
                coin-values)))))
(check-expect (cc 100 us-coins)
              292)

(cc 100 '(1 10 5))
(cc 100 '(10 5 1))
(cc 100 '(1 5 10))

;; It appears that the order of the coin-values does not affect the value of cc
;; The intutive reasoning behind this is I think the the recursion finally reduce to
;; (cc amount coin-1) + (cc amount coin-2) + (cc amount coin-3)
;; + (cc (- amount coin-1) coin-2) + (cc (- amount (* 2 coin-1)) coin-2) + ...
;; + (cc (- amount coin-2) coin-1) + (cc (- amount (* 2 coin-2)) coin-1) + ...
;; .
;; . All combination of three coins
;; .
;; + (cc (- amount (+ coin-1 coin-2)) coin-3) + (cc (- amount (+ coin-1 coin-2 coin-2)) coin-3) + (cc (- amount (+ coin-1 coin-1 coin-2)) coin-3) ...
;; .
;; . All combination for the three coins
;; Since this does not incoperate the order of he coins
;; Any order of coins shall do
;;
;; I'm not able to prove it rigourously but I'll do sooner or later
;; I have to prove that if I swap two coins in the list it doesn't affect the answer.

