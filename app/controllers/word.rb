get '/words' do
	@words = Word.all
	erb :'words/index'
end


get '/words/new' do

  erb :'words/new'
end

get 'words/:id' do
	@word = Word.find_by(id: params[:id])
	erb :"words/new"
end

post '/words/new' do
	@word = Word.new(params[:word])
	if @word.save
		if request.xhr?
			erb :'words/_list', layout: false, locals:{word:@word}
		else
			redirect "/words"
		end
	else
		@errors = @word.errors.full_messages
		if request.xhr?
			status 422
			@errors
		else
			erb :'words/new'
		end
	end
end