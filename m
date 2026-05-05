Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30135F196
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997188; cv=none; b=RAbQjJOV/FNCBs8thnFdwSOB31/A0/v0rZwctpRD1AZrKXSEAAyuJNlMdHj967XmQ/vf5eqgjBEJ4dq55U3jdfSb7XagzR7fiCogeWqb7CbPJbNsUJWWIZ/JQJBf/ciPoyu3sfeQCX7YvOxDx69B+uN7SyUmE2bKocVAsCzzvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997188; c=relaxed/simple;
	bh=XLFzUbOtyZPyAvJchwH1T1Wxu7aki4eepdCkKNYixYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pb3IGUxQ3hPyr/R7H5mn50bVMJFA7/XR88og88PkBSIn4BYfS2Hme+EKbak2F5ZRQxb4/GgcmqQwcxIAM6OckgQBkDI55NPycitedlU4XE4eDvQ/U3UDAtakuKTOivuU9ugGx9FHOihdPMWeIJTaVEvo0sJif6O80HFj5oiP5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNourhph; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNourhph"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44e5624c053so1381482f8f.2
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997185; x=1778601985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hV0+0zVBNNCjKEt7Ft390V3lS17ubfm/vB5GKRklvSI=;
        b=GNourhph5cOSFCR06ZmdMJZrrFSmC/F1Z4fYGGVxzp+oDRbXMXro08tGX1If9+PFhP
         9oe+eXcaEy3hAELDb2NFVCafFfwkACMtlnCQg3uyIky3H7wLCxjKlLcCl33bJ+7VFebv
         Ba8Oi46/T0m0jx+xSCeHBbgKnhgTCWsTN099P1U0F7tjL6dPJ320+UUOlcwXXsWS3Cfp
         lroBVXWa32Nem6sJFO3cnuIzk/F5hAYPBJ23Koyu7oN98jrXiphNywESwiKs3kEpaM8p
         VdFwrI0EzJcyduygkSKZr36AswCX9i5JHhN3CRE9StXbyAIAvJ1C6dHq/v/nQkmp02J/
         jxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997185; x=1778601985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV0+0zVBNNCjKEt7Ft390V3lS17ubfm/vB5GKRklvSI=;
        b=JUkfQfHF5lDcWgrZvfK6+Oa8w9OowrtCIf1WGSF/y1p31eDXbbFssq7AAtpQ5YK5fn
         P9jPNCsNcj718EaWFqXOw4F70t80zzcTLD7ETzYxxGpDHQBSx+z6Csj8Uop9dLi0Ix+g
         6O7Pt63M67hwyzDoSbHp7l6MZnZoPFtPXaGGaER5Gwy86ei3mAhladou0pGsbJ458yn3
         wO1AKZZrC3vX4eG/JJayRuqWrC9gA8Yx9nbBUFURexNG0g17OtIcIgFYiRqLNnV1CgpI
         /1M2l++3ImRbReF3uxyVFO1a1CI/6IGevRJFRkiRVYpbvstqFC4D7sh4ez9zl/9skVy8
         ZAMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x5OpFpFVJ/YY65eJo3oMMRGCBbSSHWoDGLmxn+S0ym1PMSNLPjpmkDzIHjERGTLg9bmQnIDEltA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPV+zfDQNEd76RNzMUjCSFqKZPs9Fk8oGO8WZ9KbS/uemrYIlt
	LvgB2bbK4bEmyHwSVlLoV2U7/7d00LpIzaYmPm4SrryV+JKorW3rGpHS
X-Gm-Gg: AeBDieubfOrpk1u4z1++3WHd9xz/pBmlRsDuW+mhQwL+bzLsbIl2Yx30pnl4NgEp4Li
	xiVhpdtoyQoQsVeAbB2IX/EIHBMBV5LyQ99VF/03/wTgefIWiWOkPsxJPuHTYmPyTZTepKA2m/x
	hflQIpf9qbfiey6na0ah7ITLfKdr042T3zwqL4Sn+SODljrg/p0QuihjLd64IlZz5aAfD/+p6Ue
	vdsxPWBunJxc33oqq4YrEytFALCsQRNj7vsfoE7rPj+jlrjzm0diBMeEMeMl47vgEirNjHenKTh
	ACuyA3ZZyESJGgMx7D+gqfJo1OBbppQRubckUVBYKjjq3ad1Fqy5kRAgSc5j3M22BBvyBavj3CM
	lp4Udx1tue9AWV1O4EZBInh955qZ52cLn8qz7L3glQFLb1ijDuVa/YWXvhn4bPOKsxTDptowSkd
	+Jjsg+feLlE6eZ8WjbNJhf12SUX0rgUNwbSvyu/im6XCRe2mn4dXj673psZSx0yB15s5ApLnAXE
	N2rz7g=
X-Received: by 2002:a05:6000:2489:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-44bb5c43349mr26253545f8f.34.1777997185280;
        Tue, 05 May 2026 09:06:25 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:24 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Tue,  5 May 2026 18:06:14 +0200
Message-ID: <20260505160623.1369347-1-a.heider@gmail.com>
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

[0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md

root@OpenWrt:~# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 USBVBUS                          4    3      0 unknown 12000mV     0mA 12000mV 12000mV
    PCIE_VCC3V3                   2    1      0 unknown  3300mV     0mA  3300mV  3300mV
       ca400000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
    MPCIE_VCC3V3                  2    1      0 unknown  3300mV     0mA  3300mV  3300mV
       ca800000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
    VCC5V0_SYS                    9   12      0 unknown  5000mV     0mA  5000mV  5000mV
       buck1                      1    0      0 unknown  1050mV     0mA   500mV  3450mV
       buck2                      1    0      0 unknown   900mV     0mA   500mV  3450mV
       buck3                      1    1      0 unknown  1800mV     0mA   500mV  1800mV
          2-0050-vcc              0                                 0mA     0mV     0mV
       buck4                      2    1      0 unknown  3300mV     0mA   500mV  3300mV
          spi0.0-vcc              1                                 0mA     0mV     0mV
       buck5                      3    7      0 unknown  2100mV     0mA   500mV  3450mV
          dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3400mV
          dldo2                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo3                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo5                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo7                   0    0      0 unknown   500mV     0mA   500mV  3400mV
       buck6                      1    0      0 unknown  1100mV     0mA   500mV  3450mV
       aldo1                      0    0      0 unknown  3300mV     0mA   500mV  3400mV
       aldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo4                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV

Thanks,
Andre

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

