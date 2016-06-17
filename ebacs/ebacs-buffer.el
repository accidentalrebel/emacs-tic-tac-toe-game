(defun ebacs-place-point-at(col row)
  "Places point at the given col and row coordinates.
If the specified column is greater than the numbero of characters in a line,
then it moves to the next line."
  (beginning-of-buffer)
  (goto-line (+ row 1))
  (beginning-of-line)
  (forward-char col))

(defun ebacs-get-col-at-point()
  "Gets the column of where the point is at"
  (string-to-number (format-mode-line "%c")))

(defun ebacs-get-row-at-point()
  "Gets the row of where the point is at"
  (- (string-to-number (format-mode-line "%l")) 1))

(defun ebacs-get-char-at-coordinate(col row)
  "Gets the character at the current point"
  (ebacs-place-point-at col row)
  (char-after))

(provide 'ebacs-buffer)
