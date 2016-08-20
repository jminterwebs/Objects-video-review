class Category
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
    story.category = self unless story.category == self
  end

  def authors #has many categories through stories
    self.stories.collect{|s| s.author}.uniq
  end
end
