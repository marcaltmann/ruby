RSpec.describe 'strings' do
  it 'substrings' do
    str = "Hello World!"

    expect(str[-1]).to eq("!")
    expect(str[0,5]).to eq("Hello")
    expect(str[6,5]).to eq("World")
  end
end
