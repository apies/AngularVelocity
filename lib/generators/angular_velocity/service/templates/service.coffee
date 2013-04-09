angular.module('<%= application_name %>Service', []).factory( '<%=file_name.camelize %>', [ '$scope','$http', 
  class <%=file_name.camelize %>
    constructor: (data) ->
      @instantiate(data)
    instantiate: (data) ->
      @attributes = data
      angular.extend(@, data) 
])