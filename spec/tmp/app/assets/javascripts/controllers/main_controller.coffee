MainController = ($scope) ->
  $scope.awesomeThings = ['HTML5 Boilerplate', 'AngularJS', 'Karma' ]

angular.module('AngularVelocityApp').controller( 'MainCtrl', [ '$scope', MainController ])