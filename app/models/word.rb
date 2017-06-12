class Word < ActiveRecord::Base
  validates :english, presence: true

  def pigLatin
  	word = self.english
	if word[0] =~ /^[aeiou]/
	    return word
	else
	    letter = ""
	until word[0] =~ /^[aeiou]/
	    letter += word[0]
	    word = word[1,word.size]
	end
		word.concat(letter + "ay")
		return word
	end
  end
end
