module StudentsHelper
  def student_options
    Student.all.collect { |student| [ student.user.full_name, student.id ] }
  end
end
