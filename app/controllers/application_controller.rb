class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def get_all_resources
    Rails.cache.fetch('allresources', :expires_in => 5.minutes) do 
      gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
      sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[1]

      resources = gsheet_to_hash(sheet)
    end
  end

end
