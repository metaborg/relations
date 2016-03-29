module typing/functions

imports

  // constructors
  src-gen/signatures/Expressions-sig
  src-gen/signatures/Types-sig   
  trans/api/constructors
  
  // functions
  typing/_multiplicity-functions
  names/naming/names

type rules

  Param(p-name, p-ty, p-mu, p-or) : (p-ty) //wrap in unary tuple
   
type rules

  Function(f-name, param*, f-ty, f-mu, f-or, e):-
  where e : e-ty
    and (e-ty == f-ty or e-ty <sub: f-ty) 
        else error $[Type mismatch: expected [f-ty] got [e-ty] in Function body] on e

  Function(f-name, param*, f-ty, f-mu, f-or, e):-
  where e has multiplicity e-mu
    and (e-mu == f-mu) 
        else error $[Multiplicity mismatch: expected [f-mu] got [e-mu] in Function body] on e
        
  Function(f-name, param*, f-ty, f-mu, f-or, e):-
  where e has ordering e-or
    and (e-or == f-or) 
        else error $[Ordering mismatch: expected [f-or] got [e-or] in Function body] on e

type rules

  Call(f-name, param*) : f-ty
  where definition of f-name : f-ty

  Call(f-name, param*) has multiplicity f-mu
  where definition of f-name has multiplicity f-mu

  Call(f-name, param*) has ordering f-or
  where definition of f-name has ordering f-or
  
  //TODO: check arg types, mults and orderings
  