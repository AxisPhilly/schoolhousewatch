class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_all_news
    gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
    sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[0]
    sheet.rows[1, sheet.rows.length]
  end

end
