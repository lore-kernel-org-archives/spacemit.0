Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745B1F8724
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947516; cv=none; b=IwjgppsnO9bsx0W8ecCDFiYdNZQTnT13FH3vdkD97apqXoy2bN57zOjcdzm0VCdcCyis1htGz4akV+RJwNW4u1Kz/6uQWE6YVvAW8gx/1ju112oz5JBsnRFaqg8pndNJjdtQ/HgsRWntbPFDzib90ZllCFxL1K5GBY4MlKDTx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947516; c=relaxed/simple;
	bh=X0GjaqTTAa5JidnwmIm7FesIRgbpydxFUu/Rva0HYuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yp/vbZ6NGirA/6aBi/ZVrYv+s7EC3nkOlStVHDVa1+oG8dcrRIi/hV2mV7l5FQnvEsGoLoNJ5hxQhdYPsf/k+vi8gMXVUqxzKyqXVMUdkfUaIambulU7PzRKdkytifOxIHaQ1ASJl1nOIhHhAgtqRep5SzICPSjMh8ySGtvZBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=T8jwQ3Rj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="T8jwQ3Rj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a6f6d52af7so11828971cf.1
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947513; x=1751552313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=T8jwQ3Rj5H3rxELHuasqh5vZyM0SKjzWXbKWyP38kkf4W/44vyRvVvpZ9oJXoXFoDu
         jBnKuAtH1OLqPrNnX4OBleDuFlpI9VFYvKVIzKCB+uTU40IejCdzxHwvtr5sPANukNaS
         yfD307mZRWZcTbMDdSuabUpTSY3FPklkDBpOBZx7dG3TtFMhisxuWL1RuZzzCz/8u0at
         0bsUPP9i5KoRdFVqd54AnN+LnjiHJQH7dqZFJPM9Dfw19rQQ/EUuU48kXMW6vYEdHBbs
         lvP1CSZyLGaIHMMSbRnWh28uzATrK0SSxZDXo7USFyhMkJoC75idlPZEfIcGL5gZ90ta
         y5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947513; x=1751552313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=GWkIW8tvzS/fY7lCWBaB52g0seLN3MGpsvIZVjets3rnUJXVKFl3Iu3xiWnIvjDXK5
         h50aNa1/7pLqFmXb6DjsmrvEf8ivjBN4g+vnq2LAZieBAeHwQ3C4r/I7VAk4HeGHpAvA
         8z4xRmRnJj3M0t0hjhAc62iG5KHo1O7NLFZi/VI/G/uOyFEDp/OcewpHE241RspidWt8
         LZcwWqHADAM5WlVXC7Okay+i1A5swxWbyUvr+Re7Z1D0/esSFHQ7cXbQa6L0DmADNCve
         hMGtcjJrraJUQNh5kbNMHxPuzcr/xVsGSIMkK/Qf6g35PK8SSVJl/IZCl8lPSxyg6DZ3
         tZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe3oIExhAxtzbwQic7Wd3etoeB18gQ8HnlLBLofeP2beOe0j14aksBSFxFE+vL/xDJxkk89ayMsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNR/L4Z/BMkNTEQOdcOH74tcdNmS1DPGSMh4PPjh9V3Bmgk13V
	royOyr22N6pJK7kV2rZSssCPglvmjhx7ygcItioGlWvxSyE00d7pN8JHV8ZtKzwCQAs=
X-Gm-Gg: ASbGncv5U5uSBRaf57K1Sh1n06r35Y0L92az19ANl1w2ZTB7y88QoLLMdqN7k59hsMY
	LfEi+POZY5HSQLh14q01xzQj9Ul1q9eaYxtKumHbDps0RVQucgcOVYc4Z5+DuUcgjRJQrn15xlH
	XnW7HRg9CVXG0MsKqEKmlzT6pyr/4UEtaOrbv9MeBFHRRmMiFCmf7EhdrzYqddps3E3ENkiZKny
	PYOgu+rJRlUFTQgK7gQaM0TmxN9TVu+2718VLp8RgDxrH1kBFoYVapWfrkuRJHdL1Q6gKeG2pHG
	pxqj3qTkkbkN+IBzoD/H048gi/TK8/d6MvYOIXqkhG67V2W/Oc1sJizG6xNDPdy+EpYMYmAEzgy
	WTGtVTxOoZwj6wjaQoxWC3nFm15BDjxVvVP0=
X-Google-Smtp-Source: AGHT+IH50fVe+8buCV/yNDQQL4G1EmkNFITk4SYtG40d0e2VPlg856V2s5HzZ2dfEIhiKOw+A+yqaA==
X-Received: by 2002:ac8:7d43:0:b0:4a5:a7a8:fd83 with SMTP id d75a77b69052e-4a7f2a3c555mr61902301cf.44.1750947512103;
        Thu, 26 Jun 2025 07:18:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] spacemit: introduce P1 PMIC support
Date: Thu, 26 Jun 2025 09:18:19 -0500
Message-ID: <20250626141827.1140403-1-elder@riscstar.com>
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

This version updates the RTC code in patch 4 based on a few review
comments from Alexandre Belloni.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v5

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
-- 
2.45.2

