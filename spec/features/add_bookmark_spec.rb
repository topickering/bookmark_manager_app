feature "Add bookmarks" do
  scenario "user given option to add a bookmark" do
    visit '/'
    expect(page).to have_selector("input[type=submit][value='Add a bookmark']")
  end
  scenario "confirmation message after adding bookmark" do
    visit '/bookmark_add'
    fill_in "new_bookmark", with: "www.testwebsite.com"
    fill_in "title", with: "test title"
    click_button 'Add bookmark'
    expect(page).to have_content 'test title'
  end
end
