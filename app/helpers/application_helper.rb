module ApplicationHelper
  def full_title(page_title)  #input: String
                              #output: String (with base title appended) 
    base_title = "BK Shift on Rails"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def gravatar_for(user, options = { size: 50 }) #input: User, output: String (html img tag for user's gravatar) [http://gravatar.com/]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end 


end
