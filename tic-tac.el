(load-file "./ebacs/ebacs-buffer.el")
(require 'ebacs-buffer)

;; Interactives
(defun tic-tac-start()
  "Starts the tic tac toe game"
  (interactive)
  (switch-to-buffer "tic-tac-toe")
  (tictactoe-mode)
  (tic-tac-setup-board)
  (setq tic-tac-current-player-number 1)
  (erase-buffer)
  (tic-tac-display-board)
  (ebacs-place-point-at 1 1))

(defun tic-tac-mark-at-point()
  "Marks the point with player character"
  (interactive)
  (catch 'exit-fun
    (let ((inhibit-read-only t))
      (let ((current-col (ebacs-get-col-at-point))
            (current-row (ebacs-get-row-at-point)))
        (if (char-equal (ebacs-get-char-at-coordinate current-col current-row) ?.)
            (message "Is period")
          (progn
            (message "Is not period")
            (throw 'exit-fun 0))))

      (delete-char 1)
      (if (= tic-tac-current-player-number 1)
          (tic-tac-insert-at-point "X")
        (tic-tac-insert-at-point "O"))

      (setq tic-tac-current-player-number (tic-tac-switch-to-next-player tic-tac-current-player-number))))
  (if (tic-tac-is-board-full)
      (message "Board is already full!")
    (message "Board is not yet full. Carry on"))
  )

;; Setup
(defun tic-tac-setup-board()
  "Set ups the tic tac board with initial values"
  (setq tic-tac-board (make-vector 9 ?.)))

(defun tic-tac-display-board()
  "Displays the board"
  (message "displaying the board")
  (let ((inhibit-read-only t))
    (dotimes (rowIndex tic-tac-board-col-count)
      (dotimes (colIndex tic-tac-board-row-count)
        (tic-tac-insert-at-point "."))
      (open-line 1)
      (next-line)
    )))

;; DEFINITIONS 
(define-derived-mode tictactoe-mode special-mode "tic-tac-toe")

(defvar-local tic-tac-board 
  "This Is the tic tac toe board vector")

(defvar-local tic-tac-current-player-number 1
  "The current player number")

(defconst tic-tac-board-col-count 3
  "The number of columns for the board")

(defconst tic-tac-board-row-count 3
  "The number of rows for the board")

;; FLOW
(defun tic-tac-switch-to-next-player(tic-tac-current-player-number)
  "Switches to the next player"
  (setq tic-tac-current-player-number (+ tic-tac-current-player-number 1))
  (if (> tic-tac-current-player-number 2)
      (setq tic-tac-current-player-number 1))
  (message "Current player is: %d" tic-tac-current-player-number)
  tic-tac-current-player-number)

(defun tic-tac-insert-at-point (to-insert)
  "Inserts at point but makes sure that the readonly is inhibited"
  (let ((inhibit-read-only t))
    (insert to-insert)))

;; HELPECS
(defun tic-tac-is-board-full ()
  "Checks if board is full or not. Returns t if full, nil if not."
  (catch 'exit-loop
  (dotimes (rowIndex tic-tac-board-col-count)
    (dotimes (colIndex tic-tac-board-row-count)
        (if (char-equal (ebacs-get-char-at-coordinate colIndex rowIndex) ?.)
            (progn
              (message "found a . character. Meaning it is not full yet")
              (throw 'exit-loop nil)
              )
          (message "found a non . character. Continuing."))
        ))
  t))

;; TESTS
(ert-deftest test-tic-tac-switch-to-next-player()
  "Tests"
  (should (= (tic-tac-switch-to-next-player 1) 2))
  (should (= (tic-tac-switch-to-next-player 2) 1))
  (should (= (tic-tac-switch-to-next-player 3) 1)))
