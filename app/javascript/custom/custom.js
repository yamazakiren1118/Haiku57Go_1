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

    // $("#haikus_block").jscroll({
    //     contentSelector:'#haikus_block'
    // });
    // $(window).on('load resize',function(){
    //     if(window.innerWidth <= 768){
    //         $("#haikus").jscroll({
    //             contentSelector:'#haikus'
    //         });
            
    //     }
    // });


});
$(window).on('load resize',function(){
    console.log('load');
    function noscroll(e){
        e.preventDefault();
        console.log('loock');
    }
    $(window).off('scroll');
    if(window.innerWidth <= 768){
        // $("#haikus_block").jscroll({
        //     contentSelector:'#haikus_block'
        // });
        // console.log('ccc');
        var ajx = true;
        function scroll_f(){
            
        }
        
        $(window).on('scroll',function(){
            var h = $(document).innerHeight(),
            height = h - $(window).innerHeight();
            
            console.log(height-30 < $(window).scrollTop());
            // $(window).off('scroll');
            // $(window).on('scroll');
            // console.log($(window).scrollTop());
            if(height-10 < $(window).scrollTop()){
                console.log("http://" + location.host + "/" + $("#control").text() + "/pagenate" + "?page=" + $("#page").text());
                // document.addEventListener('touchmove',noscroll,{passive:false});
                // document.addEventListener('mousewheel',noscroll,{passive:false});
                console.log('last');
                $.ajax({
                    type: 'GET',
                    url: "http://" + location.host + "/" + $("#control").val() + "/pagenate" + "?page=" + $("#page").val(),
    
                    // success: function(){
                    //     console.log(location.pathname + "/pagenate/?page=" + $("#page").text());
                    //     // $("#haikus_block").append("<%= j(render partial: 'pages/haikus_index',locals: {haikus:@haikus})%>");
                    // }
                    // success: function(){
                    //     document.removeEventListener('touchmove',noscroll,{passive:false});
                    //     document.removeEventListener('mousewheel',noscroll,{passive:false});
                    //     console.log('scroll');
                    //     ajx = false;
                    // }
                });
                
 

            }
        }); 
    }
});