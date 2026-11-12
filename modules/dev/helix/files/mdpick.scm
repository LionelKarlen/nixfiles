(require "ui-utils.hx/picker.scm")
(require "ui-utils.hx/keys.scm")
(require "helix/editor.scm")
(require-builtin helix/components)
(require-builtin steel/filesystem)
(require (prefix-in helix. "helix/commands.scm"))
(require "run-command/run-command.scm")
(require "expansions.hx/expansions.scm")
(require "helix/misc.scm")
(require "helix/static.scm")

(provide wikilink make_child_of_current insert-callout)

(define (get_md_files) (split-many (hash-get (run-command (string-append "nu ~/.config/helix/mdfiles.nu " (current_working_dir))) 'stdout) "\n"))

(define (current_working_dir) (hash-get (expand "%{current_working_directory}") 'text))

(define (current_file_path) (hash-get (expand "%{file_path_absolute}") 'text))

(define (make_child parent_path file_name) (helix.open (hash-get(run-command (string-append "nu ~/.config/helix/mdchild.nu \"" parent_path "\" \"" file_name"\"")) 'stdout)))

(define (make_child_of_current)
  (name-prompt "File name" (lambda (name)
    (cond [(string=? name "") (set-status! "Invalid name")] [else (make_child (current_file_path) name)]))))

(define (wikilink)
  (file-prompt
    (get_md_files)
    (lambda (result)
      (name-prompt "Display name" (lambda (display)
        (cond [(string=? display "") (insert_string (string-append "[[" result "]]"))] [else (insert_string (string-append "[[" result "|" display "]]"))])
      ))
      )))

(define (insert-callout)
  (select-prompt "Callout" (list "Notation" "Note" "Example" "Intuition" "Important" "Caution" "Tip")
    (lambda (result)
      (insert_string (string-append "> [!" result "] " result "\n> "))
    )
  )
)

(define (select-prompt title options on-done)
  (show-picker!
    (make-picker
      #:name "select-prompt"
      #:items options
      #:filter? #t
      #:allow-empty? #f
      #:title title
      #:on-accept on-done
    )
  )
  void
)

(define (name-prompt name on-done)
  (let ([query ""])
    (show-picker! (make-picker
      #:name "name-prompt"
      #:items '()
      #:filter? #t
      #:allow-empty? #t
      #:title name

      #:on-filter-change
      (lambda (text)
        (set! query text))
      #:keys
        (lambda (state-box event)
          (cond
            [(key-event-enter? event)
              (on-done query)
              event-result/close]
            [else #f]
            ))
      )
  ))
  void)

(define (file-prompt files on-done)
  (let ([query ""])
    (show-picker!
      (make-picker
        #:name "markdown-prompt"
        #:items files
        #:filter? #t
        #:allow-empty? #t
        #:title "Markdown file"

        ;; Keep the exact user input.
        #:on-filter-change
        (lambda (text)
          (set! query text))

        ;; Tab = accept fuzzy completion.
        ;; Enter = accept raw text.
        #:keys
        (lambda (state-box event)
          (cond
            [(key-event-tab? event)
              (let ([item
                      (picker-current-item (unbox state-box))])
                (if item
                  (begin
                    (on-done item)
                    event-result/close)
                  event-result/consume))]

            [(key-event-enter? event)
              (on-done query)
              event-result/close]

            [else #f])))))void)

