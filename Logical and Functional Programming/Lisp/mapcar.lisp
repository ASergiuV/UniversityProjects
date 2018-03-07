(defun CountN(L N)
	(cond 
		((and(equal L N)(atom L)) 1)
		((and(not(equal L N))(atom L)) 0)
		(T
		(apply `+ (mapcar #'(lambda(x)(CountN x N)) L))
		)
	)
)

(defun contains (L N)
	(cond
		((null l) nil)
		((eq(CountN L N) 0) nil)
		(T
			T
		)
	)
)