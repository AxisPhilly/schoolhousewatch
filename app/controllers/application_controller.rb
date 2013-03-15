class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_all_news
    gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
    sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[0]

    headers = sheet.rows[0]

    stories = sheet.rows[1, sheet.rows.length].map { |row|
      {
        headers[0] => row[0],
        headers[1] => row[1],
        headers[2] => row[2],
        headers[3] => row[3],
        headers[4] => row[4]
      }
    }

    stories
  end

  def get_all_resources
    gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
    sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[1]
    
    headers = sheet.rows[0]

    resources = sheet.rows[1, sheet.rows.length].map { |row|
      {
        headers[0] => row[0],
        headers[1] => row[1],
        headers[2] => row[2],
        headers[3] => row[3],
        headers[4] => row[4]
      }
    }

    resources
  end

end
