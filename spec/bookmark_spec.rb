describe '#all' do

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.add(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
    Bookmark.add(url: "http://www.google.com", title: 'Google')

    bookmarks = Bookmark.all

    expect(bookmarks).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(bookmarks).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(bookmarks).to have_link('Google', href: 'http://www.google.com')
  end

end

describe '#add' do
  it 'adds a new bookmark' do
    bookmark = Bookmark.add(url: 'http://www.amazon.co.uk', title: 'Amazon')
    # persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark['url']).to eq 'http://www.amazon.co.uk'
    expect(bookmark['title']).to eq 'Amazon'
  end
end
