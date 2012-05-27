;;  Является ли e переменной?
(define (variable? e)
  (symbol? e))

;;Являются ли v1 и v2 одной и той же переменной?
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;;  Является ли e суммой?
 (define (sum? e)
   (and (pair? e)(eq? (car e) '+)))
 
;;  Первое слагаемое суммы e.
(define (addend e)
  (cadr e))
   
;;  Второе слагаемое суммы e.
 (define (augend e)
   (caddr e))
   
 (define (=number? x value)
   (and (number? x) (= x value)))
 
;;  Строит сумму a1 и a2.
 (define (make-sum a1 a2)
   (cond ((=number? a1 0) a2)
         ((=number? a2 0) a1)
         ((and (number? a1) (number? a2)) (+ a1 a2))
         (else (list '+ a1 a2))))
   
;;  Является ли e произведением?
 (define (product? e)
   (and (pair? e)(eq? (car e) '*)))
 
;;  Первый множитель произведения e.
 (define (multiplier e)
   (cadr e))
    
;;  Второй множитель произведения e.
 (define (multiplicand e)
   (caddr e))
 
;;  Строит произведение m1 и m2.
 (define (make-product m1 m2)
   (cond ((or (=number? m1 0) (=number? m2 0)) 0)
         ((=number? m1 1) m2)
         ((=number? m2 1) m1)
         ((and (number? m1) (number? m2)) (* m1 m2))
         (else (list '* m1 m2))))
 
 
 (define (deriv exp var)
   (cond ((number? exp) 0)
         ((and (variable? exp) (if (same-variable? exp var) 1 0)))
         ((sum? exp) (make-sum (deriv (addend exp) var)
                               (deriv (augend exp) var)))
         ((product? exp) (make-sum (make-product (multiplier exp)
                                                 (deriv (multiplicand exp) var))
                                   (make-product (multiplicand exp)
                                                 (deriv (multiplier exp) var))))
         ((exponentiation? exp) (make-product (exponent exp) 
                                              (make-exponentiation (deriv (base exp))
                                                                   (- (exponent exp) 1))))
         (esle (error "неизвестный тип выражения -- DERIV" exp))))

 
 (define (exponentiation? exp)
   (and (pair? exp) (eq? (car exp) '**)))
 
 (define (base exp)
   (cadr exp))
 
 (define (exponent exp)
   (caddr exp))
 
 (define (make-exponentiation base exponent)
   (cond ((= exponent 0) 1)
         ((= exponent 1) base)
         (else (list '** base exponent))))
 
                      
