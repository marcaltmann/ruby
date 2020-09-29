RSpec.describe 'Sorting' do
  let(:array) { [4, 2, 5, 1, 3] }

  it 'simple sorting' do
    expect(array.sort).to eq([1, 2, 3, 4, 5])
  end

  context 'a class' do
    class Painting
      include Comparable

      attr_reader :price

      def initialize(price)
        @price = price
      end

      def <=>(other_painting)
        self.price <=> other_painting.price
      end
    end

    let(:paintings) { [100, 40, 2000, 3, 500].map { |price| Painting.new(price) }}

    it 'is sortable with <=> method' do
      result = paintings.sort.map(&:price)
      expect(result).to eq([3, 40, 100, 500, 2000])
    end

    it 'is sortable with sort_by' do
      result = paintings.sort_by(&:price).map(&:price)
      expect(result).to eq([3, 40, 100, 500, 2000])
    end

    it 'is comparable with Comparable mixin' do
      painting1 = Painting.new(500)
      painting2 = Painting.new(1000)
      expect(painting1 < painting2).to eq(true)
    end

    it 'can use other functions from Comparable' do
      painting1 = Painting.new(500)
      painting2 = Painting.new(1000)
      painting3 = Painting.new(750)
      expect(painting3.between?(painting1, painting2)).to eq(true)
    end
  end
end
