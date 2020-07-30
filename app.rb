require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks_list
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    Bookmark.create(params[:url])
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
