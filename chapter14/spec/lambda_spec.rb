RSpec.describe 'lambdas' do
  it 'standard notation' do
    fn = lambda { |x| x * 2 }

    result = [1, 2, 3].map(&fn)

    expect(result).to eq([2, 4, 6])
  end

  it 'must have the correct arity' do
    # Normal procs don't care about this.
    fn = lambda { |x| x * 2 }

    expect { lambda.call }.to raise_error(ArgumentError)
    expect { lambda(1, 2).call }.to raise_error(ArgumentError)
  end

  it 'stabby lambda notation' do
    fn = -> { 5 }

    expect(fn.call).to eq(5)
  end

  it 'stabby lambda with parameters' do
    fn = ->(x, y) { x * y }

    expect(fn.call(4, 5)).to eq(20)
  end
end
