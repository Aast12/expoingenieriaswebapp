module AcademicLevelsHelper
    def academic_level_options
        AcademicLevel.all.collect { |academic_level| [ academic_level.name, academic_level.id ] }
    end
end
