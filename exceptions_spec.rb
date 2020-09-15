RSpec.describe 'exceptions' do
  it 'can be caught' do
    def get_a
      begin
        a = 10 / 0
      rescue ZeroDivisionError => e
        a = 200
      end
      a
    end

    expect(get_a).to eq(200)
  end

  it 'can be raised' do
    def raise_it(*x)
      raise ArgumentError, "Give me arguments" if x.length == 0
    end

    expect(raise_it(1)).to eq(nil)
    expect { raise_it }.to raise_error(ArgumentError)
  end

  it 'safe navigation operator' do
    obj = Object.new
    def obj.cool
      nil
    end

    expect { obj.cool.stuff }.to raise_error(NoMethodError)
    expect(obj.cool&.stuff).to eq(nil)

    # If the receiver is nil, the method will not be called and
    # the operator returns nil.
    expect(nil&.cool).to eq(nil)
  end
end
