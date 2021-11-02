using MultiAssign
using Test

@testset "MultiAssign.jl" begin
    @multiassign a = 1
    @test a == 1
    @multiassign x, y, z = zeros(3)
    @test x == y == z == zeros(3)
end
