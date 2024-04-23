package com.project.kammi.controller.manufacturing.recipe;

import com.project.kammi.domain.manufacturing.recipeStandardVO;
import com.project.kammi.domain.manufacturing.recipeVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.service.manufacturing.manufacturingService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RequestMapping("/recipe/rest")
@RestController
@Log4j
@AllArgsConstructor
public class recipeRestController {
    private manufacturingService service;


    @PostMapping(value = "/getPhoto", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<String> getPhoto(
            @PathVariable("recipe_Id") int recipe_Id
    ) {
        log.info("getPhoto.................");

        return new ResponseEntity<>(service.selectChickenPhoto(recipe_Id), HttpStatus.OK);
    }



    @PostMapping("/recipe-standard")
    public String insertRecipeStandardList(@RequestBody List<recipeStandardVO> recipeStandardList) {
        log.info("레시피스탠다드개수" + recipeStandardList);
        try {
            int count = service.insertRecipeStandardList(recipeStandardList);
            return (count + "개");
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }

    }

    // 사진 눌렀을 때 나오는 모달창 select (규격정보 제외)
    @PostMapping(value = "/selectAllRecipeInfoForUpdate/{recipe_Id}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<recipeVO> getForUpdateInfo(
            @PathVariable("recipe_Id") int recipe_Id
    ) {
        log.info("selectAllRecipeInfoForUpdate.................");

        return new ResponseEntity<>(service.selectAllRecipeInfoForUpdate(recipe_Id), HttpStatus.OK);
    }

    @PostMapping(value = "/selectRecipeStandardInfoForUpdate/{recipe_Id}/{pagesize}/{page}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<List<recipeStandardVO>> getStandardForUpdateInfo(
            @PathVariable("recipe_Id") int recipe_Id,
            @PathVariable("page")int page,
            @PathVariable("pagesize")int pagesize
    ) {
        log.info("selectRecipeStandardInfoForUpdate.................");
        PagingVO paging = new PagingVO();
        paging.setPageNum(page);
        paging.setPageSize(pagesize);

        return new ResponseEntity<>(service.selectRecipeStandardInfoForUpdate(paging, recipe_Id), HttpStatus.OK);
    }

    @PostMapping("/recipeUpdate/{recipe_Id}/{recipe_Name}")
    public ResponseEntity<?> recipeUpdate(
            @PathVariable("recipe_Id") int recipe_Id,
            @PathVariable("recipe_Name") String recipe_Name
    ) {
            return new ResponseEntity<>(service.updateRecipe(recipe_Id, recipe_Name), HttpStatus.OK);
    }

    // 레시피명 변경 시 레시피스탠다드에 있던 레시피명도 변경
    @PostMapping("/autoRecipeStandardUpdate/{recipe_Id}/{recipe_Name}")
    public ResponseEntity<?> autoRecipeStandardUpdate(
            @PathVariable("recipe_Id") int recipe_Id,
            @PathVariable("recipe_Name") String recipe_Name
    ) {
        return new ResponseEntity<>(service.autoUpdateStandardRecipe(recipe_Id, recipe_Name), HttpStatus.OK);
    }

    // 업데이트 시 파일을 삭제(db는 변경되지 않음)
    @DeleteMapping("/recipeFileDelete/{fileName}")
    public ResponseEntity<?> deleteFile(@PathVariable String fileName) {
        String filePath = "D:\\github-wououoo\\Final_project\\final_project_subtitle\\src\\main\\resources\\static\\upload\\chickenPhoto\\" + fileName; // 파일 경로 설정
        File file = new File(filePath);
        log.info("삭제할 파일 찾기" + file);
        if (file.exists()) {
            if (file.delete()) {
                return ResponseEntity.ok().body("File deleted successfully.");
            } else {
                return ResponseEntity.badRequest().body("Failed to delete the file.");
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    
    // 파일 업로드 로직 처리(파일만 업로드, DB는 변경되지 않는다)
    @PostMapping("/uploadFile")
    public ResponseEntity<?> uploadFile(@RequestParam("fileName") MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("File is empty");
        }
        // 업로드할 파일의 원래 이름 가져오기
        String originalFileName = file.getOriginalFilename();

        // 파일을 서버에 저장할 경로 생성
        String filePath = "D:\\github-wououoo\\Final_project\\final_project_subtitle\\src\\main\\resources\\static\\upload\\chickenPhoto\\" + originalFileName; // 파일 경로 설정

        try {
            // 파일을 서버에 저장
            file.transferTo(new File(filePath));
            return ResponseEntity.ok().body("File uploaded successfully.");
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("Failed to upload file: " + e.getMessage());
        }
    }

    // DB 파일 이름 변경
    @PostMapping("/RecipeFilenameUpdate/{recipe_Id}/{fileName}")
    public ResponseEntity<?> RecipeFilenameUpdate(
            @PathVariable("recipe_Id") int recipe_Id,
            @PathVariable("fileName") String fileName
    ) {
        return new ResponseEntity<>(service.updateFileRecipe(recipe_Id, fileName), HttpStatus.OK);
    }

    // 레시피 스탠다드 정보 update

    @PostMapping("/updateRecipeStandardUpdate")
    public String updateRecipeStandardUpdate(@RequestBody recipeStandardVO vo) {
        log.info("레시피스탠다드업데이트" + vo);
        try {
            int count = service.updateAllStandardRecipe(vo);
            return (count + "개");
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }

    }
    @DeleteMapping(value = "/deleteRecipeStandard/{standard_Id}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public String deleteRecipeStandard(@PathVariable("standard_Id") int standard_Id) {
        try {
            int count =service.deleteAllStandardRecipe(standard_Id);
            return (count + "개");
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }
    }

    @DeleteMapping(value = "/deleteRecipeAndStandard/{recipe_Id}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public String deleteRecipeAndStandard(@PathVariable("recipe_Id") int recipe_Id) {
        try {
            String count =service.deleteRecipeAndStandard(recipe_Id);
            return count;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }
    }

}

