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
		redirect "/words"
	else
		@errors = @words.errors.full_messages
		erb :'words/new'
	end
end