`import Ember from 'ember'`
`import visible from '../utils/visible'`

EmberScrolltopHolderComponent = Ember.Component.extend
  classNames: Ember.A ['vertical-timenode']
  classNameBindings: ["currentlyVisible:turn-visible:turn-invisible"]
  scrollParent: window
  currentlyInvisible: Ember.computed.not("currentlyVisible")

  $scrollParent: Ember.computed "scrollParent", ->
    $ @get "scrollParent"
  didInsertElement: ->
    @get("$scrollParent").on "scroll", @decideVisibilityClass.bind(@)
    @decideVisibilityClass()
  willDestroyElement: ->
    @get("$scrollParent").off "scroll"

  shouldBeVisible: ->
    visible @$()

  shouldNotBeVisible: ->
    not @shouldBeVisible()

  decideVisibilityClass: ->
    if @shouldBeVisible() and @get("currentlyInvisible")
      @set "currentlyVisible", true
    if @get("currentlyVisible") and @shouldNotBeVisible()
      @set "currentlyVisible", false


`export default EmberScrolltopHolderComponent`
