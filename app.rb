require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmarks_list' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmark_add' do
    erb(:'bookmarks/add')
  end

  post '/new_bookmark' do
    Bookmark.create(url: params[:new_bookmark], title: params[:title])
    redirect '/bookmarks_list'
  end

  delete '/bookmark_delete' do
    Bookmark.delete(title: params[:Delete])
    redirect '/bookmarks_list'
  end

  run! if app_file == $0

end
