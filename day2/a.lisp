(ql:quickload 'april)
(in-package 'april)

; get the input into april
(setf *i* (coerce (uiop:read-file-lines "./day2/input2.txt")
        'vector))

(april (with (:state :in
              ((i *i* ))) )
       "input←i")


; part 1
(april-f "pairs←' '(≠⊆⊢)¨ input")
; (april "pairsN←{⍵[1],⍎⊃⍵[2]}¨pairs")
(april "pairsN←{(('forward' 'up' 'down')⍳⍵[1]),⍎⊃⍵[2]}¨pairs")
(april-f "m←↑pairsN")
; (april-f "1↓+⌿((1=m)[;1])⌿m")
; (april-f "-1↓+⌿((2=m)[;1])⌿m")
; (april-f "1↓+⌿((3=m)[;1])⌿m")
(april-f "fn←{⊃1↓+⌿((⍺=⍵)[;1])⌿⍵}")
(april "×/(1 fn m) , (-2 fn m) + (3 fn m)")
;;;;;;;;;;;;;;;;;;;;;;;;;
; part 2

(let ((aim 0) (hor 0) (dep 0))
  (mapcar #'(lambda (vec)
              (let ((pair (coerce vec 'list)))
                (case (first pair)
                  ((3) (setf aim
                             (+ aim (second pair) )) )
                  ((2) (setf aim
                             (- aim (second pair) )) )
                  ((1) (progn (setf hor
                                    (+ hor (second pair)))
                              (setf dep
                                    (+ dep (* aim (second pair))))) )))) 
          (coerce (april "pairsN")
                  'list))
  (* hor dep))

