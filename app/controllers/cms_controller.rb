require "browser/aliases"

class CmsController < ApplicationController
  # acts_as_token_authentication_handler_for User
  before_action :authenticate_user!

  Browser::Base.include(Browser::Aliases)
end