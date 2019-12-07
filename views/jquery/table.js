//code forked and adapted from here: https://github.com/mikhail-cct/CA1-In-class-Demo
function draw_table()
{
	$("#results").empty();
	$.getJSONuncached = function (url)
	{
		return $.ajax(
		{
			url: url,
			type: 'GET',
			cache: false,
			success: function (html)
			{
				$("#results").append(html);
				select_row();
			}
		});
	};
	$.getJSONuncached("/get/html")
};

function select_row()
{
	$("#listTable tbody tr[id]").click(function ()
	{
		$(".selected").removeClass("selected");
		$(this).addClass("selected");
        var theme = $(this).prevAll("tr").children("td[colspan='5']").length - 1;
        console.log(theme)
        var book = $(this).attr("id") - 1;
        console.log(book)
		delete_row(theme, book);
	})
};

function delete_row(thm, bk)
{
	$("#delete").click(function ()
	{
		$.ajax(
		{
			url: "/post/delete",
			type: "POST",
			data:
			{
				theme: thm,
				book_n: bk
			},
			cache: false,
			success: setTimeout(draw_table, 1000)
		})
	})
};

$(document).ready(function ()
{
	draw_table();
});