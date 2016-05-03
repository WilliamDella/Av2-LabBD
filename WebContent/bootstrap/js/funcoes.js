function aumentaHR() {            
    var hora = document.getElementById("hora").innerHTML;
    hora = parseInt(hora) + 1;
    if(hora == 24){
        hora = "0";
    }
    if(hora < 10){
        document.getElementById("hora").innerHTML = "0" + hora;
    } else {
        document.getElementById("hora").innerHTML = hora;
    }           
}

function aumentaMIN() {
    var minuto = document.getElementById("minuto").innerHTML;
    minuto = parseInt(minuto) + 1;
    if(minuto == 60){
        minuto = "0";
    }
    if(minuto < 10){
        document.getElementById("minuto").innerHTML = "0" + minuto;
    } else {
        document.getElementById("minuto").innerHTML = minuto;
    } 
}

function aumentaSEG() {
    var segundo = document.getElementById("segundo").innerHTML;
    segundo = parseInt(segundo) + 1;
    if(segundo == 60){
        segundo = "0";
    }
    if(segundo < 10){
        document.getElementById("segundo").innerHTML = "0" + segundo;
    } else {
        document.getElementById("segundo").innerHTML = segundo;
    } 
}

function aumentaD() {
    var decimo = document.getElementById("decimo").innerHTML;
    decimo = parseInt(decimo) + 1;
    if(decimo == 1000){
        decimo = "0";
    }
    if(decimo < 10){
        document.getElementById("decimo").innerHTML = "00" + decimo;
    } else if(decimo >= 10 && decimo < 100) {
        document.getElementById("decimo").innerHTML = "0" + decimo;
    } else {
        document.getElementById("decimo").innerHTML = decimo;
    }
}

function diminuiHR() {            
    var hora = document.getElementById("hora").innerHTML;
    hora = parseInt(hora) - 1;
    if(hora == -1){
        hora = "23";
    }
    if(hora < 10){
        document.getElementById("hora").innerHTML = "0" + hora;
    } else {
        document.getElementById("hora").innerHTML = hora;
    }           
}

function diminuiMIN() {
    var minuto = document.getElementById("minuto").innerHTML;
    minuto = parseInt(minuto) - 1;
    if(minuto == -1){
        minuto = "59";
    }
    if(minuto < 10){
        document.getElementById("minuto").innerHTML = "0" + minuto;
    } else {
        document.getElementById("minuto").innerHTML = minuto;
    } 
}

function diminuiSEG() {
    var segundo = document.getElementById("segundo").innerHTML;
    segundo = parseInt(segundo) - 1;
    if(segundo == -1){
        segundo = "59";
    }
    if(segundo < 10){
        document.getElementById("segundo").innerHTML = "0" + segundo;
    } else {
        document.getElementById("segundo").innerHTML = segundo;
    } 
}

function diminuiD() {
    var decimo = document.getElementById("decimo").innerHTML;
    decimo = parseInt(decimo) - 1;
    if(decimo == -1){
        decimo = "999";
    }
    if(decimo < 10){
        document.getElementById("decimo").innerHTML = "00" + decimo;
    } else if(decimo >= 10 && decimo < 100) {
        document.getElementById("decimo").innerHTML = "0" + decimo;
    } else {
        document.getElementById("decimo").innerHTML = decimo;
    }
}