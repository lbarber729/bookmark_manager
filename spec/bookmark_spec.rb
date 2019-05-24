require 'database_helpers'
describe '#all' do

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.add(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
    Bookmark.add(url: "http://www.google.com", title: 'Google')

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

  end

end

describe '#add' do
  it 'adds a new bookmark' do
    bookmark = Bookmark.add(url: 'http://www.amazon.co.uk', title: 'Amazon')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Amazon'
    expect(bookmark.url).to eq 'http://www.amazon.co.uk'
  end

  describe '#delete' do
    it 'deletes a bookmark' do
    bookmark = Bookmark.add(url: 'http://www.amazon.co.uk', title: 'Amazon')
    Bookmark.delete(id: bookmark.id)

    expect(Bookmark.all).to be_empty
    end
  end

  describe '#find' do
    it 'finds a bookmark' do
      bookmark = Bookmark.add(url: 'http://www.amazon.co.uk', title: 'Amazon')
      found = Bookmark.find(id: bookmark.id)
      expect(found).to eq ({ "url" => 'http://www.amazon.co.uk', "title" => 'Amazon' })
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.add(url: 'http://www.amazon.co.uk', title: 'Amazon')
      Bookmark.update(id: bookmark.id, url: 'http://google.com', title: 'Google')
      updated_bookmark = Bookmark.find(id: bookmark.id)
      expect(updated_bookmark['url']).to eq 'http://google.com'
      expect(updated_bookmark['title']).to eq 'Google'
    end
  end
end
