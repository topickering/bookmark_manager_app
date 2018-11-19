feature 'Bookmark list view' do
  scenario 'visit page to see list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "Look at all these bookmarks!!!"
  end
end
