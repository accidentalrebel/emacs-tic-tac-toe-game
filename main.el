(defun start-tic-tac-toe()
  "Starts the tic tac toe game"
  (interactive)
  (switch-to-buffer "tic-tac-toe")
  (setup-tic-tac-board)
  (erase-buffer)
  (display-tic-tac-board))

(defun setup-tic-tac-board()
  "Set ups the tic tac board with initial values"
  (setq tic-tac-board (make-vector 9 ?.)))

(defun display-tic-tac-board()
  "Displays the board"
  (message "displaying the board")
  (dotimes (rowIndex BOARD_COL_COUNT)
    (dotimes (colIndex BOARD_ROW_COUNT)
      (place-point-at colIndex rowIndex)
      (insert "."))
    (open-line 1)
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
  (goto-line row)
  (beginning-of-line)
  (forward-char col))
