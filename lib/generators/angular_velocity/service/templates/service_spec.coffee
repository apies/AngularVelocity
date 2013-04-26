describe "Service: <%= file_name.camelize %>", () ->

  <%= file_name.camelize %> = {}
  scope = {}
  $httpBackend = {}

  beforeEach(module('<%= application_name %>Service'))
  <%= file_name.camelize %> = {}
  scope = {}
  beforeEach(inject( ( _$httpBackend_, $rootScope, _<%= file_name.camelize %>_ ) ->
    $httpBackend = _$httpBackend_
    $httpBackend.whenGET('api/<%= file_name.pluralize %>').respond([{content:"msg1"}, {content: "ms2"}])

    scope = $rootScope.$new()
    <%= file_name.camelize %> = _<%= file_name.camelize %>_
    
  ))
  

  it 'should be able to make a new instance of itself when it already has data', () ->
    <%= file_name %>  = new <%= file_name.camelize %>(name: 'Quiet Like Horses')
    expect(<%= file_name %>.name).toBe('Quiet Like Horses')

  it 'should give itself Picture attributes with instantiate for use with promises', () ->
    
    <%= file_name %> = new <%= file_name.camelize %>
    <%= file_name %>.instantiate(name: 'Quiet Like Horses')
    expect(<%= file_name %>.name).toBe('Quiet Like Horses')
  it "should be a base for more specific <%= file_name.pluralize %>", () ->
    class <%= file_name.camelize %>Thing extends <%= file_name.camelize %>
      thing: 'thing'
    <%= file_name %>_thing = new <%= file_name.camelize %>Thing
    <%= file_name %>_thing.instantiate(name: 'Alan Pies', age: 28)
    expect(<%= file_name %>_thing.name).toBe('Alan Pies')
  it 'should be able to fetch my blogger pictures from a rest api', () ->
    <%= file_name.pluralize %> = <%= file_name.camelize %>.all()
    $httpBackend.flush()
    expect(<%= file_name.pluralize %>.length).toBe(2)
 