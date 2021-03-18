class ApplicationController < ActionController::Base
    include ApplicationHelper
    add_flash_types :info, :danger
end
