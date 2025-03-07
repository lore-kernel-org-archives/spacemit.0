Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA349641
	for <spacemit@lists.linux.dev>; Fri,  7 Mar 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353401; cv=none; b=q693Umhe/BZnLZVSNtLlR/0qme4ZUMK6qOCmHb+Rn7T87gRsGz2H2aBvGUDna244hPwnUrrxkD1Vy/pzdKzVsF++0QoOiKaxcxEVtAV87oEBl8Taf5xokvj66loBV66LJaqPypEwFrDm2ukqw/vX5j5NGs34hyWEkA7V6QFVmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353401; c=relaxed/simple;
	bh=wUTCKQdFRduQqpYphO7bDmBlHds/Fl4g1FtGtN00RRM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TRI/l12XXrllAT+g0Iy1YbTY90ISrsI+hq+3g71EM7/aA1RUfqmIxeF5WiR0echisPuyyWnI/jxvrvwufNXZpdZmGw8wr2qVaIaK1PT/dNGWnVX5E+T7Nus87U8o7mf4ZyKuDamnrK57AyS3eZwKUModvvyepLC0Qh04DUyqOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lubvH1KD; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lubvH1KD"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so2867250a91.2
        for <spacemit@lists.linux.dev>; Fri, 07 Mar 2025 05:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741353398; x=1741958198; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMvbXHKHSCisZxL639THXPR5iE2SKt/8fGdQQfWVyFU=;
        b=lubvH1KDf3q95ovWErrUCZzzm/1pNip3qkeG95yunQL9QfP8y3r5n5vvhPvpOdP4bL
         0hCEKgo0k6YhoHzV74gSNX7LBLJWD/hn3eLI2BdkhivPFt46LX8HFrAKwFZEe7eX+0qN
         bt5TbgYOBue4RcIp2S9JWzAEK9kGknh/q+uBhltvhKqXlgm721xbZZKnoG1gpalkGmXc
         r+HRqYWVFV2D2Lk0SVCfCpOhpBNq5JA6RXlOP3KOLiwBWYW3P2ODisqsFTwIIuP9T08P
         xdFIZMnGfP6XRVkw/7BIKQiVSZfscRTflDdxawXgZ5Bj06G515toahMiUYRUqEY4bQyO
         6Pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353398; x=1741958198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMvbXHKHSCisZxL639THXPR5iE2SKt/8fGdQQfWVyFU=;
        b=chO2Aw1PduqXKQp4DanzTY50Osq8q2GddZeAamjigSJnG4idvbEFJYPnrVMhvfkIlY
         lnN0fDuzrfYCytJ++lmWS6gaSAapQ4wkSSBUk0RLUsP5qgoXMSQoxVL+Jk8T6T1nghhV
         vhzgWZ676SSIHBANp1D8R56F+MjpSrQjes+bVr6NLRIIf9+nvXCYl826isRh+J5P1aYV
         MLAAS+fJM4CHaX9qBy4fmrj5zRuyHbYScqt7fP+bxv7yk6Esx4H1SOB6Nbo9g1W0pEXk
         D/hnDL51013KK6N36uyeX3/qe1Tyn4I57hcPnb6MWnYoZW2bCkHxbeL5LiZ/9boeG/Gz
         pJOA==
X-Forwarded-Encrypted: i=1; AJvYcCVR03pgs4YgE5cC2ififEF7dhfWMnVZTC91yKkinxwGKYyXyUF96C6IPvOhk9I3AHzH2AgVAEyNqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpjGjMrTd1O5U9llAz7AByMiEvPtSQ43mskh/P18jfxxAQUEkQ
	BK9KGVof+4kDYbQEqrkoIKsEgEP/w8I6BsJIvDez/xi0okbjJwqZ
X-Gm-Gg: ASbGncvAJ3ssRQscUfBW841ym7eFvsyLsTo3zoVDkpunDuNHvgQ1kmBn/KDKV8u3MeZ
	IAdKEsDD118yMyy73Sx3igP6IeeKnw8NKOMfmZU8GSdAspDTyhSUTDSFdzwF+MyUhfWXkerAWp3
	BgJeIoLDl1voEZirypcExXuhgXlX0BKorpKnwc9ET6D1yxFwqjYO4nseoxy4DRBmXmIbSXT0OSK
	r2qXbCspmweCQx4GLI548il1AuAZrq4affyRULXVDtvqylWByp8Tv79jXA53tMxYqTMeo7A8dZU
	5jmLkeOzofp75QBot6rUQVcSWWoU
X-Google-Smtp-Source: AGHT+IGuZdlA+BS6H0fs1GCOn7IAPiD3AnSb1clZZH8wjlj+5zl7SMB+jNl9tmfBcw4YKqPpDlpEWA==
X-Received: by 2002:a17:90b:4c44:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2ff7cf22f41mr6030863a91.33.1741353398529;
        Fri, 07 Mar 2025 05:16:38 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693f7cebsm2984589a91.45.2025.03.07.05.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:16:38 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v6 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Fri, 07 Mar 2025 21:13:45 +0800
