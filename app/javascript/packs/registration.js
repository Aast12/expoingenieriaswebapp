
window.manageUserableTypeRegistration = function() {
  console.log("hola")

  judgeRegistration = document.getElementById('judge-registration');
  professorRegistration = document.getElementById('professor-registration');
  studentRegistration = document.getElementById('student-registration');
  institutionSelect = document.getElementById('institution');

  isStudent = document.getElementById('isStudent').checked
  isProfessor = document.getElementById('isProfessor').checked;
  isJudge = document.getElementById('isJudge').checked;
  isCommitteeMember = document.getElementById('isCommitteeMember').checked;
  isAdmin = document.getElementById('isAdmin').checked;
  console.log(isStudent);

  if(isStudent || isProfessor || isJudge){
    institutionSelect.style.display = "block";
  }else{
    institutionSelect.style.display = "none";
  }


  if(isProfessor){
    professorRegistration.style.display = "block";
  }else{
    professorRegistration.style.display = "none";
  }

  if(isJudge){
    judgeRegistration.style.display = "block";
  }else{
    judgeRegistration.style.display = "none";
  }

  if(isStudent){
    studentRegistration.style.display = "block";
    professorRegistration.style.display = "none";
    judgeRegistration.style.display = "none";

    document.getElementById('isProfessor').disabled = true;
    document.getElementById('isJudge').disabled = true;
    document.getElementById('isCommitteeMember').disabled = true;
    document.getElementById('isAdmin').disabled = true;
    document.getElementById('isProfessor').checked = false;
    document.getElementById('isJudge').checked = false;
    document.getElementById('isCommitteeMember').checked = false;
    document.getElementById('isAdmin').checked = false;
  }else{
    studentRegistration.style.display = "none";
    document.getElementById('isProfessor').disabled = false;
    document.getElementById('isJudge').disabled = false;
    document.getElementById('isCommitteeMember').disabled = false;
    document.getElementById('isAdmin').disabled = false;
  }

  



}
