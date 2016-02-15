require "open-uri"

class StaticController < ApplicationController
  CAL_URL = "https://www.googleapis.com/calendar/v3/calendars/bostonhash@gmail.com/events?key=AIzaSyCMZCb6nbsoAyOwuBDD2pRrvMf1rjYSANc&futureevents=true&orderby=starttime&sortorder=a&singleevents=true&showDelete=false&singleEvents=true&orderBy=startTime&timeMin="

  def welcome
    if !params[:id] then
      params[:id] = 1
    end
    
    @next_hash = get_next_hash(params[:id].to_f)
  end
  
  def more
  end
  
  def about
  end
  
  def calendar
  end
  
  private 

  def get_next_hash(id)
      url = CAL_URL + Time.zone.now.beginning_of_day.iso8601
      cal_results = open(url)
      ev = JSON.parse(File.open(cal_results).read)["items"][id]
      Event.new ev
  rescue Exception => e
      puts e
  end
end
