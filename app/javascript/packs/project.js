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

// https://www.tutorialspoint.com/how-to-count-a-number-of-words-in-given-string-in-javascript
function countWords(str) {
  str = str.replace(/(^\s*)|(\s*$)/gi, "");
  str = str.replace(/[ ]{2,}/gi, " ");
  str = str.replace(/\n /, "\n");
  return str.split(" ").length;
}
