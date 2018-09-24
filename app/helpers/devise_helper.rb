# frozen_string_literal: true

# Monkey patch devise helper
module DeviseHelper
  def devise_error_messages!
    return '' unless devise_error_messages?

    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    content_tag(:div, nil, class: %w[alert alert-danger]) do
      safe_join [content_tag(:p, sentence), messages_list]
    end
  end

  def devise_error_messages?
    defined?(resource) && !resource.errors.empty?
  end

  private

  def messages_list
    content_tag :ul, safe_join(resource.errors.full_messages.map { |msg| content_tag(:li, msg) })
  end
end
