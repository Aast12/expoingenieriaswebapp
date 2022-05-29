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

window.addStudentParticipant = function(){
  pane = document.getElementById("addStudentPane");
  var br = document.createElement("br");
  cantStudents = document.getElementById("cantStudents");

  const label = document.createElement("label");
  const input = document.createElement("input");
  const inputName = document.createElement("p")


  label.classList.add("form-label");
  label.innerHTML = "Matrícula del estudiante";
  label.htmlFor = "project_participants";
  label.id = "label" + Number(cantStudents.innerHTML)

  input.type = "text";
  input.name = "participants[]";
  input.id = Number(cantStudents.innerHTML);
  input.classList.add("form-control");
  input.pattern = "[aA][0-9]{8}";
  input.setAttribute("onchange", "checkStudentCodeExists(this)");


  inputName.disabled = "true"
  inputName.id = "message" + Number(cantStudents.innerHTML);
  


  pane.appendChild(label);
  pane.appendChild(input);
  pane.appendChild(inputName)
 
  cantStudents.innerHTML = Number(cantStudents.innerHTML)+1
}

window.deleteStudentParticipant = function() {
  cantStudents = document.getElementById("cantStudents");
  currentStudent = Number(cantStudents.innerHTML) - 1
  if(currentStudent + 1 > 0){
    document.getElementById(currentStudent).remove()
    document.getElementById('message' + currentStudent).remove()
    document.getElementById('label' + currentStudent).remove()
    cantStudents.innerHTML = Number(cantStudents.innerHTML)-1
  } 
}


window.checkStudentCodeExists = function(input){
  
  const student_codes = $('.students_info').data('students')
  const message_id = 'message' + input.id
  const message = document.getElementById(message_id)
  if(!student_codes.includes(input.value) && input.value != ""){
    console.log(message_id)
    message.innerHTML = "Usuario no está registrado en la plataforma";
  }else{
    message.innerHTML = ""
  }
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

