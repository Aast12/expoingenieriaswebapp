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

window.manageGlobalWordCount = function (params, wordCountId) {
  var acum = 0;
  for (i = 0; i < params.length; i++) {
    console.log(params[i]);
    textValue = document.getElementById(params[i]).value;
    acum += countWords(textValue);
  }
  wordCount = document.getElementById(wordCountId);
  wordCount.value = acum;
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
}


// https://www.tutorialspoint.com/how-to-count-a-number-of-words-in-given-string-in-javascript
function countWords(str) {
  str = str.replace(/(^\s*)|(\s*$)/gi, "");
  str = str.replace(/[ ]{2,}/gi, " ");
  str = str.replace(/\n /, "\n");
  return str.split(" ").length;
}
