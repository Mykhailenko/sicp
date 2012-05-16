(define (yeah )
  (display " hell yeah covers"))
(define (sum-of-odds-square tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (fringe tree)))))