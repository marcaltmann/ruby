RSpec.describe 'An array can be tested wether' do
  let(:array) { [1, 2, 3, 4, 5, 1] }

  it 'an element is included' do
    result = array.include?(3)
    expect(result).to be_truthy
  end

  it 'all elements fulfill a predicate' do
    result = array.all? { |el| el > 4 }
    expect(result).to be_falsy
  end

  it 'any element fulfills a predicate' do
    result = array.any? { |el| el > 4 }
    expect(result).to be_truthy
  end

  it 'exactly one element fulfills a predicate' do
    result = array.one? { |el| el == 1 }
    expect(result).to be(false)
  end

  it 'no element fulfills a predicate' do
    result = array.none? { |el| el < 0 }
    expect(result).to be(true)
  end
end
