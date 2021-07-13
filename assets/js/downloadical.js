function download(filename, text) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);

    element.style.display = 'none';
    document.body.appendChild(element);

    element.click();

    document.body.removeChild(element);
}

// Start file download.
document.getElementById("download-ical-btn").addEventListener("click", function(){
    // Generate download of a calender file with some content
    var sumry = document.getElementById("summary").value;
    var locn = document.getElementById("location").value;
    var sdate = document.getElementById("startdate").value;
    var edate = document.getElementById("enddate").value;
    var stime = document.getElementById("starttime").value;
    var etime = document.getElementById("endtime").value;
    var st = new Date(sdate + "T" + stime);
    var en = new Date(edate + "T" + etime);
    var stout = st.toISOString();
    stout = stout.replace(/-/gi,'');
    stout = stout.replace(/:/gi,'');
    stout = stout.replace(/\.000Z/gi,'Z');
    var enout = en.toISOString();
    enout = enout.replace(/-/gi,'');
    enout = enout.replace(/:/gi,'');
    enout = enout.replace(/\.000Z/gi,'Z');
    var text = "BEGIN:VCALENDAR\n"+
               "VERSION:2.0\n"+
               "BEGIN:VEVENT\n"+
               "SUMMARY:"+sumry+"\n"+
               "DTSTART:"+stout+"\n"+
               "DTEND:"+enout+"\n"+
               "LOCATION:"+locn+"\n"+
               "END:VEVENT\n"+
               "END:VCALENDAR"
    var filename = "calender.ics";
    
    download(filename, text);
}, false);

