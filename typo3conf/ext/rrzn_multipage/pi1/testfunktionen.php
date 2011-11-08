#!/usr/bin/php4
<?php

function show_dir($dir, $pos=2)
{
    if($pos == 2)
    {
        echo "<hr><pre>";
    }

    $handle = @opendir($dir);
    while ($file = @readdir ($handle))
    {
        if (eregi("^\.{1,2}$",$file))
        {
            continue;
        }

        if(is_dir($dir.$file))
        {
            printf ("% ".$pos."s <b>%s</b>\n", "|-", $file);
            show_dir($dir.$file."/", $pos + 3);
        }
        else
        {
            printf ("% ".$pos."s %s\n", "|-", $file);
        }
    }
    @closedir($handle);

    if($pos == 2)
    {
        echo "</pre><hr>";
    }

}


function writeInArray(&$array, $key, $val)   {
	     // return false if first param isn't an array
	     if (!is_array($array))
	       return false;
	
	     // return false if second arg is an integer
	     if (is_int($key))
	       return false;
	
	     foreach ($array as $k => $v) {
	       if ($k === $key) {
	         if (is_array($v)) {
	           array_push($array[$k], $val);
	         } else {
	           $array[$k] = array($v, $val);
	         }
	         break;
	       } elseif (is_array($v)) {
	         
	       	// Try to do it here
	       	writeInArray($array[$k], $key, $val);       
	         
	       }
	     }

     return true;
   }
   
//show_dir("/var/www/lokal/");

  function foo($pid, $levels)  { // WICHTIG: $level must be called by value !

  		 if(($levels--) < 0) return(FALSE);  // Abbruch, wenn zu tief
         $result = (array());
         $test = array(
         				'0' => array (
        						'Titel' => 'Ein Titel',
         						'dummy' => 'dummy',
         						),
         				'1' => array (
         						'Titel' => 'Ein Titel 2',
         						'dummy'	=> 'dummy 2',
         						),
         				);
         foreach($children = ($childof($pid)) as $index => $child)
         //foreach($test as $index => $child)
         {
                 if( $tmp = (foo($child, $levels)))
                 {
                       $result[$index] = ($child);
                 }
         }
         if(count($result)) return($result);
         return(FALSE);
  }
  
  
  function null23() {
     	  $nested = array(
     	  				0=> 'Null', 
                        array(
                        	1=>'Eins',
                        	'Zwei',
                        	'Drei',
                        	40 => 'Vier'
                        	),
                        array(
                        	123=>'Fuenf',
                        	'Sechs',
                             array(
                             	1=>'Sieben'
                             	),
                             array(
                             	8=>'Acht',
                             	'Neun',
                                array(
                                	9=>'neu-komma-null',
                                	'neu-komma-eins',
                                	'neu-komma-zwei',
                                	'neu-komma-fuenf'
                                	),
                                'Zehn'
                                ),
                        ),
                        array(
                        	'Elf',
                        	'Zwoelf'
                        	),
                       	'Dreizehn',
                        array(
                        	2=>'Vierzehn',
                        	'Fuenfzehn'
                        	),
                        'Sechzehn',
                        'Siebzehn',
                        array(
                        	'Achzehn',
                        	'Neunzehn'
                        	),
                        20=>'Zwanzig'
                        );
		print_r($nested);
  	
  }
 
  //foo('1', 3);
  null23();
   
?>