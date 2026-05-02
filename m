Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14B723BCE3
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 05:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699156; cv=none; b=K783nN9/yYdHKg82cb38DDxy2nL937EHqaUc2qcuHlhud63DRokxY6WsFfLih8tJDu57W4GV3qYlOFTfjAm8rQV7W5lYLB1ut7uLq5zCgG/yWwmMSt3IBxCd5cPGO1WaSNpY+u11v0MIDJkLN7ZvTrlKng98H8CGETKA6rgU5QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699156; c=relaxed/simple;
	bh=1ggK7mPsnS7zqgz4VemPVqRPiFJVYau2oDq6ODxaR+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jHKFZhi1W9bw6P4I9HbzWa1WcY02yr2AaOCOjdReWeFcuay51/NRSDR/+A60FQ26jKVsIopZ4fVz4nfml+RSQjoqe7dsz67jmpALFejuEWQLQoBsUn7Q5hCl+YcSZ1WiGcx80IT78RmcHVv5Udl+PCFeBwwsJ+5d4N3tkkJsktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIqz7Jbq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIqz7Jbq"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1160366b3a.0
        for <spacemit@lists.linux.dev>; Fri, 01 May 2026 22:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699155; x=1778303955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrUF75Mz/1le31qBCqb70yVrs4hFKnGVHUNBS1DYUtw=;
        b=SIqz7JbqIxYIzAgr/I4ELyPDY4SWuMKCN4g94S5BYNHcFqP6uw8KoSDSETiwf7ECa6
         7XDZeTVDQ6Zg7IO0452MWLGiTWh/rEMWLxHv1wzE2LesSqLvWQ+/Yt5WIgjBYLCdOACZ
         ciDwxlZCHxU4kGcqrCGaU9o0Mc5DvOrUSN18D3kFA0Kjm7gXEvuXNDu4TvywSTeKeeCS
         wFdeEdcQ9H4FoMmrvhUNdLTqM2r5pGa8CLLC70tQlzOyFBb2EIhdKLdRmlng06gxQayV
         RgsWP5xyvr4CdS71sYglFt9HdsMpFxu9XyV0o8IwR2umPJnzzDCWU2mK3fdrL2o0DqSq
         dFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699155; x=1778303955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrUF75Mz/1le31qBCqb70yVrs4hFKnGVHUNBS1DYUtw=;
        b=Cx8yfL89/DTHnoWC3oZYuKfGBkAxZT2UeOOOtLKWIUhrbE03KpZAkFVGlSWSncDvDA
         HiuulVruIg/SjDl2rRGj1zzjcb21ZRZRcl5UR3gm1JhcNeVvY8n0ETABMiuyTxfz0kee
         OyxkAH91u3pvzLDSOyrQyRlRlsT+xjBnZMtdXVhmHNsFZ2BldaFjYTvrhw224C3wjmqW
         QzKjFzM63OLdK9/u70O2Xt1cWuGk3aCsSB7LYfaxpmOq+Q0H0ZYErp6gHRrCIQja/p5n
         DMQdMYZpUc1yDhEOBVoob1a0iGZmKrTJXgc6QLnGeeLTKij8itwrwQXYuD+rY3eokBrB
         nGAg==
X-Forwarded-Encrypted: i=1; AFNElJ/A5IiBuh69KQ8ZtVcN9NKu0UZtrXFDOPxNEHhxG/VkBd23DBXmmnwqSfRC7v/xLD2QSdBRiJ8ldA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylenRPrrea49hdYp7N+5gUtgbjAYOtXbMIpP5wFTyRV9JN0LGS
	EWCCr9Bbghuadz2sKJB4qRjZEyZA3eeMvfxy86tatFsiSajjoEM9EQrx
X-Gm-Gg: AeBDievgyEcDf38duBB8OGspRKvhYwSyGGW5oEg7dO9U7Z8UVheUGZ5cXbotaJmvBZm
	lsDP9RyXIsrptcvS9IHmac4v198Ryc5K4o6BU+SBLR95Jrj/aEOQM2sTYAEhTd9rLXqOgiCtCNN
	vV/F4X4G6i7Qh7DKJjjClClEblWUMPYcl1dyQwB+lwRZjn4C2AvidRgl7bL0q2DxPyDPO7gDMZA
	SBGMOtvbCELerYy2UG36SyTlxdO73EAuswntEzjbDqMD/xAQz4DA2Pn0q/1d2k/IQ/tokVHL/ty
	lZR8SKYudQhfP37cLrn7+wBZzlff4lWdmm58IsYqLj0mHGF96TFtczbcZz7Y2yQarGXsG/fQP/v
	hVkE8Bav/Lo7fRguH4Vz9aIVa1d5aoBPUJQOEWup2U28uHxrJju8vykcpW+jQ2rhKXmzmS7oDT1
	E6u1DTMuWH9rXlxWNLRunh7rWD25J55w==
X-Received: by 2002:a05:6a00:985:b0:82f:37e3:ae67 with SMTP id d2e1a72fcca58-8352d20b18amr1983415b3a.27.1777699154297;
        Fri, 01 May 2026 22:19:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 0/4] spacemit: k1-bananapi-f3: Fix the power source of USB3 nodes
Date: Sat,  2 May 2026 10:48:53 +0530
Message-ID: <20260502051906.8160-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following changes fix the power source of USB 3 and pcie on K1-Bananapi-F3
development board.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)


v1: https://lore.kernel.org/all/20260325081700.1502-1-linux.amoon@gmail.com/

v2: Add pcie vin for pcie regulator.

To verify check regulator_summary for more details

$ cat /sys/kernel/debug/regulator/regulator_summary
 dc_in_12v                        3    2      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc_4v                        1    0      0 unknown  4000mV     0mA  4000mV  4000mV
    vcc5v0_sys                    4    3      0 unknown  5000mV     0mA  5000mV  5000mV
       PCIE_VCC3V3                3    2      0 unknown  3300mV     0mA  3300mV  3300mV
          ca800000.pcie-vpcie3v3   1                                 0mA     0mV     0mV
          ca400000.pcie-vpcie3v3   1                                 0mA     0mV     0mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV

Thanks
-Anand

Anand Moon (4):
  riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for
    Banana Pi F3
  riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard
    usb and label
  riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
  riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V
    regulator

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)


base-commit: f1a5e78a55ebf2b05777fd5eb738038ddae609d6
-- 
2.50.1

