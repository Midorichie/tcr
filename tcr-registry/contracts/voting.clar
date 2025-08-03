;; Voting contract for challenged TCR entries

(define-constant VOTE_YES u1)
(define-constant VOTE_NO u2)

(define-constant ERR_INVALID_VOTE (err u400))

(define-map votes (tuple (entry principal) (voter principal)) uint)

(define-public (vote (entry principal) (vote-type uint))
  (begin
    (if (or (is-eq vote-type VOTE_YES) (is-eq vote-type VOTE_NO))
        (begin
          (map-set votes { entry: entry, voter: tx-sender } vote-type)
          (ok true)
        )
        ERR_INVALID_VOTE
    )
  )
)

(define-read-only (get-vote (entry principal) (voter principal))
  (match (map-get? votes { entry: entry, voter: voter })
    stored-vote (ok stored-vote)
    (ok u0)
  )
)
