// $(function(){

//   function buildHtml(num){
//     var html = `<div class="image_preview">
//                   <div class="image${num}" data-num="${num}">
//                     <img class="image" src="">
//                   </div>
//                   <div class="btns">
//                     <div class="btn edit">
//                       編集
//                     </div>
//                     <div class="btn delete">
//                       削除
//                     </div>
//                   </div>
//                 </div>`
//       return html
//   }

//   function buildForm(num, form_width){
//     var html =  `<label for="item_images_attributes_${num}_name" style="display: block; width: ${form_width}">
//                   <span>
//                     ドラッグアンドドロップ
//                   <br>
//                     またはクリックしてファイルをアップロード
//                   </span>
//                   <input accept="image/*" type="file" name="item[images_attributes][0][name]" id="item_images_attributes_${num}_name">
//                   </label>`
//     return html
//   }
  
//   var num = $(".image_preview").length
//   var form_width = `100%`
//   $(".items__sell__form__upload-image-form").on("change", $(`#item_images_attributes_${num}_name`), function(e){
//       $(`label[for=item_images_attributes_${num}_name`).css("display", "none")
//       if (num === 0){
//         $(".items__sell__form__upload-image-form").prepend(buildHtml(num))
//       }else{
//         $(".image_preview").last().after(buildHtml(num))
//       }
      
//       var file = e.target.files[0],
//       reader = new FileReader(),
//       $preview = $(`.image${num}`);
//       t = this;

//       reader.onload = (function(file) {
//         return function(e) {
//           $preview.empty();
//           $preview.append($('<img>').attr({
//             src: e.target.result,
//             width: "122px",
//             height: "103px",
//                     class: "preview",
//                     title: file.name
//                 }));
//               };
//       })(file);
      
//       reader.readAsDataURL(file);

//       num += 1
//       if (num < 5){
//         form_width = `calc(100% - 126 * ${num}px)`
//       }else if(num > 5){
//         form_width = `calc(100% - 126 * ${num - 5}px)`
//       }else{
//         form_width = `100%`
//       }
//       $(`label[for=item_images_attributes_${num}_name`).css("width", `${form_width}`)
//       $(`label[for=item_images_attributes_${num}_name`).css("display", "block")
//   })

//   $(document).on("click", ".btn.delete", function(){
//     var index = $(this).parent().parent().children().first().data("num")

//     $(this).parent().parent().remove()
//     num = $(".image_preview").length
//     if (num < 5){
//       form_width = `calc(100% - 126 * ${num}px)`
//     }else if(num > 5){
//       form_width = `calc(100% - 126 * ${num - 5}px)`
//     }else{
//       form_width = `100%`
//     }

//     $(".items__sell__form__upload-image-form label").css("display", "none")
//     $(`label[for=item_images_attributes_${index}_name`).remove()
//     $(`.image_preview`).each(function(i, image){
//       $(image).children().attr("data-num", `${i}`)
//       $(image).children().first().attr("class", `image${i}`)
//     })

//     if (num === 0){
//       $(".items__sell__form__upload-image-form").prepend(buildForm(num, form_width))
//     }else{
//       $(`.items__sell__form__upload-image-form label:eq(${num - 1})`).after(buildForm(num, form_width))
//     }

//     $(".items__sell__form__upload-image-form label").children("input").each(function(i, input){
//         $(input).attr("id", `item_images_attributes_${i}_name`)
//         $(input).parent().attr("for", `item_images_attributes_${i}_name`)
//       })
//   })

// })

// $(document).on(function(){
//   var dropzone = $('.dropzone-area');
//   var dropzone2 = $('.dropzone-area2');
//   var dropzone_box = $('.dropzone-box');
//   var images = [];
//   var inputs = [];
//   var input_area = $('.input_area');
//   var preview = $('#preview');
//   var preview2 = $('#preview2');

//   $(document).on('change', 'input[type= "file"].upload-image',function(event) {
//     var file = $(this).prop('files')[0];
//     var reader = new FileReader();
//     inputs.push($(this));
//     var img = $(`<div class= "img_view"><img></div>`);
//     render.onload = function(e) {
//       var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
//       img.append(btn_wrapper);
//       img.find('img').attr({
//         src: e.target.result
//       })
//     }
//     reader.readAsDataURL(file);
//     images.push(img);

