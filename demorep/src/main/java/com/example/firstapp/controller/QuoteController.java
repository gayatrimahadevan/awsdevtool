package com.example.firstapp.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStreamReader;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class QuoteController {
    //The function receives a GET request, processes it and gives back Quote as a response.
    @GetMapping(value = { "getQuote" })
    public String getQuote() {
    	StringBuilder sb = new StringBuilder();
        String strLine = "";
        List<String> list = new ArrayList<String>();
        try {            		
            ClassLoader classLoader = getClass().getClassLoader();
	        BufferedReader br = new BufferedReader(new InputStreamReader(classLoader.getResourceAsStream("vivekananda.txt")));	    
              while (strLine != null)
               {
                strLine = br.readLine();
                sb.append(strLine);
                sb.append(System.lineSeparator());
                strLine = br.readLine();
                if (strLine==null)
                   break;
                list.add(strLine); 
               }         
             br.close();
            } catch (FileNotFoundException e) {
            	System.err.println("File not found");
            } catch (IOException e) {
            	   System.err.println("Unable to read the file.");            
     }
        return list.get((int) (Math.random()* list.size()));        
    }
}