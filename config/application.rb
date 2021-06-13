require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.precompile += Ckeditor.assets
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.assets.precompile += %w( ckeditor/* ckeditor_assets/* *.png *.jpg *.jpeg *.gif img/*)
    config.encoding = "utf-8"
    config.assets.paths << "#{Rails}/vendor/assets/*"
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.time_zone = 'Hanoi'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
