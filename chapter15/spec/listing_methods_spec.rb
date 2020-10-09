RSpec.describe 'listing methods and variables' do
  it 'with #methods method for objects' do
    str = "hello"

    result = str.methods.grep(/up/).sort  # subset

    expect(result).to eq([:dup, :upcase, :upcase!, :upto])
  end

  it 'with #methods method for classes' do
    result = String.methods.grep(/attr/).sort

    expect(result).to eq([:attr, :attr_accessor, :attr_reader, :attr_writer])
  end

  it 'local_variables' do
    x = 1

    expect(local_variables).to eq([:x])
  end
end
