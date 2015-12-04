require 'sinatra/base'

Dir.glob('./{controllers,models,helpers}/*.rb').each { |file| require file }

map('/') { run ItemsController }
map('/session') { run SessionController }
