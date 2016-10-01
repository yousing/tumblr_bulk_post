configure do
	set (:client) {
		Tumblr::Client.new({
      :consumer_key => '#{your_consumer_key}',
      :consumer_secret => '#{your_consumer_secret}',
      :oauth_token => '#{your_oauth_token}',
      :oauth_token_secret => '#{your_oauth_token_secret}'
		})
	}
end

get '/' do
	erb :index, :layout => :application
end

post '/tumblr_post' do
	if settings.client?
		client = settings.client
		# :source => params[:image_path]
		post_option = {}

		%w(data caption tags link state).each do |column|
			post_option[column.to_sym] = params[column]
		end
		if post_option[:link] != ''
			post_option[:caption] = "(via <a href=\"#{post_option[:link]}\">#{post_option[:caption]}</a>)"
		else
			post_option[:caption] = "(via #{post_option[:caption]})"
		end
		
		
		if File.directory?(params[:data])
			path = params[:data]

			Dir.open(path).each do |file|
				next if MIME::Types.type_for(file) == [] or File.directory?(file)
				post_option[:data] = "#{path}/#{file}"
				post_option.delete("data")
				post_option.delete(:type)
				photo(client,post_option)
			end

		else
			photo(client,post_option)
		end


		puts response
		erb :tumblr_post, :layout => :application
	end
end

def photo(client,post_option)
	client.photo("#{client.info["user"]["name"]}.tumblr.com",post_option)
end

helpers do
	def link_to(url, txt=url)
		%Q(<a href="#{url}">#{txt}</a>)   
	end

end
