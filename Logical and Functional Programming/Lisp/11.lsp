(defun existnode(li e)
 
 (cond
  ((null li) nil)
  ((and (atom (car li)) (equal (car li) e)) t)
  ((and (null (cadr li)) (null (caddr li))) nil)
  ((null (caddr li)) (existnode (cadr li) e))
  (T (or (existnode (cadr li) e) (existnode (caddr li) e)))
)
)
(defun nodepath2(li e)
(cond
 ((null li) nil)
 ((and (listp li)(existnode (cadr li) e)) (print 3)(car li))
 ((and (listp li)(existnode (caddr li) e)) (print 5)(car li))
 (t nil)
))
(defun nodepath(li e)
(cond
 ((null li) nil)
 ((and (listp li)(existnode (cadr li) e)) (print 3)(car li))
 ((and (listp li)(existnode (caddr li) e)) (print 5)(car li))
 
	(t(apply `append (mapcar #'(lambda(x)(nodepath x e) li))
	)
)
))

(defun nodepath3(li e)
(cond
 ((null li) nil)
 ((and (null (caddr li)) (null (cadr li))) nil)
 ((and (null (caddr li)) (existnode (caddr li) e)) (append (list (car li)) (nodepath (cadr li) e)))
 ((and (not (existnode (cadr li) e)) (existnode (caddr li) e)) (append (list (car li)) (nodepath (caddr li) e)))
 ((and (existnode (cadr li) e) (existnode (caddr li) e)) (append (list (car li)) (nodepath (cadr li) e)))
)
)