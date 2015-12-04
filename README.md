# SinatraShoppingList
A shopping list application using Sinatra

## TODO
Add logout button
adjust menu based on if logged in or not

## ISSUES / QUESTIONS

* Should I do authorization_check every route?


* couldn't install on digital ocean!! why not? See error excerpt below
```
root@shopping-list:~/SinatraShoppingList# bundle exec rackup -p 80 --host 0.0.0.0
/root/SinatraShoppingList/controllers/ItemsController.rb:1:in `<top (required)>': uninitialized constant ApplicationController (NameError)
	from /root/SinatraShoppingList/config.ru:3:in `require'
	from /root/SinatraShoppingList/config.ru:3:in `block (2 levels) in <main>'
  .
  .
  .
```
* best way to get the status message back to the read route, (the route that reads/displays list, /list_read)?

My solution:
``` ruby
get '/some_route' do
  .
  .
  .
  @status_msg = 'Your item was updated.'
  @items = Item.all
  erb :item_read
end
```
* Other solutions:
  * store status_msg in database
  * use redirect '/some_route' with params.  How to do this?




* do I need to have chain of routes?  Is there a cleaner more concise way to do this?  post '/item_update' -> post '/item_update_validate' -> redirect '/item_read'

* do i have to find the item each time in every route in the chain?  inefficient because of redundant database calls.

* why can't i set width of name & quantity for name & quantity

* whats best way to redirect to a page with a button?
  * a href?
  * (form method="get")  with  <(nput type="submit")  ?

* do i need to use a form element to wrap (input type="submit")  or can (input type="submit") alone make a post/get?
