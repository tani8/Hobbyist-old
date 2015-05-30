import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('categories');
  this.resource('category', { path: ':category_id' });
});


export default Router;

