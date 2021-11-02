# MultiAssign.jl

[![Build Status](https://github.com/markmbaum/MultiAssign.jl/workflows/CI/badge.svg)](https://github.com/markmbaum/MultiAssign.jl/actions)
[![Coverage](https://codecov.io/gh/markmbaum/MultiAssign.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/markmbaum/MultiAssign.jl)

`MultiAssign` exports a macro for assigning a value/expression to multiple variables in a single terse and clear line. For example, you can write
```julia
@multiassign x, y, z = zeros(n)
```
instead of
```julia
x = zeros(n)
y = zeros(n)
z = zeros(n)
```
or
```julia
x, y, z = (zeros(n) for _ in 1:3)
```

Importantly, each of the variables is assigned with a distinct call to `zeros` in the example above. The resulting `x`, `y`, and `z` vectors are not copies of each other.

The macro should work wherever multiple variables should be assigned the same value. It simply generates identical assignments for each variable.

Type annotations will also work if you need them, except in global scope. For example
```julia
@multiassign a::Float64, b::Float32, c::Int64 = 0
```
will work inside a function, but not at the global scope of the REPL.