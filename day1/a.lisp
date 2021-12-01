(ql:quickload 'april)
(in-package 'april)

(setf *i* (with-open-file (s "./day1/input1.txt"
                             :direction :input)
            (loop
              :for line = (read-line s nil)
              :while (not (null line))
              :collect line)))

; get the input into april
(april (with (:state :in
              ((i (coerce *i*
                          'vector)))) )
       "input←i")

; (april "input←199 200 208 210 200 207 240 269 260 263")
(april "input←⍎¨input")

; part 1
(april "+/0>2-/input")

; part 2
(april "+/0>2-/3+/input")
