(ql:quickload 'april)
(in-package 'april)

; get the input into april
(setf *i* (coerce (uiop:read-file-lines "./day4/input1.txt")
        'vector))

(april (with (:state :in
              ((i *i* ))) )
       "input←i")

; turn input into a vector of numbers called
; and a 3d cube of boards
(april "callsA←⊃1↑input")
(april "calls←⍎¨callsA⊆⍨~','=callsA")
(april "boards←⍎¨1↓input")
(april "boardsA←(∊1=⍴∘⍴¨boards)/boards")
(april "numBoards←5÷⍨1⌷⍴↑boardsA" )
(april "boardCube←numBoards 5 5 ⍴ ↑boardsA")
(april "callRuns←1↓,\\calls")

; (april "⎕←hits←∨/[1] 7 4 9 5 11 17 23 2 0 14 21 24∘.=boardCube")

;   ⍵[1] is the calls , ⍵[2] is win board,  ⍵[3] is the boardCube
;   returns 0 if no win, winningBoardNum and winning number
(april "playBingo←{
                 calls←⍵[1]
                 callRuns←⊃⍵[1]
                 calls←⊃1↑callRuns
                 winningBoardNum←⍵[2]
                 boardCube←⊃⍵[3]
                 hits←∨/[1] calls ∘.=boardCube
                 winningBoardNumA←⊃⍸(∨/∧/[3]hits)
                 winningBoardNumB←⊃⍸(∨/∧/[2]hits)
                 both←winningBoardNumA winningBoardNumB
                 winningBoardNum←⊃both/⍨0≠both
                 $[winningBoardNum≠0 ;
                    winningNumber←¯1↑calls
                    winningNumber×getUnmarkedSum winningBoardNum hits
                    ⎕←winningNumber×getUnmarkedSum winningBoardNum hits
                    callRuns 0 boardCube ;
                    (1↓callRuns) 0 boardCube]
        }")
(april "getUnmarkedSum←{
             winningBoardNum←⊃⍵[1]
             hits←⊃⍵[2]
             winningBoard←winningBoardNum⌷boardCube
             winningBoardHits←winningBoardNum⌷hits
             unmarkedNumbers←winningBoard∧~winningBoardHits
             +/+/unmarkedNumbers
        }")

(april "(playBingo⍣≡) callRuns 0 boardCube ⋄ 0")
; ans 87456

