;; Interactives
(defun tic-tac-start()
  "Starts the tic tac toe game"
  (interactive)
  (switch-to-buffer "tic-tac-toe")
  (tic-tac-setup-board)
  (setq tic-tac-current-player-number 1)
  (erase-buffer)
  (tic-tac-display-board)
  (tic-tac-place-point-at 1 1))

(defun tic-tac-mark-at-point()
  "Marks the point with player characacter"
  (interactive)
  (delete-char 1)
  (if (= tic-tac-current-player-number 1)
      (insert "X")
    (insert "O"))

  (setq tic-tac-current-player-number (tic-tac-switch-to-next-player tic-tac-current-player-number))
  )

;; Setup
(defun tic-tac-setup-board()
  "Set ups the tic tac board with initial values"
  (setq tic-tac-board (make-vector 9 ?.)))

(defun tic-tac-display-board()
  "Displays the board"
  (message "displaying the board")
  (dotimes (rowIndex tic-tac-board-col-count)
    (dotimes (colIndex tic-tac-board-row-count)
      (insert "."))
    (open-line 1)
    (next-line)
    ))

;; VARIABLES
(defvar-local tic-tac-board 
  "This Is the tic tac toe board vector")

(defvar-local tic-tac-current-player-number 1
  "The current player number")

;; CONSTANTS
(defconst tic-tac-board-col-count 3
  "The number of columns for the board")

(defconst tic-tac-board-row-count 3
  "The number of rows for the board")

;; DISPLAY
(defun tic-tac-place-point-at(col row)
  "Places point at the given col and row coordinates.
If the specified column is greater than the numbero of characters in a line,
then it moves to the next line."
  (beginning-of-buffer)
  (goto-line (+ row 1))
  (beginning-of-line)
  (forward-char col))

(defun tic-tac-get-col-of-point()
  "Gets the column of where the point is at"
  )

(defun tic-tac-get-row-of-point()
  "Gets the row of where the point is at"
  )

(defun tic-tac-get-char-at-coordinate(col row)
  "Gets the character at the current point"
  )

;; FLOW
(defun tic-tac-switch-to-next-player(tic-tac-current-player-number)
  "Switches to the next player"
  (setq tic-tac-current-player-number (+ tic-tac-current-player-number 1))
  (if (> tic-tac-current-player-number 2)
      (setq tic-tac-current-player-number 1))
  (message "Current player is: %d" tic-tac-current-player-number)
  tic-tac-current-player-number)

;; TESTS
(ert-deftest test-tic-tac-switch-to-next-player()
  "Tests"
  (should (= (tic-tac-switch-to-next-player 1) 2))
  (should (= (tic-tac-switch-to-next-player 2) 1))
  (should (= (tic-tac-switch-to-next-player 3) 1)))
