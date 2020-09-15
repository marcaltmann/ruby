RSpec.describe 'modules' do
  it 'can be used for namespacing' do
    module Adapters
      class Paypal
      end
    end

    adapter = Adapters::Paypal.new

    expect(adapter.class.name).to eq("Adapters::Paypal")
  end

  it 'method_missing method override' do
    class Lucky
      def method_missing(m, *args)
        if m == :luke
          "You guessed it"
        else
          super(m, *args)
        end
      end
    end

    person = Lucky.new

    expect(person.luke).to eq("You guessed it")
    expect { person.hans }.to raise_error(NoMethodError)
  end
end
