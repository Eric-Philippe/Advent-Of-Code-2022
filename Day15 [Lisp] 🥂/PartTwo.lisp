(defun sensor-range-at-y (sensor beacon y)
  (let* ((y-distance (manhattan-distance sensor (complex (realpart sensor) y)))
         (b-s-distance (manhattan-distance sensor beacon))
         (distance (abs (- y-distance b-s-distance))))
    (when (<= y-distance b-s-distance)
      (list (- (realpart sensor) distance)
            (+ (realpart sensor) distance)))))

(defun all-ranges (data y)
  (loop for (sx sy bx by) in data
        for sensor = (complex sx sy)
        for beacon = (complex bx by)
        for range = (sensor-range-at-y sensor beacon y)
        if range
          collect range))

(defun in-range (range x)
  (<= (first range) x (second range)))

(defun limits (ranges)
  (loop for (start end) in ranges
        minimizing start into min
        maximizing end into max
        finally (return (list min max))))

(defun range<= (r1 r2)
  (<= (first r1) (first r2)))

(defun scan-ranges-at-y (data y &key (absolute-min 0) absolute-max)
  (loop with ranges = (sort (all-ranges data y) #'range<=)
        with (min max) = (limits ranges)
        with x = (max 0 min)
        while (<= x (min (max 0 max) absolute-max))
        unless (loop for range in ranges
                     with ret = nil
                     if (in-range range x)
                       do (setf x (1+ (second range)))
                          (setf ret t)
                     finally (return ret))
          return x))

(defun known-locations (data)
  (loop for (sx sy bx by) in data
        collect (complex sx sy)
        collect (complex bx by)))

(defun beacon-tuning-frequency (data max)
  (loop for y from 0 to max
        for x = (scan-ranges-at-y data y :absolute-max max)
        with beacons-and-sensors = (known-locations data)
        if (and x (not (member (complex x y) beacons-and-sensors)))
          do (return (+ y (* 4000000 x)))))

(defun runPartTwo () (format t "Solution : ~a~%" (beacon-tuning-frequency * input * 4000000)))