require 'services/text'
#
class SlugFactory
  ##include TextService	
  #
  # top level router 
  # concocive aspect
  #  
  def SlugFactory.parse(args) 
    
    method = args.shift   
    slug = args.shift
    
    if method == 'read'
      TextService.read(slug)
    elsif method == 'write'
      TextService.write
    elsif method == 'erase'
      TextService.erase(slug)
    elsif method == 'edit'
      TextService.edit(slug)
    elsif method == 'list'
      TextService.list(slug)
    else	    
      puts 'crickets'
    end  
  
  end
  
  
end
