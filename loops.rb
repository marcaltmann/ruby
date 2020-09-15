RSpec.describe 'loops' do
  describe 'unconditional loop method' do
    it 'with short code block' do
      # A code block is a delimited set of program instructions,
      # written as part of the method call,
      # available to be executed from the method.
      a = 0

      loop { a += 1; break if a > 9 }

      expect(a).to eq(10)
    end

    it 'with long code block' do
      a = 0

      loop do
        a += 1
        break if a > 9
      end

      expect(a).to eq(10)
    end
  end

  describe 'while loop' do  
    it 'at the beginning' do
      a = 10

      while a > 0
        a -= 1
      end

      expect(a).to eq(0)
    end

    it 'at the end' do
      a = 10

      begin
        a -= 1
      end while a > 0

      expect(a).to eq(0)
    end

    it 'as a one-liner' do
      a = 10

      a -= 1 while a > 0

      expect(a).to eq(0)
    end
  end

  it 'also has an until loop' do
    a = 10

    until a == 0
      a -= 1
    end
  end

  it 'for/in loop' do
    numbers = 1..10
    sum = 0

    for n in numbers
      sum += n
    end

    expect(sum).to eq(55)
  end
end
