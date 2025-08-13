Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AB72F0C59
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077017; cv=none; b=Rc5TTxczHdKlOD8aFDX4YPYUOBfcRb/EDJ3f+LZjgduHdohnXWFlcDmJJW0KVhX/V99obyqOjAxSXJIKUEcxWX+3v4jkOecKMBtWriQpeG4WyoOO6MC2vv3hCWLPhEPlGmkH0fpMAMsLEKlMiWmoy/K6Rl8vGJRNzjQMweyABro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077017; c=relaxed/simple;
	bh=nSnlQzS3Oijb3uuQVtZaTkeoC2ip6X+Cu8XPFNiTPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXpoOzOn1H0jK6Lps0XpDlpq3iwKyv8hjCwV9RIPLe/FiaklvQGjUmlHtz2Y9JdV75hKygACaht6SKROsh6AAWc/WqidZAPDigWo/bNb+IDq1kRV7Akf8ebeCHe0YkkCTFTLjcdIvqo1xqZkmQT3mC9frZcsnVKoXKvMcT4QxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=W5sBoc+M; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="W5sBoc+M"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so6474108f8f.1
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077014; x=1755681814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEyolKpesJRN4enzfkBag9GEI6SkLDls4Ifg+2q31hc=;
        b=W5sBoc+MPTpPL6mKQr8ywhSZyn7NdEqijCPXVXMHYse5cAEAU/uwI8ex6GJyT/AsUi
         xxtBJnNJa/divpCOlVXAS8tzLW334ELgSerkd3h+fCfwd0O/b4KQdwrgst8i6FJwWnQ9
         LTL2w7an79QWJfXIuVwlIYWaE2wsFTKPExT7MtUz4/6UYXI8fp+V5dqhddRRAe9oPSNb
         ClpXywWP4T/QbEos4qyeIM/jiQkLVMmEvAW6VOOsMiwx2ZXs5BcnnBG8J7gSqs4BPZsg
         zuQv05FFBttp+IVhTnPSsEajrxkSsEBNbxfMyxzxvulT4to+Dw51PfOtjTkm3DLJ6TWU
         iKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077014; x=1755681814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEyolKpesJRN4enzfkBag9GEI6SkLDls4Ifg+2q31hc=;
        b=YtgHoh+hCGgPVWycM87mA9MdUMSsc7iY+XeR02B6WOn3JZMWux7kyfouec2uBAimlj
         fTUwH6iXMaDTPQgPIFBipWcvqNkbpAnCdkidIoENht12gbuDWUciK5Zu3NPdaI/vdgpx
         enUthlqFBpMLChVDPjat+68lA25rVPMZ9IGHmMHmWPQ0lDahZWmJnXOTyeUuWgaXtfET
         7RB6bbxJB+bvOMz6MtCqj8WkWuzAWl2Ve4CZbTyaXBVJfAyY/LVYT14Rn4ck01hUlIvm
         HfmMEBqC554fGe/lPrJ6DLxiO63WAgil0UBIWtPTon/vx3U2Shec3NAg2C1T5anMLmmH
         J9/w==
X-Forwarded-Encrypted: i=1; AJvYcCXOjYtzUXkrZFuRBROZDMkab7VAf8VfmbnyaoMeneXclhLTAvVNVMrTE/2BucwH9x3KqyyY1Jsy1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXBnclBt5Sf0yimOZIk/jff1MJXtx94xh59fOEC9UViCnwZt28
	5qe+uPGwfvDouwkp5VFaVnG3oE9TEdevLNBxiCwpfCY0xQZJy/NKxdtVLoP0F579KLY=
X-Gm-Gg: ASbGncuf+c3+OaXkcQZiqj+Yv3MoowZW7L1cjvNfUSBvYNhxqGofEGdl4b4QzG5QWxF
	e+wZhKd9iRIQckMwfvhlo8RXnZ4S9+QAMrEnhC/ZmaRp2dchwLB8phDjRIPJ89BC+s7woVf7QEv
	NpLrWU4LG+7/9+lZQUuFOR96bhut8IUjF7m+DDDP0UM1OTWwqqYIkPbu8aQeTlrkQNX34nvs7d0
	QZH9Xy7lYxNw/Rw9f+w82P0etHb1nyFkan7y57x1pIPSu/Cut6GHVs+2aVLNAHcJzStWO1rgH67
	9MWVHvf8v57WCWF+K50KZ+0y9drK/wv2O4LtO5uWEkOaRC1goauik2YwQbfGk2KCONFSkRw1I0A
	EoVOiXI/LFJ21yWWMAbIxfr8rJtsWZE/CV4ESUqiaB8umw3WkTw==
X-Google-Smtp-Source: AGHT+IFxawn2hn81XiBMFzlp9R7LXDt7IQlnw4bYwjrbGUdm+VKiMtSVAcwLlkK3/1f3t/cZPUZtdA==
X-Received: by 2002:a05:6000:40cb:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3b917ec345cmr1916488f8f.45.1755077013860;
        Wed, 13 Aug 2025 02:23:33 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:33 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v3 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Wed, 13 Aug 2025 11:22:38 +0200
Message-ID: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is described as using the Ky X1 SoC. Based on research
and testing, it appears to be identical or very closely related to the
SpacemiT K1 SoC [2], as suggested by the following:

- Similar integration in the Banana Pi kernel tree [3], which uses the 
  OrangePi RV2 and identifies it as the SpacemiT K1.
- Comparison of the device tree code showing a match to the OrangePi RV2 
  Linux tree [4].
- Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
  confirming it boots and operates correctly.

Patch #1 documents the compatible string for the OrangePi RV2, and 
patch #2 adds its minimal device tree. This enables booting to a serial
console with UART output and blinking a LED, similar to other K1-based 
boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]

Changes in v3:
Improved changelog: Reworded relation to SpacemiT K1 as presumed identical,
based on downstream sources and testing.
Applied Yixun Lan's Reviewed-by tag.

Changes in v2:
Patch 1: no changes.
Patch 2:
- Added aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Updated copyright header.
Link: https://lore.kernel.org/spacemit/20250718084339.471449-3-hendrik.hamerlinck@hammernet.be/

Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250711183245.256683-1-hendrik.hamerlinck@hammernet.be/

This is the follow-up mentioned in the previous version, sent now that
v6.17-rc1 was released yesterday.

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0

