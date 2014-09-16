# Page Cache behavior of Mobile Safari in an iframe

- access /a with Mobile Safari
- tap link to move forward to /b
- check the time displayed in HTML (suppose it's 11:00:00 here)
- tap link to /c
 - if you do browser-back, you can see the time you checked before (and it's exactly what you expect)
- tap link to /a, and tap "enter iframe"
- now you can see another /a wrapped in the iframe
- tap link to /b
- you can see the refreshed time (suppose it's 11:08:02 here)
- tap link to /c
- now doing browser-back, you can see "11:00:00" in your HTML
 - even if you do location.reload() via JavaScript in /a context in your Mobile Safrai, you cannot make page-cache refresh.
 - you can make page-cache refreshed only by reloading at outside of the iframe
  - you cannot make it refresh even if you set /b to src attribute of the iframe element (by neither accessing nor reloading)

## Workaround

Adding hash or query parameter inside the iframe to change URL of the contents.

- Mobile Safari gets the fresh page cache when the first browser-back is given
- note that the page cache has never been refreshed inside iframe
 - page cache will be discarded after a while, or at the time when the browser process is killed

Adding no-store in Cache-Control field of HTTP Response Headers.

- no-store prevents browsers produce page-cache
- you can give no-store field to the page which you want to keep refresh especially.


## Assumption

Mobile Safari seems not to produce/refresh its page-cache inside an iframe.

Therefore, when you do browser-back inside the iframe,
Mobile Safari shows an old page cache which was produced when you accessed the page outside of the iframe.

If Mobile Safari doesn't have the page cache associated with the URL you've browser-backed,
the page has been loaded at that time and the page cache has been made at once.
But it has never been refreshed when you load the page again as long as you're inside the iframe.
