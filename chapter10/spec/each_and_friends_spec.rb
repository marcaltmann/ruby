RSpec.describe 'Each and similar methods, e.g.' do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:strings) { ['a', 'b', ' ', 'c', 'd', ' ', 'e'] }

  context 'eaches cousins:' do
    it 'each' do
      # Works only via side effects.
      result = []
      array.each { |el| result << el * 2 }
      expect(result).to eq([2, 4, 6, 8, 10])
    end

    it 'reverse_each' do
      result = []
      array.reverse_each { |el| result << el * 2 }
      expect(result).to eq([10, 8, 6, 4, 2])
    end

    it 'each_with_index' do
      result = []
      array.each_with_index { |el, index| result << el * 2 if index < 2 }
      expect(result).to eq([2, 4])
    end

    it 'each_index' do
      # Only indexes
      result = []
      array.each_index { |index| result << index }
      expect(result).to eq([0, 1, 2, 3, 4])
    end

    it 'cycle' do
      result = []
      array.cycle(3) { |el| result << el * 2 }
      expect(result).to eq([2, 4, 6, 8, 10, 2, 4, 6, 8, 10, 2, 4, 6, 8, 10])
    end
  end

  context 'slicing and dicing:' do
    it 'each_slice' do
      result = []
      array.each_slice(2) { |el| result << el.sum }
      expect(result).to eq([3, 7, 5])
    end

    it 'each_cons' do
      result = []
      array.each_cons(2) { |el| result << el.sum }
      expect(result).to eq([3, 5, 7, 9])
    end

    it 'slice_before' do
      result = strings.slice_before(/\s/).to_a
      expect(result).to eq([
        ['a', 'b'],
        [' ', 'c', 'd'],
        [' ', 'e']
      ])
    end

    it 'slice_after' do
      result = strings.slice_after(/\s/).to_a
      expect(result).to eq([
        ['a', 'b', ' '],
        ['c', 'd', ' '],
        ['e']
      ])
    end
  end

  context 'inject/reduce' do
    it 'with initial value' do
      result = array.reduce(0) { |acc, el| acc + el }
      expect(result).to eq(15)
    end

    it 'without initial value' do
      result = array.inject { |acc, el| acc + el }
      expect(result).to eq(15)
    end

    it 'passing method name' do
      result = array.inject(0, :+)  # or just array.inject(:+)
      expect(result).to eq(15)
    end
  end

  context 'map' do
    it 'with block' do
      # Works without side effects.
      result = array.map { |el| el * 2 }
      expect(result).to eq([2, 4, 6, 8, 10])
    end

    it 'with method name' do
      result = strings.map(&:upcase)
      expect(result).to eq(['A', 'B', ' ', 'C', 'D', ' ', 'E'])
    end
  end

  context 'strings' do
    # Better use methods without side effects?

    let(:name) { "James" }
    let(:other_name) { "习近平" }
    let(:multiline) { "Hello\nworld" }

    it 'each_byte' do
      result = []
      name.each_byte { |byte| result << byte }
      expect(result).to eq([74, 97, 109, 101, 115])
    end

    it 'each_char' do
      result = ""
      name.each_char { |char| result << char }
      expect(result).to eq("James")
    end

    it 'each_codepoint' do
      result = []
      other_name.each_codepoint { |cp| result << cp }
      expect(result).to eq([20064, 36817, 24179])
    end

    it 'each_line' do
      result = []
      multiline.each_line { |line| result << line }
      expect(result).to eq(["Hello\n", "world"])
    end
  end

end
