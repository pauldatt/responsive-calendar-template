class CalendarPagesController < ApplicationController
    
    def home
        # unless the date has been provided in parameters, set it to today's date
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
        # added the date to Calendar Class from CalendarPagesHelper which should be included in application controller
        @calendar = Calendar.new(@date).to_a
    end
    
    
end
