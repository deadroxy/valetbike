const stationsPerPage = 4;

function getStations(page) {
  $.ajax({
    url: "/stations",
    data: { page: page, per_page: stationsPerPage },
    dataType: "html",
    success: function(data) {
      $("#stations-list").html(data);
    }
  });
}

$("#pagination").will_paginate({
  containerClass: "pagination",
  previousLabel: "&laquo;",
  nextLabel: "&raquo;",
  innerWindow: 2,
  outerWindow: 0,
  activeClassName: "active",
  ajax: {
    dataType: "html",
    beforeSend: function() {
      $("#stations-list").html("<div class='loading'>Loading...</div>");
    },
    success: function(data, textStatus, jqXHR) {
      $("#stations-list").html(data);
    }
  }
});

getStations(1);

$("#pagination").on("click", ".pagination a", function() {
  const page = $(this).attr("href").split("=")[1];
  getStations(page);
  return false;
});