class Author
  attr_reader :first_name, :last_name

  def initialize(args)
    @first_name = args[:first_name]
    @last_name  = args[:last_name]
    @books      = []
  end


end
