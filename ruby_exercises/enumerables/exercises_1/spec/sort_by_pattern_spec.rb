RSpec.describe 'sort_by pattern' do

  it 'sorts alphabetically' do
    words = ["broccoli", "Carrots", "FISH", "Bacon", "candy"]
    transformed = []
    words.each do |word|
      transformed << [word.downcase, word]
    end

    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, word|
      sorted << word
    end

    expect(sorted).to eq(["Bacon", "broccoli", "candy", "Carrots", "FISH"])
  end

  it 'alphabetically by last letter' do
    things = ["pill", "box", "glass", "water", "sponge"]
    transformed = []
    things.each do |thing|
      # Your code goes here
      transformed << [thing[-1], thing]
    end

    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, thing|
      sorted << thing
    end
    expect(sorted).to eq(["sponge", "pill", "water", "glass", "box"])
  end

  it 'sort by distance' do
    distances = ["1cm", "9cm", "30cm", "4cm", "2cm"]
    transformed = []
    # Your code goes here
    distances.each do |distance|
      trim = distance[0..-2]
      transformed << [trim.to_i, distance]
    end

    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, distance|
      sorted << distance
    end
    expect(sorted).to eq(["1cm", "2cm", "4cm", "9cm", "30cm"])
  end

  it 'by length' do
    words = ["heteromorph", "ancyloceratina", "bioengineering", "mathematical", "bug"]
    # Your code goes here
    transformed = []
    words.each do |word|
      transformed << [word.length, word]
    end
    
    sorted = []
    transformed = transformed.sort
    transformed.each do |sort_key, word|
      sorted << word
    end

    expect(sorted).to eq(["bug", "heteromorph", "mathematical", "ancyloceratina", "bioengineering"])
  end

  it 'by proximity to ten' do
    prices = [3.02, 9.91, 17.9, 10.01, 11.0]
    # Your code goes here
    proximity = []
    prices.each do |price|
      proximity << [(10-price).abs, price]
    end

    sorted = []
    proximity = proximity.sort
    proximity.each do |sort_key, price|
      sorted << price
    end

    expect(sorted).to eq([10.01, 9.91, 11.0, 3.02, 17.9])
  end

  it 'by number of cents' do
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    # Your code goes here
    cents = []
    prices.each do |price|
      cents << [(price - price.floor).abs, price]
    end

    sorted = []
    cents = cents.sort
    cents.each do |sort_key, price|
      sorted << price
    end

    expect(sorted).to eq([11.0, 10.01, 3.02, 7.9, 9.91])
  end
end
