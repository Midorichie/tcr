;; Token Curated Registry (TCR) Smart Contract

(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_LISTED (err u101))
(define-constant ERR_NOT_LISTED (err u102))
(define-constant ERR_INSUFFICIENT_STAKE (err u103))

(define-constant STAKE_AMOUNT u1000000)

(define-map registry principal bool)
(define-map stakes principal uint)

(define-public (add-entry (entry principal))
  (begin
    (if (is-some (map-get? registry entry))
        ERR_ALREADY_LISTED
        (let (
              (caller tx-sender)
              (balance (stx-get-balance caller))
             )
          (if (< balance STAKE_AMOUNT)
              ERR_INSUFFICIENT_STAKE
              (begin
                (try! (stx-transfer? STAKE_AMOUNT caller (as-contract tx-sender)))
                (map-set registry entry true)
                (if (is-none (map-get? stakes caller))
                    (ok (map-set stakes caller STAKE_AMOUNT))
                    (ok true)
                )
              )
          )
        )
    )
  )
)

(define-public (challenge-entry (entry principal))
  (begin
    (if (is-none (map-get? registry entry))
        ERR_NOT_LISTED
        ;; Future logic for voting or dispute resolution
        (ok true)
    )
  )
)

(define-public (remove-entry (entry principal))
  (begin
    (if (is-none (map-get? registry entry))
        ERR_NOT_LISTED
        (begin
          (map-delete registry entry)
          (ok true)
        )
    )
  )
)

(define-read-only (is-listed (entry principal))
  (match (map-get? registry entry)
    some-entry (ok some-entry)
    (ok false)
  )
)

(define-read-only (get-stake (user principal))
  (match (map-get? stakes user)
    some-stake (ok some-stake)
    (ok u0)
  )
)
