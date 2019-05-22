require 'pg'

feature 'Bookmarks' do

  scenario 'You can view a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

     Bookmark.add(url: "http://www.makersacademy.com")
+    Bookmark.add(url: "http://www.destroyallsoftware.com")
+    Bookmark.add(url: "http://www.google.com")

    visit('/bookmarks/index')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario 'You can add a bookmark to the list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.amazon.co.uk')
    click_button('Add')

    expect(page).to have_content 'http://www.amazon.co.uk'
  end
end
