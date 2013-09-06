function simpleTree(obj) {
    $(".itemTitle:not(.titleShow)",obj).addClass("titleHide");
    $(".itemContent:not(.contentShow)",obj).addClass("contentHide");
    $(".itemTitle",obj).click(function(){
        if ($(this).hasClass("titleShow")) {
            $(this).removeClass("titleShow").addClass("titleHide");
            $(this).next().removeClass("contentShow").addClass("contentHide");
        } else if ($(this).hasClass("titleHide")) {
            $(this).removeClass("titleHide").addClass("titleShow");
            $(this).next().removeClass("contentHide").addClass("contentShow");
        };
    });
    $(".bullet",obj).click(function(){
        $(".menuSelected").removeClass("menuSelected");
        $(this).addClass("menuSelected");
    });
}
