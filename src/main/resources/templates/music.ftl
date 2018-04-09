<html>
<#include "partials/_header.ftl">
<link rel="stylesheet" href="APlayer.min.css">

<body>
<div class="container ">
    <h1 align="center" class="display-4 mb-5">QQ Music Top 50</h1>


    <h1 align="center" class="display-8 mb-1" id="title"></h1>

    <div style="margin: 25px auto; display: table;" >
        <audio  onended="next()" id="audio" controls>
            <source id="audioSource" src="" type="audio/mpeg">
            Your browser does not support the audio format.
        </audio>
    </div>


    <div id="aplayer"></div>

    <table id="table" class="table table-striped text-center" style="width:100%;">
        <thead>
        <tr>
            <th scope="col" >Title</th>
            <th scope="col">Author</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <#list 0..49 as i>
        <tr>
            <#--<th class="align-middle" scope="row">-->
                <#--<img height="100px" src="">-->
            <#--</th>-->
            <td class="align-middle">${songs.get(i).get("title")}</td>
            <td class="align-middle">${songs.get(i).get("author")}</td>
            <td class="align-middle">
                <a href="javascript:void(0)" id=${i} onclick="play(this)" data-src=${songs.get(i).get("url")} style="color: inherit"><i class="fas fa-play fa-lg"></i></a>
            </td>

        </tr>

        </#list>
        </tbody>
    </table>



</div>
<#include "partials/_footer.ftl">
<script src="APlayer.min.js"></script>

<script>
    function play(li) {
        document.getElementById("audioSource").src = li.getAttribute('data-src');
        var audio = document.getElementById('audio');

        audio.load(); //call this to just preload the audio without playing
        audio.play(); //call this to play the song right away
        var i = li.id;

        document.getElementById("title").innerHTML = $("tbody tr")[i].firstElementChild.innerHTML;
    }
    function next() {
        var id = Math.floor((Math.random() * 50));
        var song = document.getElementById(id);
        play(song);
    }
</script>
</body>
</html>