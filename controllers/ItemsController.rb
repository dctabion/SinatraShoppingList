class ItemsController < ApplicationController
  get '/' do
    erb :home
  end

  get '/item_read' do
    authorization_check
    @status_msg = params[1]
    @items = Item.all
    erb :item_read
  end

  post '/item_add' do
    authorization_check
    erb :item_add
    # redirect '/item_read'
  end

  post '/item_add_validate' do
    authorization_check
    # TODO add validation to this!!!
    item = Item.new
    item.name = params[:name]
    item.quantity = params[:quantity].to_i
    item.save
    @status_msg = 'Your item was added.'
    @items = Item.all
    erb :item_read
  end

  post '/item_update' do
    authorization_check
    @item = Item.find(params[:id])
    erb :item_update
  end

  post '/item_update_validate' do
    authorization_check
    # TODO This is the same as add except for status msg.  can we consolidate/DRY?
    # TODO add validation to this!!!
    item = Item.find(params[:id])
    item.name = params[:name]
    item.quantity = params[:quantity].to_i
    item.save
    @status_msg = 'Your item was updated.'
    @items = Item.all
    erb :item_read
  end

  post '/item_delete_confirm' do
    authorization_check
    @item = Item.find(params[:id])
    erb :item_delete_confirm
  end

  post '/item_delete' do
    authorization_check
    p params
    if params[:delete]=='Delete'
      item = Item.find(params[:id])
      item.destroy
      @status_msg = 'Your item was deleted.'
    else
      @status_msg = 'Cancelled.  Item was not deleted.'
    end

    @items = Item.all
    erb :item_read
  end
end
