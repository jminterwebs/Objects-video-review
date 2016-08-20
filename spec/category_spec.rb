describe Category do
  let(:category){Category.new.tap{|c| c.name = "Fiction"}}
  let(:story){Story.new.tap{|s| s.name = "The Old Man and the Sea"}}

 it 'has a name' do
   # Expectation
   expect(category.name).to eq("Fiction")
 end

  context 'has many stories' do
    describe '#stores' do
      it 'has an empty array of stories when initialized' do
        expect(category.stories).to match_array([])
      end

      it 'returns a frozen copy of the stories array' do
        expect(category.stories).to be_frozen
      end
    end

    describe '#add_story' do
      it 'can push story instances onto it' do
        category.add_story(story)

        expect(category.stories).to include(story)
      end

      it 'reciproacates assinging this category as the story\'s category' do
        category.add_story(story)

        expect(story.category).to eq(category)
      end

      it 'can push story instances onto it' do
        story = "Old Man and the Sea"

        expect{category.add_story(story)}.to raise_error(AssoiationTypeMismatchError)
      end
    end
  end

  context 'has many categories through stories' do
    it 'returns the collection of unique category instances based on the stories' do
      king = Author.new{|c| c.name = "Steven King"}
      patternson = Author.new{|c| c.name = "John Patterson"}

      story_1 = Story.new.tap{|s| s.name = "The Scary One"; s.author = patternson}
      story_2 = Story.new.tap{|s| s.name = "The Mystery"; s.author = patternson}
      story_3 = Story.new.tap{|s| s.name = "The Shinning"; s.author = king}

      category.add_story(story_1)
      category.add_story(story_2)
      category.add_story(story_3)

      expect(category.authors).to match_array([king, patternson])
    end
  end
end
