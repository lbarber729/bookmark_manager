feature 'Bookmarks' do

  scenario 'You can view a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('http://www.Github.com')
  end
end
