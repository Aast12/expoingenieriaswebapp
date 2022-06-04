
var globalStudentCount = 0;
var globalProfessorCount = 0;

window.manageSocialImpactForm = function () {
  socialImpactProjectDetail = document.getElementById(
    "social-impact-project-detail"
  );
  socialImpactForm = document.getElementById("social-impact-form");
  socialImpactValue = socialImpactProjectDetail.value;
  if (socialImpactValue == "true") {
    socialImpactForm.style.display = "block";
  } else {
    socialImpactForm.style.display = "none";
  }
};

window.manageWordCount = function (textId, wordCountId) {
  textValue = document.getElementById(textId).value;
  wordCount = document.getElementById(wordCountId);
  wordCount.value = countWords(textValue);
};

window.addSecondaryProfessor = function(){

  const parent = document.getElementById("professors-input");
  const row = document.createElement("div");
  const emailCol = document.createElement("div");
  const namesCol = document.createElement("div");
  const deleteCol = document.createElement("div");

  emailCol.classList.add("form-group", "col-sm-5", "text-left");
  namesCol.classList.add("form-group", "col-sm-5", "text-left");
  deleteCol.classList.add("form-group", "col-sm-2", "text-left", "mt-4");

  row.classList.add("form-group", "row", "text-left");
  row.id = "rowforProfessor" + globalProfessorCount;

  const deleteBtn = document.createElement("button");
  const deleteIcon = document.createElement("i");
  const label = document.createElement("label");
  const input = document.createElement("input");
  const inputName = document.createElement("input");
  const nameLabel = document.createElement("label");


  label.classList.add("form-label");
  label.innerHTML = "Correo del professor";
  label.htmlFor = "secondary_professors";
  label.id = "labelProfessor" + globalProfessorCount;

  input.type = "text";
  input.name = "secondary_professors[]";
  input.id = "prof" + globalProfessorCount;
  input.classList.add("form-control");
  input.pattern = "[aA-zZ0-9._%+-]+@[itesm||tec]+\.(mx|com)";
  input.setAttribute("onchange", "checkValidProfessor(this)");

  inputName.id = "nameprof" +  globalProfessorCount;
  inputName.disabled = true;
  inputName.classList.add("form-control");

  nameLabel.classList.add("form-label");
  nameLabel.innerHTML = "Nombre del profesor";
  nameLabel.id = "profNameLabel" +  globalProfessorCount;

  deleteBtn.id = globalProfessorCount;
  deleteBtn.classList.add("btn", "btn-light");
  deleteBtn.setAttribute("onclick", "deleteProfessor(this)");
  deleteBtn.type = "button";
  deleteIcon.classList.add("fa");
  deleteIcon.classList.add("fa-trash-o");                           
  deleteBtn.appendChild(deleteIcon);

  emailCol.appendChild(label);
  emailCol.appendChild(input);

  namesCol.appendChild(nameLabel);
  namesCol.appendChild(inputName);

  deleteCol.appendChild(deleteBtn);

  row.appendChild(emailCol);
  row.appendChild(namesCol);
  row.appendChild(deleteCol);

  parent.appendChild(row);


  cantSecondaryProfessors.innerHTML = Number(cantSecondaryProfessors.innerHTML)+1;
  globalProfessorCount+=1;
};

window.deleteProfessor = function(input){

  
  document.getElementById("rowforProfessor" + input.id).remove();

  cantSecondaryProfessors.innerHTML = Number(cantSecondaryProfessors.innerHTML)-1;
  
}

window.checkValidProfessor = function(input){
  $.ajax({
    type:'GET',
    url:'/professor/is_valid_professor',
    data: {"professor_email": input.value},
    success:function(response){
      if(typeof response === "undefined"){
        document.getElementById('name' + input.id).value = "Profesor no está registrado en la plataforma";
        document.getElementById('name' + input.id).style.color = "red";
      }else{ 
        document.getElementById('name' + input.id).style.color = "black";
        document.getElementById('name' + input.id).value = response.name;
      }
    }
  });
}
/*
window.deleteSecondaryProfessor = function() {
  
  cantSecondaryProfessors = document.getElementById("cantSecondaryProfessors");
  currentProfessor = globalProfessorCount - 1;
  if(currentProfessor + 1 > 0){
    document.getElementById('labelProfessor'+currentProfessor).remove();
    document.getElementById('prof' + currentProfessor).remove();
    //document.getElementById('warningProfessor' + currentProfessor).remove();
    document.getElementById('profNameLabel' + currentProfessor).remove();
    document.getElementById('nameprof' + currentProfessor).remove();
   
    cantSecondaryProfessors.innerHTML = globalProfessorCount-1;
  } 
}
*/


