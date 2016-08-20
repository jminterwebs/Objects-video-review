class Author
  attr_accessor :name

  def initialize
    @stories = []
  end

  def stories
    @stories.dup.freeze
  end

  def add_story(story)
    raise AssoiationTypeMismatchError, "#{story.class} received, Story expected" if !story.is_a?(Story)
    @stories << story
    story.author = self unless story.author == self
  end

  def bibliography
    #go through all the Story instances and grab the names
    @stories.collect{|s| s.name} #All stories need to be instances of stories
  end

  def categories # has many categories through stories
   self.stories.collect{|s| s.category}.uniq
 end

end
