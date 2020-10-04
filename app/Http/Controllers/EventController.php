<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use App\Event;
use App\Location;
use App\Ticket;
use Validator;

class EventController extends Controller
{
    
    public function create(Request $request){

        $validator = Validator::make($request->all(),[
            'name'              => 'required',
            'id_location'       => 'required|numeric|exists:locations,id',
            'description'       => 'required',
            'ticket_sale_open'  => 'required|date_format:Y-m-d H:i|after_or_equal:today',
            'ticket_sale_close' => 'required|date_format:Y-m-d H:i|after:ticket_sale_open',
            'event_open_time'   => 'required|date_format:Y-m-d H:i|after:ticket_sale_close',
            'event_close_time'  => 'required|date_format:Y-m-d H:i|after:event_open_time',
            'event_image'       => 'required|mimes:jpeg,jpg,png'
        ]);

        if ($validator->fails()) {
            return parent::raiseError('400', $validator->messages());
        }
        $path = public_path() . '/eventImages/';
        $input_file = $request->file('event_image');
        $input_file_name = $input_file->getClientOriginalName();
        $input_extension = pathinfo($input_file_name, PATHINFO_EXTENSION);
        $original_name = pathinfo($input_file_name, PATHINFO_FILENAME);
        $new_name = $this->getImageNewName($original_name, $input_extension, $path);
        $request['event_image_url'] = $path;
        if ($request->file('event_image')->move($path, $new_name)) :
            $event                      = new Event;
            $event->name                = $request->name;
            $event->description         = $request->description;
            $event->id_location         = $request->id_location;
            $event->ticket_sale_open    = $request->ticket_sale_open;
            $event->ticket_sale_close   = $request->ticket_sale_close;
            $event->event_open_time     = $request->event_open_time;
            $event->event_close_time    = $request->event_close_time;
            $event->event_image_url     = $path.$new_name;
            $event->save();
            return parent::sendResponse([
                "success_code"       => "200",
                "success_message"    => "Event data created successfully"
            ]);
        endif;
    }

    public function getEvent($id = null){
        $event = Event::find($id);
        if(is_null($event)){
            return parent::raiseError('404', 'Event not found');
        }
        $event['location'] = Location::find($event->id_location);
        $event['tickets'] = Ticket::where('id_event',$event->id)->get();
        return parent::sendResponse([
            "success_code"     => "200",
            "data"             => $event
        ]);
    }

    public function getImageNewName($filename, $extension, $path)
    {
        if (!File::exists($path)) {
            File::makeDirectory($path, $mode = 0777, true, true);
        }

        $i = 1;
        $new_filename = $filename . '.' . $extension;

        while (File::exists($path . $new_filename)) {
            $new_filename = $filename . '_' . $i++ . '.' . $extension;
        }
        return $new_filename;
    }
}