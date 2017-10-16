$(document).ready(function () {

    $("#cta").keyup(function () {
        if ($(this).val().replace(" ","").length > 0){
            $("#btn-comment").show();
        } else {
            $("#btn-comment").hide();
        }
        
    })


});