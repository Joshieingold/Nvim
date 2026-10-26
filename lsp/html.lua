-- HTML completion/hover. Also attached to Razor and JSP so markup gets tag and
-- attribute completion. Caveat: the HTML server knows nothing about C#/Java, so
-- it can occasionally produce noise inside @code { } blocks or <% %> scriptlets.
-- If that bothers you, remove "razor" and/or "jsp" below.
return {
	filetypes = { "html", "razor", "jsp" },
}
