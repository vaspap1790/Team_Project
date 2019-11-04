package com.mainpackage.tripPlan.paypal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import javax.servlet.http.HttpServletRequest;

@Controller
public class PaypalController {

    @Autowired
    PaypalService service;

    public static final String PAYPAL_SUCCESS_URL = "pay/success";
    public static final String PAYPAL_CANCEL_URL = "pay/cancel";

    @GetMapping("/payment")
    public String payment() {
        return "payment";
    }

    @PostMapping("/pay")
    public String payment(@ModelAttribute("order") Order order,HttpServletRequest request) throws PayPalRESTException {
        String cancelUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_CANCEL_URL;
        String successUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_SUCCESS_URL;

        Payment payment = service.createPayment(
                order.getPrice(),
                order.getCurrency(),
                order.getMethod(),
                order.getIntent(),
                order.getDescription(),
                cancelUrl,
                successUrl);
        for (Links link : payment.getLinks()) {
            if (link.getRel().equals("approval_url")) {
                return "redirect:" + link.getHref();
            }
        }
        return "redirect:/";

    }

    @GetMapping(value = PAYPAL_CANCEL_URL)
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping(value = PAYPAL_SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) throws PayPalRESTException {
        Payment payment = service.executePayment(paymentId, payerId);

        if (payment.getState().equals("approved")) {
            return "success";
        }
        return "redirect:/";
    }

}
