$(document).on('turbolinks:load', function(){
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
      $(".tnsubmit").addClass("km-greyout")
      $(".tnmain__contents__form__note__return").addClass("km-redout")
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown){
      alert('出品に失敗しました！');
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textstatus : " + textStatus);
      console.log("errorThrown : " + errorThrown.message);
    });
  });
});
