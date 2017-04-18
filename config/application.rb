require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'pp'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Empcl
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.eager_load_paths += %W(#{Rails.root.join}/lib #{Rails.root.join('app', '*')})

    # Bower asset paths
    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end
	
    # Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
    # Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

	config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf )

    #国际化
    # 指定 I18n 库搜索翻译文件的路径
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = ["zh_CN","en"]
    # 修改默认区域设置（默认是 :en）
    I18n.default_locale = :zh_CN
    config.i18n.fallbacks = true  #当应用程序需要的语言文件缺失时，使用默认的语言文件default_locale
  end
end
