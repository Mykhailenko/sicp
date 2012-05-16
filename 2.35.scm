;;(define (count-leaves x)
;;  (cond ((null? x) 0)
;;        ((not (pair? x)) 1)
;;        (else (+ (count-leaves (car x))
;;                 (count-leaves (cdr x))))))
(define (count-leaves3 t)
  (accumulate + 0
              (map (lambda (item) 
                     (iсf (not (pair? item))
                         1
                         (count-leaves3 item)))
                   t )))
