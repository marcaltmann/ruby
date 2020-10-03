RSpec.describe 'aliases' do
  it 'just trying them out' do
    class Person
      def initialize(forename, surname)
        @forename = forename
        @surname = surname
      end

      def full_name
        "#{@forename} #{@surname}"
      end

      alias official_name full_name
    end

    p = Person.new('Christopher', 'Nolan')

    expect(p.official_name).to eq('Christopher Nolan')
  end
end
