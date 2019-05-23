require 'pg'

feature 'Bookmarks' do

  scenario 'You can view a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.add(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
    Bookmark.add(url: "http://www.google.com", title: 'Google')

    visit('/bookmarks/index')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end

  scenario 'You can add a bookmark to the list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.amazon.co.uk')
    fill_in('title', with: 'Amazon')
    click_button('Add')

    expect(page).to have_link('Amazon', href: 'http://www.amazon.co.uk')
  end
end
