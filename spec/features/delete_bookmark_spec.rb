feature 'Delete bookmark' do
  scenario 'user given option to delete bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'makers') RETURNING id, title, url;")

    visit '/bookmarks_list'
    expect(page).to have_selector("input[type=submit][value='makers']")
  end
  scenario 'user deletes a bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'makers') RETURNING id, title, url;")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'destroy') RETURNING id, title, url;")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'google') RETURNING id, title, url;")

    visit('/bookmarks_list')

    click_button 'makers'

    expect(page).not_to have_content 'makers'
  end
end
