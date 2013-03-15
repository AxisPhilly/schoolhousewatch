class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def get_all_news
    gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
    sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[0]

    stories = gsheet_to_hash(sheet)
  end

  def get_all_resources
    gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
    sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[1]
    
    resources = gsheet_to_hash(sheet)
  end

end
