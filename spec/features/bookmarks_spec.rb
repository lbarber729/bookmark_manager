require 'pg'
require_relative './web_helpers.rb'

feature 'Bookmarks' do

  scenario 'You can view a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.add(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
    Bookmark.add(url: "http://www.google.com", title: 'Google')

    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end

  scenario 'You can add a bookmark to the list' do
    add_bookmark
    expect(page).to have_link('Amazon', href: 'http://www.amazon.co.uk')
  end

  scenario 'You can delete a bookmark from the list' do
    add_bookmark
    click_button 'Delete'
    expect(page).not_to have_link('Amazon', href: 'http://www.amazon.co.uk')
  end

  scenario 'You can update a bookmark' do
    add_bookmark
    click_button 'Update'
    fill_in('url', with: 'http://google.com')
    fill_in('title', with: 'Google')
    click_button 'Update Bookmark'
    expect(page).to have_link('Google', href: 'http://google.com')
  end
end
