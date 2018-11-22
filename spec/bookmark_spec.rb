require 'bookmark'

describe Bookmark do

  describe '#create' do
    it 'adds a url to the database' do
      bookmark = Bookmark.create(url: 'test_url', title: 'test title')
      expect(bookmark.url).to eq 'test_url'
      expect(bookmark.title).to eq 'test title'
    end
  end

  describe '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'makers') RETURNING id, title, url;")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroy') RETURNING id, title, url;")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google') RETURNING id, title, url;")

      bookmarks = Bookmark.all

      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      expect(bookmarks.last.title).to eq 'google'
    end
  end

end
