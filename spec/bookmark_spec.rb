require 'bookmark'

describe Bookmark do

  describe '#create' do
    it 'adds a url to the database' do
      Bookmark.create(url: 'test_url', title: 'test title')
      expect(Bookmark.all).to include('test title')
    end
  end

  describe '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('makers')
      expect(bookmarks).to include('destroy')
      expect(bookmarks).to include('google')
    end
  end

end
