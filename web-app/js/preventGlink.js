function preventGlink(obj){
    alert($(obj).attr("href"));
    $("#body").load($(obj).attr("href"));
    return false
}