export default Ember.Route.extend({
  model: function(params){
    return Ember.$.getJSON('http://localhost:3000/categories/'+params.category_id+'/hobbies').then(function(data) {
      return data;
    });
  },
  // setupController: function (controller, model) {
  //     console.log('place route called');

  //     return Ember.$.getJSON('http://localhost:3000/categories/'+params.category_id+'/hobbies').then(function(data) {
  //       return data;
  //     });

  //     controller.set("model", place);
  // }
  getCategory: function() {
    model.refresh()
  }
});
