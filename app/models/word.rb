class Word < ActiveRecord::Base
  validates :english, presence: true

  def pig_latin
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


def sub_letters(letter)
  translate_letter = letter.gsub!(/[bcdfghjklmnpqrstvwxyz]/,
  'b' => 'bub',
  'c' => 'cash',
  'd' => 'dud',
  'f' => 'fuf',
  'g' => 'gug',
  'h' => 'hash',
  'j' => 'jay',
  'k' => 'kuck',
  'l' => 'lul',
  'm' => 'mum',
  'n' => 'nun',
  'p' => 'pub',
  'q' => 'quack',
  'r' => 'rug',
  's' => 'sus',
  't' => 'tut',
  'v' => 'vuv',
  'w' => 'wack',
  'x' => 'ex',
  'y' => 'yub',
  'z' => 'zub'
  )

  return translate_letter
end

def tutnese_dialect_one(word)
  word_array = word.scan(/((\w)\2*)/).map(&:first)
  translate_array = word_array.collect{|i| i.length >1 && i==="ee" || i==="ii"  ||  i==="uu"? ["squat"] +  [i] : i.length>1 && i === "aa" || i === "oo" ? ["squat"] + [i[0] + "h" ]:  i.length >1? ["squa"] + [i] : i}.flatten!
  i = 0
  while i < translate_array.length
    if translate_array[i].length == 1
      if translate_array[i]=~ /[^aeiou]/
        translate_array[i] = sub_letters(translate_array[i])
      else 
        translate_array[i] = translate_array[i]
      end
    else
      translate_array[i] = translate_array[i]
    end
    i +=1
  end
  return translate_array.join("")
end

end
