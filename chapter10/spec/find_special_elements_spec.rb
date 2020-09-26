RSpec.describe 'Find special elements with' do
  let(:array) { [1, 2, 3, 4, 5] }

  it 'first' do
    expect(array.first).to eq(1)
  end

  it 'last' do
    # Does not exist on every Enumerable, but on arrays.
    expect(array.last).to eq(5)
  end

  it 'take' do
    expect(array.take(2)).to eq([1, 2])
  end

  it 'drop' do
    expect(array.drop(2)).to eq([3, 4, 5])
  end

  it 'min' do
    expect(array.min).to eq(1)
  end

  it 'max' do
    expect(array.max).to eq(5)
  end

  it 'minmax' do
    expect(array.minmax).to eq([1, 5])
  end
end
