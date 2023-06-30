require 'rspec'
require './lib/image_generator'

RSpec.describe ImageGenerator do
  describe '#initialize' do
    it 'exists' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator).to be_a ImageGenerator
    end

    it 'has attributes' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator.max_image_size).to eq 2500
    end

    # Using stubs write the tests to confirm the functionality
    # that exists in ./lib/image_generator.rb
    it 'can generate_images' do
      image_generator = ImageGenerator.new(2)

      # stubbing the max_image_size
      allow(image_generator).to receive(:max_image_size).and_return(2500) 

      result = image_generator.generate_images

      expect(result.first).to eq("image#{0}")
    end 

    it 'can change max size' do
      image_generator = ImageGenerator.new(10)

      allow(image_generator).to receive(:max_image_size).and_return(2500)

      result = image_generator.change_max_size(50)

      expect(result).to_not eq(2500)
    end
  end
end
