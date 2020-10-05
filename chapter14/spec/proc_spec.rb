RSpec.describe 'Proc objects' do
  it 'just works... and with closures, too' do
    result = nil

    pr = Proc.new { result = 'Hello world!' }

    expect(result).to be_nil

    pr.call

    expect(result).to eq('Hello world!')
  end

  it 'also has other syntax' do
    result = nil
    pr = proc { result = 'Hello world!'}

    pr.call

    expect(result).to eq('Hello world!')
  end
end
