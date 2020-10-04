<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ticket;
use Validator;

class TicketController extends Controller
{
    
    public function create(Request $request){

        $validator = Validator::make($request->all(),[
            'id_event'   => 'required|numeric|exists:events,id',
            'name'       => 'required',
            'price'      => 'required|numeric',
            'quote'   => 'required|numeric',            
        ]);

        if ($validator->fails()) {
            return parent::raiseError('400', $validator->messages());
        }
        Ticket::insert($request->all());
        return parent::sendResponse([
            "success_code"       => "200",
            "success_message"    => "Ticket data created successfully"
        ]);
    }
}