<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ticket;
use App\Transaction;
use App\DetailTransaction;
use App\User;
use Validator;

class TransactionController extends Controller
{
    
    public function purchase(Request $request){

        $validator = Validator::make($request->all(),[
            'id_user'             => 'required|exists:users,id',
            'id_event'            => 'required|numeric|exists:events,id',
            'tickets'             => 'required',
            'tickets.*.ticket_id' => 'required|numeric|exists:tickets,id',
            'tickets.*.quote'  => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return parent::raiseError('400', $validator->messages());
        }

        \DB::beginTransaction();
        try {
            $last = \DB::table('transactions')->latest('id')->first();
            $totalPrice = 0;
            foreach($request->tickets as $ticket){
                $ticketData = Ticket::find($ticket['ticket_id']);
                if($request->id_event != $ticketData->id_event){
                    throw new \Exception("Opps Not Valid Ticket");
                }
                if($ticket['quote'] > $ticketData->available_stock) {
                    throw new \Exception("Opps Ticket Out of Stock");
                }
                $totalPrice += $ticketData->price * $ticket['quote'];
                //Save Detail Transactions
                $detailTransaction = new DetailTransaction();
                $detailTransaction->id_ticket = $ticket['ticket_id'];
                $detailTransaction->id_transaction = $last ? $last->id+1 : 1;
                $detailTransaction->quote = $ticket['quote'];
                $detailTransaction->price_per_ticket = $ticketData->price;
                $detailTransaction->save();
                
                //Update quote
                $ticketData->available_stock = $ticketData->available_stock - $ticket['quote'];
                $ticketData->update();        
            }
            //Save Transactions
            $transaction = new Transaction();
            $transaction->id_user = $request->id_user;
            $transaction->id_event = $request->id_event;
            $transaction->total_price = $totalPrice;
            $transaction->save();
            \DB::commit();
        } catch (\Exception $error) {
            \DB::rollback();
            return parent::raiseError('500', $error->getMessage());
        }
            return parent::sendResponse([
                "success_code"       => "200",
                "success_message"    => "Purchasing Ticket successfully"
            ]);
    }

    public function getInfo($id)
    {
        $transaction = Transaction::find($id);
        if(is_null($transaction)){
            return parent::raiseError('404', 'Transaction not found');
        }
        $transaction['detail_transaction'] = DetailTransaction::select('detail_transactions.id', 't.name as ticket_name', 'detail_transactions.price_per_ticket', 'detail_transactions.quote as quantity')
                                             ->leftjoin('tickets as t', 't.id', '=', 'detail_transactions.id_ticket')
                                             ->where('detail_transactions.id_transaction', $id)
                                             ->get();
        return parent::sendResponse([
            "success_code"     => "200",
            "data"             => $transaction
        ]);
    }
}