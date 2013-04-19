<?php
$url = "http://example.com/postfixadmin/create-mailbox.php?domain=example.com";
function create_mailbox( $name ) {
    $mailbox = array(
        'fUsername' => $name,
        'fDomain' => 'example.com',
        'fPassword' => $name,
        'fPassword2' => $name,
        'fName' => '',
        'fActive' => 'on',
        'fMail' => 'on',
        'submit' => 'Add Mailbox',
    );
    $fields_string = '';
    foreach( $mailbox as $key => $value ) {
        $fields_string .= "{$key}={$value}&";
    }
    return rtrim( $fields_string, '&' );
}

for( $i = 0; $i < 50000; $i++ ) {
    $curl = curl_init();
    curl_setopt( $curl, CURLOPT_URL, $url );
    curl_setopt( $curl, CURLOPT_POST, true );
    curl_setopt( $curl, CURLOPT_COOKIE, "PHPSESSID=bp2b7ugicau7v4qi8npblof4a4" );
    curl_setopt( $curl, CURLOPT_POSTFIELDS, create_mailbox( "{$i}" ) );
    curl_exec( $curl );
    curl_close( $curl );
}
