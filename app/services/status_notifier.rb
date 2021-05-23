class StatusNotifier < ApplicationService

    def initialize(args)
        @status, @emails = args
    end

    def call
        print("=== send update email")
    end
end