export default Ember.Route.extend({
  model: function(){
    return Ember.$.getJSON('http://localhost:3000/categories/1').then(function(data) {
      console.log(data)
      return data;
    });
  },
});
