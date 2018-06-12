Require Import Coq.ZArith.BinInt.
Inductive type := Z | prod (A B : type) | arrow (s d : type).
Inductive expr {var:type -> Type} : type -> Type :=
| LetIn {s d} (x : expr s) (f : var s -> expr d) : expr d
| App {s d} (f : expr (arrow s d)) (x : expr s) : expr d
| Abs {s d} (f : var s -> expr d) : expr (arrow s d)
| Var {t} (v : var t) : expr t
| Pair {A B} (x : expr A) (y : expr B) : expr (prod A B)
| Fst {A B} (x : expr (prod A B)) : expr A
| Snd {A B} (x : expr (prod A B)) : expr B
| Add (x y : expr Z) : expr Z
| Mul (x y : expr Z) : expr Z
| Sub (x y : expr Z) : expr Z
| Opp (x : expr Z) : expr Z
| Literal (v : BinInt.Z) : expr Z
| AddWithGetCarry (x y c : expr Z) : expr (prod Z Z)
| CastToSize (lower upper : BinInt.Z) (v : expr Z) : expr Z.

(* Syntax of notations (e.g., \texttt{Infix "+" := add.}; \texttt{Notation "a + b" := (add a b).}) *)
(* Notation bodies must be parenthesized *)
(* How to use levels and associativity, how to pick levels, how to discover levels of existing notations (\texttt{Print Grammar constr}) *)
(* Controlling display: \texttt{format}, extra spaces, quoting symbols, boxes in \texttt{format} for display of indentation, newlines, and whitespace *)
(* Recursive notations: \texttt{..} for pair- and $\lambda$-like things *)
(* \texttt{Reserved Notation} and \texttt{only printing}, useful for ensuring that notations don't conflict *)
(* Using single-variable only-printing notations for hiding identifiers *)
(* Abbreviations vs notations (what it means when your \texttt{Notation} doesn't have quotes, and why you might want this) *)
(* Notation scopes, useful for overloading notations and selecting the right one automatically (\texttt{Bind Scope}, \texttt{Delimit Scope}, \texttt{Open Scope}) *)
(* Using binders for destructuring pairs *)
(* Parenthesizing notations: when to use parentheses, and when to use levels *)
(* Deliberate ordering of notations: how to express wildcard and negation in notation matching *)
