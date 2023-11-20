<!DOCTYPE html>
<html>
<head>
 <title>Token Points Generate</title>
		 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />        
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link href="css/styles.css" rel="stylesheet" type="text/css" />
        <link rel="icon" href="../images/favicon.png" sizes="32x32" />
<link rel="icon" href="../images/favicon.png" sizes="192x192" />
 <link href="../css/styles.css" rel="stylesheet" type="text/css" />
</head>

<body style="background:-webkit-gradient(linear, 56% 86%, 52% 9%, from(#CFBEEA), to(#7EE6FF));">
	<div class="page-container">
            
            <div class="page-content page-content-default">

                <div class="block-login">
                    <div class="block-login-logo">
                        <a class="logo">Token Points Generate</a>
                    </div>                    
                    <div class="block-login-content">
                        <h1>Sign in</h1>
                        <g:if test='${flash.message}'>
				
					<p style="color:red"><strong> ${flash.message}
					</strong></p>
				
			</g:if>
                        <form class="m-login__form m-form" action='${postUrl}' method='POST'
				id='loginForm' autocomplete='off'>
				<div class="form-group has-feedback">
					<input autocomplete="off" name='j_username' type="text"
						id='username' class="form-control" placeholder="username">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="Password"
						name='j_password' id='password'> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					
					
					<div class="col-xs-6 col-xs-offset-3">
						<button id="submit" type="submit"
							class="btn btn-primary btn-block btn-flat"
							value='${message(code: "springSecurity.login.button")}'>Sign
							In</button>

					</div>
					<!-- /.col -->
				</div>
			</form>
                        <div class="sp"></div>

                                            

                        

                        
                       
                        <div class="text-center">
                            © All Rights Reserved by <a href="https://www.hiideals.com/" target="_blank">Hi-Ideals Technologies Pvt Ltd </a>
                        </div>
                    </div>
<div class="block-login-logo">
                        <a class="logo"><img src="../images/logo.png" width="120px"/></a>
                    </div> 
                </div>
                
            </div>
        </div>

	
	
</body>
</html>
