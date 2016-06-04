;; Interactives
(defun start-tic-tac-toe()
  "Starts the tic tac toe game"
  (interactive)
  (switch-to-buffer "tic-tac-toe")
  (setup-tic-tac-board)
  (erase-buffer)
  (display-tic-tac-board)
  (place-point-at 1 1))

(defun mark-at-point()
  "Marks the point with player characacter"
  (interactive)
  (delete-char 1)
  (insert "x")
  )

;; Setup
(defun setup-tic-tac-board()
  "Set ups the tic tac board with initial values"
  (setq tic-tac-board (make-vector 9 ?.)))

(defun display-tic-tac-board()
  "Displays the board"
  (message "displaying the board")
  (dotimes (rowIndex BOARD_COL_COUNT)
    (dotimes (colIndex BOARD_ROW_COUNT)
      (insert "."))
    (open-line 1)
    (next-line)
    ))

;; VARIABLES
(defvar-local tic-tac-board 
  "This Is the tic tac toe board vector")

;; CONSTANTS
(defconst BOARD_COL_COUNT 3
  "The number of columns for the board")

(defconst BOARD_ROW_COUNT 3
  "The number of rows for the board")

;; DISPLAY
(defun place-point-at(col row)
  "Places point at the given col and row coordinates.
If the specified column is greater than the numbero of characters in a line,
then it moves to the next line."
  (beginning-of-buffer)
  (goto-line (+ row 1))
  (beginning-of-line)
  (forward-char col))

(defun get-col-of-point()
  "Gets the column of where the point is at"
  )

(defun get-row-of-point()
  "Gets the row of where the point is at"
  )

(defun get-char-at-coordinate(col row)
  "Gets the character at the current point"
  )
