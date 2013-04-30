angular.module('<%= application_name %>Service').factory( '<%= file_name.camelize %>', [ '$http', ($http, $scope) -> 
  class <%=file_name.camelize %>
    constructor: (data) ->
      @instantiate(data)
    instantiate: (data) ->
      @attributes = data
      angular.extend(@, data)
    @all: () ->
      <%=file_name.pluralize %> = []
      $http.get("api/<%= file_name.pluralize %>").then( (response) ->
        <%=file_name.pluralize %>.push new <%=file_name.camelize %>(params) for params in response.data
      ) 
      <%=file_name.pluralize %>
    @find: (<%=file_name %>Id) ->
      <%=file_name%> = new <%=file_name.camelize %>
      $http.get('api/<%= file_name.pluralize %>/<%=file_name %>Id').then( (response)->
        <%=file_name%>.instantiate(response.data)
      )
      <%=file_name%>

])