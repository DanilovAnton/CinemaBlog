$(document).ready(function () {

    $("#cta").keyup(function () {
        if ($(this).val().trim().length > 0){
            $("#btn-comment").show();
        } else {
            $("#btn-comment").hide();
         }
        
    })


});