#bundle exec rails import:data


namespace :import do
  desc "Task imports data from an excel sheet"
  task data: :environment do

    puts "Importing data ..."
    

    data = Roo::Spreadsheet.open('lib/proyectos final 9-6-2021.xlsx') # open spreadsheet
    headers = data.row(1) # get header row

    data.each_with_index do |row, idx|
      next if idx == 0 #skip header
      data = Hash[[headers, row].transpose]

      projectID = data['ID']
      puts "Loading project with project id: " + projectID

      case data['ACCEPTADO']
      when "RG"
        status = 0
      when "NE" 
        status = 1
      when 'NA'
        status = 2
      when "EV"
        status = 3
      when "AC"
        status = 4
      when "RE"
        status = 5
      when "DE"
        status = 6
      when "FA"
        status = 7
      end


      project = Project.new(id: data['ID'] ,status: status, main_student: data['NOMBRE ALUMNO RESPONSABLE1'], professor: data['PROFESOR COORDINADOR'], institution_id: 1, edition_id: 2, campus: data['CAMPUS'])
      project.save!

      if data['MATERIA'] == "SEMESTRE i"
          is_semestre_i = 1
        else
          is_semestre_i = 0
      end

      if data['ENFOQUE_SOCIAL'] == 'SI'
          has_social_impact = 1
        else
          has_social_impact = 0
      end


      project_detail = ProjectDetail.new(name: data['NOMBRE DEL PROYECTO'], description: data['DESCRIPCION'], category: data['TIPO DE PROYECTO'], semestre_i: is_semestre_i, social_impact: has_social_impact, client_type: data['TIPO DE CLIENTE'], area: data['TIPO DE DESARROLLO'] , project_id: project.id)
      project_detail.save!


      if data['ACCEPTADO']  == "AC"    #Projecto fue aceptado
        #LOAD VIRTUAL SAMPLE
        images = Roo::Spreadsheet.open('lib/info muestravirtual final 9-6-2021.xlsx') # open spreadsheet
        headersImages= images.row(1) # get header row

        images.each_with_index do |rowS, idxS|
          next if idxS == 0
          dataImages = Hash[[headersImages, rowS].transpose]

          #src="assets/fotos_proyectos/Proyecto_1421/foto 1.jpg"
          if dataImages['Título'] == projectID

            ## LOAD PROJECT VIDEO
            video_id = dataImages['VIDEOURL'].split('=')[-1]
            correct_video_url = "https://drive.google.com/file/d/" + video_id + "/preview"
            pathToFolder = '/Users/fernandasanchez/Desktop/conexion_tec/lib/fotos_proyecto/Proyecto_' << projectID << "/"

            virtualSample = VirtualSample.new(project_id: projectID, video_link: correct_video_url)


            ## LOAD LOGO
            if dataImages['PIC1NOM'] != nil && File.extname(dataImages['PIC1NOM']) != ".mp4"
              pathToLogo = pathToFolder + dataImages['PIC1NOM']
              #puts pathToLogo
              virtualSample.icon_image.attach(io: File.open(pathToLogo), filename: dataImages['PIC1NOM'], content_type: 'image/jpeg')
            end

            ## LOAD BACKGROUND IMAGE
            if dataImages['PIC4NOM'] != nil && File.extname(dataImages['PIC4NOM']) != ".mp4"
              pathToBGImage = pathToFolder + dataImages['PIC4NOM']
              virtualSample.background_image.attach(io: File.open(pathToBGImage), filename: dataImages['PIC4NOM'], content_type: 'image/jpeg')
            end

            ## LOAD CARD IMAGE
            if dataImages['PIC2NOM'] != nil && File.extname(dataImages['PIC2NOM']) != ".mp4"
              pathToBGImage = pathToFolder + dataImages['PIC2NOM']
              virtualSample.card_image.attach(io: File.open(pathToBGImage), filename: dataImages['PIC2NOM'], content_type: 'image/jpeg')
            end

            ## LOAD IMAGES FOR CARROUSEL
            pics = Array.new(5)
            for i in 2..5
              picName = 'PIC' + i.to_s + 'NOM'

              if dataImages[picName] != nil && File.extname(dataImages[picName]) != ".mp4" && picName != 'PIC4NOM'
                pathToPic = pathToFolder + dataImages[picName]
                pics[i] = pathToPic
                virtualSample.images.attach(io: File.open(pathToPic), filename: dataImages[picName], content_type: 'image/jpeg')
              end
            end
            virtualSample.save!
            

            #LOAD COMMENTS 
            comments = Roo::Spreadsheet.open('lib/comentarios final 19-09-2021.xlsx') # open spreadsheet
            headersComments= comments.row(1) # get header row

            comments.each_with_index do |rowC, idxC|
              next if idxC == 0
              dataComments = Hash[[headersComments, rowC].transpose]

              if dataComments['PARENTID'] == virtualSample.project_id && dataComments['COMENTARIO'] != nil
                newComment = Comment.new(virtual_sample_id: virtualSample.id, user_name: dataComments['AUTOR'], user_type: dataComments['TIPO'], body: dataComments['COMENTARIO'])
                newComment.save!
              end


            end
            

          end

        end
      end
    end


    puts "Done importing data"


  end

end

#/assets/fotos_proyecto/Proyecto_1427/Animación del llenado.gif
#/app/assets/images/fotos_proyecto/Proyecto_1427
#/assets/fotos_proyecto/Proyecto_1433/Jubileo.jpg
#../assets/fotos_proyecto/Proyecto_1427/WhatsApp Image 2021-05-27 at 22.54.54.jpeg
#/assets/fotos_proyecto/Proyecto_1487/654a3ef9-8328-4022-bad3-d4f0d0b057d7.JPG
#/assets/fotos_proyecto/Proyecto_1487/654a3ef9-8328-4022-bad3-d4f0d0b057d7.JPG

