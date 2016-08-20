class Story
  attr_accessor :name
  attr_reader :author, :category

  def author=(author) #Belongs to an Author
    raise AssoiationTypeMismatchError, "#{author.class} recieved, Author Expceted" if !author.is_a?(Author)
    @author = author
    author.add_story(self) unless author.stories.include?(self)
  end

  def category=(category) #Belongs to an Category
    raise AssoiationTypeMismatchError, "#{category.class} recieved, Category Expceted" if !category.is_a?(Category)
    @category = category
    category.add_story(self) unless category.stories.include?(self)
  end




end
