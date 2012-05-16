(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) 
         (dot-product row v ))
       m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col))
                cols))
         m)))

(define A (list (list 2 1) (list 3 4) (list 4 6)))
(define B (list (list 6 5) (list 5 5)))
;;(define mm (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
  
(define (mat-mat m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row) 
           (matrix-*-vector cols m-row))
         m)))

