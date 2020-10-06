RSpec.describe 'system commands' do
  it 'with system method' do
    result = system("echo hello")

    expect(result).to eq(true)  # hello is output but not the return value
  end

  it 'with backticks' do
    result = `echo hello`

    expect(result).to eq("hello\n")
  end
end
