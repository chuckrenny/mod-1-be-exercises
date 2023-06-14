# 1. Using #each, write the code to find all the numbers divisible by 3
# 2. Once you get the method below to work using #each, refactor your code to use #find_all. 

#each
def find_all_nums_divisible_by_3
    numbers = [1,2,3,4,5,6,7,8,9]
    
    ### YOUR CODE HERE
    output = []

    numbers.each do |num|
        if num % 3 == 0
            output << num
        end
    end
    output
    # should return [3,6,9]
end
p find_all_nums_divisible_by_3

#find_all
def find_all_nums_divisible_by_3
    numbers = [1,2,3,4,5,6,7,8,9]
    
    ### YOUR CODE HERE
    divisible_by_three = numbers.find_all do |num| num % 3 == 0 end
  
    divisible_by_three
    # should return [3,6,9]
end
p find_all_nums_divisible_by_3
