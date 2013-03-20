class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def get_axisphilly_news
    feed = Feedzirra::Feed.fetch_and_parse("http://axisphilly.org/school-buildings/feed/")

    feed
  end

   def get_other_news
    feed = Feedzirra::Feed.fetch_and_parse("http://axisphilly.org/school-buildings/feed/?post_type=external_post")

    feed
  end

  def get_all_resources
    gsession = GoogleDrive.login(ENV["GOOGLE_DRIVE_EMAIL"], ENV["GOOGLE_DRIVE_PASSWORD"])
    sheet = gsession.spreadsheet_by_key("0AsiZZJ_cOXiMdEhTVnNGblVYTDBBU1BpQkVxQ09vdVE").worksheets[1]
    
    resources = gsheet_to_hash(sheet)
  end

end
