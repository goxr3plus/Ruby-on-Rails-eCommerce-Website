module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 150)
    # gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?
    # s=#{size}"
    # image_tag(gravatar_url, alt: user.name, class: 'gravatar')
    # gravatar_image_tag("#{user.email}".gsub('spam', 'mdeering'),
    # alt: "#{user.name}" ,filetype: :png, rating: 'pg',size:500)
    gravatar_image_tag(
      user.email.to_s.gsub('spam', 'mdeering'),
      alt: 'User Image', gravatar: {
        default: 'https://assets.github.com/images/gravatars/gravatar-140.png',
        size: size
      }
    )
  end
end
