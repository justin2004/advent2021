(ql:quickload 'april)
(in-package 'april)

; get the input into april
(setf *i* (coerce (uiop:read-file-lines "./day4/input1.txt")
        'vector))

(april (with (:state :in
              ((i *i* ))) )
       "input←i")

(april "callsA←⊃1↑input")
(april "calls←⍎¨callsA⊆⍨~','=callsA")
(april "boards←⍎¨1↓input")
(april "boards")
(april "boardsA←(∊1=⍴∘⍴¨boards)/boards")

(april "numBoards←5÷⍨1⌷⍴↑boardsA" )
(april "boardCube←numBoards 5 5 ⍴ ↑boardsA")

(april "callRuns←1↓,\\calls")
(april "callRuns←1↓(7 (7 4) (7 4 9) (7 4 9 5))")
(april "⎕←hits←∨/[1] 7 4 9 5 11 17 23 2 0 14 21 24∘.=boardCube")

(april "⎕←hits←∨/[1] 7 4 9 5 11 17 23 2 0 14 21 24∘.=boardCube")
(april "⎕←hits←∨/[1] 7 4 9 5 11 17 23 2 0 14 21 ∘.=boardCube")

;   ⍵[1] is the calls , ⍵[2] is win board,  ⍵[3] is the boardCube
;   returns 0 if no win, winningBoardNum and winning number
(april "function←{
                 calls←⍵[1]
                 callRuns←⊃⍵[1]
                 calls←⊃1↑callRuns
                 winningBoardNum←⍵[2]
                 boardCube←⊃⍵[3]
                 ⎕←'hits'
                 ⎕←hits←∨/[1] calls ∘.=boardCube
                 winningBoardNumA←⊃⍸(∨/∧/[3]hits)
                 winningBoardNumB←⊃⍸(∨/∧/[2]hits)
                 both←winningBoardNumA winningBoardNumB
                 ⎕←'here1'
                 ⎕←winningBoardNum←⊃both/⍨0≠both
                 $[winningBoardNum≠0 ;
                    ⎕←'winner!'
                    ⎕←winningBoardNum
                    winningNumber←¯1↑calls
                    ⎕←'res:'
                    ⎕←winningNumber×getUnmarkedSum winningBoardNum hits
                    ⎕←getUnmarkedSum winningBoardNum hits
                    ⎕←winningNumber
                    ⎕←'answer'
                    ⎕←winningNumber×getUnmarkedSum winningBoardNum hits
                    callRuns 0 boardCube ;
                    (1↓callRuns) 0 boardCube]
        }")
(april "getUnmarkedSum←{
             ⍝⎕←'winnig board num'
             winningBoardNum←⊃⍵[1]
             hits←⊃⍵[2]
             ⍝⎕←'winnig board'
             winningBoard←winningBoardNum⌷boardCube
             winningBoardHits←winningBoardNum⌷hits
             ⍝⎕←'about to assign to unmarkedNumbers'
             unmarkedNumbers←winningBoard∧~winningBoardHits
             ⍝⎕←winningBoard∧~winningBoardHits
             ⍝winningBoardHits
             ⍝unmarkedNumbers
             ⎕←'summing unamrkedNumbers'
             +/+/unmarkedNumbers
        }")

(april "(function⍣≡) callRuns 0 boardCube")
; ans 87456

(april "ff←{⎕←bobNum←2
        bob←bobNum⌷(3 4) (5 6) (7 8)
        ⎕←'bob'
        ⎕←bob
        fred←bob∧⊂~0 0
        ⊃fred
        }")
(april "gg←{⎕←bobNum←1
            $[ 1=1 ;
               ff 9;
             0]
        }")
(april "(gg⍣35) 8")
(april "ff 4")
(april "(ff⍣50) 0")

(april "41⌷boardCube")
; RESUME  board number 41 is the winner..

; (april " function callRuns 0 boardCube")
(april "calls")
(april "41⌷boardCube")

; 0 21 17 24  4
; 0  0 15  9 19
; 0  8  0 26 20
; 0 11 13  6  0
; 0  0 12  3  7

(april "(function⍣99) callRuns 0 boardCube")
(april "(function⍣≡) callRuns 0 boardCube") ; 5304 wrong
(april "⊃4 2/⍨0≠0 2.")
; 20640  too low
(april " function (7 4 9 5 11 17 23 2 0 14 21 24) 0 boardCube")
(april " function (7 4 9 5 11 17 23 2 0 14 21 ) 0 boardCube")


(april-f "getHits←{∨/[1] ⍵∘.=boardCube}")
(april "callRuns")
(april-f "getHits¨ callRuns")
(april "f←{⍺∘.=⍵}")
(april-f "callRuns ∘.f boardCube")
(april-f "callRuns ∘.= boardCube")
(april-f "hits")
(april-f "∨/∧/[3]hits")
(april-f "winningBoardNum←⊃⍸(∨/∧/[3]hits)")
(april-f "winningBoard←winningBoardNum⌷boardCube")
(april-f "winningBoardHits←winningBoardNum⌷hits")
(april-f "unmarkedNumbers←winningBoard∧~winningBoardHits")
(april "24×+/+/unmarkedNumbers")


(april "fun ")

(april-f "2 3 4 ⍴ ⍳24") ; 1 planes
(april-f "+/[1] 2 3 4 ⍴ ⍳24") ; 1 down planes, 
;                             2 down cols, 3 down rows



(april "1 2 3 +.× 4 5 6")
(april "+/1 2 3 × 4 5 6")
; (april "(' '@(⍸','=calls)) calls")














;;;;;;;;;;;
(april-f "⊂⍤¯1∘⍉ 5 5 ⍴ ⍳ 25")

(april-f "(⊂⍤¯1) 5 5 ⍴ ⍳ 25") ; major cells
(april-f "↓5 5 ⍴ ⍳ 25") ; major cells

(april-f "↓⍉5 5 ⍴ ⍳ 25") 
(april-f "f←↓∘⍉") 
(april "f 5 5 ⍴ ⍳25")

(april-f "5 5 ⍴ ⍳ 25")
