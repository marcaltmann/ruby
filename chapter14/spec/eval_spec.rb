RSpec.describe 'eval' do
  it 'evaluates code' do
    result = eval("4 + 4")

    expect(result).to eq(8)
  end

  it 'does know local vars' do
    # At this point, binding is not needed yet. See page 462.
    x = 1
    result = eval("x + 3")

    expect(result).to eq(4)
  end

  it 'tainted method' do
    # e.g. user input gets marked as tainted.
    str = "hello"

    expect(str.tainted?).to be_falsy
  end
end
