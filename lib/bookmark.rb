require 'pg'

class Bookmark

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.instance
    @bookmarks
  end

  def self.create
    @bookmarks = Bookmark.new
  end

end
