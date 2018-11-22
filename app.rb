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

  delete '/bookmark/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks_list'
  end

  get '/bookmarks_update/:id' do
    @bookmark = Bookmark.search(id: params[:id])
    erb(:'bookmarks/update')
  end

  patch '/bookmarks_updated/:id' do
    Bookmark.update(id: params[:id], title: params[:new_title], url: params[:new_url])
    redirect '/bookmarks_list'
  end

  run! if app_file == $0

end
