RSpec.describe 'Each and similar methods, e.g.' do
  let(:array) { [1, 2, 3, 4, 5] }

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

  it 'map' do
    # Works without side effects.
    expect(array.map { |el| el * 2 }).to eq([2, 4, 6, 8, 10])
  end
end
