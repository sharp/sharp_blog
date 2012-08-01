module DateHelper
  def format_month(date)
    date.strftime("%Y-%m")
  end

  def format_post_date(date)
    date.strftime("%Y-%m-%d")
  end

  def format_comment_date(date)
    date.strftime("%Y-%m-%d %M:%S")
  end
end
