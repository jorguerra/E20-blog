class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization
  load_and_authorize_resource :unless => :devise_controller?
end
