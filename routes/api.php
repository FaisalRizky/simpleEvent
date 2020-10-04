<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('location/create','LocationController@create');
Route::post('event/create','EventController@create');
Route::get('event/get_info/{id}','EventController@getEvent');
Route::post('transaction/purchase','TransactionController@purchase');
Route::post('ticket/create','TicketController@create');