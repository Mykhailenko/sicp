(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define empty-board '())

(define (adjoin-position new-row new-col rest)
  (append rest (cons new-row new-col)))

(define (list-ref l pos)
  (define (ref li cur)
    (cond ((null? li) nil)
          ((= cur pos) (car li))
          (else (ref (cdr li) (+ cur 1)))))
  (ref l 0)
  )
(define (safe? k positions)
  (let ((main (list-ref position k)))
    ()))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (FOR from step to body)
  (if (> from to)
      ()
      (body from))
  (FOR (+ from step) step fromto body))

(define (body x)
  (display x))
  