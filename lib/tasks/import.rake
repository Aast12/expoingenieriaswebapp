namespace :import do
  desc "Task imports data from an excel sheet"
  task data: :environment do
    puts "Importing data ..."
    data = Roo::Spreadsheet.open('lib/projects.xlsx') # open spreadsheet
    headers = data.row(1) # get header row

    data.each_with_index do |row, idx|
      next if idx == 0 # skip header
      # create hash from headers and cells
      data = Hash[[headers, row].transpose]
      
  
      project = Project.new(status: data['status'], student_id: data['student_id'], professor_id: data['professor_id'], institution_id: data['institution_id'], edition_id: data['edition_id'])
      project.save!
      projectDetails = ProjectDetail.new(name: data['name'], description: data['description'], category: data['catergory'], video_url: data['video_url'], semestre_i: data['semestre_i'], social_impact: data['social_impact'], client_type: data['client_type'], area: data['area'], type_of: data['type_of'], project_id: project.id)
      projectDetails.save!
      virtualSample = VirtualSample.new(project_id: project.id)
      virtualSample.icon_image.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/gato3.png'), filename: 'gato3.png' , content_type: 'image/jpeg')
      virtualSample.about_file.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/gato1.jpeg'), filename: 'gato1.png' , content_type: 'image/jpeg')
      virtualSample.video_file.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/video1023017414.mp4'), filename: 'video1023017414.mp4')
      virtualSample.images.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/gato1.jpeg'), filename: 'gato1.png' , content_type: 'image/jpeg')
      
      
      virtualSample.save!
    end
    puts "Done importing data"
  end

end
