module MessagesHelper
  def dialect_img_url(dialect)
    dialect + '.png'
  end
  def date_format(date)
    date.in_time_zone('Berlin').strftime(' %b %e %Y %T')
  end
end