window.addStudentParticipant = function(){
  var cantStudents = document.getElementById("cantStudents");
  const parent = document.getElementById("students-input");
  const row = document.createElement("div");
  const emailCol = document.createElement("div");
  const namesCol = document.createElement("div");
  const deleteCol = document.createElement("div");

  emailCol.classList.add("form-group", "col-sm-5", "text-left");
  namesCol.classList.add("form-group", "col-sm-5", "text-left");
  deleteCol.classList.add("form-group", "col-sm-2", "text-left", "mt-4");

  row.classList.add("form-group", "row", "text-left");
  row.id = "rowforStudent" + globalStudentCount;

  const deleteBtn = document.createElement("button");
  const deleteIcon = document.createElement("i");
  const label = document.createElement("label");
  const input = document.createElement("input");
  const inputName = document.createElement("input");
  const nameLabel = document.createElement("label");


  label.classList.add("form-label");
  label.innerHTML = "Matrícula del alumno";
  label.htmlFor = "project_participants";
  label.id = "labelStudentCode" + globalStudentCount;

  input.type = "text";
  input.name = "participants[]";
  input.id = "student" + globalStudentCount;
  input.classList.add("form-control");
  input.setAttribute("onchange", "checkValidStudent(this)");

  inputName.id = "namestudent" +  globalStudentCount;
  inputName.disabled = true;
  inputName.classList.add("form-control");

  nameLabel.classList.add("form-label");
  nameLabel.innerHTML = "Nombre del alumno";
  nameLabel.id = "studentNamelabel" +  globalStudentCount;

  deleteBtn.id = globalStudentCount;
  deleteBtn.classList.add("btn", "btn-light");
  deleteBtn.setAttribute("onclick", "deleteStudentParticipant(this)");
  deleteBtn.type = "button";
  deleteIcon.classList.add("fa");
  deleteIcon.classList.add("fa-trash-o");                           
  deleteBtn.appendChild(deleteIcon);

  emailCol.appendChild(label);
  emailCol.appendChild(input);

  namesCol.appendChild(nameLabel);
  namesCol.appendChild(inputName);

  deleteCol.appendChild(deleteBtn);

  row.appendChild(emailCol);
  row.appendChild(namesCol);
  row.appendChild(deleteCol);

  parent.appendChild(row);


  cantStudents.innerHTML = Number(cantStudents.innerHTML)+1;
  globalStudentCount+=1;
}

window.deleteStudentParticipant = function(input) {
  document.getElementById("rowforStudent" + input.id).remove();
  cantStudents.innerHTML = Number(cantStudents.innerHTML)-1;
}


window.checkValidStudent = function(input){
  $.ajax({
    type:'GET',
    url:'/student/is_valid_student',
    data: {"student_code": input.value},
    success:function(response){
      if(typeof response === "undefined"){
        document.getElementById('name' + input.id).value = "Alumno no está registrado en la plataforma";
        document.getElementById('name' + input.id).style.color = "red";
      }else{ 
        console.log(input.id);
        document.getElementById('name' + input.id).style.color = "black";
        document.getElementById('name' + input.id).value = response.name;
      }
    }
  });
}


window.manageGlobalWordCount = function (params, wordCountId) {
  var acum = 0;
  for (i = 0; i < params.length; i++) {
    console.log(params[i]);
    textValue = document.getElementById(params[i]).value;
    if(textValue != ""){
      acum += countWords(textValue);
    }
   
  }
  wordCount = document.getElementById(wordCountId);
  wordCount.value = acum + "/260";
};

window.set_info = function(email_id,major_id,code_id,select_id,value) {
  email = document.getElementById(email_id);
  major = document.getElementById(major_id);
  code = document.getElementById(code_id);
  select = document.getElementById(select_id);
  id = select.value

  values_arr = JSON.parse(value)

  email.value = values_arr[parseInt(id)-1][1];
  major.value = values_arr[parseInt(id)-1][3];;
  code.value = values_arr[parseInt(id)-1][2];;
}

window.set_info_professor = function(email_id,select_id,value) {
  email = document.getElementById(email_id);
  select = document.getElementById(select_id);
  id = select.value
  values_arr = JSON.parse(value)

  email.value = values_arr[parseInt(id)-1][1];
  //email.value = email_id
}


// https://www.tutorialspoint.com/how-to-count-a-number-of-words-in-given-string-in-javascript
function countWords(str) {
  str = str.replace(/(^\s*)|(\s*$)/gi, "");
  str = str.replace(/[ ]{2,}/gi, " ");
  str = str.replace(/\n /, "\n");
  return str.split(" ").length;
}

