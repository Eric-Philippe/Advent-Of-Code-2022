(defun manhattan-distance (sensor beacon)
  (+ (abs (realpart (- sensor beacon)))
     (abs (imagpart (- sensor beacon)))))

(defun bounds-at-y (data y)
  (loop for (sx sy bx by) in data
        for sensor = (complex sx sy)
        for beacon = (complex bx by)
        for y-distance = (abs (- sy y))
        for b-s-distance = (manhattan-distance sensor beacon)
        for distance = (abs (- y-distance b-s-distance))
        with min-x = sb-ext:double-float-positive-infinity
        with max-x = sb-ext:double-float-negative-infinity
        if (<= y-distance b-s-distance)
        do (setf min-x (min min-x (- sx distance))
                 max-x (max max-x (+ sx distance)))
        finally (return (list min-x max-x))))

(defun not-a-beacon (sensor beacon point)
  (let ((distance (manhattan-distance sensor beacon)))
    (cond ((= beacon point) nil)
          ((= sensor point) nil)
          ((< distance (manhattan-distance sensor point)) t)
          (t t))))

(defun not-a-beacon-at-y (data y)
  (loop with bounds = (bounds-at-y data y)
        for x from (first bounds) to (second bounds)
        for point = (complex x y)
        count (loop for (sx sy bx by) in data
                    for sensor = (complex sx sy)
                    for beacon = (complex bx by)
                    always (not-a-beacon sensor beacon point))))

(defun runPartOne () (format t "Solution: ~a~%" (not-a-beacon-at-y * input * 2000000)))