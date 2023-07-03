# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

function main()
    n_max = 4000000

    last_term = 1
    term = 1

    # start the total at zero since the ones won't contribute
    total = 0 

    while term<n_max
        if term%2==0 #isEven
            total = total + term 
        end

        # update the terms now 
        temp = term +last_term
        last_term = term
        term = temp 
        
    end

    return total 
end

what = main()
println("The sum of the first few even terms is ")
println(what)
        