feature 'Index page' do
  scenario 'hello world setup test' do
    visit '/'
    expect(page).to have_content "Welcome to the bookmark manager."
  end
end
