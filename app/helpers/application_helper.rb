module ApplicationHelper

  def md(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, { tables: true }).render(text).html_safe
  end

  def stars(book)
    return '' unless book.rating
    string = ''
    book.rating.times{ string += "<div class='glyphicon glyphicon-star'></div>" }
    ( 5 - book.rating ).times{ string += "<div class='glyphicon glyphicon-star-empty'></div>" }
    string.html_safe
  end
end
