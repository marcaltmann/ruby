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

  it 'code block the normal way with yield' do
    def execute_block
      yield
    end

    result = execute_block { 5 }

    expect(result).to eq(5)
  end

  it 'code block captured with & and called' do
    def execute_block(&block)
      block.call
    end

    result = execute_block { 5 }

    expect(result).to eq(5)
  end

  it 'the & converts both ways' do
    pr = proc { |a| a + 5 }

    arr = [1, 2, 3]

    result = arr.map(&pr)

    expect(result).to eq([6, 7, 8])
  end

  it 'Hashes as functions, sort of' do
    income = {
      2018 => 50_123,
      2019 => 23_150,
      2020 => 15_000
    }

    fn = income.to_proc

    expect(fn.call(2018)).to eq(50_123)
    expect(fn.call(2017)).to be_nil
  end
end
