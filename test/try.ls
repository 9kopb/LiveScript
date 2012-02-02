# Basic exception throwing.
throws 'up', -> throw Error 'up'


# Basic try/catch.
eq 5, try throw 'error' catch e then e.length

eq 2, try
  throw 'up'
catch e
  e.length

eq 1, try
  throw o = i: 0
catch e
  ++e.i
finally
  ++o.i
eq o.i, 2


# try/catch with empty clauses still compiles.
try

try catch

try finally

try catch finally

try
  #!nothing
catch
  #!nothing
finally
  #!nothing


# Nested implicit indentations
eq 1, do -> try 1
eq 2, do -> try do -> throw 1 catch do -> 2 finally


# Empty `throw`
try throw
catch
  eq null e
