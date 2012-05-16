(define (cub x) (* x x x ))
(define (ololo) 
 (newline)
  (newline)
  (display " 1488 "))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (sum-integers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))
(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
(define (sum-integers2 a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum2 identity a inc b))
(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))
  (define (f-k k)
    (f (+ a (* k (h)))))
  (define (iter k)
    (if (> k n)
        0
        (+ (f-k k) (iter (+ k 1)))))
  (* (/ (h) 3) (iter 0)))
(define (cube x) (* x x x))
(define (last-pair l)
  (if (null? (cdr l))
      (car l)
      (last-pair (cdr l))))
(define nil '())
(define (reverse l)
  (define (rev li result)
    (if (null? li)
        result
        (rev (cdr li) (cons (car li) result))))
  (rev l nil))
  

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(define (same-parity x . l)
  (define (same x y)
    (or 
     (and (even? x) (even? y))
     (and (not (even? x)) (not (even? y)))
     )  )
  (define (iter from result)
    (if (null? from)
        result
        (if (same x (car from))
            (iter (cdr from) (append result (cons (car from) nil)))
            (iter (cdr from) result))))
  (iter l nil))

  
  
  
 (define (square x) (* x x))
  
  
  
  
             