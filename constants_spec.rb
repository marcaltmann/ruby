RSpec.describe 'constants' do
  it 'can be accessed with double colon' do
    class Person
      MAX_NAMES = 3
    end

    expect(Person::MAX_NAMES).to eq(3)
  end

  it 'can be accessed within the class' do
    class Person
      MAX_NAMES = 3
      some_local_var = 7

      def get_constant
        MAX_NAMES
      end

      def get_local_var
        some_local_var
      end
    end

    charlie = Person.new

    expect(charlie.get_constant).to eq(3)
    
    expect { charlie.get_local_var }.to raise_error(NameError)
  end
end
