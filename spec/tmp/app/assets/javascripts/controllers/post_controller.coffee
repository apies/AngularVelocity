PostController = ($scope) ->
  $scope.awesomeThings = ['HTML5 Boilerplate', 'AngularJS', 'Karma' ]

angular.module('AngularVelocityApp').controller( 'PostCtrl', [ '$scope', PostController ])