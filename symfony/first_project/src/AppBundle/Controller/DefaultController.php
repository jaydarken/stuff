<?php

namespace AppBundle\Controller;

use AppBundle\Data\Orders;
use AppBundle\Util\Order\Calculator;
use AppBundle\Util\PDF\PDFRenderer;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $name = "R-jay";
        // replace this example code with whatever you need
        return $this->render('AppBundle::default/index.html.twig',['name'=>$name]);
    } 
     /**
     * @Route("/orders", name="orderspage")
     */
    public function orderTableAction(Request $request)
    {
        $orders = new Orders(); 
        $calculator = new Calculator();
        $totals = $calculator->calculateTotals($orders);

        // replace this example code with whatever you need
        return $this->render(
            'AppBundle::default/orders.html.twig',
            [
                'meals' => $orders->getMeals(),
                'orders' => $orders->getOrders(),
                'totals' => $totals['totals'],
                'max_min' => $totals['max_min'],
            ]
        );
    }

    /**
     * @Route("/orders/pdf", name="generateOrdersPDF")
     */
    public function ordersPdfAction(Request $request)
    {
        $pdf_renderer = new PDFRenderer();

        $this->get('orders.file_renderer')->render($pdf_renderer);
    }

    /**
     * @Route("/generateCSV", name="generateCSV")
     */
   public function generateCSVAction(Request $request)
    {
        
        // replace this example code with whatever you need
        return $this->render('AppBundle::default/orderTable.html.twig'); 
    }
    
     */

}
