module UrlHelper
  def author_link(comment)
    if comment.author_url.blank?
     comment.author
    else
      link_to(comment.author, comment.author_url, :class => 'openid')
    end
  end
end
