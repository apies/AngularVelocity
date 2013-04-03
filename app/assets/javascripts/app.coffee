angular.module('AngularVelocityApp', []).config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when("/", templateUrl: '../assets', controller: 'MainCtrl').otherwise(redirectTo: '/')
])