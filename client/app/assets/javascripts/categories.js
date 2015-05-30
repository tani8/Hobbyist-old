$(document).on('page:change', function() {
  bindEvents();
  getAllCategories();
});

$(".categories.show").ready(function() {
  showCategory();
})

function bindEvents(){
  // $('#categories').on('click', '.category_link', showCategory);
  // $('#show_category').on('click', '.hobby_link', showHobby);
};

function getAllCategories(){
  var source = $('#all_categories').html();
  var template = Handlebars.compile(source);

  $.ajax({
      url: 'http://localhost:3000/categories',
      type: 'get'
  }).done(function(data) {
    context = {categories: data}
    $('#categories').html(template(context))
  }).fail(function() {
      console.log('error');
  });
}

function showCategory(){
  // event.preventDefault();
  debugger
  var source = $('#category_template').html();
  var template = Handlebars.compile(source);
  // var url = $(this).attr('href')

  $.ajax({
      url: 'http://localhost:3000/categories/1',
      type: 'get'
  }).done(function(data) {
    context = {hobbies: data}
    $('#show_category').html(template(context));
    // $('#categories').hide();
  }).fail(function() {
      console.log('error');
  });
}

function showHobby(){
  event.preventDefault();

  var source = $('#hobby_template').html();
  var template = Handlebars.compile(source);
  var url = $(this).attr('href')

  $.ajax({
      url: 'http://localhost:3000'+url,
      type: 'get'
  }).done(function(data) {
    $('#show_hobby').html(template(data));
    $('#show_category').hide();
  }).fail(function() {
      console.log('error');
  });
}
