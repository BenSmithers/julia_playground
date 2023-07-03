
# find the sum of all multiples of 3 or 5 below 1000

function main()
    """
    Iterate over all numbers between 1 and 1000.
    If it's divisible by 3 or 5, add it to the counter 
    return the sum, print the sum 
    """
    
    n_max = 1000
    total = 0
    for i = 1:n_max-1
        if i%3==0 || i%5==0
            total = total + i
        end
    end
    println(total)

    return total
end

