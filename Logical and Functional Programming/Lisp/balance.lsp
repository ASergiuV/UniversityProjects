(defun treedepth (l)
  (cond
   ((null l) 0)
   ((atom l)  0)
   (T (+ 1 (apply #'max (mapcar 'treedepth l))))
)
)

(defun v_balans(l)
 (cond 
 ((null l) nil)
 ((= (- (treedepth (cadr l) ) (treedepth (caddr l))) 1) t)
 (T nil)
)
)