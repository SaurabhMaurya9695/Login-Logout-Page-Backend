<%-- 
    Document   : signup
    Created on : 31-Jul-2022, 9:30:57 PM
    Author     : saurabhmaurya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--pasting Materialize CSS CDN-->
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background : url(img/new.jpg) ; background-size: cover ; background-attachment: fixed">
        <div class="container"  >  <!--set 70% of the width-->
            <div class ="row"> <!--create a 12 row grid -->
                <div class ="col m-6 offset-m3"> <!--create a 6 medium size row grid  && offset is used for off 3 grid-->
                    <div class="card" style="border-radius: 25px ; border: 2px solid black;">
                        <div class="card-content">  <!-- getting outer padding -->
                            <h4 style="margin-top : 10px ;" class ="center-align">Register here!!</h4>
                            <h6 id="msg" class="h5 center-align" > </h6>

                            <div class ="form center-align">
                                <!--for our form -->
                                <form action ="Register" method ="post" id="myform">
                                    <input type="text" placeholder="Enter your Name" name ="user_name"/>
                                    <input type="password" placeholder="Enter your password" name ="user_password"/>
                                    <input type="email" placeholder="Enter your email" name ="user_email"/>

                                    <div class="file-field input-field">
                                        <div  class="btn light-blue accent-4">
                                            <span>File</span>
                                            <input type="file" name ="image">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn  light-blue accent-4"> Submit </button>
                                    <button type="reset" class="btn  light-blue accent-4"> Reset </button>
                                </form>


                            </div>
                            <div class ="loder center-align" style = "margin-top: 10px; display: none ;"> 
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Please wait..</h5>


                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>


        <!--// to checking whether it is working or not-->
        <script>
            $(document).ready(function () {
                console.log("our function is ready.......");
                $("#myform").on('submit', function (event) {
                    event.preventDefault();
//                    var f = $(this).serialize(); this can be used when we are using data serialize from means text
                    let f = new FormData(this); // used in case of image
                    console.log(f);

                    $(".loder").show();
                    $(".form").hide();
                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POSt',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success ..........");
                            $(".loder").hide();
                            $(".form").show();
                            if (data.trim() == 'done')
                            {
                                $('#msg').html("Successful Registered!!");
                                $('#msg').addClass('green-text');
                            } else {
                                $('#msg').html("Something Went Wrong!!");
                                $('#msg').addClass('red-text');

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("Error ..........");
                            $(".loder").hide();
                            $(".form").show();
                            $('#msg').html("Something Went Wrong!!");
                            $('#msg').addClass('red-text');
                        },
                        processData : false,
                        contentType: false
                    })
                }) 
            })
        </script>

    </body>
</html>
