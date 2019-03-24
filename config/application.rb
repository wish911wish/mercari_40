require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mercari40
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        # skip when label
        html_tag.html_safe
      else
        "<div class=\"has-error\">#{html_tag}<span class=\"has-error-text\">#{instance.error_message.first}</span></div>".html_safe
      end
    end
  end
end
