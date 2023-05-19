function calc_pi(n)
    w = 1.0/n
    psum = 0.0

    for i in 1:n
        x = w * (i - 0.5)
        psum += 4.0 / (1.0 + x * x)
    end

    pi = w * psum
    return pi
end

using BenchmarkTools

n = 10_000_000_000
println(n)
println(calc_pi(n))
@btime calc_pi(n)
