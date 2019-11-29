/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.utilities;

import java.io.ByteArrayOutputStream;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import javax.imageio.ImageIO;
import static javax.servlet.SessionTrackingMode.URL;
import org.springframework.stereotype.Component;

@Component
public class ImgUtils {

    public byte[] defaultImage() throws Exception {
        URL urlInput = new URL("https://www.pinclipart.com/picdir/middle/379-3796154_profile-clipart-john-doe-circle-png-download.png");
        BufferedImage bImage = ImageIO.read(urlInput);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ImageIO.write(bImage, "jpg", bos);
        byte[] data = bos.toByteArray();
        return data;
    }
}
