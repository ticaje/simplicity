class ApplicationDecorator < Draper::Decorator
  delegate_all

  def redcloth_format(text)
    RedCloth.new(text).to_html.html_safe
  end
end
