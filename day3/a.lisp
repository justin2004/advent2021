(ql:quickload 'april)
(in-package 'april)

; get the input into april
(setf *i* (coerce (uiop:read-file-lines "./day3/input1.txt")
        'vector))

(april (with (:state :in
              ((i *i* ))) )
       "input←i")

; part 1
(april "m←⍎¨↑input")
(april "numRows←⊃1↑⍴")
(april "half←(numRows m)÷2")
; (april "(+⌿÷numRows) m")
(april "gammaBin←half≤+⌿m")
(april "(2⊥~gammaBin)×(2⊥gammaBin)")


