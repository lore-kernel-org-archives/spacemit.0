Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBDB12CD96
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562988; cv=none; b=OZxJlMattPLC2rW/RpW/0ht1iRksGTiVFULax26vQFE3CiVZPUfxcU+lNzYjku/gTweXrNatH68CSMOu4RpYnnkiFII+fqsF3O2rhhrbiyo93vnwZx+cJULDQUzeeoaOnzzdV/QxUlME7s8ZhRzsUVilyprXqk+aTvWbHzui8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562988; c=relaxed/simple;
	bh=reQ/ACXzC0FPxqlDRYXVLqxNB2esQfycAhNqUDmVLbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkSU6RhHamROthmglOCeyFtIhZzWK17CbpSTxNqUbuxe/LpfeKM9zOh7pURA4izHJVn3y3/7NKA2ZMTuv+0QqgcLacAORZuMBAQ4HfZtLD6oLssIyIPsUFr8OPEVp28sevM1poamX73Eb9WguRHyjXAxAa5T5U1W+BNiHwzKeos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KUCRqG7P; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KUCRqG7P"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a442a3a2bfso51315831cf.1
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562986; x=1751167786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=KUCRqG7PggwjJJ+kzNxCNds1tSpS9Dom+rrS3Ood90TDLdKCDOLqDPnKktDosfw8a5
         y2nj6DtTaWIgN9wb+cVRk4HEpVB/X2QBMegBLvCcD/dU0NXItYdhx5DxqLRVFEJKHI+b
         G0JeZBXB2bmd3ksGT9d0fiOoVPNkiPpRTs/upscNfZz2FQ/fWx4EYkJT+LhBUJnqeKV1
         WNP+pMM02QGKUj1IgwagMSgsiQxXi2fbLEdazNQCKfbKVDePSJZmuAfzLKmkIy8ItHmD
         YDEMElK3Fo7Ra4foBt8vxGqlhMCbq1SemTFkLHksDbxNOm86VG4XyQzKr23X6GNCoCiq
         /awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562986; x=1751167786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=j0oHg6DQo8cDz3e63IOVlHST/fMIl5tahN0oQlYrSZcM5qpYIbnJWGvasqt1dMhqgr
         iZ1wwlRd7db3k7wxJuS9NpIGgz+vL0nRgnu8ryW7wE7fydl+yTgk19V/LHh1Tcpu23D+
         rvCeZiCrK7Jl6e6GZFz5tQPfaaFsVSbkgqkW0kootTYYo+mJ/n+TJ0n3eNotsX/plPD0
         EjT/qz6qb2RPKZJoBixXgVp5AjOsRZypiK78Qy46fWJB4FgtiwGAMm5TeAnnNTCw6BpB
         uYNzUl6ZSmbUstluGmYIZQvi0DG5wKUg7LRmeTgONIkjLk7J4+L5OykukFUrj7q6teMK
         2kzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Rtjam0l05RHhzvEIjY1JO4yDEwugVLes2ceEu5DxSDHfOj1B6wV9HdnhKjhM/9rl2XDaygYa8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ZZiI9sblghKP12AiiFzgb4dourfh/vRwX85sYqAfbZ9i1X6I
	r1hJLFihY9BcMFuxyDOk2zQn6W3I6wII6Kj2GUQ1AOlcBh3vi3rK3eRW6ANdz7KJLIs=
X-Gm-Gg: ASbGncv5+sKdj/7NbKyvIcEcdtORgYsHFlTwgB5/JZ8GnHnP6LQUGIvqu96R51EUrbH
	EFRARFsF35pr0xKTgNLH5WrDn0WwlYfHPZmLERqZpMQfg8gucIUc4y07tNm2QtD3j1JhIK1gJR1
	izZkZjAMk8TsG51zFiX9RqV3spCk1PiO6yz6eASvHsRsDX8xlLC9jWXB4LzkQFv9cOLHMqbVROG
	9+QogNGanqnP8X+/WPRO8uH4T/lCie6QrpCsDpDp+vp0BALSiu8cH2Q+eiv/Yu2HJdHiG47l6lt
	NNfaYyIiyTYu+lQim+HyW07X2G7TVfWzYv4BoLP1MhJtZgz5z5zHLezbS/t/nbl5zmICIHzv7CU
	paOHouSP/tFzVSseDctGB12pCPDOhOo9lC+M=
X-Google-Smtp-Source: AGHT+IFeIAU1AkteDl39FgQydYRwtm5GM125i8YSXLkjgyUSEEtkYenBUd8CxZ/YJ2gC3UkZwdaRjQ==
X-Received: by 2002:a05:6214:509c:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-6fd0a54d8c8mr142353156d6.25.1750562985883;
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] spacemit: introduce P1 PMIC support
Date: Sat, 21 Jun 2025 22:29:32 -0500
Message-ID: <20250622032941.3768912-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v3

					-Alex
Between version 2 and version 3:
  - Removed "spacemit-pmic.c" and updated "simple-mfd-i2c.c" instead
  - Added an RTC driver, so that the MFD has more than one sub-device
  - Other suggestions were directed at "spacemit-pmic.c"

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Reviewed-by tag from Mark Brown to patch 3
  - Implemented suggestions from Vivian Wang:
      - Fixed a typo in the subject line in patch 1
      - Now use module_i2c_driver() for the PMIC driver in patch 2
      - Added MODULE_ALIAS() for both drivers (patches 2 and 3)
      - Defined and used DRV_NAME in both drivers
      - Added additional Kconfig module help text for both drivers

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  10 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-p1.c                          | 137 +++++++++++++++
 12 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-p1.c


base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.45.2

