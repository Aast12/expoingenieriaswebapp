namespace :import do
  desc "Task imports data from an excel sheet"
  task data: :environment do
    puts "Importing data ..."
    data = Roo::Spreadsheet.open('lib/proyectos final 9-6-2021.xlsx') # open spreadsheet
    headers = data.row(1) # get header row

    images = Roo::Spreadsheet.open('lib/info muestravirtual final 9-6-2021.xlsx') # open spreadsheet
    headersImages= images.row(1) # get header row




    data.each_with_index do |row, idx|
      next if idx == 0 # skip header
      # create hash from headers and cells
      data = Hash[[headers, row].transpose]
      project = Project.new(id: data['ID'] ,status: 4, main_student: data['NOMBRE ALUMNO RESPONSABLE1'], professor: data['PROFESOR COORDINADOR'], institution_id: 1, edition_id: 2)
      project.save!

      if data['MATERIA'] == "SEMESTRE i"
        is_semestre_i = 1
      else
        is_semestre_i = 0
      end

      # Falta llenar type_of, borrar video_url, llenar social_impact si tiene
      project_detail = ProjectDetail.new(name: data['NOMBRE DEL PROYECTO'], description: data['DESCRIPCION'], category: data['TIPO DE PROYECTO'], semestre_i: is_semestre_i, social_impact: 0, client_type: data['TIPO DE CLIENTE'], area: data['TIPO DE DESARROLLO'], project_id: project.id)
      project_detail.save!
    
      virtualSample = VirtualSample.new(project_id: project.id)
      

      pathToFolder = '/Users/fernandasanchez/Desktop/conexion_tec/lib/fotos_proyectos/Proyecto_' << data['ID'] << "/"


      images.each_with_index do |rowS, idxS|
        next if idx == 0
        dataImages = Hash[[headersImages, rowS].transpose]
        if dataImages['Título'] == data['ID']
          if dataImages['PIC1NOM'] != nil && File.extname(dataImages['PIC1NOM']) != ".mp4"
            # L O G O
            puts "Project: " << data['ID'] << " File" << dataImages['PIC1NOM']

            pathToLogo = pathToFolder << dataImages['PIC1NOM']
            virtualSample.icon_image.attach(io: File.open(pathToLogo), filename: dataImages['PIC1NOM'], content_type: 'image/jpeg')
          end
        else
          next
        end

      end

      virtualSample.save!
      sleep(1)
      
    
      #virtualSample.icon_image.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/gato3.png'), filename: 'gato3.png' , content_type: 'image/jpeg')
      #virtualSample.about_file.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/gato1.jpeg'), filename: 'gato1.png' , content_type: 'image/jpeg')
      #virtualSample.video_file.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/video1023017414.mp4'), filename: 'video1023017414.mp4')
      #virtualSample.images.attach(io: File.open('/Users/fernandasanchez/Desktop/conexion_tec/storage/gato1.jpeg'), filename: 'gato1.png' , content_type: 'image/jpeg')
   
    end

    

    puts "Done importing data"
  end

end





