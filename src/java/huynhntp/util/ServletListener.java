/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author ACER
 */
public class ServletListener implements ServletContextListener{
    private final String PATH = "/WEB-INF/fileController.txt" ;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        String path = context.getRealPath("/");
        Map<String,String> siteMap = readFile(context, path + PATH);
        context.setAttribute("SITE_MAP", siteMap);
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Map<String,String> siteMap = null;
    }
    
    private Map<String,String> readFile(ServletContext context, String filePath){
        Map<String,String> siteMap = null;
        FileReader fr = null;
        BufferedReader br = null;
        try {
            fr = new FileReader(filePath);
            br = new BufferedReader(fr);
            while (br.ready()) {                
                String data = br.readLine();
                String[] str = data.split("=");
                
                if(str.length == 2){
                    if( siteMap == null){
                        siteMap = new HashMap<>();
                    }
                    String key = str[0];
                    String value = str[1];
                    siteMap.put(key, value);
                }
            }
            br.close();
            fr.close();
        } catch (IOException e) {
        }
        return siteMap;
    }
}
