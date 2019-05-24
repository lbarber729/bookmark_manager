def add_bookmark
  visit('/bookmarks')
  click_button('Add Bookmark')
  fill_in('url', with: 'http://www.amazon.co.uk')
  fill_in('title', with: 'Amazon')
  click_button('Add')
end
