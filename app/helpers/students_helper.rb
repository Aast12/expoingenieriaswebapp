module StudentsHelper
  def student_options
    Student.all.collect { |student| [ student.user.full_name, student.user.email, student.student_code,student.major,student.id ] }
  end
end
