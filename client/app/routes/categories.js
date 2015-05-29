export default Ember.Route.extend({
  model: function(){
    return Ember.$.getJSON('http://localhost:3000/categories').then(function(data) {
      return data;
    });
  },
});
