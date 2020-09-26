RSpec.describe 'Enumerables' do
  context 'can find the first element with a positive predicate' do
    it 'using find' do
      array = [1, 2, 3, 4, 5]

      result = array.find { |el| el > 3 }

      expect(result).to eq(4)
    end

    it 'using detect' do
      array = [1, 2, 3, 4, 5]

      result = array.detect { |el| el > 10 }

      expect(result).to eq(nil)
    end

    it 'returning a special failure value' do
      array = [1, 2, nil, 4, nil]

      failure = lambda { "nothing found" }
      result = array.find(failure) { |el| el.nil? ? nil : el > 10 }

      expect(result).to eq("nothing found")
    end
  end

  context 'can filter elements' do
    it 'with find_all' do
      array = [1, 2, 3, 4, 5]

      result = array.find_all { |el| el >= 3 }

      expect(result).to eq([3, 4, 5])
    end

    it 'with select' do
      array = [1, 2, 3, 4, 5]

      result = array.select { |el| el > 10 }

      expect(result).to eq([])
    end

    it 'negatively with reject' do
      array = [1, 2, 3, 4, 5]

      result = array.reject { |el| el >= 3 }

      expect(result).to eq([1, 2])
    end

    it 'with grep-like method' do
      array = %w(red orange yellow blue green)

      result = array.grep(/l/)

      expect(result).to eq(%w(yellow blue))
    end
  end

  context 'can organize elements' do
    it 'into multiple groups' do
      array = %w(red orange yellow blue green)

      result = array.group_by { |el| el.size }

      expect(result).to eq({
        3 => ['red'],
        4 => ['blue'],
        5 => ['green'],
        6 => ['orange', 'yellow']
      })
    end

    it 'into two groups' do
      array = [-5, 7, -1, 0, 2, 3]

      result = array.partition { |el| el >= 0 }

      expect(result).to eq([
        [7, 0, 2, 3],
        [-5, -1]
      ])
    end
  end
end
