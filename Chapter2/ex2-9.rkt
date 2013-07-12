#lang racket
;; let I1 be (a1, b1) w1 be width of I1 = b1-a1
;; and I2 be (a2, b2) w1 be width of I2 = b2-a2
;; I3 = I1 + I2
;; I3 = (a1+a2, b1+b2)
;; then w3 = (b1+b2) - (a1+a2)
;; w3 = (b1-a1) + (b2-a2)
;; w3 = w1 + w2

;; I4 = I1 - I2
;; I4 = (a1-b2, b1-a2)
;; w4 = b1-a2 - a1 + b2
;; w4 = (b1-a1) + (b2 - a2)
;; w4 = w1 + w2
;; Hence, the width of the sum or difference is the function of 
;; only the widths of the intervals being added or subtracted

;; This is not true for multiplication or division
;; For Example I1=(1, 2) w1=1; I2=(2, 3) w2=1; I3 = I2*I1
;; I3 = (2, 6) w3 = 4
;; let I4 = (0, 1) w4=1
;; I5 = I1*I4
;; I5 = (0, 2) w5=2
;; w5 is not equal to w3 eventhough w1=w2=w3
;; I6 = I1/I2 = (0.33..., 1)
;; w6 = 0.66...
;; I7 = I4/I2 = (0, 0.33...) w7=0.33...
;; w6 is not equal too w7