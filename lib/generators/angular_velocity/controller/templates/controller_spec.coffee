describe "Controller: <%= file_name.camelize %>Ctrl", () ->

  <%= file_name.camelize %>Ctrl = {}
  scope = {}

  beforeEach(module('<%= application_name.camelize %>'))
  <%= file_name.camelize %>Ctrl = {}
  scope = {}
  beforeEach(inject( ($rootScope, $controller) ->

    scope = $rootScope.$new()
    <%= file_name.camelize %>Ctrl = $controller( '<%= file_name.camelize %>Ctrl', {
          $scope: scope
    })
    
  ))
  
  it "should attach a list of awesomeThings to the scope", () ->
    expect(scope.awesomeThings.length).toBe(3)