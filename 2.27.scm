(define (deep-reverse x)
  (define (deep x result)
    (cond ((null? x) result)
          ((not (pair? x)) x)
          (else
           (deep (cdr x) (cons (deep (car x) nil) result))
           )))
  (deep x nil))

(define dddd (list (list 1 2) (list 3 4)))
