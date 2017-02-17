<!-- Default HTML File for the Nginx and PHP-FPM-->
<html>
<head>
	<title>Welcome to Nginx Server</title>
</head>
<body>
	<center>
		<h1>Welcome to docker-centos-devops-phpmyadmin!</h1>
				
	</center>
		<pre>
			
FROM appsoa/docker-centos-base-php70
LABEL maintainer    = "Matthew Davis <matthew@appsoa.io>"
LABEL repository    = appsoa
LABEL image         = docker-centos-devops-phpmyadmin
LABEL built_at      = 0000-00-00 00:00:00

ENV VERSION=4.7.0-beta1
ENV URL=https://files.phpmyadmin.net/phpMyAdmin/$VERSION/phpMyAdmin-$VERSION-all-languages.zip

			
		</pre>

	<?php
		phpinfo();
	?>
</body>
</html>
