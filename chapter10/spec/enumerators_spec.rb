RSpec.describe 'Enumerators' do
  it 'basic scenario with code block' do
    # Enumerators are not containers, they do not contain
    # objects.
    # An iterator is a method that iterates on an
    # enumerator?

    e = Enumerator.new do |y|
      y << 1
      y << 2
      y << 3
    end

    expect(e.to_a).to eq([1, 2, 3])
  end

  it 'attached to another object with enum_for' do
    names = %w(David Copperfield Oliver Twist)

    e = names.enum_for(:select)

    # each just behaves like select at this point.
    result = e.each { |n| n.size > 5 }
    expect(result).to eq(%w(Copperfield Oliver))
  end

  it 'attained by calling an iterator without a block' do
    name = "Tenet"
    e = name.each_char  # same as: name.enum_for(:each_char)

    expect(e.to_a).to eq(['T', 'e', 'n', 'e', 't'])
    expect(e.map(&:upcase)).to eq(['T', 'E', 'N', 'E', 'T'])
  end

  it 'can protect data structures' do
    class Numbers
      def initialize(start, stop)
        @numbers = (start..stop).to_a
      end

      def numbers
        @numbers.to_enum
      end
    end

    n = Numbers.new(3, 6)

    expect(n.numbers.to_a).to eq([3, 4, 5, 6])
  end

  it 'works like a JavaScript iterator' do
    e = [1, 2, 3].to_enum

    expect(e.next).to eq(1)
    expect(e.next).to eq(2)
    expect(e.next).to eq(3)
    e.rewind
    expect(e.next).to eq(1)
  end
end
