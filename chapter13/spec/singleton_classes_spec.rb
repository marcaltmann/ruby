RSpec.describe 'singleton classes' do
  it 'syntax' do
    obj = Object.new

    class << obj
      def shout_out
        "Hello world!"
      end
    end

    expect(obj.shout_out).to eq("Hello world!")
  end

  it 'used for class methods' do
    # Class methods are defined on the class object's singleton class.
    class Person
      class << self
        def possible_names
          ['Schmidt', 'Jones', 'Li']
        end
      end
    end

    expect(Person.possible_names[0]).to eq('Schmidt')
  end
end
