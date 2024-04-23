package com.project.kammi.controller.purchasecontroller;

import com.project.kammi.domain.purchase.*;
import com.project.kammi.service.purchase.purchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/purchase")
public class purchaseController {

    @Autowired
    private purchaseService purchaseService;

    @GetMapping("/materialssupplier")
    public String index(Model model) {
        List<materialssupplierVO> materList = purchaseService.materialssupplierRead();
        model.addAttribute("materList", materList);
        return "purchase/materialssupplier";
    }

    @GetMapping("/materialInventory")
    public String materialInventory(Model model) {
        List<materialsVO> materList = purchaseService.materialListRead();
        int count = purchaseService.pageCount();
        model.addAttribute("materList", materList);
        model.addAttribute("count", count);
        return "purchase/materialInventory";
    }

    @GetMapping("/materialPurchase")
    public String materialPurchase(Model model) {
        List<purchaseListVO> purchaseList = purchaseService.purchaseListRead();
        int count = purchaseService.purchasePageCount();
        model.addAttribute("purchaseList", purchaseList);
        model.addAttribute("count", count);
        return "purchase/materialPurchase";
    }
    
    @GetMapping("/supplierRead")
    public ResponseEntity<List<materialssupplierVO>> supplierRead(
            @RequestParam String part
    ) {
    	System.out.println("확인용"+purchaseService.supplierRead(part).get(0).getSupplier_location());
        return new ResponseEntity<>(purchaseService.supplierRead(part), HttpStatus.OK);
    }

    @GetMapping("/materialsRead")
    public ResponseEntity<List<materialsVO>> materialsRead(
            @RequestParam String part
    ) {
        return new ResponseEntity<>(purchaseService.materialsRead(part), HttpStatus.OK);
    }

    @GetMapping("/materialRead")
    public ResponseEntity<materialsVO> materialRead(
            @RequestParam String part
    ) {
        return new ResponseEntity<>(purchaseService.materialRead(part), HttpStatus.OK);
    }
    
    @PostMapping(value = "/materialInsert",
            //consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public String materialInsert(@RequestBody materialsVO vo) {
        purchaseService.materialInsert(vo);
        return "purchase/materialPurchase";
    }

    @PostMapping(value = "/purchaseListInsert",
            //consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public String purchaseListInsert(@RequestBody purchaseListVO vo) {
        purchaseService.purchaseListInsert(vo);
        return "purchase/materialPurchase";
    }

    @PostMapping(value = "/materialPurchaseInsert",
            //consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public String materialPurchaseInsert(@RequestBody List<materialPurchaseVO> vo) {
        System.out.println("vo = " +vo.get(0));
        purchaseService.materialPurchaseInsert(vo);
        return "purchase/materialPurchase";
    }

    @GetMapping("/materialPurchaseRead")
    public ResponseEntity<List<materialPurchaseVO>> materialPurchaseRead(
            @RequestParam int purchaseid
    ) {

        return new ResponseEntity<>(purchaseService.materialPurchaseRead(purchaseid), HttpStatus.OK);
    }
    
    @DeleteMapping("/materialDelete")
    public ResponseEntity<String> materialDelete(
    		@RequestParam int materialid
    ) {
    	purchaseService.materialDelete(materialid);
    	return new ResponseEntity<>("success", HttpStatus.OK);
    	
    }
    
    @GetMapping("/categoryRead")
    public ResponseEntity<List<categoryVO>> categoryRead(
            @RequestParam String category
    ) {

        return new ResponseEntity<>(purchaseService.categoryRead(category), HttpStatus.OK);
    }

    @GetMapping("/getPage")
    public ResponseEntity<List<materialsVO>> getPage(
            @RequestParam int pageNum
    ) {

        return new ResponseEntity<>(purchaseService.materialListRead(pageNum), HttpStatus.OK);
    }
}
