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

//$router->get('/', 'WelcomeController@index');

//$router->get('/home', 'HomeController@index');

$router->get('/cinemas',function(){
	//show available cinemas
	$results = DB::select('select id, name from cinemas where status="open"'); //select all query

	$results_per_page=(int)Input::get('results_per_page')?:5; //configurable, default 5

	$out['page']=(int)Input::get('page')?:1; //page 1 by default

	$out['pages']=ceil(count($results)/$results_per_page); //total number of pages

	$out['cinemas']=array_splice($results,($out['page']-1)*$results_per_page,$results_per_page); //remove unecessary results

	return response()->json($out);
});


$router->get('/cinemas/{name}',function($cinemaName){
	//show information about a particular cinema

	$results = DB::select('select * from cinemas where name=? limit 1',array($cinemaName));

	return response()->json($results);
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
