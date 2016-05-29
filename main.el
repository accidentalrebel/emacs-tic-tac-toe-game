(defun start-tic-tac-toe()
  "Starts the tic tac toe game"
  (interactive)
  (switch-to-buffer "tic-tac-toe")
  (setup-tic-tac-board)
  )

(defun setup-tic-tac-board()
  (setq tic-tac-board (make-vector 9 ?.))
  )

(defvar-local tic-tac-board 
  "This Is the tic tac toe board vector"
  )
