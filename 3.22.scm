(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty?)
      (if (eq? front-ptr '())
          #t
          #f))
    (define (front-queue)
      (if (empty?)
          (error "Ololo empty queue!")
          (front-ptr)))
    (define (insert! item)
      (let ((new-pair (cons item '())))
        (cond ((empty?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else 
               (set-cdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)))))
    (define (delete!)
      (cond ((empty?)
             (error "Deletos"))
            (else 
             (set! front-ptr (cdr front-ptr)))))
    (define (print)
      (display front-ptr))
    (define (dispatch m)
      (cond 
       ((eq? m 'empty?) empty?)
       ((eq? m 'front-queue) front-queue)
       ((eq? m 'insert) insert!)
       ((eq? m 'delete) delete!)
       ((eq? m 'print) print)
       (else "Unknown method")))
    dispatch))

      