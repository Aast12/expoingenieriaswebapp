module StandsHelper
    def stand_options
        Stand.all.collect {|stand| [stand.number, stand.id]}
    end
end
