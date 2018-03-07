(defun findLeft (l n m subarbore)
(cond
((null l)nil)
((= n (+ m 1)) subarbore)
(T 
(findLeft (cddr l) (+ n 1) (+ m (cadr l)) (append subarbore (list (car l)) (list(cadr l)))
)
)))

(defun getLeft(l)
(cond
	((null l))
	(t(findLeft (cddr l) 0 0 nil)
)))

(defun findRight (l n m)
(cond
((null l) nil)
((= n (+ m 1)) l)
(T (findRight (cddr l) (+ n 1) (+ m (cadr l))))
)
)

(defun getRight (l)
(cond
	((null l))
	(t(findRight (cddr l) 0 0)
)))

(defun trans(l)
	(cond
	((null l) nil)
	((eq (cadr l) 0) (list(car l)))
	((eq (cadr l) 1) (list (trans (getLeft l))))
	
	(t
	(cons (car l) (append (list (trans (getLeft l))) (list (trans (getRight l)))))
	)
	)
)