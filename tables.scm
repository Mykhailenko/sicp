(define (assoc key records) 
  (cond ((null? records) #f)
        ((equal? key (caar records))
         (car records))
        (else (assoc key (cdr records)))))

(define (lookup key table)
  (let ((result (assoc key( cdr table))))
    (if result
        (cdr result)
        #f)))

(define (insert! key value table)
  (let ((result (assoc key (cdr table))))
    (if result
        (set-cdr! result value)
        (set-cdr! table 
                  (cons (cons key value) (cdr table)))))
  'ok)

(define (make-table) 
  (list 'table))

