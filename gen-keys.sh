#!/bin/bash

echo '<?php' > wordpress/keys.php
curl -s  https://api.wordpress.org/secret-key/1.1/salt/ >> wordpress/keys.php
