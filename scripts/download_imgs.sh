#!/bin/bash

# Array of URLs
urls=(
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RX5Pu-X20jI/AAAAAAAAAAk/rbL9yl62GjE/s72-c/PICT1247.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RX5Pu-X20jI/AAAAAAAAAAk/rbL9yl62GjE/s320/PICT1247.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RX5Pu-X20jI/AAAAAAAAAAk/rbL9yl62GjE/s1600-h/PICT1247.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYAPD0M4n_I/AAAAAAAAAAw/8Rjh9FJaZ78/s72-c/band_logo_ybs.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYAPD0M4n_I/AAAAAAAAAAw/8Rjh9FJaZ78/s200/band_logo_ybs.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYAPD0M4n_I/AAAAAAAAAAw/8Rjh9FJaZ78/s1600-h/band_logo_ybs.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYFNdkM4oAI/AAAAAAAAAA8/fo-h2uj0a7c/s72-c/150.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYFNdkM4oAI/AAAAAAAAAA8/fo-h2uj0a7c/s200/150.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYFNdkM4oAI/AAAAAAAAAA8/fo-h2uj0a7c/s1600-h/150.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYFNn0M4oBI/AAAAAAAAABE/V79uJBI6Q_8/s200/186.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYFNy0M4oCI/AAAAAAAAABM/_oOugGFg_OM/s200/488.jpg"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/RYY4h97AoiI/AAAAAAAAAC8/H_wEKrKPytc/s72-c/IMAGE_111.jpg"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/RYY4h97AoiI/AAAAAAAAAC8/H_wEKrKPytc/s320/IMAGE_111.jpg"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/RYY4h97AoiI/AAAAAAAAAC8/H_wEKrKPytc/s1600-h/IMAGE_111.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYt-3N7AojI/AAAAAAAAADQ/JV8yRg-gkEA/s72-c/Tessin061219+027.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYt-3N7AojI/AAAAAAAAADQ/JV8yRg-gkEA/s320/Tessin061219+027.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RYt-3N7AojI/AAAAAAAAADQ/JV8yRg-gkEA/s1600-h/Tessin061219+027.jpg"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/RZTarN7AonI/AAAAAAAAAEA/bnSsroIRvOk/s72-c/DSC_1606.JPG"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/RZTarN7AonI/AAAAAAAAAEA/bnSsroIRvOk/s320/DSC_1606.JPG"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/RZTarN7AonI/AAAAAAAAAEA/bnSsroIRvOk/s1600-h/DSC_1606.JPG"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/RZTSSt7AomI/AAAAAAAAADs/yRTvGxcDw4k/s320/150.jpg"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/RZTSSt7AomI/AAAAAAAAADs/yRTvGxcDw4k/s1600-h/150.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RZTR997AokI/AAAAAAAAADc/ebGnslWQ43U/s320/marcus+p%C3%A5+skattjakt.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/RZTR997AokI/AAAAAAAAADc/ebGnslWQ43U/s1600-h/marcus+p%C"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/R7ias5J-hlI/AAAAAAAAAQk/5l9NMgpXTh4/s1600-h/PICT2579.JPG"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/R86MK2Qz5OI/AAAAAAAAARE/fVwd4StsW_U/s1600-h/trackitem.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/R8-csWQz5PI/AAAAAAAAARM/ja8UA5zTBM4/s1600-h/syntaxhighlightvb.net.jpb.JPG"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/R9QuOrtDxaI/AAAAAAAAASI/meySp48QUxs/s1600-h/PICT2590.JPG"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/R9QsEbtDxYI/AAAAAAAAAR4/DzJkvetrUII/s1600-h/PICT2615.JPG"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/R9ktYrtDxcI/AAAAAAAAASU/GFZ-Pox2QKM/s1600-h/conchango.JPG"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/R9qMjbtDxdI/AAAAAAAAASc/CjoKf0Uyu1I/s1600-h/webservicestudio.JPG"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/R-oTPcP5M9I/AAAAAAAAASk/dDIeMqXWn3c/s1600-h/tfs.JPG"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/R\_-eC9oEHvI/AAAAAAAAAS8/iZe0-mLzStQ/s320/PICT2722.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/R_-d4NoEHuI/AAAAAAAAAS0/FVg3EyJ0IrM/s1600-h/PICT2749.JPG"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/SAcGzrgJ0AI/AAAAAAAAATQ/LDW4SNw5vnQ/s1600-h/Wire-Youth.jpg"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/SDqTsnzy3pI/AAAAAAAAAUA/Xvj_tfVKZOM/s1600-h/vs2008intellisense.JPG"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/R9QuOrtDxaI/AAAAAAAAASI/meySp48QUxs/s1600-h/PICT2590.JPG"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/SEZwgxjljgI/AAAAAAAAAUQ/XzCpmdZ2llY/s400/resharper.JPG"
  "http://3.bp.blogspot.com/_kkDJOSPNTLs/SEZwkymPxgI/AAAAAAAAAUY/co4RoBPkhlw/s400/resharper2.JPG"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/SFD_bXm08NI/AAAAAAAAAUg/oBUqvgR-7Fo/s400/1.jpg"
  "http://4.bp.blogspot.com/_kkDJOSPNTLs/SFD_q1-u6tI/AAAAAAAAAUo/W8Vsno2Nbmo/s400/DSC_1333.jpg"
  "http://1.bp.blogspot.com/_kkDJOSPNTLs/SGs8PwZYmRI/AAAAAAAAAVg/uq94Mv2A3Fo/s1600-h/MarcusHammarberg.jpg"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/SJi_hNi3EeI/AAAAAAAAAVo/ffOnYQXqqDk/s400/DSC_0040.JPG"
  "http://2.bp.blogspot.com/_kkDJOSPNTLs/TLiD5c8mP3I/AAAAAAAAAnM/Hk25KeDJi-s/s1600/Screen+shot+2010-10-15+at+12.34.49.png"
  "http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD53iDwcI/AAAAAAAAAnU/JCPsRuGJukU/s1600/Screen+shot+2010-10-15+at+12.53.51.png"
  "http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD6C3iJmI/AAAAAAAAAnY/DDtH95aFEmE/s1600/Screen+shot+2010-10-15+at+12.54.34.png23.http://4.bp.blogspot.com/_TI0jeIedRFk/TLiD6jLcqfI/AAAAAAAAAnc/lB2ZD7J5Hps/s1600/Screen+shot+2010-10-15+at+12.55.32.png"
  "http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD7XkMFVI/AAAAAAAAAng/9YpI29ELHu0/s1600/Screen+shot+2010-10-15+at+12.57.45.png"
  "http://3.bp.blogspot.com/_dVhQbe4S9AM/S0mvWNxDAgI/AAAAAAAAAJ4/uiVFWTex4Bs/s72-c/roti.png"
  "http://3.bp.blogspot.com/_dVhQbe4S9AM/S0mvWNxDAgI/AAAAAAAAAJ4/uiVFWTex4Bs/s400/roti.png"
  "http://3.bp.blogspot.com/_dVhQbe4S9AM/S0mvWNxDAgI/AAAAAAAAAJ4/uiVFWTex4Bs/s200/roti.png"
  "http://3.bp.blogspot.com/-zoGsR5Z8uz8/UP553fs4fVI/AAAAAAAABaE/1v0f9oOQ8lQ/s72-c/IMG_2848.jpg"
  "http://3.bp.blogspot.com/-zoGsR5Z8uz8/UP553fs4fVI/AAAAAAAABaE/1v0f9oOQ8lQ/s1600/IMG_2848.jpg"
  "http://3.bp.blogspot.com/-D43ZGtiqsNk/UP553Q_m9RI/AAAAAAAABaA/WzaDu4nWQ7Q/s1600/IMG_2847.jpg"
  "http://3.bp.blogspot.com/-D43ZGtiqsNk/UP553Q_m9RI/AAAAAAAABaA/WzaDu4nWQ7Q/s200/IMG_2847.jpg"
  "http://4.bp.blogspot.com/-4ITuI6HkUQ0/UROeBmSi6nI/AAAAAAAABaY/TDU-LChRDVU/s72-c/Screen+Shot+2013-02-07+at+13.24.53+.png"
  "http://4.bp.blogspot.com/-4ITuI6HkUQ0/UROeBmSi6nI/AAAAAAAABaY/TDU-LChRDVU/s1600/Screen+Shot+2013-02-07+at+13.24.53+.png"
  "http://2.bp.blogspot.com/-DPEZjG4KFGE/USpE9u7iwwI/AAAAAAAABa4/MPhZDYVZA_U/s72-c/Screen+Shot+2013-02-24+at+17.50.30+.png"
  "http://2.bp.blogspot.com/-DPEZjG4KFGE/USpE9u7iwwI/AAAAAAAABa4/MPhZDYVZA_U/s1600/Screen+Shot+2013-02-24+at+17.50.30+.png"
  "http://2.bp.blogspot.com/-5XFiq1Y30pY/UTRzU7S-3UI/AAAAAAAABbM/WoOQJqHoPs0/s72-c/between+the+chairs.JPG"
  "http://2.bp.blogspot.com/-5XFiq1Y30pY/UTRzU7S-3UI/AAAAAAAABbM/WoOQJqHoPs0/s1600/between+the+chairs.JPG"
  "http://2.bp.blogspot.com/-5XFiq1Y30pY/UTRzU7S-3UI/AAAAAAAABbM/WoOQJqHoPs0/s320/between+the+chairs.JPG"
  "http://4.bp.blogspot.com/-SO45pIhicKA/UTXr7lAazbI/AAAAAAAABbc/c4Z05mjJ-7E/s1600/donkey-in-air-cart.jpg"
  "http://4.bp.blogspot.com/-SO45pIhicKA/UTXr7lAazbI/AAAAAAAABbc/c4Z05mjJ-7E/s320/donkey-in-air-cart.jpg"
  "http://4.bp.blogspot.com/-BD7_e-V8lx0/UTb-Sh747XI/AAAAAAAABbs/KZKlNXi6keQ/s72-c/Screen+Shot+2013-03-06+at+09.28.37+.png"
  "http://4.bp.blogspot.com/-BD7_e-V8lx0/UTb-Sh747XI/AAAAAAAABbs/KZKlNXi6keQ/s1600/Screen+Shot+2013-03-06+at+09.28.37+.png"
  "http://2.bp.blogspot.com/-MerjpNT5euw/UTcbUy6hOLI/AAAAAAAABb8/iMgJ9Thm5Zc/s1600/Screen+Shot+2013-03-05+at+20.20.54+.png"
  "http://2.bp.blogspot.com/-MerjpNT5euw/UTcbUy6hOLI/AAAAAAAABb8/iMgJ9Thm5Zc/s72-c/Screen+Shot+2013-03-05+at+20.20.54+.png"
  "HerearetheuniqueURLsextractedfromthetext:1.http://2.bp.blogspot.com/-hn6e2czaSic/UyZ0vNusrkI/AAAAAAAACFw/J0-aqvQhu-w/s1600/2014-03-14+09.53.03.jpg"
  "http://1.bp.blogspot.com/-pImUB2XAOEI/UyZ1RKo6w8I/AAAAAAAACF4/wjufF9DfVUU/s1600/2014-03-14+09.52.55.jpg"
  "http://3.bp.blogspot.com/-m2QXZ9fcWO8/UyZ3TUr2A2I/AAAAAAAACGE/wmI2cMn1Qps/s1600/2014-03-17+11.13.45.jpg"
  "http://3.bp.blogspot.com/-C42tlxuNfLw/Uy-qRodILlI/AAAAAAAACGc/xjaY9qa-zaA/s1600/throughput+1.jpg"
  "http://1.bp.blogspot.com/-Kg-g-uCJ1jQ/Uy-roNQTyZI/AAAAAAAACGw/wYANSOKM1fk/s1600/2014-03-24+10.44.28.jpg"
  "http://1.bp.blogspot.com/-s4SKJwr-Izg/Uy-qR1bpt5I/AAAAAAAACGg/Wtwu993dS7U/s1600/throughput+2.jpg"
  "http://4.bp.blogspot.com/-gILhj6-IEP4/Uy_XUm8ZHNI/AAAAAAAACHM/5Bl2QuYlNl8/s1600/inceptiontop.jpg"
  "http://4.bp.blogspot.com/-DaHQeu_DBqA/Uy_V7J-e11I/AAAAAAAACHA/weW7PJZw494/s1600/download+ubuntu.jpg"
  "http://3.bp.blogspot.com/-QTOh92pfG00/Uy_dTa43_tI/AAAAAAAACHk/shGI9OrLqpY/s1600/createvirtual+machine.jpg"
  "http://3.bp.blogspot.com/-5ecD9T8yTCw/Uy_dTds57MI/AAAAAAAACHo/73x1IDOP_pg/s1600/allocate+memory.jpg"
  "http://3.bp.blogspot.com/-Yq2Cx33pDCM/Uy_wTyVOsgI/AAAAAAAACIA/76WBmzIW_5E/s1600/virtual+machine+settings.jpg"
  "http://2.bp.blogspot.com/-fp9ou6UDGAY/Uy_wUPv0hRI/AAAAAAAACII/AVXInw365jQ/s1600/attach+iso+file.jpg"
  "http://3.bp.blogspot.com/-t2J3QEgM9X4/UzDY7vY0v9I/AAAAAAAACIo/SqzmQGVEzpw/s1600/unmount.jpg"
  "http://3.bp.blogspot.com/-qC2CcjGQTQA/UzD0lN0pd0I/AAAAAAAACI0/leuk_W_4nEI/s1600/hostkey.jpg"
  "http://4.bp.blogspot.com/-p-bSCG5FUhQ/UzI_9I2qLbI/AAAAAAAACJ4/a7SrY8XrejQ/s1600/hostkey+easy.jpg"
  "http://1.bp.blogspot.com/-KUKpl6c_eHc/UzD1WNngkpI/AAAAAAAACI8/Bg0I5qq4EjA/s1600/copy+and+past+settings.jpg"
  "http://3.bp.blogspot.com/-vQhUUFMjvMc/Uy_0V4X2ViI/AAAAAAAACIU/1SRbtDnn6Xs/s1600/ubuntu+homescreen.jpg"
  "http://3.bp.blogspot.com/-dEEnoC3BID0/UzvIZq2RxHI/AAAAAAAACKM/jjzx2WLSfUw/s1600/2014-04-02+08.31.29.jpg"
  "http://2.bp.blogspot.com/-JwetSJnesxc/UzvJP6CbunI/AAAAAAAACKo/62Tns5UFG1Q/s1600/2014-04-02+08.45.53.jpg"
  "http://2.bp.blogspot.com/-VdMKSjl4dPQ/UzvJXVD0QDI/AAAAAAAACK4/ioddK6s324I/s1600/2014-04-02+09.09.00.jpg"
  "http://4.bp.blogspot.com/-CP0oWXV42eI/UzvJZ3eTqaI/AAAAAAAACLQ/3fFrjLv1SBo/s1600/2014-04-02+09.09.20.jpg22.http://2.bp.blogspot.com/-tH1tH_c2Nc0/UzvJcbgxkZI/AAAAAAAACLY/zxZvBCR3eJA/s1600/2014-04-02+09.11.10.jpg"
  "http://4.bp.blogspot.com/-HhzfHJ_QE58/UzvJeYhefRI/AAAAAAAACLo/FM6kIc94eEM/s1600/2014-04-02+09.12.47.jpg"
  "http://1.bp.blogspot.com/-aLlyoUbtdsQ/UzvJjFgS6MI/AAAAAAAACLw/4CvP4IZAW5s/s1600/2014-04-02+09.13.06.jpg"
  "http://2.bp.blogspot.com/-U6_dWBf9_bY/UzvJltlkdDI/AAAAAAAACL4/Jq7ylN_0iCw/s1600/2014-04-02+09.14.46.jpg"
  "http://3.bp.blogspot.com/-ouLxTP1n0wI/UzvJnX4j4WI/AAAAAAAACMI/4IBgh8ChLsk/s1600/2014-04-02+09.15.08.jpg"
  "http://3.bp.blogspot.com/-EJpiK0b2aFQ/UzvJrR3b22I/AAAAAAAACMQ/GRBxk2ZzqZs/s1600/2014-04-02+09.15.23.jpg"
  "http://4.bp.blogspot.com/-P6lLZypgOUE/UzvJtH-G1oI/AAAAAAAACMY/5IE63yMDCvk/s1600/2014-04-02+09.15.31.jpg"
  "http://4.bp.blogspot.com/-rFBfes-yM3g/UzvJvabjZlI/AAAAAAAACMc/BSm2G4X_skg/s1600/2014-04-02+09.15.40.jpg"
  "http://1.bp.blogspot.com/-3x0CHC8qlT8/UzvJxDGnqZI/AAAAAAAACMo/YTFdQOgVutA/s1600/2014-04-02+09.16.30.jpg"
  "http://3.bp.blogspot.com/-J6gCk4eRZlw/UzvJzLwLOjI/AAAAAAAACNA/PLz01z1q_zQ/s1600/2014-04-02+09.16.43.jpg"
  "http://4.bp.blogspot.com/-oFVulVHhlZY/UzvJ0_l0sGI/AAAAAAAACNI/zrbUIHqDvPM/s1600/2014-04-02+09.16.56.jpg"
  "http://1.bp.blogspot.com/-yJNXW-2z7eg/UzvJ3Px2A4I/AAAAAAAACNU/5kP9aD_eyPg/s1600/2014-04-02+09.17.08.jpg"
  "http://2.bp.blogspot.com/-r4O2-_yD5Yk/UzvJ5k0ZKGI/AAAAAAAACNc/SC82IvQeUuc/s1600/2014-04-02+09.17.20.jpg"
  "http://1.bp.blogspot.com/-G6vFA2AVIfo/UzvJ7jH4R2I/AAAAAAAACNk/XQ8fWXseZgM/s1600/2014-04-02+09.17.28.jpg"
  "http://4.bp.blogspot.com/-19MPA-jg5E0/UzvJ8sDYjdI/AAAAAAAACNs/JkIftirXGL8/s1600/2014-04-02+09.17.40.jpg"
  "http://2.bp.blogspot.com/-wOVFQFnQzDk/UzvKAcivK7I/AAAAAAAACN0/LRzOJ6o7sB4/s1600/2014-04-02+09.17.57.jpg"
  "http://2.bp.blogspot.com/-deLxf-vOoPI/UzvKAoO6KII/AAAAAAAACN8/Rsl6drE1W-Q/s1600/2014-04-02+09.18.10.jpg"
  "http://2.bp.blogspot.com/-KjKcF1HdDzE/UzvKBf-N12I/AAAAAAAACOE/0qZgGftJDp8/s1600/2014-04-02+09.18.20.jpg"
  "http://2.bp.blogspot.com/-klaCRobThm8/UzvKCnmR0kI/AAAAAAAACOI/CWqP7B3RfbA/s1600/2014-04-02+09.18.31.jpg"
  "http://1.bp.blogspot.com/-pza3QqWhLfE/UzvKDwhBkFI/AAAAAAAACOM/1RL_dkV-ey4/s1600/2014-04-02+09.18.44.jpg"
  "http://1.bp.blogspot.com/-dGfbZaS6vMA/UzvKFMZvBUI/AAAAAAAACOU/4sqxq4UokGg/s1600/2014-04-02+09.19.00.jpg"
  "http://2.bp.blogspot.com/-qEwThi0S-wE/UzvKF63bWcI/AAAAAAAACOc/RzP3rWskbfY/s1600/2014-04-02+09.19.09.jpg"
  "http://1.bp.blogspot.com/-wIC9mD6s0R0/UzvKGcuxiDI/AAAAAAAACOk/bUhS6xxYkDQ/s1600/2014-04-02+09.19.28.jpg"
  "http://3.bp.blogspot.com/-vJBaAH9Dgig/UzvKIvD5K5I/AAAAAAAACOs/gXmBLO3i6mg/s1600/2014-04-02+09.19.46.jpg"
  "http://3.bp.blogspot.com/-fS5Z3ikD21E/UzvKKC2RdWI/AAAAAAAACO0/qKWpSEmj8BA/s1600/2014-04-02+09.20.09.jpg"
  "http://2.bp.blogspot.com/-SS1wSODm1xM/UzvKK7HZlxI/AAAAAAAACO8/w0P6OBZMhqQ/s1600/2014-04-02+09.20.17.jpg"
  "http://3.bp.blogspot.com/-blTqXZac00k/UzvKLkV8jxI/AAAAAAAACPE/QVz-POsW87A/s1600/2014-04-02+09.20.29.jpg"
  "http://1.bp.blogspot.com/-ctG1VJnVxeQ/UzvKMYy9zDI/AAAAAAAACPQ/VpjN3jIefRM/s1600/2014-04-02+09.20.47.jpg"
  "http://1.bp.blogspot.com/-GHZVjM8A2_E/UzvKMuGyOuI/AAAAAAAACPY/UupC0WANqRg/s1600/2014-04-02+09.20.56.jpg"
  "http://4.bp.blogspot.com/-GYtyFCjwGBU/UzvKPCkwMEI/AAAAAAAACPg/eXlXKJCR5Y4/s1600/2014-04-02+09.21.29.jpg"
  "http://2.bp.blogspot.com/-Bq-YV5c2oWQ/UzvKPLHKcMI/AAAAAAAACPk/77G4HS0wA9s/s1600/2014-04-02+09.21.36.jpg"
  "http://4.bp.blogspot.com/-eEyZCvV-8Bg/UzvKP1MEnlI/AAAAAAAACPw/8AgtpGnDEWk/s1600/2014-04-02+09.21.45.jpg"
  "http://4.bp.blogspot.com/-lZZmH7B9j1c/UzvKQijYZpI/AAAAAAAACP4/Yz4SXw5o1vc/s1600/2014-04-02+09.21.54.jpg"
  "http://4.bp.blogspot.com/-5pQGGJ5v2Y8/UzvKRGfh4aI/AAAAAAAACQA/3WMpqRzEocU/s1600/2014-04-02+09.22.13.jpg"
  "http://3.bp.blogspot.com/-jz_Tw79Nzbo/UzvKSN94v1I/AAAAAAAACQM/j2jtF0HK-Dk/s1600/2014-04-02+09.22.26.jpg"
  "http://1.bp.blogspot.com/-hfFjmdSsfgY/UzvKThUGSrI/AAAAAAAACQY/mXnj9Dddt9s/s1600/2014-04-02+09.22.33.jpg"
  "http://3.bp.blogspot.com/-naTjKLUdOb4/UzvKUYfB13I/AAAAAAAACQg/fJL70AJiM8w/s1600/2014-04-02+09.22.43.jpg"
  "http://3.bp.blogspot.com/-DxEYvXTXqok/UzvKVw-8TdI/AAAAAAAACQs/NX0XwVj4RGU/s1600/2014-04-02+09.22.55.jpg"
  "http://2.bp.blogspot.com/-zfDFK5pvDQY/UzvKXgjLvtI/AAAAAAAACQ0/_NnF7j5hwjQ/s1600/2014-04-02+09.23.05.jpg"
  "http://3.bp.blogspot.com/-XG4N-yRfrTg/UzvKZjzv0kI/AAAAAAAACQ8/Zt2jEzq01-k/s1600/2014-04-02+09.23.17.jpg"
  "http://3.bp.blogspot.com/-Qh-Rgfrp_0c/UzvKbY6f7yI/AAAAAAAACRE/Mqrc5HZ0YGo/s1600/2014-04-02+09.23.34.jpg"
  "http://2.bp.blogspot.com/-i3cTxiLE6oA/UzvKddjAyPI/AAAAAAAACRM/yE1nyJ4RZYE/s1600/2014-04-02+09.23.42.jpg"
  "http://2.bp.blogspot.com/-l1dHw6Yg8dg/UzvKfP0q9oI/AAAAAAAACRY/lFtKtlz4LY0/s1600/2014-04-02+09.23.54.jpg"
  "http://1.bp.blogspot.com/-WM5YZm7gCTY/UzvKhSZk6nI/AAAAAAAACRg/Y-5CXM6cN7E/s1600/2014-04-02+09.24.04.jpg"
  "http://1.bp.blogspot.com/-TK__yWH6dmY/UzvKjrgcLuI/AAAAAAAACRw/f6iB3bIYJEU/s1600/2014-04-02+09.24.16.jpg"
  "http://2.bp.blogspot.com/-duBto5TljCI/UzvKlu2JdVI/AAAAAAAACR4/FsWKVLvZvoc/s1600/2014-04-02+09.24.23.jpg"
  "http://2.bp.blogspot.com/-U71IEOkOy7Y/UzvKn3E7kgI/AAAAAAAACSE/kZszqLrz-M4/s1600/2014-04-02+09.24.34.jpg"
  "http://1.bp.blogspot.com/-J1q-1OVU9Vw/UzvKpxZr1dI/AAAAAAAACSI/_9P0xy1vUyg/s1600/2014-04-02+09.24.44.jpg"
  "http://4.bp.blogspot.com/-wiTo0KJ3dZU/UzvKsNJ_V8I/AAAAAAAACSM/Oio8xR2nhh8/s1600/2014-04-02+09.24.53.jpg"
  "http://2.bp.blogspot.com/-ZTc-nA1Ycd4/UzvKuAwj3iI/AAAAAAAACSY/n3o1iRJlxWc/s1600/2014-04-02+09.25.01.jpg"
  "http://4.bp.blogspot.com/-k-K48B2-ppY/UzvKwmE2ZHI/AAAAAAAACSg/eXgQ7X15fBE/s1600/2014-04-02+09.25.pg"
  "http://4.bp.blogspot.com/-Ye-3_G1lcNc/UzvKxZrQ7DI/AAAAAAAACSo/0sWjAcC3LyI/s1600/2014-04-02+09.25.24.jpg"
  "http://4.bp.blogspot.com/-ElNpI9U16_w/UzvKz-3xQDI/AAAAAAAACSs/yTx4X2G1cJc/s1600/2014-04-02+09.25.37.jpg"
  "http://4.bp.blogspot.com/-YyR5M92NqOs/UzvK1o1GJqI/AAAAAAAACSw/9H9JfT0Xcxk/s1600/2014-04-02+09.25.46.jpg"
  "http://2.bp.blogspot.com/-ltFwEDSZX98/UzvK3UEgD1I/AAAAAAAACUE/r8fBl0pRhfM/s1600/2014-04-02+09.26.04.jpg"
  "http://4.bp.blogspot.com/-YLJ3MKPxFlQ/UzvK40Y_2XI/AAAAAAAACUI/gt2mhQGcnmo/s1600/2014-04-02+09.26.15.jpg"
  "http://2.bp.blogspot.com/-LVDS3fYI9X0/UzvK6Fg7_ZI/AAAAAAAACUM/8Y4dajZG6-k/s1600/2014-04-02+09.26.30.jpg"
  "http://4.bp.blogspot.com/-mbgp3td8y7A/UzvK8rTqD4I/AAAAAAAACUQ/9dAIBufSqc8/s1600/2014-04-02+09.26.40.jpg"
  "http://1.bp.blogspot.com/-f0pNwYMSx9o/UzvLA97UldI/AAAAAAAACUU/iyXOQs5ZCSg/s1600/2014-04-02+09.26.56.jpg"
  "http://1.bp.blogspot.com/-ysEi2dZMJ1U/UzvLEbsuPwI/AAAAAAAACUc/9zJ3WJLw-vw/s1600/2014-04-02+09.27.05.jpg"
  "http://3.bp.blogspot.com/-P4aRk3fI2e0/UzvLGGp7g4I/AAAAAAAACUo/NnhyF0XOJ10/s1600/2014-04-02+09.27.14.jpg"
  "http://1.bp.blogspot.com/-aS7UZhsFRFA/UzvLIZG6ZDI/AAAAAAAACUw/LGkF2VKwN1M/s1600/2014-04-02+09.27.26.jpg"
  "http://1.bp.blogspot.com/-gWhxKQfqMYk/UzvLK9rZ3oI/AAAAAAAACU4/21rNMeT7hCw/s1600/2014-04-02+09.27.36.jpg"
  "http://4.bp.blogspot.com/-9AbJ1XfDz9A/UzvLLBkYV8I/AAAAAAAACVA/dOq2wS8Z2Tk/s1600/2014-04-02+09.27.47.jpg"
  "http://1.bp.blogspot.com/-8HgK00mLq6A/UzvLMabPfKI/AAAAAAAACVI/R4f-2_jvuwQ/s1600/2014-04-02+09.27.56.jpg"
  "http://1.bp.blogspot.com/-Q4pvCIG3ZLU/UzvLNlh8YwI/AAAAAAAACVM/1GxxhAe8w3w/s1600/2014-04-02+09.28.05.jpg"
  "http://3.bp.blogspot.com/-ybl_xoxRRQ4/UzvLOOnF3ZI/AAAAAAAACVU/_IiB9Lvj8MA/s1600/2014-04-02+09.28.17.jpg"
  "http://1.bp.blogspot.com/-2HgVO6JAVSU/UzvLP-ffklI/AAAAAAAACVc/MwhftbFf-Qk/s1600/2014-04-02+09.28.33.jpg"
  "http://3.bp.blogspot.com/-27H0H6mwtPE/UzvLRGOw2II/AAAAAAAACVk/2Cb6lXd3G2o/s1600/2014-04-02+09.28.45.jpg"
  "http://1.bp.blogspot.com/-vTxiJ-xt_yo/UzvLSL_fL3I/AAAAAAAACVs/kWc8izgMMB0/s1600/2014-04-02+09.28.54.jpg"
  "http://2.bp.blogspot.com/-74m0OGuBqN8/UzvLT32ufbI/AAAAAAAACV0/_9fmmPzYp5I/s1600/2014-04-02+09.29.04.jpg"
  "http://3.bp.blogspot.com/-Sc86TKRzqHg/UzvLVBRo3lI/AAAAAAAACWA/xyTQelZ8zR8/s1600/2014-04-02+09.29.13.jpg"
  "http://3.bp.blogspot.com/-2VfQJFj9E5Y/UzvLWjH8FkI/AAAAAAAACWI/XVzSOAYyck0/s1600/2014-04-02+09.29.22.jpg"
  "http://1.bp.blogspot.com/-W6tONt20yvA/UzvLXmqyoWI/AAAAAAAACWQ/PG4vW8y1pFw/s1600/2014-04-02+09.29.31.jpg"
  "http://3.bp.blogspot.com/-uQj1vQO7GYk/UzvLY97xK0I/AAAAAAAACWY/Q2Ss_xl-ZcE/s1600/2014-04-02+09.29.41.jpg"
  "http://2.bp.blogspot.com/-z09u_UkohbI/UzvLaUrsB3I/AAAAAAAACWg/PRu1sRAFxEc/s1600/2014-04-02+09.29.49.jpg"
  "http://3.bp.blogspot.com/-m8rTUpfY6m0/UzvLbr_d6iI/AAAAAAAACWk/OKSJxk8TyQU/s1600/2014-04-02+09.29.58.jpg"
  "http://1.bp.blogspot.com/-RdoDhtXkjoo/UzvLdb52LmI/AAAAAAAACWo/vYYvONN9zRI/s1600/2014-04-02+09.30.06.jpg"
  "http://2.bp.blogspot.com/-rtXH8ZfXpuA/UzvLgM2N28I/AAAAAAAACWw/VCdyeAlcI6w/s1600/2014-04-02+09.30.24.jpg"
  "http://4.bp.blogspot.com/-7jY3i_SuePI/VCOIFGJUEFI/AAAAAAAAHl8/wXallDMpqoc/s1600/own%2Bchoice.png"
  "http://3.bp.blogspot.com/-yW0xTRJnxcw/VCOIFLrB9HI/AAAAAAAAHl0/LF9G-iA1X_I/s1600/set%2Bbatik%2Band%2Bbeard.jpg"
  "http://1.bp.blogspot.com/-3qZugxM9lA8/VCOIFFzRydI/AAAAAAAAHl4/RI70-qdNcHM/s1600/uniform.jpg"
  "http://4.bp.blogspot.com/-8XzUHg5W19k/VCOZkxzsyrI/AAAAAAAAHmU/j7aaSHETfB8/s1600/black%2Bdyke.JPG"
  "http://4.bp.blogspot.com/-T36j3MTeqNo/VCObq1tPtXI/AAAAAAAAHmg/BmGzaQv9P0Y/s1600/christiansInIraq.jpeg"
  "http://3.bp.blogspot.com/-43lZKd__bxM/VCyYHseUOqI/AAAAAAAAHt4/HbdK6bJaK3M/s1600/ikon_photo_book_150px.jpg"
  "http://4.bp.blogspot.com/-bjVpLGzNkUk/VDyLDQTj2zI/AAAAAAAAH_Y/1wx-HZ6hWbw/s1600/250px-US_Navy_SEALs_insignia.png"
  "http://3.bp.blogspot.com/-t6nf8kRQLcM/VDyUArDokyI/AAAAAAAAH_o/GWJI5QWWqh8/s1600/hellweek.jpg"
  "http://1.bp.blogspot.com/-NKyFyUTzcls/VDyePz24WzI/AAAAAAAAH_4/IM1p7CHrOXA/s1600/4712188695_5b6877d10c_m.jpg"
  "http://4.bp.blogspot.com/-UPCq4fiBLgk/VEXeXjJiRhI/AAAAAAAAIM0/if4QQ0tAlqA/s1600/kanbanInAction.improvement.jpg"
  "http://1.bp.blogspot.com/-qPbrpX2awl4/VEh1C7riW1I/AAAAAAAAIR0/gCdL1ip_PHo/s1600/9096190838_350590d10d_m.jpg"
  "http://4.bp.blogspot.com/--qDpUxXmqNU/VEh2xvOEucI/AAAAAAAAISA/xfTYC25J7dM/s1600/computer_programmer__ink_by_doctormo-d5q4fm1.png"
  "http://1.bp.blogspot.com/-eu7i_1n2a6g/VFyALSS9X2I/AAAAAAAAI1g/eFoRIpzq3fc/s1600/financial%2Bdebt.jpg"
  "http://4.bp.blogspot.com/-hQecz42PHsc/VFyAJY3MJRI/AAAAAAAAI1Y/1Jsc6LEueSw/s1600/communication%2Bdebt.jpg"
  "http://2.bp.blogspot.com/-i9Bd4Vcxsu4/VGwV-n6WcmI/AAAAAAAAJa8/1g9mtFxNiHY/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B10.51.42%2B.png"
  "http://2.bp.blogspot.com/-rip2OL1bGjw/VGwXJIaXiaI/AAAAAAAAJbI/u8QbQrgdw_o/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B11.05.33%2B.png"
  "http://4.bp.blogspot.com/-z09G07OtPks/VGwZ44Ps-wI/AAAAAAAAJbU/5vBRp3Zmxko/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B11.17.09%2B.png"
  "http://4.bp.blogspot.com/-rY9qwbxrb34/VGwbRTUB4GI/AAAAAAAAJbg/DlCbaPO0hso/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B11.22.48%2B.png"
  "http://4.bp.blogspot.com/-rnDPhKlz74w/VGw7X2YYDtI/AAAAAAAAJcE/s9jhvjfPXvo/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.40.16%2B.png"
  "http://2.bp.blogspot.com/-Z8mx6d_5kDs/VGw28gSWYxI/AAAAAAAAJbw/NuAIu5Fi8Nw/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.08.24%2B.png"
  "http://1.bp.blogspot.com/-VciF1sBWD5g/VGw280CLU2I/AAAAAAAAJb0/9EZTrA-hJT4/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.09.35%2B.png"
  "http://2.bp.blogspot.com/-0T-UtGFD_Cc/VGw39D2SSZI/AAAAAAAAJcA/ABE_26okh4M/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.18.36%2B.png"
  "http://2.bp.blogspot.com/-l7JH8RnOH04/VGw3rlgBlWI/AAAAAAAAJcQ/5AHb23dybxo/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.22.06%2B.png"
  "http://2.bp.blogspot.com/-u7PO1wv9C6s/VGw39I8NxfI/AAAAAAAAJcI/9UDpp9S6UJs/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.21.34%2B.png"
  "http://2.bp.blogspot.com/-2nMSm6fQmSo/VGw4byMBFkI/AAAAAAAAJcg/LuBPOEiRn2s/s1600/Screen%2BShot%2B2014-11-19%2Bat%2B13.25.25%2B.png"
)

# Function to download images
download_images() {
    for url in "${urls[@]}"; do
        # Extract filename from URL
        filename=$(basename "$url")
        # Download image
        wget "$url" -O "$filename"
    done
}

# Call the function to download images
download_images