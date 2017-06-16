function sendRequest(){
    let apiKey = $('#apiKey').val();
    let dataText = $('#data').val();
    if(apiKey.length>0 && dataText.length>0){
        $('#errorApiKey').html("")
        $('#errorData').html("")
        let btn=  $('#btnSend').attr('disabled','disabled');
        let dataArray = dataText.split(',');
        $.ajax({
            url: "/find_duplicates/",
            data: {api_key: apiKey,
            data:dataArray},
            success: function(data, textStatus, xhr) {
                iziToast.info({
                    title: 'OK',
                    message: 'Conexión realizada',
                });
                $('#respuesta').html(JSON.stringify(data))
            },
            complete: function(xhr, textStatus) {
                btn.removeAttr('disabled');
                console.log(xhr.status);
            } 
        });
    }
    else{
        let errorApi ="";
        let errorData = "";
        if(apiKey.length==0)
            errorApi = "Can't be blank";
        if(dataText.length==0)
             errorData = "Can't be blank";

        $('#errorApiKey').html(errorApi);
        $('#errorData').html(errorData);
    }
 }

 function limpiar(){
    $('#apiKey').val("");
    $('#data').val("");
    $('#errorApiKey').html("");
    $('#errorData').html("");
 }
;
