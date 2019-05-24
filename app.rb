require 'sinatra/base'
require './lib/bookmarks.rb'
class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello world'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  post '/bookmarks/update/:id' do
    @id = params[:id]
    found = Bookmark.find(id: @id)
    @url = found["url"]
    @title = found["title"]
    erb (:'bookmarks/update')
  end

  post '/bookmarks/update' do
    @url = params[:url]
    @title = params[:title]
    Bookmark.update(id: @id, url: @url, title: @title)
    redirect '/bookmarks'
  end

end
