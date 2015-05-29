import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';

var App;

Ember.MODEL_FACTORY_INJECTIONS = true;

App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  Resolver: Resolver
});



loadInitializers(App, config.modulePrefix);

export default App;


// tutorial

// App = Ember.Application.create({});

// App.Router.map(function() {
//   this.resource('categories');
  // this.resource('posts', function() {
  //   this.resource('post', { path: ':post_id' });
  // });
// });

// App.PostsRoute = Ember.Route.extend({
//   model: function() {
    // return posts;
//   }
// });

// App.PostRoute = Ember.Route.extend({
//   model: function(params) {
//     return posts.findBy('id', params.post_id);
//   }
// });

// App.PostController = Ember.ObjectController.extend({
//   isEditing: false,

//   actions: {
//     edit: function() {
//       this.set('isEditing', true);
//     },

//     doneEditing: function() {
//       this.set('isEditing', false);
//     }
//   }
// });

// var showdown = new Showdown.converter();

// Ember.Handlebars.helper('format-markdown', function(input) {
//   return new Handlebars.SafeString(showdown.makeHtml(input));
// });

// Ember.Handlebars.helper('format-date', function(date) {
//   return moment(date).fromNow();
// });
