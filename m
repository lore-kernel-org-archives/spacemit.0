Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC4D8635C
	for <spacemit@lists.linux.dev>; Mon,  3 Mar 2025 05:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740980021; cv=none; b=e45vIRdzQnE3aqOlphV1l0AGfcYlFBgOnjBacI9DO8rvbGEW6vNToUWMV1XjmsNjY90A0SbPSoJqn6J1qn9Oze0jukMwDGfuLk0tzm5u1G9Bh5GR0tX2sedBOqZXPMsCaskSleeQZVn4AYVyWxLmtxLDWJG7ZCdEk5djhAGrLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740980021; c=relaxed/simple;
	bh=6sHXAvzsP+r1/I6tpeLEGO+JZaMbG5gqUrghqgt3eew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fiVqDJqVz/scAetOZGxhz8UnddLsgq7SRCaF+3Rv6Uk4F/8V5hK5H7+18A5DqqKMJ1kfEDlWxc2T58Y/2BfsVUqvdJt4bXdxarAxo1sJ8dZSS4eCIVHQZZelHPX+L/FH4Wo6QNGZ0IW+3/1r4+vHjeKsl6XrO4JFnsrRLq3J0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irwSV8jQ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irwSV8jQ"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2238d965199so17570955ad.2
        for <spacemit@lists.linux.dev>; Sun, 02 Mar 2025 21:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980018; x=1741584818; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNzjTOUxxhbIheI57oMl3Xyjh6I6yF+qqVevEIma7Bs=;
        b=irwSV8jQdCpp9kT86I4iQPIB2N6ZFmgqx6UxAmlcBnajFDRwcABFpCxedpVE1ZFNI7
         P7Ys3CrEzi8y5iWZd13QwpqayD032Vp4ILYUFBZUP8jPIdVw1/sxk+cp8W9rxwy4w1be
         P4epudBAYYwgeRUzyRuiAROPfKOMsF1M3pulGX4R/FA433q+bI3N+LQLK0d4wCmL6T8K
         GtmTJEQ9I65p+3AfmR2P4m4lEL9JkP+Bnf90NkjVjcAxNHMhDoupZ9yDWCriTGICa/0A
         p8+4ZSSt3KMO3kYH1d5aF8ckSZVxX4L9YxsCNtF0Ek5bSyotMZaC4pCJe4SYVohcqkRo
         bTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980018; x=1741584818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNzjTOUxxhbIheI57oMl3Xyjh6I6yF+qqVevEIma7Bs=;
        b=uePpTxe1m6BNQ+z+gguYg5JDaZk9u/VRcsoht2PBXQVfZNe3fjwansCn9WLJYO0nnZ
         yG5yDYCBTLKsNLSjNCtEuhkZc+V6/75kwoe3RWH6bx0npdrABazMRFBxSwdLtU4aBzdJ
         cCFn6FzZz5LCSXYe+laiP3o6hVJVU6vPjLG/ZEknx2nOyjJbsiMTmvAHncAOWQfYoEir
         j/ETsXCeZ9I1rOw6hckP18SEglFzFYUmm+T71g4JgFH9474BicnL3zmHAgiNyeGZCQlH
         dMY0I+b8SQwrUv7TqH+H7UeHATRhckcTF98RRrVwLOJvUXVvnFG9NEYqaRPcxia5Iks5
         8FCA==
X-Forwarded-Encrypted: i=1; AJvYcCWw4iRfen1MFbEpUMwd8T/kjttNwDhXO7zrLCcVEkRy4a8FAYgvxTpoLaicJpPEY7xBqy0vWb+Ugg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3RFufURccMYSIOwiflVRRQkK12LzElhhs/y+oHd0oyz+A16CY
	rIA8/cUzrGjzntPtd1yvIcZSKLXQxusKLPfNjktsViP9m2/nL6lYAYHxxsHJK8iRlaXM
X-Gm-Gg: ASbGncuwSKmH49x0M3CHTf+M6QF4s4huM+GFonNtTy4EBsCq7wU/N1xfKBTginmHc0n
	2hFVa4Hy9LSv2NFmy6YBukuJwgCP8LfoQ/XSNvuzBbPP0onybnAsrIdcIqyhNeotX1qKEVi0CFW
	MA9OG5a8e7dJUmU/fREUQxUkkb1Qlg7IflZWR3OFeUtP1GafJRNCAJyKyqGfcR0lfAHbFpziM/N
	FVig5k/npy+RU/Q55FITZ65afExh18lrX8KudIfyyO+gqkruvvf2Fmd0QeCviNUoMwSitz55xSu
	w8vy5IGcoxC2XHVNpNtdEjKryhk0oV0P5hr77iybusWNcAYrjPlE
X-Google-Smtp-Source: AGHT+IGbXxluxQW6FaZUoHMuYCLcvcCCJ9B5cuRUXONbMkfPqLEfzADvL4kkgN3LWbLuD7i5KGYwOA==
X-Received: by 2002:a05:6a20:3945:b0:1ee:d17a:d632 with SMTP id adf61e73a8af0-1f2f4c95d1bmr18909910637.9.1740980018507;
        Sun, 02 Mar 2025 21:33:38 -0800 (PST)
Received: from [127.0.1.1] ([240e:341:e66:ce00:d50e:ead5:2cdd:617b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm1856002b3a.83.2025.03.02.21.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:33:38 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH RESEND v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Mon, 03 Mar 2025 13:30:54 +0800
Message-Id: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4+xWcC/5WQPU/DMBCG/0rkGVf2+SN2JgY6wgBsiMFxLo1F0
 4BjIqqq/x0nqiDqgMR4Zz2P33tPZMQYcCRVcSIRpzCG4ZAHdVMQ37nDDmlo8kyAgeRMcPrGaQB
 PezcmjLTFsi1r1ni0gmTmPWIbvhbfC3ncPm0f7shr3rdx6GnqIrqVDQxTAoBthNRgBOX0OQ7H+
 5B8h/u9NeZ217uw3/ihv7gjfnzmiOnywU/CqpiNTIOe8zFOazcGT5tEuXOCI2LtG6gmNXvyG9L
 s7EOqCoMWrK+V1IgSvHWaNyBbh5ppptCi4BaEkssVXRjTEI9LWZNcIiyXcFBXvUySMspa0Shjt
 BC6Xp0ymyaxojlc0yLTijFVl7laYOaahl/6Xy0uMF/BXLFScSE3XEorlfmbPp/P39Z+HygxAgA
 A
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740979868; l=4909;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=6sHXAvzsP+r1/I6tpeLEGO+JZaMbG5gqUrghqgt3eew=;
 b=AyIGByemAuDfgV4XZYaeJW7eawBah8yzyZfzbqVnQTLWMfG8F3tLcKIJJ3XCF3bigU/GuK3ZW
 1yYt5t3MJQuD51BBNof6Eb/g4fUy4sdWNFRCKXIoZPduh5CsgPnMtKc
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
I'm sorry for forgetting to CC Yixun Lan and SpacemiT, and for not syncing the Kconfig.
This re-send also corrects the warning mentioned in the CI test.
That's why I'm resending this.
---
Change in v5:
- Path #1:
        - Add `clock-names` property
        - Modify the clock property into two
- Path #2:
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

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  59 ++
 drivers/i2c/busses/Kconfig                         |  17 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
 4 files changed, 694 insertions(+)
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

