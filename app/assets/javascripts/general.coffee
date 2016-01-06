$ ->
  $(document).on "page:change", ->
    if $(".remove_fields")[0]
      $(".remove_fields")[0].click()

