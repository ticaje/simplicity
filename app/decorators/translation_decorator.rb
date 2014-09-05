class TranslationDecorator < ApplicationDecorator
  decorates :translation

  def creation_date
    h.l(model.created_at, format: :long)
  end

end
