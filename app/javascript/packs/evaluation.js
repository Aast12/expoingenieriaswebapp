window.calculateEvaluationTotal = function(professor_score){
    console.log(professor_score)
    let description_value = document.getElementById("description_value").value;
    let social_cause_value = document.getElementById("social_cause_value").value;
    let metodology_value = document.getElementById("metodology_value").value;
    let feasibility_value = document.getElementById("feasibility_value").value;
    let results_value = document.getElementById("results_value").value;
    let impact_value = document.getElementById("impact_value").value;
    let ortography_value = document.getElementById("ortography_value").value;

    let total = document.getElementById("evaluation_total")
    

    let total_value = professor_score + Number(description_value) + Number(social_cause_value) + Number(metodology_value) + Number(feasibility_value) + Number(results_value) + Number(impact_value) + Number(ortography_value);

    total.value = total_value;


}