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

	$rpp=(int)Input::get('results_per_page')?:5; //configurable, default 5

	$out['page']=(int)Input::get('page')?:1; //page 1 by default

	$out['pages']=ceil(count($results)/$rpp); //total number of pages

	$out['results']=array_splice($results,($out['page']-1)*$rpp,$rpp); //remove unecessary results

	return response()->json($out);
});


$router->get('/cinemas/{name}',function($cinemaName){
	//show information about a particular cinema

	$results = DB::select('select * from cinemas where name=?',array($cinemaName));

	return response()->json($results);
});

$router->get('/movies/{name}',function($movieName){
	//show information for a particular movie

	$results = DB::select('select * from movies where name=?',array($movieName));

	return response()->json($results);
});

$router->get('/movies/sessions/{name}',function($movieName){
	//shows all upcoming sessions for a particular movie

	$results = DB::select('SELECT movies.name,movies.duration, movies.rating,session_times.time_start, cinemas.name as cinema,cinemas.address FROM session_times left join movies on movies.id=session_times.movie_id left join cinemas on session_times.cinema_id=cinemas.id where time_start>now() and movies.name=?;',array($movieName));

	$rpp=(int)Input::get('results_per_page')?:5; //configurable, default 5

	$out['page']=(int)Input::get('page')?:1; //page 1 by default

	$out['pages']=ceil(count($results)/$rpp); //total number of pages

	$out['results']=array_splice($results,($out['page']-1)*$rpp,$rpp); //remove unecessary 

	return response()->json($out);
});

$router->get('/upcoming',function(){
	//show all upcoming movie sessions

	$results = DB::select('SELECT movies.name,movies.duration, movies.rating,session_times.time_start, cinemas.name as cinema,cinemas.address FROM session_times left join movies on movies.id=session_times.movie_id left join cinemas on session_times.cinema_id=cinemas.id where time_start>now();');

	$rpp=(int)Input::get('results_per_page')?:5; //configurable, default 5

	$out['page']=(int)Input::get('page')?:1; //page 1 by default

	$out['pages']=ceil(count($results)/$rpp); //total number of pages

	$out['results']=array_splice($results,($out['page']-1)*$rpp,$rpp); //remove unecessary 

	return response()->json($out);
});

$router->get('/past',function(){
	//show all past movie sessions

	$results = DB::select('SELECT movies.name,movies.duration, movies.rating,session_times.time_start, cinemas.name as cinema,cinemas.address FROM session_times left join movies on movies.id=session_times.movie_id left join cinemas on session_times.cinema_id=cinemas.id where time_start<now();');

	$rpp=(int)Input::get('results_per_page')?:5; //configurable, default 5

	$out['page']=(int)Input::get('page')?:1; //page 1 by default

	$out['pages']=ceil(count($results)/$rpp); //total number of pages

	$out['results']=array_splice($results,($out['page']-1)*$rpp,$rpp); //remove unecessary 

	return response()->json($out);
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
