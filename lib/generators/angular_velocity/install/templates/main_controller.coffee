MainController = ($scope) ->
  $scope.awesomeThings = ['HTML5 Boilerplate', 'AngularJS', 'Karma' ]

angular.module('<%= application_name %>').controller( 'MainCtrl', [ '$scope', MainController ])