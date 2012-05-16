(define (square-tree tree)
  (map (lambda (sub)
         (if (pair? sub)
             (square-tree sub)
             (square sub)))
       tree))
(define sssss (list 1
(list 2 (list 3 4) 5)
(list 6 7)))
  