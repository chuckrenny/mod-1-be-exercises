# 1. Using #each, write the code to find the first sister over four letters in length.
# 2. Once you get the method below to work using #each, refactor your code to use #find. 

#each
def find_first_long_named_sister
    sisters = ["Rose", "Kathleen", "Eunice", "Patricia", "Jean"]
  
    
    ### YOUR CODE HERE
    sisters.each do |sister|
        if sister.length > 4
            puts sister
            break
        end
    end

    # should return "Kathleen"
end
p find_first_long_named_sister

#find
def find_first_long_named_sister
    sisters = ["Rose", "Kathleen", "Eunice", "Patricia", "Jean"]
  
    ### YOUR CODE HERE
    first_long_sister = sisters.find do |sister| sister.length > 4 end
    
    puts first_long_sister
    # should return "Kathleen"
end
p find_first_long_named_sister