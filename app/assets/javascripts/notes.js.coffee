# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#jQuery ->
  #$('#note-list .note h2 a').click ->
    #$(this).parent().parent().toggleClass("focus")
    #false
jQuery ->
  if $('#socialshareprivacy').length > 0
    $('#socialshareprivacy').socialSharePrivacy {
      css_path: false,
      services: {
        facebook: {
          app_id: "187193338017248",
          dummy_img: "/assets/dummy_facebook.png"
        },
        twitter: {
          dummy_img: "/assets/dummy_twitter.png"
        },
        gplus: {
          dummy_img: "/assets/dummy_gplus.png"
        }
      }
    }
  $('#light-switcher').click ->
    $(this).toggleClass("switched")
    $('html').toggleClass("dark")
    $('body').toggleClass("dark")
    $.post('/sessions/switch_color')
    return false
  $('.link .url').each ->
    console.log this
    cur_element = $(this)
    data =  cur_element.find(".tip").html()
    cur_element.qtip {
      content: "loading.."
      events: {
        render: (event,api) ->
         #console.log event.target
         #console.log this
         $(this).find(".ui-tooltip-content").html(data)
      },
      style: {
        classes: 'ui-tooltip-blue ui-tooltip-shadow'
      }
    }
