(defvar board
  #2a((5 3 0 0 7 0 0 0 0)
      (6 0 0 1 9 5 0 0 0)
      (0 9 8 0 0 0 0 6 0)
      (8 0 0 0 6 0 0 0 3)
      (4 0 0 8 0 3 0 0 1)
      (7 0 0 0 2 0 0 0 6)
      (0 6 0 0 0 0 2 8 0)
      (0 0 0 4 1 9 0 0 5)
      (0 0 0 0 8 0 0 7 9))) ; example board to solve
 
(defun try (position)
  (let ((row (truncate position 9)) ; finding row of position
        (column (mod position 9))) ; finding column of position
    (cond
     ((or (>= row 9) (>= column 9)) t) ; checking if position is outside board, if so return 
     ((plusp (aref board row column)) (try (+ position 1))) ;; checking if value in position > 0, if so move along
     (t
      (dotimes (i 9 (reset row column)) ;; otherwise, find the value to put in that position by iterating through 1-9
        (if (check (+ i 1) row column) ;; check if value is appropriate
          (progn
            (setf (aref board row column) (+ i 1)) ;; if value is valid, set the number
            (if (try (+ position 1)) (return t)))))))))) ;; move to next position
 
 
(defun reset (row column) ;; reset function in case needed to reset position to 0 if backtracking needed
  (setf (aref board row column) 0)
  nil)
 
 
 
(defun check (number row column)
  (let ((r (* (truncate row 3) 3))
        (c (* (truncate column 3) 3))) ;; find starting row and column of box position is in
    (dotimes (i 9 t)
      (when (or (= number (aref board row i))
                (= number (aref board i column))
                (= number (aref board (+ r (mod i 3))
                                     (+ c (truncate i 3))))) ;; checking number is unique in box, row and column of position
        (return nil)))))
 
 
 
(defun show () ;; print function to show board
  (dotimes (row 9)
    (if (zerop (mod row 3))
        (format t "~%++---+---+---++---+---+---++---+---+---++~%++---+---+---++---+---+---++---+---+---++~%||") 
      (format t "~%++---+---+---++---+---+---++---+---+---++~%||"))
    (dotimes (column 9)
      (if (= 2 (mod column 3))
          (format t " ~a ||" (aref board row column))
        (format t " ~a |" (aref board row column)))))
  (format t "~%++---+---+---++---+---+---++---+---+---++~%++---+---+---++---+---+---++---+---+---++~%"))
 
 
(defun sodoku ()  (if (try 0) (show)    (format t "This sodoku cannot be solved"))) ;; main function to start program and show solution or say that there is no solution to given board
