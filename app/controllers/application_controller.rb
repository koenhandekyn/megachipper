class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    # I18n.locale = params[:locale] || :nl
    I18n.locale = :nl
  end

end
