require './environment'

module FormsLab
  class App < Sinatra::Base
    
    get '/' do
      erb :root
    end
    
    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      
      params[:pirate][:ships].each do |ship_info|
        Ship.new(ship_info[:name], ship_info[:type], ship_info[:booty])
      end
      
      @ships = Ship.all
      erb :'pirates/show'
      
    end
    
    # code other routes/actions here

  end
end
