describe Author do
  let(:story){Story.new.tap{|s| s.name ="The Old Man and the Sea"}}
  let(:author){Author.new.tap{|a| a.name = "Ernest Hemingway"}}
  it 'has a name' do

    expect(author.name).to eq("Ernest Hemingway")
  end

  context 'has many stories' do
    describe '#stores' do
      it 'has an empty array of stories when initialized' do
        expect(author.stories).to match_array([])
      end

      it 'returns a frozen copy of the stories array' do
        expect(author.stories).to be_frozen
      end
    end

    describe '#add_story' do
      it 'can push story instances onto it' do
        author.add_story(story)

        expect(author.stories).to include(story)
      end

      it 'reciproacates assinging this author as the story\'s author' do
        author.add_story(story)

        expect(story.author).to eq(author)
      end

      it 'can push story instances onto it' do
        story = "Old Man and the Sea"

        expect{author.add_story(story)}.to raise_error(AssoiationTypeMismatchError)
      end
    end

    describe '#bibliography' do
      it 'returns an aeeay all the stories names of an Author' do

        story_1 = Story.new.tap{|s| s.name = "The Old Man and The Sea"}
        story_2 = Story.new.tap{|s| s.name = "The Sun also Rises"}
        story_3 = Story.new.tap{|s| s.name = "For Whom the Bell Tolls"}

        author.add_story(story_1)
        author.add_story(story_2)
        author.add_story(story_3)

        expect(author.bibliography).to match_array(["The Old Man and The Sea", "The Sun also Rises", "For Whom the Bell Tolls"])
      end
    end
  end


  context 'has many categories through stories' do
    it 'returns the collection of unique category instances based on the stories' do
      fiction = Category.new{|c| c.name = "Fiction"}
      non_fiction = Category.new{|c| c.name = "Non Fiction"}

      story_1 = Story.new.tap{|s| s.name = "The Old Man and The Sea"; s.category = fiction}
      story_2 = Story.new.tap{|s| s.name = "The Sun also Rises"; s.category = fiction}
      story_3 = Story.new.tap{|s| s.name = "A Moveable Feast"; s.category = non_fiction}

      author.add_story(story_1)
      author.add_story(story_2)
      author.add_story(story_3)

      expect(author.categories).to match_array([fiction, non_fiction])
    end
  end

  def authors #has many categories through stories
    self.stories.collect{|s| s.authors}.uniq
  end

end
