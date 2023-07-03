# Project Euler 

Take a look here! 

https://projecteuler.net/

This is a website with a ton of math/coding problems and challenges.
I'm trying to learn Julia so I'm trying to do a bunch of these

# Select Problems 

## Project 1 

*Find the sum of all multiples of 3 or 5 below 1000*

Iterate over all numbers between 1 and 1000.
If it's divisible by 3 or 5, add it to the counter 
return the sum, print the sum 

## Project 2 

*By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.*

It... does... this. 
Iteratively calculates the next term in the Fib sequence. If it's even, add it to the total.
Stop adding once you hit 4,000,000

## project 30

*Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.*

Function `digit_sum` calculates the sum of the digits for some integer.
And then we literally just iterate between 1 and 10^5-1 and check each one individualy 


What is the maximum number worth checking?
We'll, essentially there is some number = 10^(N-1)

10^(N-1) = N*(9^5)
10^(N-2) = 9^5 
N = log10(9^5) + 2
want 10^(log(9^5) + 2)
    = 100 * 10^log10(9^5)