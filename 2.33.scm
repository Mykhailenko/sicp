(define (map1 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append1 seq1 seq2)
  (accumulate cons seq2 seq1 ))

(define (length1 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
