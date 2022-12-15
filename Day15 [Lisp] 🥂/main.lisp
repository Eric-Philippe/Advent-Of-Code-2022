(defparameter *sample*
  (with-input-from-string (in *sample-input*)
    (process-stream in)))

(run! 'runPartOne)
(run! 'runPartTwo)