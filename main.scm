(define nil '())
(define (even? x)
  (= (remainder x 2) 0))

(define (odd? x)
  (not (even? x)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;;(define (map proc items)
;;  (if (null? items)
;;      nil
;;      (cons (proc (car items))
;;            (map proc (cdr items)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
      
(define (all-in-one op initial proc predicate sequence)
  (accumulate op
              initial
              (map proc
                   (filter predicate
                           sequence))))

(define (enumerate-interval from to)
  (define (iter curr)
    (if (> curr to )
        nil
        (cons curr (iter (+ 1 curr)))))
  (iter from))
           
           
           
           