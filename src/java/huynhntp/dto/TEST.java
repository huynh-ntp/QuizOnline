/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.dto;

import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author ACER
 */
public class TEST {
    public static void main(String[] args) {
        String ori = "123";
        String hex = DigestUtils.sha256Hex(ori);
        System.out.println(hex.substring(0, 49));
    }
}