Message-Id: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArxymcC/5WQwU6EMBCGX4VwtpvpTFsKJ1/AmzfjoZRBGpdFC
 xI3m313C2qWcDEe/0y+L//8l3zkGHjMq+ySR57DGIZTCuYuy33nTi8sQpNyjoBKAknxKkVAL3o
 3ThxFy0Vb1NB4LilPzFvkNnyuvqfnlNs49GLqIruNBS1oQoQDKYOWhBSPcTg/hMl3fDyW1t6/9
 C4cD37of5yR3z9StelbfGtWZYsRDJqlF0hRuzF40UxCOkeSmWvfYDXrxZNuLJKzD1OVWS6x9LV
 WhlmhL52RDarWsQEDmksmWSJplS9fdGGchnheR5rVWmH9RKLe7TErAQJaarS1hsjUm1cW00wbW
 uKepkRrAF0XaVIEu6fxRv9rxRWWG1hqKLQkdZBKlUrbv2n9S2sgoH1xnYqjbFpfuKZlKrb09Xr
 9AnrL1lVnAgAA
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741353244; l=5452;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=wUTCKQdFRduQqpYphO7bDmBlHds/Fl4g1FtGtN00RRM=;
 b=JTxhTRL0Z2JT2mTJnFDUsLORpQFRZ623+XTqU/OxWEMqkF9l/h17XSR0kmCtSf+4Efb33GUZX
 bfzatGA3bDjAFacQVFyBPOpdODYLRkGGrmV3ZV35qZyhrHnaYL8PjrY
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
---
Change in v6:
- Patch #1:
        - Give a brief clock description and a clear clock name
        - Changed the clock numbers in the example to match those
          in the mainline clock driver
- Patch #2:
        - Fix incorrect comments in macro definitions
        - Fix code style
        - Merge `spacemit_i2c_xfer_core` into `spacemit_i2c_xfer`
        - Remove `reset` and `enable_irq` before each transfer
          and place `reset` in the probe function.
        - SPACEMIT_I2C_GET_ERR -> SPACEMIT_I2C_SR_ERR
        - spacemit_i2c_recover_bus_busy -> spacemit_i2c_wait_bus_busy
        - Support standard mode
Link to v5:
https://lore.kernel.org/all/20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com/

Change in v5:
- Patch #1:
        - Add `clock-names` property
        - Modify the clock property into two
- Patch #2:
        - Enable the APB clock
        - Fix comment and code styles
        - Fix typo and drop unnecessary description in Kconfig
        - Prefix all macro definitions with SPACEMIT_
        - Rename `spacemit_i2c_bus_reset` to `spacemit_i2c_conditionally_reset_bus`
        - Remove all `unlikely` and `likely`
        - Remove unused register and bit macros
        - Remove the "err" field, as it only contains a subset of the status field
        - Retrieve `clock-frequency` from the device tree instead of using a macro
        - Use a local variable to track the current message
        - Use `i2c->read` to represent read and write statuses instead of `i2c->dir`
Link to v4:
https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com/

Change in v4:
- Patch #1:
	- Change the default value of clock-frequency from 100000 to
	  400000. This is to correspond to the driver's default value.
	- Drop the minimum of clock-frequency
	- Modify the description of clock-frequency
- Patch #2:
	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
	- Drop useless wrap
Link to v3:
https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/

Change in v3:
- Patch #1:
	- Change the maxItems of reg from 2 to 1 in properties
	- Modify reg in dts example
	- Changed the enum selection for clock-frequency to a range,
	  setting a minimum value of 1 and a maximum value of 3,300,000.
- Patch #2:
	- Drop unused judgement in `spacemit_i2c_xfer_msg`
	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
	- Fix the error check for `i2c->base`
	- Modify Kconfig dependencies
Link to v2:
https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/

Change in v2:
- Patch #1:
	- Change the maxItems of reg from 1 to 2 in properties
	- Change 'i2c' to 'I2C' in the commit message.
	- Drop fifo-disable property
	- Drop alias in dts example
	- Move `unevaluatedProperties` after `required:` block
- Patch #2:
	- Alphabetize Makefile and Kconfig
	- Change `.remove_new` to `.remove` in `struct platform_driver`
	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
	- Change `spacemit_i2c_read/write_reg` to `read/writel`
	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
	- Clean up code flow
	- Fix unnecessary line wraps
	- Move `spacemit_i2c_handle_err` to a suitable location
	- Modify Kconfig dependencies
	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
	  the intermediate variable
Link to v1:
https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/

---
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  61 +++
 drivers/i2c/busses/Kconfig                         |  17 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 601 +++++++++++++++++++++
 4 files changed, 680 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241031-k1-i2c-master-fe7f7b0dce93
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>

