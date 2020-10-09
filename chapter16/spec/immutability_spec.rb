RSpec.describe 'immutability' do
  it 'freeze' do
    str = "hello world"

    str.freeze

    expect {str.upcase!}.to raise_error(FrozenError)
    expect(str.frozen?).to be_truthy
  end
end
