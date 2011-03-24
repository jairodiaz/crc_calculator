// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function logger (log_txt) {
    if (window.console != undefined) {
        console.log(log_txt);
    }
}

jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    logger('client calling /crc_calculators/calculate');
    $.post('/crc_calculators/calculate', $("#crc_calculators_form").serialize(), null, "script");
    return false;
  })
  return this;
};

$(document).ready(function() {
  $("#crc_calculators_form").submitWithAjax();
})

