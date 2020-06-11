window.manageUserableTypeRegistration = function() {
  judgeRegistration = document.getElementById('judge-registration');
  professorRegistration = document.getElementById('professor-registration');
  studentRegistration = document.getElementById('student-registration');
  userableTypeRegistration = document.getElementById('userable-type-registration');
  userableTypeValue = userableTypeRegistration.value;
  switch(userableTypeValue) {
    case "Judge":
      judgeRegistration.style.display = "block";
      professorRegistration.style.display = "none";
      studentRegistration.style.display = "none";
      break;
    case "Professor":
      judgeRegistration.style.display = "none";
      professorRegistration.style.display = "block";
      studentRegistration.style.display = "none";
      break;
    case "Student":
      judgeRegistration.style.display = "none";
      professorRegistration.style.display = "none";
      studentRegistration.style.display = "block";
      break;
    // Other userable type
    default:
      judgeRegistration.style.display = "none";
      professorRegistration.style.display = "none";
      studentRegistration.style.display = "none";
      break;
  }
}
