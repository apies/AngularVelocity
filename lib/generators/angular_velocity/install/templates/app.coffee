angular.module('<%= application_name %>', []).config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when("/", templateUrl: 'templates/main_control.html', controller: 'MainCtrl').otherwise(redirectTo: '/')
])