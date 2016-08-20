Author
  has_many stories
  has many categories through stories

stories
  belongs to an Author
  belongs to a category


  categories
    has many stories
    has many authors through stories


Heminway = Author. new
Heminway.stories => [stories, ...]

Implement a through for categories

author.build_Story("the name")
story.build_author("New Author")
