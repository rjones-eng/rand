;; [!] Urgent
((text_line) @note.urgent
(#match? @note.urgent "^\\[!\\]"))

;; [ ] To Do
((text_line) @note.todo
(#match? @note.todo "^\\[ \\]"))

;; [+] In Progress
((text_line) @note.partial
(#match? @note.partial "^\\[\\+\\]"))

;; [x] Done
((text_line) @note.done
(#match? @note.done "^\\[x\\]"))

;; [?] Question
((text_line) @note.question
(#match? @note.question "^\\[\\?\\]"))

;; [-] Blocked
((text_line) @note.block
(#match? @note.block "^\\[-\\]"))

;; [>] Next
((text_line) @note.next
(#match? @note.next "^\\[>\\]"))
