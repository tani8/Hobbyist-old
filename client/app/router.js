import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  // this.resource('index', {path: 'categories'})
  this.resource('categories', function(){
    this.resource('category', {path: ':category_id'});
      // , function(){
      // this.resource('hobbies');
    });


});

var IndexRoute = Ember.Route.extend({
  redirect: function(){
    this.transitionTo('categories');
  }
})

export default Router;

