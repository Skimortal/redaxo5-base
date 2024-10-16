<?php 

rex_yrewrite::addDomain(new rex_yrewrite_domain("localhost:8080", "http", "/", 0, 1, 2, null, 1, "%T / %SN", "", "User-agent: *
Disallow:", false,1,0,0,false));