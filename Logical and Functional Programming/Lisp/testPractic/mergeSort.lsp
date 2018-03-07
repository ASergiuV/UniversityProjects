(defun insert(E L)
    (cond
        ((null L)
            (list E))
        ((< E (car L))
            (cons E L))
        (t
            (cons (car L) (insert E (cdr L)))
        )
    )
)

(defun msort(L)
    (cond
        ((null L)
            nil)
        (t
            (insert (car L) (msort (cdr L)))
        )
    )
)
(defun solutie (L1 L2)
(msort (append L1 L2))
)