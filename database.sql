/*
MySQL Backup
Source Server Version: 5.5.28
Source Database: laravelio_development
Date: 22/12/2012 15:34:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `laravel_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `laravel_migrations`;
CREATE TABLE `laravel_migrations` (
  `bundle` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`bundle`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tag_topic`
-- ----------------------------
DROP TABLE IF EXISTS `tag_topic`;
CREATE TABLE `tag_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `topics`
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topics_user_id_index` (`user_id`),
  KEY `topics_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `guest` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `twitter` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `laravel_migrations` VALUES ('application','2012_11_12_133047_add_topics_table','1'), ('application','2012_11_12_133305_add_users_table','1'), ('application','2012_11_13_130610_add_tags_tables','2'), ('application','2012_12_07_104114_add_twitter_field_to_users','3');
INSERT INTO `tags` VALUES ('1','Laravel 3.2','laravel-3-2','0000-00-00 00:00:00','0000-00-00 00:00:00'), ('2','Reverse-Routing','reverse-routing','0000-00-00 00:00:00','0000-00-00 00:00:00'), ('3','Controller Routing','controller-routing','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `tag_topic` VALUES ('1','1','2','0','0000-00-00 00:00:00','0000-00-00 00:00:00'), ('2','2','2','0','0000-00-00 00:00:00','0000-00-00 00:00:00'), ('3','3','2','0','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `topics` VALUES ('1','1','Introductions','Hi everyone! The good people of the #Laravel IRC channel came up with the idea to start a Laravel Study Group!\r\n\r\nWe’re exploring one discrete topic per day to increase our mastery of Laravel. Follow us here or at [http://twitter.com/laravelio](http://twitter.com/laravelio) and check every week day for our new topic.\r\n\r\nFeel free to recommend topics [here on the official Laravel forum thread](http://forums.laravel.com/viewtopic.php?id=3310).','1','2012-11-02 12:03:00','2012-11-02 12:03:00'), ('2','1','Reverse-Routing with Controller Actions','Reverse-routing is generating URLs based on route declarations. \r\n\r\nFor example the following route declaration tells Laravel to execute the action “register” in the controller “users” when the request’s URI is ‘register’.\r\n\r\n	// http://mysite.com/register\r\n	Route::any(‘register’, ‘users@register’);\r\n\r\nTraditionally, we may link to the registration page like this:\r\n\r\n	{{ HTML::link(‘register’, ‘Register Now!’) }}\r\n\r\nHowever, this has the unfortunate disadvantage of being dependent on our route declaration. If we change the route declaration to:\r\n\r\n	// http://mysite.com/signup\r\n	Route::any(‘signup’, ‘users@register’);\r\n\r\nThen our link will be wrong. We’ll have to go throughout our entire site and fix our links. Hope we don’t miss one!\r\n\r\nInstead, let’s use reverse-routing.\r\n\r\n	{{ HTML::link_to_action(‘users@register’, ‘Register Now!’) }}\r\n\r\nNow, the link that we generate will automatically change when we change our routing table. In our first example it’d generate http://mysite.com/register. Then, when we change the routes call to match our second example it’ll generate http://mysite.com/signup.\r\n\r\nReverse-routing can make your app not only more robust but easier to maintain. You’re often more familiar with your controllers and actions than your URLs.\r\n\r\n**Your Goal for the Day**\r\n\r\nUse URL::to_action(), Redirect::to_action(), or HTML::link_to_action() at least one time today. Implement it, change a route, and see how it reacts.\r\n\r\n**Required Reading**\r\n\r\n[Official Documentation](http://laravel.com/docs/urls#urls-to-controller-actions)\r\n\r\n[Laravel’s URL class’ to_action() method](https://github.com/laravel/laravel/blob/master/laravel/url.php#L153)\r\n\r\n[Laravel’s HTML class’ link_to_action() method](https://github.com/laravel/laravel/blob/master/laravel/html.php#L236)\r\n\r\n[Laravel’s Redirect class’ to_action() method](https://github.com/laravel/laravel/blob/master/laravel/redirect.php#L61)\r\n\r\n**Additional Resources**\r\n\r\n[Forum Post on Routing to Closures and Controller Actions as well as Reverse-Routing best-practices.](http://forums.laravel.com/viewtopic.php?pid=18549)\r\n\r\n[Screenr: Laravel 3 Controller Routing & Reverse Routing](http://www.screenr.com/oijs)','1','2012-11-02 13:07:00','2012-11-02 13:07:00'), ('3','1','Laravel\'s Helper Functions','Laravel comes stock with a collection of helper functions that are used to keep its code clean and expressive. We can use them for the same purpose in our own code.\r\n\r\n**Our Goal for the Day**\r\n\r\nRead the laravel/helpers.php file in its entirety. Understand each function and consider their potential use in your applications.\r\n\r\n**Required Reading**\r\n\r\n[Laravel\'s helpers.php](https://github.com/laravel/laravel/blob/develop/laravel/helpers.php)\r\n\r\n**Extracurricular Activity**\r\n\r\nSearch the Laravel codebase to see how each of the helper functions are used within Laravel itself.','1','2012-11-05 09:41:00','2012-11-05 09:41:00'), ('4','1','Laravel\'s Fluent Class - No, not the query-builder.','Today\'s topic is Laravel\'s Fluent class. We\'re not talking about the Fluent query-builder. \r\n\r\nFluent is defined as: _Able to express oneself easily and articulately: \"a fluent speaker and writer on technical subjects\"._\r\n\r\nIt should be of no surprise that the Fluent class is designed to make it easier to access data from an object or an array.\r\n\r\nStep 1) Use the Fluent class to \'wrap\' an object or array.\r\n\r\n	$my_thoughts = array(\'cats\' => \'sneezing\', \'dogs\' => \'pooing\');\r\n\r\n	$pets = new \\Laravel\\Fluent($my_thoughts);\r\n\r\nNow we can access the data using the new Fluent object.\r\n\r\n	echo $pets->cats;\r\n	echo $pets->dogs;\r\n\r\nOne benefit is that should you try:\r\n\r\n	echo $my_thoughts[\'snakes\'];\r\n\r\nYou\'ll get an \'undefined index\' error. With the Fluent class you will simply get null.\r\n\r\nYou also have the power of the array_get() helper that we learned yesterday!  As you know the array_get() helper allows you to use array dot notation to easily and cleanly retrieve data from arrays. For example, you can do the following:\r\n\r\n	$data = array(\'people\' => array(\'chrono\' => \'ordinary\', \'marle\' => \'princess\', \'lucca\' => \'smart\', \'frog\' => \'honorable\'));\r\n\r\n	$fluent = new \\Laravel\\Fluent($data);\r\n\r\n	// returns \'ordinary\'\r\n	echo $fluent->get(\'people.chrono\');\r\n\r\n	// returns NULL\r\n	echo $fluent->get(\'people.magus\');\r\n\r\n	// returning a default value: returns \"nobody knows, man\"\r\n	echo $fluent->get(\'people.schala\', \'nobody knows, man\');\r\n\r\nIn addition you can set values in interesting ways:\r\n\r\n	$fluent = new \\Laravel\\Fluent();\r\n	$fluent->name(\'Locke\');\r\n\r\n	// returns \'Locke\'\r\n	echo $fluent->name;\r\n\r\nIt\'s interesting how much functionality you can get from such a small class. This is also a great opportunity to learn more about PHP\'s magic methods. Marco Monteiro wrote a great guide on this topic. The link to this post can be found below under extracurricular activities.\r\n\r\n**Our Goal For the Day**\r\n\r\nCreate an object using Laravel\'s Fluent class then use and understand each function defined within the class (it\'s a very short class). Think about how you can use this class in your applications.\r\n\r\n**Required Reading**\r\n\r\n[Laravel\'s Fluent class](https://github.com/laravel/laravel/blob/master/laravel/fluent.php)\r\n\r\n**Extracurricular Activity**\r\n\r\nLearn and understand PHP\'s magic methods.\r\n\r\n[Official PHP Documentation on Magic Methods](http://php.net/manual/en/language.oop5.magic.php)\r\n\r\n[Marco Monteiro\'s Blog \"PHP Magic Methods - The Complete Guide\"](http://blog.marcomonteiro.net/post/33150811883/php-magic-methods)','1','2012-11-06 13:55:00','2012-11-06 13:55:00'), ('5','1','Registering and Generating Paths','Today\'s topic is Laravel\'s method of path generation.\r\n\r\nQuick Note: As an attempt to pace the study group a bit, I\'m going to try to use Tuesdays and Thursdays for more advanced topics and Mondays, Wednesdays, and Fridays for simpler topics.\r\n\r\nThe paths.php file that exists at the root of the Laravel installation defines environments, the directory separator, default paths, and the path functions. We\'ll go into environments in another topic. For now, it\'s Wednesday and we\'re focused on paths.\r\n\r\nThe paths that are set by default are app, sys, bundle, storage, and public. These correspond to the application, laravel, bundles, storage, and public folders in your Laravel installation. Path definitions are relative to the Laravel base installation directory (the directory that paths.php sits within).\r\n\r\nThe path functions defined in this file are path() and set_path(). They\'re pretty self-explanatory. path() allows you to retrieve a path, set_path() enables you to add one to the laravel paths global variable. Note that set_path() doesn\'t store anything long-term. A path added with set_path() will not exist in subsequent requests.\r\n\r\nAs you need more paths defined in your application you would add them here and utilize the path() function to access them across your app.\r\n\r\nWe want to think of paths.php as the definitive location to store our application\'s paths.\r\n\r\n**Our Goal for the Day**\r\n\r\nRead paths.php and pay attention to what path options are available. Consider how how we can register our own paths in paths.php and utilize path() throughout our site as a standard method of generating paths.\r\n\r\n**Required Reading**\r\n\r\n[paths.php](https://github.com/laravel/laravel/blob/master/paths.php), of course','1','2012-11-07 10:37:00','2012-11-07 10:37:00'), ('6','1','Laravel\'s Messages Class - It\'s Not Just for Validation Errors!','The Messages class is used for storing, returning, and formatting messages.\r\n\r\nYou may be already somewhat familiar with the functionality of this class because it\'s used for accessing validation errors in the view. But, it\'s a simple and powerful class with a wide variety of potential use-cases. \r\n\r\nAt the core of the Messages class is its $messages array. $messages is a multi-dimensional array that stores a list of messages under a key. For example, the \'password\' key might contain an array with the messages \'your passwords do not match\' and \'your password must be at least 5 characters\'.\r\n\r\nIt looks something like this (in pseudo whatever):\r\n\r\n	$messages[\'password\'] = array(\r\n		\'your passwords do not match\',\r\n		\'your password must be at least 5 characters\',\r\n	);\r\n\r\n**Adding Messages**\r\n\r\nThe Messages class\' add() method allows you to add values to the $messages array.\r\n\r\n**Checking for Messages**\r\n\r\nLike other Laravel classes, you can test whether or not the Messages class contains messages for a certain key with the has() method. \r\n\r\n**Returning Messages**\r\n\r\nThere are a few options for returning messages. \r\n\r\nThe first() method returns the first message available for a key. If the key password has the 2 messages that we listed above then $messages->first(\'password\') method would return \"your passwords do not match\".\r\n\r\nThe get() method retuns all of the messages available for a key as an array.\r\n\r\nThe all() method returns all of the messages for each and every key.\r\n\r\n**Formatting Messages**\r\n\r\nYou\'ll notice that the retrieval methods all accept \'format\' parameters. This is a wonderful feature that you\'ll be using a lot. By passing a format string you can easily format messages into the form that you need, cleaning up your code quite a bit. \r\n\r\nImagine that we\'re in a form and we want to show the most relevant error for the password field. (Since the $errors object available within views is an instance of the message class, you can do this right out of the gate already!)\r\n\r\n	{{ Form::password(\'password\') }}\r\n	{{ $errors->first(\'password\', \'<span class=\"error\">:message</span>\') }}\r\n\r\nIn the case of our example this will output: \r\n\r\n	<span class=\"error\">your passwords do not match</span>\r\n\r\nHow useful is that!\r\n\r\n**Our Goal for the Day**\r\n\r\nToday we want to really master the Messages class. It\'s a short and simple class with a wide array of potential use cases. Many of us are probably using our own home-grown solutions where we could be simplifying our lives by using Laravel\'s Messages class.\r\n\r\nIn addition, we want to truly understand how the validator uses the Messages class for errors and how Laravel\'s view class creates an instance of the Messages class to make errors available in the view. In this way we can better handle passing errors, etc to our views using this built-in functionality.\r\n\r\nCreate something like:\r\n\r\n	Route::get(\'test\', function()\r\n	{\r\n		$messages = new \\Laravel\\Messages;\r\n\r\n		// do cool stuff here\r\n	});\r\n\r\nUse and really get to know the functionality of the Messages class.\r\n\r\n**Required Reading**\r\n\r\n[Laravel\'s Messages class](https://github.com/laravel/laravel/blob/master/laravel/messages.php)\r\n\r\n[Laravel\'s Validator class](https://github.com/laravel/laravel/blob/master/laravel/validator.php#L220) (focus on use of the Messages class)\r\n\r\n[Laravel\'s View class](https://github.com/laravel/laravel/blob/master/laravel/view.php#L103) (focus on use of the Messages class)\r\n\r\n**Extracurricular Activity**\r\n\r\nEverything is super important today. So, it\'s all \'required\'. ','1','2012-11-08 08:46:00','2012-11-08 08:46:00'), ('7','1','Getting Information about a Route','Today\'s topic is over accessing information about the current route.\r\n\r\nGaining this information is easy enough, take a look at this example:\r\n\r\n	Route::get(\'test\', function()\r\n	{\r\n		dd(Request::route());\r\n	});\r\n\r\nAs you no doubt remember from our \'helpers\' topic dd() is a shortcut for die(var_dump($variable)); and it\'s super useful.\r\n\r\nWhen we run this we get the following result:\r\n\r\n	object(Laravel\\Routing\\Route)#30 (7) {\r\n	  [\"uri\"]=>\r\n	  string(4) \"test\"\r\n	  [\"method\"]=>\r\n	  string(3) \"GET\"\r\n	  [\"bundle\"]=>\r\n	  string(11) \"application\"\r\n	  [\"controller\"]=>\r\n	  NULL\r\n	  [\"controller_action\"]=>\r\n	  NULL\r\n	  [\"action\"]=>\r\n	  array(2) {\r\n	    [0]=>\r\n	    object(Closure)#19 (0) {\r\n	    }\r\n	    [\"https\"]=>\r\n	    bool(false)\r\n	  }\r\n	  [\"parameters\"]=>\r\n	  array(0) {\r\n	  }\r\n	}\r\n\r\nThis isn\'t terribly useful, but let\'s take a look at what we get when we run it within a controller:\r\n\r\n	object(Laravel\\Routing\\Route)#30 (7) {\r\n	  [\"uri\"]=>\r\n	  string(13) \"login/(:all?)\"\r\n	  [\"method\"]=>\r\n	  string(3) \"GET\"\r\n	  [\"bundle\"]=>\r\n	  string(11) \"application\"\r\n	  [\"controller\"]=>\r\n	  string(4) \"auth\"\r\n	  [\"controller_action\"]=>\r\n	  string(5) \"login\"\r\n	  [\"action\"]=>\r\n	  array(2) {\r\n	    [\"uses\"]=>\r\n	    string(10) \"auth@login\"\r\n	    [\"https\"]=>\r\n	    bool(false)\r\n	  }\r\n	  [\"parameters\"]=>\r\n	  array(0) {\r\n	  }\r\n	}\r\n\r\nThis is much more useful! As you can see I accessed this request with http://whatever.com/login and it\'s calling the \'login\' action in the \'auth\' controller. Let\'s check out an example with parameters.\r\n\r\n	object(Laravel\\Routing\\Route)#30 (7) {\r\n	  [\"uri\"]=>\r\n	  string(14) \"search/(:all?)\"\r\n	  [\"method\"]=>\r\n	  string(3) \"GET\"\r\n	  [\"bundle\"]=>\r\n	  string(11) \"application\"\r\n	  [\"controller\"]=>\r\n	  string(6) \"search\"\r\n	  [\"controller_action\"]=>\r\n	  string(5) \"index\"\r\n	  [\"action\"]=>\r\n	  array(3) {\r\n	    [\"uses\"]=>\r\n	    string(12) \"search@index\"\r\n	    [\"before\"]=>\r\n	    string(4) \"auth\"\r\n	    [\"https\"]=>\r\n	    bool(false)\r\n	  }\r\n	  [\"parameters\"]=>\r\n	  array(1) {\r\n	    [0]=>\r\n	    string(5) \"shawn\"\r\n	  }\r\n	}\r\n\r\nIn this example I accessed http://whatever.com/search/shawn.\r\n\r\nThis is all super handy information... But, check this out... you can use the \'uses\' and \'parameters\' to generate URLs.\r\n\r\n	$uses       = Request::route()->action[\'uses\'];\r\n	$parameters = Request::route()->parameters;\r\n\r\n	return Redirect::to_action($uses, $parameters);\r\n\r\nIn this way we can know what action we\'re trying to run as well as our parameters, then we can generate new URLs based on this information. One way in which I use this is to store the action and parameters in session when an auth filter forces a user to the login page. Upon successful logic I\'ll check to see if these variables are in session and generate a Redirect::to_action() to take them post-login to where they intended to go.\r\n\r\n**Our Goal for the Day**\r\n\r\nToday is an easy one. Check out the kind of info available in Request::route() for various locations in one of your applications and get a good grasp on what you can use it for.\r\n\r\n**Required Reading**\r\n\r\n[laravel/laravel.php](https://github.com/laravel/laravel/blob/master/laravel/laravel.php#L152), where the route is assigned\r\n\r\n[routing/router.php](https://github.com/laravel/laravel/blob/master/laravel/routing/router.php#L449), where routing information is distilled from a method and URI\r\n\r\n**Extracurricular Activities**\r\n\r\nGet down and dirty with routing/router.php\'s route() function. Seriously, check it out. You\'ll be impressed. For example:\r\n\r\n	dd(Router::route(\'GET\', \'login\'));\r\n\r\nI know, right?','1','2012-11-09 09:44:00','2012-11-09 09:44:00'), ('8','1','Naming Attributes for Validation Messages','Today\'s topic is over setting attribute display names for validation messages.\r\n\r\nLet\'s say that we have the following form:\r\n\r\n	{{ Form::open() }}\r\n\r\n	Email: {{ Form::text(\'email\', Input::old(\'email\')) }}<br/>\r\n	{{ $errors->first(\'email\', \'<span class=\"error\">:message</span>\') }}<br/>\r\n\r\n	Password: {{ Form::password(\'password\') }}<br/>\r\n	{{ $errors->first(\'password\', \'<span class=\"error\">:message</span>\') }}<br/>\r\n\r\n	{{ Form::submit(\'Login\') }}\r\n\r\n	{{ Form::close() }}\r\n\r\nAnd our validation looks something like this:\r\n\r\n	$rules = array(\r\n		\'email\' => \'required\',\r\n	);\r\n\r\n	$validation = new Validator(Input::all(), $rules);\r\n\r\n	if(!$validation->passes())\r\n	{\r\n		return Redirect::back()->with_input()->with_errors($validation);\r\n	}\r\n\r\nIf we post our form without an email address we\'ll get the error, \"The email field is required.\" That\'s not so bad. But, what if we wanted to change the message to something like.. \"The E-mail address field is required.\"? Well, we COULD make a custom validation message. But, that may be a bit of overkill for what we\'re wanting to do as we\'ll have to make custom validation messages for every rule assigned to the \'email\' field.\r\n\r\nInstead we can load up our trusty language file and change how the email field is returned in validator error messages.\r\n\r\nBy default we use English and therefore we will load up [application/language/en/validation.php](https://github.com/laravel/laravel/blob/master/application/language/en/validation.php#L87). At the bottom we see the attributes array.\r\n\r\n	/*\r\n	|--------------------------------------------------------------------------\r\n	| Validation Attributes\r\n	|--------------------------------------------------------------------------\r\n	|\r\n	| The following language lines are used to swap attribute place-holders\r\n	| with something more reader friendly such as \"E-Mail Address\" instead\r\n	| of \"email\". Your users will thank you.\r\n	|\r\n	| The Validator class will automatically search this array of lines it\r\n	| is attempting to replace the :attribute place-holder in messages.\r\n	| It\'s pretty slick. We think you\'ll like it.\r\n	|\r\n	*/\r\n\r\n	\'attributes\' => array(),\r\n\r\nThis array can be used as a hash for field names and their equivalent display name. Let\'s change the array to...\r\n\r\n	\'attributes\' => array(\r\n		\'email\' => \'E-mail Address\',\r\n	),\r\n\r\n... and run the validation again. Now, we get back the error, \"The E-mail Address field is required.\"\r\n\r\nIn this way we can set our attributes\' display names for various languages and prevent the need to create a plethora of custom validator messages.\r\n\r\n**Our Goal for the Day**\r\n\r\nIt\'s Monday, relax and transition back into work.\r\n\r\n**Required Reading**\r\n\r\nJust what you\'ve already read of this post.\r\n\r\n**Extracurricular Activity**\r\n\r\nRead over the [message() method in laravel/validator.php](https://github.com/laravel/laravel/blob/master/laravel/validator.php#L761) to see how the validator constructs messages.','1','2012-11-12 09:52:00','2012-11-12 09:52:00'), ('9','1','The Lifecycle of a Laravel Request Part 1','Today we\'re going to BEGIN looking into the lifecycle of a Laravel request.\r\n\r\nLaravel 3 is bootstrapped primarily by 3 files. public/index.php, laravel/laravel.php and laravel/core.php.\r\n\r\nWhen a request first hits your server it is likely to hit a .htaccess file (in most cases) and the request will be received by public/index.php.\r\n\r\nLet\'s start by looking at public/index.php:\r\n\r\n	/**\r\n	 * Laravel - A PHP Framework For Web Artisans\r\n	 *\r\n	 * @package  Laravel\r\n	 * @version  3.2.12\r\n	 * @author   Taylor Otwell <taylorotwell@gmail.com>\r\n	 * @link     http://laravel.com\r\n	 */\r\n\r\n	// --------------------------------------------------------------\r\n	// Tick... Tock... Tick... Tock...\r\n	// --------------------------------------------------------------\r\n	define(\'LARAVEL_START\', microtime(true));\r\n\r\n	// --------------------------------------------------------------\r\n	// Indicate that the request is from the web.\r\n	// --------------------------------------------------------------\r\n	$web = true;\r\n\r\n	// --------------------------------------------------------------\r\n	// Set the core Laravel path constants.\r\n	// --------------------------------------------------------------\r\n	require \'../paths.php\';\r\n\r\n	// --------------------------------------------------------------\r\n	// Unset the temporary web variable.\r\n	// --------------------------------------------------------------\r\n	unset($web);\r\n\r\n	// --------------------------------------------------------------\r\n	// Launch Laravel.\r\n	// --------------------------------------------------------------\r\n	require path(\'sys\').\'laravel.php\';\r\n\r\nAs you can see here the request begins with setting a timestamp. This will be used for profiling the request. Next, we register the paths for our application. We\'re familiar with the paths.php file from a previous study on registering and generating paths. Finally, index.php includes laravel/laravel.php. \r\n\r\nAs you can imagine from the name, laravel.php is a critical part of our request\'s lifecycle. However, as going over the entire cycle in one post is not possible, we\'ll start by focusing on laravel.php\'s first action.. including laravel/core.php. In the next installment of this series we\'ll continue with the rest laravel/laravel.php.\r\n\r\n**laravel/core.php** handles the following things in the following order:\r\n\r\n1. **registers various constants** that Laravel will be using for handling the rest of the request, (EXT, CRLF, BLADE_EXT, DEFAULT_BUNDLE, MB_STRING)\r\n2. **begins output buffering**, this prevents output from causing redirection failures, etc\r\n3. **loads some core classes**, ioc, event, bundle, config, the autoloader and the helper functions\r\n4. **registers the framework autoloader** with spl_autoload_register()\r\n5. **registers the Laravel namespace** with the autoloader so that classes loaded with \\Laravel\\<whatever> will be autoloaded from the laravel/ folder\r\n6. **registers Eloquent relationship classes** with the autoloader since they use non-standard naming conventions\r\n7. **registers Symfony components** that Laravel uses with the autoloader \r\n8. if magic_quotes are enabled, **strip slashes from input arrays** $_GET, $_POST, $_COOKIE and $_REQUEST\r\n9. at this point Laravel **instantiates the HTTPFoundation abstraction layer**\r\n10. then, we **determine and set the application environment** variable either from the artisan command-line option or from detecting the environment from the URL\r\n11. **register any artisan CLI arguments in the $_SERVER array** should the artisan command line utility be used to create this request\r\n12. finally, **core.php registers all of the bundles from bundles.php**. these won\'t be started yet.\r\n\r\nWith these tasks completed, we\'re ready to procede with the rest of laravel/laravel.php. We\'ll be going over it in the next installment of this series (day after tommorrow).\r\n\r\n**Our Goal for the Day**\r\n\r\nWe want to get a good idea about how Laravel starts up and gets going. This will enable us to more easily troubleshoot problems and empower us to better understand what a framework must do to get started. We\'re generally intimately familiar with the middle and end of a framework\'s processing, but we often overlook the beginning.\r\n\r\n**Required Reading**\r\n\r\n[public/index.php](https://github.com/laravel/laravel/blob/master/public/index.php) Where the request lands.\r\n\r\n[laravel/laravel.php](https://github.com/laravel/laravel/blob/master/laravel/laravel.php) We just need to read up to the first action (which is including core.php).\r\n\r\n[laravel/core.php](https://github.com/laravel/laravel/blob/master/laravel/core.php) Read this file thoroughly and understand everything about it. If you have questions feel free to post them below in the comments.\r\n\r\n**Extracurricular Activity**\r\n\r\nAs if today\'s topic isn\'t expansive enough?','1','2012-11-13 12:58:00','2012-11-13 12:58:00'), ('10','1','The Laravel View Class','Today\'s topic is the Laravel View class.\r\n\r\nHere\'s a class that we\'re using very regularly. Actually, the only time that we\'re not using it is when we\'re writing an API. Still, how much functionality is packed inside the class that we never knew about?\r\n\r\nToday\'s topic is short because there\'s not so much to talk about as much as there is something to do. It\'s time to reach out and take control of one of the most commonly used classes in the framework.\r\n\r\nWhen reading through the class pay special attention to the data that the constructor takes and what it does with it, how the view generates the $errors variable, and the many useful functions such as exists(), file(), of(), name(), render(), etc.\r\n\r\nLet\'s make today the last day that we don\'t have mastery over our View class.\r\n\r\n**Required Reading**\r\n\r\n[The Laravel View class](https://github.com/laravel/laravel/blob/master/laravel/view.php)\r\n\r\n**Extracurricular Activities**\r\n\r\nTo better beat the information into our heads we can work up a test and use the various methods that we never knew about.','1','2012-11-14 16:35:00','2012-11-14 16:35:00'), ('11','1','The Lifecycle of a Laravel Request Part 2','Today we\'re going to finish learning the basics of the Laravel request lifecycle.\r\n\r\nLast time we read the public/index.php file and the laravel/core.php file. Today we\'ll continue by finishing laravel/laravel.php. \r\n\r\nAfter laravel/core.php is loaded laravel/laravel.php will handle the following tasks:\r\n\r\n1. setup error and exception handlers\r\n2. temporarily enable all php errors\r\n3. start the default bundle (your application folder)\r\n4. register a catch-all route. if your application or bundle\'s routes don\'t respond to a request, the catch-all will and it returns a 404\r\n5. grab the language information from config and set the current language based on the uri\r\n6. finally Laravel requests the route information from the router and calls the routed code, capturing the response into a variable\r\n7. the response is then rendered to a string from the response object\r\n8. the session is then saved using the chosen session driver\r\n9. finally, the laravel.done event is fired and passed the response object \r\n\r\n**Our Goal for the Day**\r\n\r\nIt\'s all pretty straight-forward here. But, we need to read the code and understand what it\'s doing so that we can leverage this knowledge going forward. Today\'s topic completes our reading of public/index.php, laravel/laravel.php, and laravel/core.php.\r\n\r\nPost any questions in the comments below.\r\n\r\n**Required Reading**\r\n\r\n[laravel/laravel.php](https://github.com/laravel/laravel/blob/master/laravel/laravel.php)','1','2012-11-15 11:22:00','2012-11-15 11:22:00'), ('12','1','Contributing to the Laravel Project','I apologize but I\'m sick so today\'s topic is going to be short. \r\n\r\nBy contributing to Laravel you can help fix bugs and improve the framework for all.\r\n\r\nLaravel has some contribution guidelines that can be found in [CONTRIBUTING.md](https://github.com/laravel/laravel/blob/master/CONTRIBUTING.md). Give these a read and if you ever spot a bug or something that you\'d like to see improved (especially documentation) then consider contributing.\r\n\r\n# Pull request guidelines\r\n\r\n[GitHub pull requests](https://help.github.com/articles/using-pull-requests) are a great way for everyone in the community to contribute to the Laravel codebase. Found a bug? Just fix it in your fork and submit a pull request. This will then be reviewed, and, if found as good, merged into the main repository.\r\n\r\nIn order to keep the codebase clean, stable and at high quality, even with so many people contributing, some guidelines are necessary for high-quality pull requests:\r\n\r\n- **Branch:** Unless they are immediate documentation fixes relevant for old versions, pull requests should be sent to the \'develop\' branch only. Make sure to select that branch as target when creating the pull request (GitHub will not automatically select it.)\r\n- **Documentation:** If you are adding a new feature or changing the API in any relevant way, this should be documented. The documentation files can be found directly in the core repository.\r\n- **Unit tests:** To keep old bugs from re-appearing and generally hold quality at a high level, the Laravel core is thoroughly unit-tested. Thus, when you create a pull request, it is expected that you unit test any new code you add. For any bug you fix, you should also add regression tests to make sure the bug will never appear again. If you are unsure about how to write tests, the core team or other contributors will gladly help.','1','2012-11-16 15:56:00','2012-11-16 15:56:00');
INSERT INTO `users` VALUES ('1','Shawn McCool','shawn@heybigname.com','0','2012-11-12 14:48:37','2012-11-12 14:48:39','shawnmccool');
