class StarsRenderer
  def initialize(rating, template)
    @rating = rating
    @template = template
  end
  
  def render_stars
    #content_tag :div, star_images, :class => 'stars'
    a = ""
    @rating.times do |s|
      a+= image_tag "full_star.png", :size => '20x20'
    end
    #content_tag :div, a, :class => 'stars'
    return a
  end

  private
  
  def star_images
    (0...5).map do |position|
      star_image(((@rating-position)*2).round)
    end
  end
  
  def star_image(value)
    image_tag "#{star_type(value)}_star.png", :size => '20x20'
  end
  
  def star_type(value)
    if value <= 0
      'empty'
    else
      'full'
    end
  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end