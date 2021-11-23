module DaysgroupsHelper
    def daysgroups_options
        Daysgroup.all.collect {|daysgroup| [daysgroup.group, daysgroup.id]}
    end
end
