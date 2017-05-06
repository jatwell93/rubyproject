module ApplicationHelper
  
  
    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "FitnessLabs (A & K LABS)"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  

  
  def gravatar_for(user, options = { size: 80})
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
 
  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
    
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map {
      |msg| content_tag(:li, msg)}.join
    html = <<-HTML
      <div class="alert alert-error alert-danger">
      <a href='#' class='close' data-dismiss="alert"> &#215;</a>
      <%= content_tag :div , msg if msg.is_a(String) %>
      </div>
      HTML
    html.html_safe
  end

end


