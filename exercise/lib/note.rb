class Note
  attr_reader :title, :content, :tag

  def initialize(title, content)
    @title = title
    @content = content
    @tag = nil
  end

  def add_tag(tag)
    @tag = tag
  end

end
