class TextService

  def TextService.list(slug)
    file = "stubs/#{slug}.json"	  
    res = ''	  
    File.open(file, "r") do |file|
      while line = file.gets
        res += line
      end
    end
    
    return res
  end

  def TextService.read slug
    file = "stubs/#{slug}.json"
    response = ''
    File.open(file, "r") do |file|
      while line = file.gets
        response += line
      end       
    end
      
    return response
  end

  def TextService.write 
    form = "views/texts/edit.html"
    res = ''    
    File.open(form, "r") do |form|
      while line = form.gets
        res += line
      end
    end
    return res
  end
  
  def TextService.save params
    slug = params['title'].gsub(' ', '-')
    return slug    
  end	  
  
  def erase
  end

  def edit slug
  end	  


end