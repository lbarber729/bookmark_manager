require 'sinatra/base'
require './lib/bookmarks.rb'
class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello world'
  end

  get '/bookmarks/index' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.add(url: params[:url])
    redirect '/bookmarks/index'
  end

end
