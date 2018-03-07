
(defun firstEl (x)
	(cond 
		((null x) nil)
		((atom (car x)) (firstEl (cdr x)))
		((oddp (length (car x))) (append (cons (caar x) (firstEl (car x))) (firstEl (cdr x))))
		((evenp (length (car x))) (append (firstEl (car x)) (firstEl (cdr x))))


))
(defun firstEl2 (x)
	(cond 
	((oddp (length x)) (cons (car x) (firstEl x)))
	((evenp (length x)) (firstEl x))
	))

(defun reverseall(L)
    (cond
        ((null L) nil)
        ((listp (car L)) (append (reverseall (cdr L)) (list (reverseall (car L)))))
        (t
            (append (reverseall (cdr L)) (list (car L)))
        )
    )
)

(defun sum(x)
    (cond
		((null x) 0)
		((listp (car x)) (+ 0 (sum (cdr x))))
		((numberp (car x)) (+ (car x) (sum (cdr x))))
		((atom (car x)) (sum (cdr x))
		)))

		  
(defun difset (a b)
	(cond
		((null a) nil)
		((not (member (car a) b)) (cons (car a) (difset (cdr a) b)))
		(t
			(difset (cdr a) b)


)))