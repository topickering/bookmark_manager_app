feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'destroy');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'google');")

    visit('/bookmarks_list')

    expect(page).to have_content "makers"
    expect(page).to have_content "destroy"
    expect(page).to have_content "google"
  end
end
