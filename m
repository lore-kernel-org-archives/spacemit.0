Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E038B7CD
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656804; cv=none; b=jSDF6Ig92veJV6iIww6G3Rq2z3Q4A2xdj25bzgT2wTBvEfDpkuZjHlPesN0kV2NUc+H6lLvCpTBLvuIyQ3oF4FRYiaotG6KqwlnyNSeIBHLtMceMJLnluAKA/6uK1MAQg0YsBW7q0pAxgAvZnpT2+KC5TY2vSj1t30eM0s4/jhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656804; c=relaxed/simple;
	bh=cg8fLWOawfrKpqz2/XWaLYyIRBaVqgEy5uKXSzyOrU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJHiZOR0j+IFEotOdmd2oHNr3P0lZwkYk4sv9NnGRl4BsW3sGJJT3Bcv0Sv38XKKXtxQjewTbiucwvPjlynW17vwSFrv18V7qTzs+WK9iN+oP1d0b0goKqB3C8ihyDjJG7Dsd40lut0NDPtGkMB9GLHkWjL/GIRESCHTOvERVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqtLXEy/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqtLXEy/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso68999425e9.3
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656801; x=1779261601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKJgblmvlEcKiYekKnfozYVRzdG1dmcVyVFAo6SuTOg=;
        b=BqtLXEy/ZHp8hLzWjIurwgDesuqptsiTmRKYtrsYQ8F/TfI6Ffphb0Hx+J5XXF9SUz
         w3scKNo8hiZuCEaJrJUwVlwdcwcZtm0/lpdEoSvdsi3X9diCxmwCyTIzjRciFTqjpnZM
         XC15445jAEihSyZVxa29Uv9Ig4NKaJjjsMqT/Q55dDQZzwDRE4biuSeguEBPCqMlMnlG
         Z2P8pw9geBti5Kq0zGUHqMwX3qX/RBCN5pXPvCKPW81J+ihSObmBmuNB0QyCtL7HArmz
         WKwAuGzBda6anu3ddeBz5qXiPjO6nsauhwJ0/AKVi2R0I6PtUrBNRTnm67TbKsdfQYYh
         nSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656801; x=1779261601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKJgblmvlEcKiYekKnfozYVRzdG1dmcVyVFAo6SuTOg=;
        b=ahAzRB0Z0YysKxocgunW4gEdMGDlVK7ndbvN+ycao4oIg3c5Z+gbdksca2k+HuhU9J
         d81vycf/o/JQ0DUg27+LbkMF+xUdk9nfVy3nOWGZnhKOBF0MMSjNJCsV4grm5k97P+Qp
         qpHTc9qGyzhnGCAn1Lov0z6uSACb5Juhqk3GwpnbLahWGZ83rqd8NrXfC19mvoyS4fiD
         /4mhEZ19AhsLGVyonap3ecEohzsV3v/wyOC+DaNZ1wU5i7md7JUqOzdZe+hsY90HiAqV
         IQ3tRjCkbBw9E3bm3sc8vuOc7il3WyGaKJXO/pMfqYLdmnlhZhbXDPZzX7KbRutJHjk1
         qYZg==
X-Forwarded-Encrypted: i=1; AFNElJ9aIVpUBMUJqN00jWTwb8uisxvxHwyftM2TbWx1wCOu8cWxYY3PPMB9LkjJBRZ+btBk1TJmZhuZtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdml7SbLb3Be7C98DXWvIrzXncCuVsBHCMSgH1bzBFf3TcVG47
	tZnUNFvRgPMcidhZCj9/1+JJO6cGxLs8u5LnPP55EL02qt9iMCDzBsSYLN/q/4Zm
