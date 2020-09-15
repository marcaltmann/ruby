RSpec.describe 'methods' do
  it 'can have optional arguments' do
    obj = Object.new
    
    def obj.sum(a, b, *x)
      a + b + x.sum
    end

    expect(obj.sum(1, 2)).to eq(3)
    expect(obj.sum(1, 2, 3)).to eq(6)
    expect(obj.sum(1, 2, 3, 4, 5)).to eq(15)
  end

  it 'can have optional arguments' do
    obj = Object.new

    def obj.add(a = 1, b = 2)
      a + b
    end

    expect(obj.add).to eq(3)
    expect(obj.add(3, 3)).to eq(6)
  end

  it 'arguments are mostly references' do
    obj = Object.new
    def obj.to_uppercase(str)
      str.replace(str.upcase)
    end

    a = "hello"
    obj.to_uppercase(a)

    expect(a).to eq("HELLO")
  end

  it 'except for some types' do
    obj = Object.new
    def obj.plus_one(num)
      num += 1
    end

    a = 5
    obj.plus_one(a)

    expect(a).to eq(5)
  end
end
