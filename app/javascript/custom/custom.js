$(window).on('turbolinks:load',function(){
    // $('.flash').fadeOut(2000);
    

    setTimeout("$('.alert').fadeOut('slow')", 1000) ;
    $(".haiku__del").on('click',function(){
        if(confirm('俳句を削除しますか')){

        }else{
            return false;
        }
    });
    $(".logout_btn").on('click',function(){
        if(confirm('ログアウトしますか')){

        }else{
            return false;
        }
    });
    $(".user_del").on('click',function(){
        if(confirm('ユーザー情報を削除しますか')){

        }else{
            return false;
        }
    });

    // $(".haiku_btn").on('click',function(){
    //     // if(confirm('俳句を投稿しますか')){

    //     // }else{
    //     //     return false;
    //     // }
    //     $(".dialog").css('display','block');
    //     return false;
    // });
    var class_name;
    $("form.aaa input[type=submit]").on('click',function(){
        // if(confirm('俳句を投稿しますか')){

        // }else{
        //     return false;
        // }
        $(".dialog").css('display','block');
        class_name = $(this).attr('class');
        console.log(class_name);
        return false;
    });
    $(".dialog button").on('click',function(){
        console.log(class_name);
        $("form."+class_name).submit();
    });
});
