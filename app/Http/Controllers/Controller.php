<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function sendResponse($result)
    {
        return response()->json([
                'status' => 1,
                'result' => $result
            ], 200);
    }

    public function raiseError($code, $message)
    {
        return response()->json([
                'status' => 0,
                'result' => array(
                    'error_code' => $code,
                    'error_message' => $message
                )
            ], 200);
    }

}
