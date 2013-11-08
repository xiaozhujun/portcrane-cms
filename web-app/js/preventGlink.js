function preventGlink(obj){
    $("#templatebody").load($(obj).attr("href"));
    return false
}