describe "Controller: MainCtrl", () ->

  MainCtrl = {}
  scope = {}

  beforeEach(module('<%= application_name %>'))
  MainCtrl = {}
  scope = {}
  beforeEach(inject( ($rootScope, $controller) ->

    scope = $rootScope.$new()
    MainCtrl = $controller( 'MainCtrl', {
          $scope: scope
    })
    
  ))
  
  it "should attach a list of awesomeThings to the scope", () ->
    expect(scope.awesomeThings.length).toBe(3)