//     if (images.length >= 5) {
//       dropzone2.css({
//         'display': 'block'
//       })
//       dropzone.css({
//         'display': 'none'
//       })
//       $.each(images,function(index, image){
//         image.attr('data-image', index);
//         preview2.append(image);
//         dropzone2.css({
//           'width': `calc(100% - (135px * ${images.length - 5}))`
//         })
//       })
//       if (images.length == 9) {
//         dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//       }
//     } else {
//       $('#preview').empty();
//       $.each(images,function(index, image) {
//         image.attr('data-image', index);
//         preview.append(image);
//       })
//       dropzone.css({
//         'width':`calc(100% - (135px * ${images.length}))`
//       })
//     }
//   if (images.length == 4) {
//     dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
//   }
//   if (images.length == 10) {
//     dropzone2.css({
//       'display': 'none'
//     })
//     return;
//   }
//   var new_image = $(`<input multiple= "multiple" name="product_images[image][]" class="upload-image" data-mage= ${images.length} type="file" id="upload-image">`);
//   input_area.prepend(new_image);
//   });

//   $(document).on('click', '.delete', function() {
//     var target_image = $(this).parent().parent();
//     $.each(inputs, function(index, input){
//       if ($(this).data('image') == target_image.data('image')){
//         $(this).remove();
//         target_image.remove();
//         var num = $(this).data('image');
//         images.splice(num, 1);
//         inputs.splice(num, 1);
//         if(inputs.length == 0) {
//           $('input[type= "file"].upload-image').attr({
//             'data-image': 0
//           })
//         }
//       }
//     })
//     $('input[type= "file"].upload-image:first').attr({
//       'data-image': inputs.length
//     })
//     $.each(inputs, function(index, input){
//       var input = $(this)
//       input.attr({
//         'data-image': index
//       })
//       $('input[type= "file"].upload-image:first').after(input)
//     })
//     if (images.length >= 5){
//       dropzone2.css({
//         'display': 'block'
//       })
//       $.each(images, function(index, image) {
//         image.attr('data-image', index);
//         preview2.append(image);
//       })
//       dropzone2.css({
//         'width': `calc(100% - (135px * ${images.length - 5}))`
//       })
//       if (images.length == 9) {
//         dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//       }
//       if (images.length == 8) {
//         dropzone2.find('i').replaceWith('<p>ここをクリックしてください</p>')
//       }
//     } else {
//       dropzone.css({
//         'display': 'block'
//       })
//       $.each(images, function(index, image) {
//         image.attr('data-image', index);
//         preview.append(image);
//       })
//       dropzone.css({
//         'width': `calc(100% - (135px * ${images.length}))`
//       })
//     }
//     if (images.length == 4) {
//       dropzone2.css({
//         'display': 'none'
//       })
//     }
//     if (images.length == 3) {
//       dropzone.find('i').replaceWith('<p>ここをクリックしてください</p>')
//     }
//   })
// });
$(function(){
  function buildImage(loadedImageUri){
    var html =
    `<li class="km-images__container">
      <img src=${loadedImageUri}>
      <div class="item__images__container__preview__box">
        <div class="item__images__container__preview__box__edit">
          編集
        </div>
        <div>
          <a class="item__images__container__preview__box__delete">削除</a>
        </div>
      </div>
    </li>`
    return html
  };

  var files_array = [];
  $('.km-images__guide').on('dragover',function(e){
    e.preventDefault();
  });

  $('.km-images__guide').on('drop',function(event){
    event.preventDefault();
    files = event.originalEvent.dataTransfer.files;
    for (var i=0; i<files.length; i++) {
      files_array.push(files[i]);
      var fileReader = new FileReader();
      fileReader.onload = function( event ) {
        var loadedImageUri = event.target.result;
        $(buildImage(loadedImageUri)).appendTo(".km-images__preview ul").trigger("create");
      };
      fileReader.readAsDataURL(files[i]);
    }
  });

  $(document).on('click','.km-images__preview a', function(){
    var index = $(".km-images__preview a").index(this);
    files_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
  });

  $('#new_item').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    files_array.forEach(function(file){
      formData.append("images[image][]",file)
      console.log(this);
    });
    $.ajax({
      url: '/items',
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json'
    })
    .done(function(data){
      alert('出品に成功しました！');
      var html = 
    })
    .fail(function(XMLHttpRequest, textstatus, errorThrown){
      alert('出品に失敗しました！')
    });
  });
});
