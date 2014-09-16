# examine iOS Page Cache behavior in iframe

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
 - even if you do location.reload() via JavaScript in /a context in your Mobile Safrai, you cannot make Page Cache refresh.
 - you can make Page Cache refreshed by reloading at outside of the iframe
  - you cannot make it refresh even if you set /b to src attribute of the iframe element (by neither accessing nor reloading)
