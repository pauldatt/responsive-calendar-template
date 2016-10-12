module CalendarPagesHelper
    class Calendar
        # initializes a calendar object with a date parameter or Date.today if no param provided
        def initialize(date = Date.today)
             @date = date
        end
        
        # we set up our calendar by defining the weeks and setting different classes to dates using the CalendarWeeks and AssignClasses classes
        def to_a
            CalendarWeeks.new(@date).to_a.map do |week|
                week.map do |date|
                    [date, AssignClasses.new(date).to_s]
                end
            end
        end
    end
    
    class CalendarWeeks
        def initialize(date = Date.today)
            @date = date
        end
        
        #we get date ranges of our calendar and divide them up in equal groups of 7 dates each group
        def to_a
            (first_calendar_day..last_calendar_day).to_a.in_groups_of(7)
        end
        
    private
        #get our first calendar day by getting the beginning of the month of the 
        # param date then the beginning of week which is sunday in this case
        def first_calendar_day
            @date.beginning_of_month.beginning_of_week(:sunday)
        end
        
        #get our last calendar day
        def last_calendar_day
            @date.end_of_month.end_of_week(:sunday)
        end
    end
    
    class AssignClasses
        def initialize(date)
            @date = date
        end
        
        #we want to associate certain classes with our dates of the calendar so we can manipulate them and add designs 
        def to_s
            [today, future, past, other_month].compact.join(" ")
        end
        
    private
        
        #the different types of classes added to a date object depending on the date
        def today
            "today" if @date == Date.today
        end
        
        def future
            "future" if @date > Date.today
        end
        
        def past
            "past" if @date < Date.today
        end
        
        def other_month
            "other_month" if @date.month != Date.today.month
        end
        
    end
end