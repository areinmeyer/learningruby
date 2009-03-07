=begin
    Loop through the range of 1 to 100
    Print out the current number except:
        when divisible by 3, print 'fizz'
        when divisible by 5, print 'buzz'
        when divisible by 3 and 5, print 'fizzbuzz'
=end

def checkDivisible(n)
    return_val = "";

    if (n % 3 == 0)
        return_val.concat("fizz")
    end

    if (n % 5 == 0)
        return_val.concat("buzz")
    end

    if (return_val == "")
        return_val = n
    end
    return return_val
end

array = (1..100).to_a

array.each {|n| puts checkDivisible( n )} 

