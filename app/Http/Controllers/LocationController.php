<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;
use Validator;

class LocationController extends Controller
{
    
    public function create(Request $request){

        $validator = Validator::make($request->all(),[
            'location_detail'   => 'required',
            'id_city'           => 'required|numeric|exists:city,id',
        ]);

        if ($validator->fails()) {
            return parent::raiseError('400', $validator->messages());
        }
        Location::insert($request->all());
        return parent::sendResponse([
            "success_code"       => "200",
            "success_message"    => "Location data created successfully"
        ]);
    }
}