module DaysgroupsHelper
    def daysgroups_options
        Daysgroup.all.collect {|daysgroup| ["#{daysgroup.day} - #{daysgroup.group}", daysgroup.id]}
    end
end
