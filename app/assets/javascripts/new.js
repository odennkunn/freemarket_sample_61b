$(document).on('ready page:load',function(){
  $(document).on('change', '#post_img,#post_img_last', function(){
    var input_area = $('.upload__box');
    var fileprop = $(this).prop('files')[0],
        find_img = $(this).parent().find('img'),
        filereader = new FileReader(),
        view_box = $(this).parent('.view_box,.post_box'),
        count = $('.img').length,
        new_input = $(`<div class="post_box"><input name="product[images_attributes][][image_url]" class="sell-upload-drop-box" type="file" id="post_img_last" accept="image/*"></div>`);

    input_area.prepend(new_input);

    $('.upload__box').children(":first").css({
      'display':'block',
      'display':'flex',
    });
    $(this).css({'display':'none'});
    $('.upload__box').children(".post_box:last").attr('class',"view_box");

      if(find_img.length){
        find_img.nextAll().remove();
        find_img.remove();
      }
      var img = '<div class="img_view"><img alt="" class="img"><p><a href="#" class="img_del">削除</a></p></div>';
      view_box.append(img);
      filereader.onload = function() {
        view_box.find('img').attr('src', filereader.result);
        img_del(view_box);      
      }
      filereader.readAsDataURL(fileprop);
        if(count >= 9){
          $('.post_box').css({
            'display':'none',
          });
          alert("画像は10枚まででお願いします。");
        }
  });

  function img_del(target){
    target.find("a.img_del").on('click',function(){
      var self = $(this),
          count = $('.img').length,
          parentBox = self.parent().parent().parent(),
          parentBox2 = self.parent().parent().parent('.view_box');

      if(window.confirm('画像を削除します。\nよろしいですか？')){
        setTimeout(function(){
          parentBox.find('input[type=file]').val('');
          parentBox.find('.img_view').remove();
          parentBox2.remove();
        } , 0);
        if(count <= 10){
          $('.post_box').css({
            'display':'',
          });
        }            
      }
      return false;
    });
  }

  $(document).on("turbolinks:load", function(){ 
    $('.input-default').on('keyup',function(){
      $('#l-left,#l-left2').empty();
      var Input = $('.input-default').val();
      var Fee = Math.floor($('.input-default').val()*0.1),
          Total = Input - Fee

      if(Input >= 300 && Input <= 9999999){
        var Fee = String(Fee),
            Total = String(Total);
        while(Fee != (Fee = Fee.replace(/^(-?\d+)(\d{3})/, "$1,$2")));
        while(Total != (Total = Total.replace(/^(-?\d+)(\d{3})/, "$1,$2")));
        $('#l-left').append("¥ " + Fee);
        $('#l-left2').append("¥ " + Total);
      }
      if( $('.input-default').val()==""){
        $('#l-left,#l-left2').empty();    
      }
      return false
    });
  });
});