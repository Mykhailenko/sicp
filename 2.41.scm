(define (hettric n s)
  (define (list-eq-s lst)
    (= s (accumulate +
                     0
                     lst)))
  (accumulate append
              nil
              (filter list-eq-s 
                      (map (lambda (i)
                             (map (lambda (j)
                                    (map (lambda (k)
                                           (list i j k))
                                         (enumerate-interval 1 n)))
                                  (enumerate-interval 1 n)))
                           (enumerate-interval 1 n)))))