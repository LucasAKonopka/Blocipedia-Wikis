module ApplicationHelper
  def markdown_text(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, no_styles: true, prettify: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, )
    markdown.render(text).html_safe
  end
end
