RSpec.describe 'iterators' do
  it 'using times' do
    n = 0
    5.times { |i| n += i }

    expect(n).to eq(10)
  end

  it 'implementing own_times' do
    class Integer
      def own_times
        for a in (0..self - 1)
          yield a
        end
        self
      end
    end

    n = 0
    5.own_times { |i| n += i }

    expect(n).to eq(10)
  end

  it 'map' do
    arr = ['a', 'b', 'c']

    arr2 = arr.map { |c| c.upcase }

    expect(arr2).to eq(['A', 'B', 'C'])
  end
end
