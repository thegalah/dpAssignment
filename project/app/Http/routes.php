<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

$router->get('/', 'WelcomeController@index');

$router->get('/home', 'HomeController@index');

$router->get('/cinemas',function(){
	//show available cinemas
	return 'cinemas list';
});


$router->get('/cinemas/{name}',function($cinemaName){
	//show information about a particular cinema
	return 'cinema info';
});

$router->get('/movies/{name}',function($movieName){
	//show information for a particular movie
	return 'movie information';
});
/*
|--------------------------------------------------------------------------
| Authentication & Password Reset Controllers
|--------------------------------------------------------------------------
|
| These two controllers handle the authentication of the users of your
| application, as well as the functions necessary for resetting the
| passwords for your users. You may modify or remove these files.
|
*/

$router->controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
