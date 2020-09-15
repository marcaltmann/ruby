RSpec.describe 'objects' do
  it 'are objects' do
    obj = Object.new

    expect(obj.is_a?(Object)).to be_truthy;
  end

  it 'can have new methods' do
    obj = Object.new

    def obj.talk
      "hello, hello!"
    end

    expect(obj.talk).to eq("hello, hello!")
  end

  it 'have 68 innate methods' do
    obj = Object.new

    expect(obj.methods.length).to eq(68)
  end
end
