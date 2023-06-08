# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    locale = extract_locale_from_accept_language_header(env)
    I18n.locale = locale

    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

  private

  def extract_locale_from_accept_language_header(env)
    return env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first if env['HTTP_ACCEPT_LANGUAGE'].present?

    I18n.default_locale
  end
  # END
end
