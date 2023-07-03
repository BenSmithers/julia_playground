# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.


function digit_sum(value, powers)
    """
        Returns the "digit_sum" 
        56134 -> 5^1 + 6^2 + 1^3 + 3^4 + 4^5 
        where it returns the sum of the digits raised to a power which sequentially increases 

        oops, I actually did the wrong problem
        Updated it so that it now takes the sum of all the digits raised to the $powers power
    """
    total = 0 
    
    for i=0:(powers-1)
        this_power = powers - i

        # this first finds out how many thousands or how many tens there are 
        # if we're looking at, say, tens... this then cuts off all the extra hundreds 
        how_many = value%(10^(i+1))
        # then we divide by the thousands
        how_many = floor(how_many / (10^i))
        
        # println("$how_many ^ $this_power")
        total = total + how_many^powers
    end

    return total
end


function main(powers)
    """
        Calculates the sum of all the integers who are equal to the sum of all their digits raised to the power given by `powers`
    """
    
    n_max = floor(Int, 100 * 10^log10(9^powers))
    println("Max considered $n_max")
    total = 0
    for i=1:n_max
        if i==digit_sum(i, powers) && i!=1
            println(i)
            total = total + i
        end
    end
    println("The total is $total")

    return total

end

power = 4
res_five = main(power)
println("For $power numbers $res_five")

