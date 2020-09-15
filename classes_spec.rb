RSpec.describe 'classes' do
  it 'can be instantiated' do
    class Book
      def title
        "To be determined"
      end
    end

    ruby = Book.new

    expect(ruby.title).to eq("To be determined")
  end

  it 'can be reopened' do
    class Book
      def title
        "To be determined"
      end
    end

    class Book
      def author
        "Anonymous"
      end
    end

    ruby = Book.new

    expect(ruby.title).to eq("To be determined")
    expect(ruby.author).to eq("Anonymous")
  end

  it 'can be initialized' do
    class Book
      def initialize(title, author)
        @title = title
        @author = author
      end

      def title
        @title
      end

      def author
        @author
      end
    end

    ruby = Book.new("The Well-Grounded Rubyist", "David A. Black")

    expect(ruby.title).to eq("The Well-Grounded Rubyist")
    expect(ruby.author).to eq("David A. Black")
  end

  it 'can have setter methods' do
    class Book
      # needs to be overwritten
      def initialize
      end

      def title
        @title
      end

      def set_title(title)
        @title = title
      end

      def author
        @author
      end

      def author=(author)
        @author = author
      end
    end

    ruby = Book.new
    ruby.set_title "The Well-Grounded Rubyist"
    ruby.author = "David A. Black"

    expect(ruby.title).to eq("The Well-Grounded Rubyist")
    expect(ruby.author).to eq("David A. Black")    
  end

  it 'can have attributes' do
    class Person
      attr_reader :forename
      attr_accessor :surname

      def initialize(forename, surname)
        @forename = forename
        @surname = surname
      end
    end

    director = Person.new("Christopher", "Nolan")

    expect { director.forename = "Bruce" }.to raise_error(NoMethodError)

    director.surname = "Wayne"
    expect(director.surname).to eq("Wayne")
  end

  it 'can be inherited' do
    class Publication
      attr_accessor :year
    end

    class Magazine < Publication
      attr_accessor :name
    end

    expect(Publication.superclass).to eq(Object)
    expect(Magazine.superclass).to eq(Publication)

    expect(Publication.class).to eq(Class)
    expect(Object.class).to eq(Class)
    expect(Class.class).to eq(Class)

    deutsch = Magazine.new
    deutsch.name = "Deutsch perfekt"
    deutsch.year = 2019

    expect(deutsch.name).to eq("Deutsch perfekt")
    expect(deutsch.year).to eq(2019)
  end
end
