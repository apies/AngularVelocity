angular.module('<%= application_name %>', []).config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when("/", templateUrl: 'views/main_control.html', controller: 'MainCtrl').otherwise(redirectTo: '/')
])