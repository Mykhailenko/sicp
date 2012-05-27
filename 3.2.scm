(define (make-monitored f)
  (let ((count 0))
    (define (mf x)
      (cond ((eq? x 'count) count)
            ((eq? x 'reset) (set! count 0))
            (else (begin 
                    (set! count (+ count 1))
                    (f x)))))
    mf))