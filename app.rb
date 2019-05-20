require 'sinatra/base'
require './lib/bookmarks'
class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello world'
  end

  get '/bookmarks' do
   @bookmarks = Bookmark::BOOKMARKS.join("\n")
   erb :bookmarks
  end

end
