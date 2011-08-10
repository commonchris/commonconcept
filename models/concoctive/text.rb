  #
  # abstract base class for Text Dinguses ( Dingusi?? )
  # 
  # Any text document can be one big blob of ascii, built up with Text Dinguses or a cocktail. 
  # Trailer park machine lernin type o' thing bitches!
  # 
  # @author - common christle
  #
class Text < Dingus
  property :body, String
  
  property :elements, HashMap #words and/or phrases, sentences,etc..,
  
end