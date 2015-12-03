# SinatraShoppingList
A shopping list application using Sinatra

## ISSUES / QUESTIONS
* how to get the status message back to the list_read route?
* do I need to have chain of routes?  post '/item_update' -> post '/item_update_validate' -> redirect '/item_read'
* do i have to find the item each time?  inefficient!!
* is it bad idea to set status msg and call home erb?  for example:

``` ruby
@status_msg = 'Your item was updated.'
@items = Item.all
erb :item_read
```

* why can't i set width of name & quantity in "table"?
