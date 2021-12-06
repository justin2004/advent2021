
(april-f "2 3 4 ⍴ ⍳24") ; 1 planes
(april-f "+/[1] 2 3 4 ⍴ ⍳24") ; 1 down planes, 
;                             2 down cols, 3 down rows

(april "1 2 3 +.× 4 5 6")
(april "+/1 2 3 × 4 5 6")
; (april "(' '@(⍸','=calls)) calls")


(april-f "⊂⍤¯1∘⍉ 5 5 ⍴ ⍳ 25")

(april-f "(⊂⍤¯1) 5 5 ⍴ ⍳ 25") ; major cells
(april-f "↓5 5 ⍴ ⍳ 25") ; major cells

(april-f "↓⍉5 5 ⍴ ⍳ 25") 
(april-f "f←↓∘⍉") 
(april "f 5 5 ⍴ ⍳25")

(april-f "5 5 ⍴ ⍳ 25")
