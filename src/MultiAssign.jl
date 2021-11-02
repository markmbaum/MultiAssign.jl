module MultiAssign

export @multiassign

const msg = "@multiassign expression must be in the form x, y, ... = z"

macro multiassign(x)
    #must be doing variable assignment
    @assert isa(x, Expr) msg
    @assert x.head == :(=) msg
    @assert length(x.args) == 2 msg
    #handle single assignment case
    vars = isa(x.args[1], Symbol) ? [x.args[1]] : x.args[1].args
    #get the assignment value
    val = x.args[2]
    #build the multiple assignment expression
    esc(Expr(:block, [:($var = $val) for var ∈ vars]...))
end

end
