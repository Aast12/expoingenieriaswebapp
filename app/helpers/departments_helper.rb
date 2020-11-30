module DepartmentsHelper
    def departments_options
        Department.all.collect { |department| [ department.name, department.name] }
    end
end
