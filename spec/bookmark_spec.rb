describe '#all' do

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.add(url: "http://www.makersacademy.com")
    Bookmark.add(url: "http://www.destroyallsoftware.com")
    Bookmark.add(url: "http://www.google.com")

    bookmarks = Bookmark.all

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end

end

describe '#add' do
  it 'adds a new bookmark' do
    Bookmark.add(url: 'http://www.amazon.co.uk')

    expect(Bookmark.all).to include 'http://www.amazon.co.uk'
  end
end
