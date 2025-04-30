;; Title: BitPredix - Decentralized Bitcoin Price Prediction Market
;; 
;; Summary:
;; A transparent, trustless prediction market built on Stacks Layer 2 that allows
;; users to stake STX tokens on Bitcoin price movements, with automatic resolution
;; and rewards distribution.
;; 
;; Description:
;; BitPredix enables users to participate in prediction markets where they can stake on
;; whether Bitcoin's price will go up or down within defined periods. The contract handles
;; market creation, user predictions, oracle-based resolution, and winner payouts.
;; All operations are executed on-chain with transparent fee structures and automatic
;; settlement, leveraging Stacks' Bitcoin-anchored security.

;; Administrative Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))

;; Error Codes
(define-constant err-not-found (err u101))
(define-constant err-invalid-prediction (err u102))
(define-constant err-market-closed (err u103))
(define-constant err-already-claimed (err u104))
(define-constant err-insufficient-balance (err u105))
(define-constant err-invalid-parameter (err u106))

;; State Variables

;; Platform configuration
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum stake
(define-data-var fee-percentage uint u2) ;; 2% platform fee
(define-data-var market-counter uint u0)

;; Data Maps

;; Market data structure
(define-map markets
    uint
    {
        start-price: uint,
        end-price: uint,
        total-up-stake: uint,
        total-down-stake: uint,
        start-block: uint,
        end-block: uint,
        resolved: bool
    }
)