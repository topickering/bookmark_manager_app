require 'bookmark_list'

describe BookmarkList do

  describe "#view" do
    it "shows all bookmarks" do
      expect(subject.view).to eq "A bookmarks list"
    end
  end

end