X-Gm-Gg: Acq92OEVhoKR9zuoe9SRGXvl+LV89wsuLFY8OMT6gwDlAZfbjAsJcMExBPrHpBs+KDv
	gneL8w8YJXOa8jRqhll9mcCLy4LbK7kvAnI9x2mQ7TQnz65gLFedxntjKaktxhsqt6fI2D8LtU+
	vyMiFFu2pHTQBLHW6ffHzv3uT13uIqZodhTt56tJ3gPcIafG8Ef7Uf+IzZu6AX9XCvg4Qo38SN/
	V7tZQY+/C7vCsP/CtLexYkWngtFNtZwk4GD9vrI/X8CZ60QMq7oDdn/Vw9PPObTSvogtduCdDIb
	ftKOla+PtCQBDX2JTrXHTls5G6snx8J1zdtnWGsSKlqdPjrwh6fvfjaD2cx1sSt4Bn4qhA2uWB1
	Py55HQIn4L0I0UABUQ8SKOjuYC2coxB040/7um1AHyxRQZrCvuM+GaQ2YimSZf0dbJG25KWDihH
	de6PV5+q3fFaRFmmKNjwKVwBmj5Z0y6RZcGgUQvQX0B3SWyChmWrFb2xszsCzPoTlTIQ==
X-Received: by 2002:a05:600c:3f0f:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-48fce99d7e5mr18903665e9.3.1778656800876;
        Wed, 13 May 2026 00:20:00 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:00 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Wed, 13 May 2026 09:19:48 +0200
Message-ID: <20260513071958.29574-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing devices with their required regulators. The regulators are named after
their label in the vendor schematics[0].

v3:
- drop reg_usb_vbus, non-controllable and served only as vin-supply
- fixed regulator-vcc-4v0 typo
- fold addition of pmic regulator labels into the pmic patch
- eeprom is a GT24C02B, fixed commit message
- added reg_qspi_vcc1v833
- fixed uboot nor name offset
- add missing "reg_" prefix for reg_pcie_vcc_3v3
- drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports

v2:
- drop reg_vcc_5v0_sys as per "non-controllable" review comments on
  similar patches for other boards (kept the root reg_usb_vbus for though)
- add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
- drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
  ("non-controllable" again)
- all of the above makes it consistent with other k1 boards

v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t

$ cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 PCIE_VCC3V3                      5    4      0 unknown  3300mV     0mA  3300mV  3300mV
    ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
    ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
    ca800000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
    ca400000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
 VCC4V0                           8   10      0 unknown  4000mV     0mA  4000mV  4000mV
    buck1                         1    0      0 unknown  1050mV     0mA   500mV  3450mV
    buck2                         1    0      0 unknown   900mV     0mA   500mV  3450mV
    buck3                         1    1      0 unknown  1800mV     0mA   500mV  1800mV
       2-0050-vcc                 0                                 0mA     0mV     0mV
    buck4                         2    2      0 unknown  3300mV     0mA   500mV  3300mV
       d4280000.mmc-vmmc          0                                 0mA  3300mV  3300mV
       QSPI_VCC1833               2    1      0 unknown  1833mV     0mA  1833mV  1833mV
          spi0.0-vcc              1                                 0mA     0mV     0mV
    buck5                         3    7      0 unknown  2100mV     0mA   500mV  3450mV
       dldo1                      0    0      0 unknown  1200mV     0mA   500mV  3400mV
       dldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       dldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       dldo4                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
       dldo5                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       dldo6                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
       dldo7                      0    0      0 unknown   500mV     0mA   500mV  3400mV
    buck6                         1    0      0 unknown  1100mV     0mA   500mV  3450mV
    aldo1                         1    1      0 unknown  3300mV     0mA   500mV  3400mV
       d4280000.mmc-vqmmc         1                                 0mA     0mV     0mV
    aldo2                         0    0      0 unknown   500mV     0mA   500mV  3400mV
    aldo3                         0    0      0 unknown   500mV     0mA   500mV  3400mV
    aldo4                         0    0      0 unknown   500mV     0mA   500mV  3400mV
 5V_VBUS                          2    1      0 unknown  5000mV     0mA  5000mV  5000mV
    c0a00000.usb-vbus             1                                 0mA     0mV     0mV
 VCC5V0_HUB                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
    c0a00000.usb:hub@1-vdd        1                                 0mA     0mV     0mV

[0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md

Andre Heider (6):
  riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
  riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
  riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
  riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
  riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
  riscv: dts: spacemit: k1-musepi-pro: set default console baud rate

 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 309 +++++++++++++++++-
 1 file changed, 308 insertions(+), 1 deletion(-)

-- 
2.53.0

