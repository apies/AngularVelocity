<%=file_name.camelize %>Controller = ($scope) ->
  $scope.awesomeThings = ['HTML5 Boilerplate', 'AngularJS', 'Karma' ]

angular.module('<%= application_name %>').controller( '<%=file_name.camelize %>Ctrl', [ '$scope', <%=file_name.camelize %>Controller ])