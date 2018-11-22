feature 'Update bookmark' do
  scenario 'user has the option to update bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'makers') RETURNING id, title, url;")

    visit '/bookmarks_list'
    expect(page).to have_selector("input[type=submit][value='Update']")
  end

  scenario 'user can update a bookmark\'s title or id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'makers') RETURNING id, title, url;")

    visit '/bookmarks_list'
    click_button 'Update'
    fill_in('new_title', with: 'makers academy')
    click_button 'Update'
    expect(page).to have_content 'makers academy'
  end
end
