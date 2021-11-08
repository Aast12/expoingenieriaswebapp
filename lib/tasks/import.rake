#bundle exec rails import:data

namespace :import do
  desc "Task imports data from an excel sheet"
  task data: :environment do

    puts "Importing data ..."
    data = Roo::Spreadsheet.open('lib/proyectos final 9-6-2021.xlsx') # open spreadsheet
    #headers = data.row(1) # get header row

    data = Roo::Spreadsheet.open('lib/proyectos final 9-6-2021.xlsx') # open spreadsheet
    headers = data.row(1) # get header row

    data.each_with_index do |row, idx|
      next if idx == 0 #skip header
      data = Hash[[headers, row].transpose]

      projectID = data['ID']
      puts "Loading virtual sample with project id: " + projectID

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

      category = correct_names_categories(data['TIPO DE PROYECTO'])
      area = correct_names_area(data['TIPO DE DESARROLLO'])



      project = Project.new(id: data['ID'] ,status: status, main_student: data['NOMBRE ALUMNO RESPONSABLE1'], professor: data['PROFESOR COORDINADOR'], institution_id: 1, edition_id: 2)
      project.save!

      if data['MATERIA'] == "SEMESTRE i"
          is_semestre_i = 1
        else
          is_semestre_i = 0
      end

      project_detail = ProjectDetail.new(name: data['NOMBRE DEL PROYECTO'], description: data['DESCRIPCION'], category: category, semestre_i: is_semestre_i, social_impact: 0, client_type: data['TIPO DE CLIENTE'], area: area , project_id: project.id)
      project_detail.save!


      if data['ACCEPTADO']  == "AC"    #Projecto fue aceptado
        #LOAD VIRTUAL SAMPLE
        images = Roo::Spreadsheet.open('lib/info muestravirtual final 9-6-2021.xlsx') # open spreadsheet
        headersImages= images.row(1) # get header row

        images.each_with_index do |rowS, idxS|
          next if idxS == 0
          dataImages = Hash[[headersImages, rowS].transpose]

          if dataImages['Título'] == projectID
            ## LOAD PROJECT VIDEO
            video_id = dataImages['VIDEOURL'].split('=')[-1]
            correct_video_url = "https://drive.google.com/file/d/" + video_id + "/preview"
            virtualSample = VirtualSample.new(project_id: projectID, video_link: correct_video_url)
            pathToFolder = 'lib/fotos_proyectos/Proyecto_' << projectID << "/"
           
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

            ## LOAD IMAGES FOR CARROUSEL
            for i in 2..5
              picName = 'PIC' + i.to_s + 'NOM'
              
              if dataImages[picName] != nil && File.extname(dataImages[picName]) != ".mp4"
                pathToPic = pathToFolder + dataImages[picName]
                virtualSample.images.attach(io: File.open(pathToPic), filename: dataImages[picName], content_type: 'image/jpeg')
              end
              
            end
            virtualSample.save!
            

          end
        end
      end
    end

    puts "Done importing data"


  end

end



def correct_names_area(area)
  

  case area
    when "AGROBIOTECNOLOGIA"
      return "Agrobiotecnología"
    when "AUTOMATIZACION DE PROCESO"
      return "Automatización de Proceso"
    when "ELECTRONICA-HARDWARE"
      return "Electrónica-Hardware"
    when "INGENIERIA DE ALIMENTOS"
      return "Ingeniería de Alimentos"
    when "INGENIERIA INDUSTRIAL"
      return "Ingeniería Industrial"
    when "INGENIERIA MECANICA"
      return "Ingeniería Mecánica"
    when "INGENIERIA QUIMICA"
      return "Ingeniería Química"
    when "MODELO ARQUITECTONICO"
      return "Modelo Arquitectónico"
    when "NANOTECNOLOGIA"
      return "Nanotecnología"
    when "PROCESO DE PRODUCCION"
      return "Proceso de Producción"
    when "QUIMICA-BIOQUIMCA"
      return "Química-Bioquímica"
    else
      return area.titleize
  end

end


def correct_names_categories(category)

  case category
    when "DESARROLLO DE PROTOTIPO FISICO"
      return "Desarrollo de Prototipo Físico"
    when "DESARROLLO DE PROTOTIPO DE SOFTWARE"
      return "Desarrollo de Prototipo de Software"
    when "INVESTIGACION Y DESARROLLO DE PROPUESTAS DE MEJORA"
      return "Investigación y Desarrollo de Propuestas de Mejora"
    when "PRODUCTOS O SERVICIOS PARA EMPRENDIMIENTO DE BASE TECNOLOGICA"
      return "Productos o Servicios para Emprendimiento de Base Tecnológica"
  end

end




