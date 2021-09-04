class ApplicationController < ActionController::Base
    around_action :switch_locale

    def switch_locale(&action)
      locale = extract_locale_from_tld || I18n.default_locale
      I18n.with_locale(locale, &action)
    end
    
    # Get locale from top-level domain or return +nil+ if such locale is not available
    # You have to put something like:
    #   127.0.0.1 application.com
    #   127.0.0.1 application.it
    #   127.0.0.1 application.pl
    # in your /etc/hosts file to try this out locally
    def extract_locale_from_tld
      parsed_locale = request.host.split('.').last
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
    end
end
