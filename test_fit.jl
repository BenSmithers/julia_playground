# this script generates some data according to some function, and then tries to fit to that function 

println("Running")

using Random
using CurveFit
using Plots

println("Imported") 

function vector_mult(a_vec, b_vec)
    """
        element-wise multiplication of two vectors 
    """
    la = length(a_vec)
    lb = length(b_vec)
    if la!=lb
        error("Vectors must be the same length, got $la and $lb")
    end
    result =zeros(la)
    for i=1:la
        result[i] = a_vec[i]*b_vec[i]
    end
    return result
end

function vector_add(vecvec)
    """
        Takes a array or vector of vectors or arrays
        Adds them all together such that the resultant 1D Array has the same length as the first input vector/array 
        All of those vectors/arrays in the main one must be the same length 
    """
    la = length(vecvec)
    if la==0
        error("Must pass more than one vector")
    end
    l_internal = length(vecvec[1])
    if length(vecvec[1])==0
        error("Internal vectors must be greater than length-zero")
    end

    #result = Vector(0.0, l_internal)
    result = zeros(l_internal)

    for i_vec=1:la
        this_len = length(vecvec[i_vec])
        if this_len!=l_internal
            error("All arrays must have same length $l_internal, found $this_len")
        end
        for i_entry=1:this_len
            result[i_entry] += vecvec[i_vec][i_entry]
        end
    end
    return result

end

function vector_scale(value, vec)
    """
        scale a vector/array by some value `value`, which is a float/int or whatever
    """
    len = length(vec)
    result = zeros(len)
    for i=1:len
        result[i] = value*vec[i]
    end
    return result
end

A = 1.5
B = -0.75
C = 1

noise_scale = 0.15

function test_func(x_vals, noisy=true)
    """
        Smash some stuff together, add some noise 
    """
    if noisy
        const_part = vector_scale(C - 0.5*noise_scale, ones(length(x_vals)))

        return vector_add([vector_scale(A, vector_mult(x_vals, x_vals)), vector_scale(B, x_vals), const_part, vector_scale(noise_scale, rand(length(x_vals))) ])
    else
        const_part = vector_scale(C, ones(length(x_vals)))

        return vector_add([vector_scale(A, vector_mult(x_vals, x_vals)), vector_scale(B, x_vals), const_part ])
    end
end

#x_vals = linspace(0, 10, 20)
x_vals = LinRange(-1, 1, 100)
#x_vals = Array(x_vals)
y_vals = test_func(x_vals)

vals = poly_fit(x_vals, y_vals, 2)
y_perfect = test_func(x_vals, false)

println(vals)

plot(x_vals, y_perfect, label="true", lc=:black, lw=2)
test = scatter!(x_vals, y_vals, label="data", mc=:red, ms=2, ma=0.5)

plot!(legend=:bottomleft)
title!("Sine with noise")
xlabel!("x")
ylabel!("y")
display(test)
