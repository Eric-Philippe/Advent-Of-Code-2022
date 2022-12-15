(defun parse-line (line)
  (mapcar #'parse-integer (cl-ppcre:all-matches-as-strings "-?\\d+" line)))

(defun process-stream (in)
  (loop for line = (read-line in nil)
        while line
        collect (parse-line line)))
(defun read-input (file)
  (with-open-file (in file)
    (process-stream in)))

    (defparameter *input*
  (read-input "input.txt"))