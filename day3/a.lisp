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

; part 2
(april "keep←{alterBits←⍺  
              iter←⊃⍵[1]
              $[¯1=iter ;   ⍝ if iter is -1 then we just need to break
               ¯1 ,(⊂gammaBin),↓⊃⍵[3] ;
                ⍝gammaBin←alterBits ⊃⍵[2]
                ⎕←'applying to'
                ⎕←⊃⍵[2]
                gammaBin←$[alterBits=1;~⊃⍵[2];⊃⍵[2]]
                ⎕←'------------'
                ⎕←'rowNum'
                ⎕←rowNum←iter  ⍝ i think i mean colNum
                ⎕←'what'
                ⎕←what←iter⌷gammaBin
                ⎕←'matFiltered'
                ⎕←matFiltered←↑(∊what=rowNum⌷¨↓⊃⍵[3])/↓⊃⍵[3]
                ⎕←'half'
                ⎕←half←(numRows matFiltered)÷2
                ⎕←'gammaBin first'
                ⎕←gammaBin
                ⎕←'gammaBin second'
                ⎕←gammaBin←half≤+⌿matFiltered
                ⍝⎕←gammaBin←half<+⌿matFiltered
                $[1=⊃1↑⍴matFiltered; ⍝ if we have 1 row left
                  ⎕←'1 row left'
                 ¯1 ,(⊂gammaBin),⊂matFiltered ;  ⍝ return the args-ish
                  (iter+1),(⊂gammaBin),⊂matFiltered   ⍝ else keep going
               ]]
                }")


; (april "keep keep keep keep keep keep (keep 1 gammaBin m)")
; (april-f "argPairs←↓gammaBin,[1.5]⍨⍳⍴gammaBin")
; i think i should learn @

(april "oxygenGeneratorRating←(2⊥⊃3⌷(1∘keep⍣≡ 1 gammaBin m))")
(april "co2ScrubberRating←(2⊥⊃3⌷(0∘keep⍣≡ 1 gammaBin m))")
(april "oxygenGeneratorRating×co2ScrubberRating")



