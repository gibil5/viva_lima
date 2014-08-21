

def full_title(page_title)

  #base_title = "Ruby on Rails Tutorial Sample App"
  base_title = "¡ Viva Lima !"

  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end

end
