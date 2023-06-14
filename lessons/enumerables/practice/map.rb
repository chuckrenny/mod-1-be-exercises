# All of the methods below have been started for you. To test your code, uncomment the line at the bottom of the page that 
# prints out the return value of that method.  


def capitalize
    names = ["alice", "bob", "charlie"]

    # Your code goes here
    arr_names = names.map do |name| name.capitalize end
    arr_names
    # expected return value is ["Alice", "Bob", "Charlie"]
end

def doubles
    numbers = [1, 2, 3, 4, 5]

    # Your code goes here
    even = numbers.map do |num| 
        num*2
    end
    even
    # expected return value is [2, 4, 6, 8, 10]
end

def squares
    numbers = [1, 2, 3, 4, 5]

    # Your code goes here
    squared = numbers.map do |num| num ** 2 end
    squared
    # expected return value is [1, 4, 9, 16, 25]
end

def lengths
    names = ["alice", "bob", "charlie", "david", "eve"]

    # Your code goes here
    name_lengths = names.map do |name| name.length end
    name_lengths
    # expected return value is [5, 3, 7, 5, 3]
end

def normalize_zip_codes
    numbers = [234, 10, 9119, 38881]

    # Your code goes here
    zip_codes = numbers.map do |num|
        num = num.to_s
        while num.length < 5
            num = '0' + num
        end
        num
    end
    zip_codes
    # expected return value is ["00234", "00010", "09119", "38881"]
end

def backwards
    names = ["alice", "bob", "charlie", "david", "eve"]

    # Your code goes here
    flipped = names.map do |name|
        name.reverse
    end
    flipped
    # expected return value is ["ecila", "bob", "eilrahc", "divad", "eve"]
end

def words_with_no_vowels
    words = ["green", "sheep", "travel", "least", "boat"]

    # Your code goes here
    no_vowels = words.map do |word|
        word.delete("aeiou")
    end
    no_vowels
    # expected return value is ["grn", "shp", "trvl", "lst", "bt"]
end

def trim_last_letter
    animals = ["dog", "cat", "mouse", "frog", "platypus"]

    # Your code goes here
    trim_last = animals.map do |animal|
        animal.slice!(-1)
        animal
    end
    # expected return value is ["do", "ca", "mous", "fro", "platypu"]
end


p capitalize
p doubles
p squares
p lengths
p normalize_zip_codes
p backwards
p words_with_no_vowels
p trim_last_letter