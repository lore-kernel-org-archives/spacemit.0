Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49EC2D949B
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497882; cv=none; b=oAdcKZaNtJGFvHOKyHfn/EG9I3QRfJG6UBTA3kIleBMbm/TY+3BOnv2Pw793tAkwLGLo0oDK096K8ByHbz7/QAbCW1iSrJQXy5xhGs2Q6WCEqSHe+jxwtXdmZbDTltahHxbzFbUGxpm5NjKnv0a/QvLUIec2QlpGQCvksJNBZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497882; c=relaxed/simple;
	bh=jV/5Bu9wW1JnrDpWIq4xoZaZC34U9pwOTwMyvtUEqpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oEpyZWZBjK7xulRMsfseNctBSA07xujErh9U2Dm4gYx8PJRSmMNgvi9+lhDJYKCaug5vqKWT2M1sdFfhqm4errGmHeP/8pHnY3WD75KPFfauFJ//wReOWnJO2AzWJyT/8W+yrKqpC99pflP9xh7zHpySTZC0XGPRht4RL7/IGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRqHGvew; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRqHGvew"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so71073315e9.2
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497879; x=1779102679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C1bHVka4WkqxKLcjiVrRtNUHdq3msbMLuP2fSIT1mk=;
        b=iRqHGvewDxba9JozFW323wMxv6C5ezevJwKvWxJhEb4FN3jrBdxKD5KjKdTExH3UNg
         21jFmVSpEBSdoc8Ryc6Kc7J8kUyZaOAuolqmlkKp1FWUYTm47U8zSXSTj4vbZcaiM+gZ
         lRb1E75+d5wf/+XOQ42xTN6fo4xCRQHpIEUYcl1OJtZPMurEcXZ2NeeTPfAKrcU/xQPU
         1qrE+Yb6/Tyf4jBFj4Z59BVMpl9TRWJyv0ybu1/YHLmv4vlrHaRqYA8XjT4BpiG2o3af
         Xx9eZPlxUJr1bA7tyx/cYunXNMk1sMz7sGuTP4L+ZKqwfLtvEjiejsL+QMVhI12XB5uW
         cHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497879; x=1779102679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C1bHVka4WkqxKLcjiVrRtNUHdq3msbMLuP2fSIT1mk=;
        b=FNNZ4/SqmGbA/60wU7Li4w6xH/uyJGekgmKa2elaW9e6ZLwwS4bn94U/wFvyNEsUZb
         sV0JcNa/RdRVIOapOy3tPAkrYP926GMfxN4aXma32J0Xdvz3DxKQLYRLfO/30ELB8hYa
         iVFk+M7+jNQJMTuIjSX4PETT2lOeJ1UFaEvWniZGGfllt4vBl01FCM4d7FNpD5PwQFN7
         +2sm5b2GDNvoYtZSSwpKccdsgmo1ABtBfVjHT8uOhilCRvDnVt8fnzN2BpFH6pKzV5TN
         FbAeBd3b8GbHsYVy0/oy4VvWmsYp5AIdVqJjltk2GSX2+G4rXtU+tpZVSzYRdQ0+xstg
         +LRw==
X-Forwarded-Encrypted: i=1; AFNElJ8+nctnZRhiTLb9BrRzQYX1OtvAa6riAJ5QATMwgDVr4LHuwtx4Z/VGLGwycte04ECWOdQekksxug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGXDO98WeHIEcElg6zihkQ5r8hQafPQMTRmit+gaSQSkkgW/ie
	74TX4kvdRQwhjKskRYQ3NTD05fj5O4lzPMUHhJkprZuqpUKvLvILl+tU
X-Gm-Gg: Acq92OEC+UgTrmB2Ze/xyrY38e0zoKXIgO7epI+cGx6ejXVqbAtU2b/R1t0377E32WI
	OjbE+kj51hGAVV3+8D4NztaKH20oo6Et95BS1jkk+oNYvgifuzYYMkI0NyXqVaJ+Bu8SLHaNQJP
	LZGLL39gRvccuMHXUho6jwRPYJBn4EBhTkx4I4PDFf88GIOaWW7NFFSGnYIl+MzZdNg4WtZWOW5
	CWdAQ2kg16qZJqzHBL4jijxm1TRN4sLBdocqY+NDZwIVQ0JwOCj268THlpOingV0/XcJc5KBJ4O
	Jt5t9Wr1V3KgAt1aFr/7iENbFEPPpeFSJxd/JoHexpP2sZrHXmxrR9S1JmmFYpcGCbHClPnzSyp
	4T11jQUTKJIppFlpJXj+Id0qWvjV7qfYuhrclt75HkjyuUDuYvciRTA1yrA5uMOmCsGiglXY0nM
	aHaRwks6trRA4Y4Yn34VSkYhh9WzIx/5FmgD213H3GjeK3z6eMaUlj9gLW2umQAHGNAA==
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr424568565e9.28.1778497878900;
        Mon, 11 May 2026 04:11:18 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:18 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Mon, 11 May 2026 13:11:07 +0200
Message-ID: <20260511111116.1109643-1-a.heider@gmail.com>
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

v2:
- drop reg_vcc_5v0_sys as per "non-controllable" review comments on
  similar patches for other boards (kept the root reg_usb_vbus for though)
- add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
- drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
  ("non-controllable" again)
- all of the above makes it consistent with other k1 boards

v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t

root@OpenWrt:~# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 USBVBUS                          5    4      0 unknown 12000mV     0mA 12000mV 12000mV
    PCIE_VCC3V3                   5    4      0 unknown  3300mV     0mA  3300mV  3300mV
       ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
       ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
       ca400000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
       ca800000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
    VCC4V0                        8   10      0 unknown  4000mV     0mA  4000mV  4000mV
       buck1                      1    0      0 unknown  1050mV     0mA   500mV  3450mV
       buck2                      1    0      0 unknown   900mV     0mA   500mV  3450mV
       buck3                      1    1      0 unknown  1800mV     0mA   500mV  1800mV
          2-0050-vcc              0                                 0mA     0mV     0mV
       buck4                      2    2      0 unknown  3300mV     0mA   500mV  3300mV
          spi0.0-vcc              1                                 0mA     0mV     0mV
          d4280000.mmc-vmmc       0                                 0mA  3300mV  3300mV
       buck5                      3    7      0 unknown  2100mV     0mA   500mV  3450mV
          dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3400mV
          dldo2                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo3                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo5                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo7                   0    0      0 unknown   500mV     0mA   500mV  3400mV
       buck6                      1    0      0 unknown  1100mV     0mA   500mV  3450mV
       aldo1                      1    1      0 unknown  3300mV     0mA   500mV  3400mV
          d4280000.mmc-vqmmc      1                                 0mA     0mV     0mV
       aldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo4                      0    0      0 unknown   500mV     0mA   500mV  3400mV
    5V_VBUS                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       c0a00000.usb-vbus          1                                 0mA     0mV     0mV
    VCC5V0_HUB                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       c0a00000.usb:hub@1-vdd     1                                 0mA     0mV     0mV

[0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md

Andre Heider (6):
  riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
  riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
  riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
  riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
  riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
  riscv: dts: spacemit: k1-musepi-pro: set default console baud rate

 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 324 +++++++++++++++++-
 1 file changed, 323 insertions(+), 1 deletion(-)

-- 
2.53.0

