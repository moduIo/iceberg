# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.add_fields').on 'click', ->
    skillCategoryInterval = setInterval ->
      if $(".skill_category_select_form").length
        $(".skill_category_select_form").change ->
          $correspondingSkillSelect = $(this).parent("div").parent("div").next()
            .children("div").children("select")
          $correspondingSkillSelect.html("")
          if $(this).val() >= 0
            optionValue = $(this).val()
            i = 0
            while i < gon.skills.length
              if Number gon.skills[i].skill_category_id == Number optionValue
                $correspondingSkillSelect.append($('<option/>', {
                  value: gon.skills[i].id
                  text: gon.skills[i].skill
                }))
              i++
        .change()
        clearInterval(skillCategoryInterval)
    , 50
