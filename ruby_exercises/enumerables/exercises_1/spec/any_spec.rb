RSpec.describe 'Any test' do
  it 'has at least one zero' do
    numbers = [2, 0, 9, 3, 0, 1]
    has_zero = numbers.any? do |number|
      number.zero?
    end
    expect(has_zero).to eq(true)
  end

  it 'does not have zeroes' do
    numbers = [3, 1, 3, 2, 4, 9, 8]
    has_zero = numbers.any? do |number|
      # Your code goes here
      number.zero?
    end
    expect(has_zero).to eq(false)
  end

  it 'has at least one alice' do
    names = ["Bill", "Bob", "Burton", "Alice", "Brandon"]
    # Your code goes here
    has_alice = names.any? do |name|
      name == 'Alice'
    end

    expect(has_alice).to eq(true)
  end

  it 'no alices' do
    names = ["Chuck", "Charlene", "Cory", "Chris", "Carl"]
    # Your code goes here
    has_alice = names.any? do |name|
      name == 'Alice'
    end

    expect(has_alice).to eq(false)
  end

  it 'has a multi word phrase' do
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    # Your code goes here
    multi_word_phrase = phrases.any? do |phrase|
      phrase.include?(" ")
    end

    expect(multi_word_phrase).to eq(true)
  end

  it 'no monkeys' do
    animals = ["elephant", "hippo", "jaguar", "python"]
    # Your code goes here
    has_monkeys = animals.any? do |animal|
      animal == 'monkey'
    end

    expect(has_monkeys).to eq(false)
  end

  it 'no multiples of five' do
    numbers = [3, 1, 3, 2, 4, 9, 8]
    # Your code goes here
    multiples_of_5 = numbers.any? do |num|
      num % 5 == 0
    end
    
    expect(multiples_of_5).to eq(false)
  end
end
