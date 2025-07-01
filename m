Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A923AB87
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348294; cv=none; b=MzX+MV8JKZs3yK8C2JOs8Fuz0wUJvrLlU1gn4QasLqIARk6jMgEa+aY29qvlcwp0myjpUADtdauUPyPYFpGzKY/TTR3dwwIun9d6RuLNksXTdPxgf7ehZvV54cb61iPfSL7MVvzjDbNZGKk8uWWZ6bIRGExp4PB/kiBJGrODxEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348294; c=relaxed/simple;
	bh=jeK9tZE+sqx6u/AlkHuW+Oi/yjhHjqxpmQf98di5WaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEVPTWNpNwL6upDPNzsHeXEiEMR7qpy/An4rNoVCJriyLHh5pWqQZGMDRAC6O7GQbDYyS1JWDgEPKKy7jMWpRicQjmnILupUXR6EjS5Du+caced8Z/WbvhPtMczqU2ws6DsxzrBc/Jl7loVXB5RZnr6vGDzJ89ihBAz7I2NTiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Rqt0wgPw; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Rqt0wgPw"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3121aed2435so4847221a91.2
        for <spacemit@lists.linux.dev>; Mon, 30 Jun 2025 22:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348292; x=1751953092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmX5fOXWCoBnrBEU79U5TxH9E1pYhnhJLwNdCcpNrA0=;
        b=Rqt0wgPwW2g7ZJmowr2+IyjtAHGiheW8uUHCTuqZQOwsbpY4wNhXgy5hOE1x8Y6jZT
         i+mijPYoe+CKYrhDxjE4XW9Orwcm4uWbPUybz/0jhAn+xuSLUSNvn4F5FfnWzoWIUkXk
         HF3Yx89lgXZsvXDTkeL8PbRxHWRcmMGKGT9jD8pM73t1WYVU1iF8m5K0uYZzDxTl63pI
         VfMuQGZml4trxAMG2I5Vaa9oh9kn9+Ph1ijf9yiNa7sZpHAKjm4PEBzeUdoFKEcxM2hL
         V9zN1XVJkqQNMB7Ry+xGVMjtwyurLRQ7TCb6/jNfpqWETEckVatHTHWAilZU1KHFQCAu
         i9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348292; x=1751953092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmX5fOXWCoBnrBEU79U5TxH9E1pYhnhJLwNdCcpNrA0=;
        b=sZAlEE0gLTyevoUeTkfv+x4aBmHEXlhpdV24NI09z+RBXimkGIKQCvrtsmTl0bEHty
         Fh1Vd+DYjGOpsWbPoU5QLZqrL58yAjIPpARFp50w7XXpoWGxEapx+koMbl8nXG71lgVk
         4z3ANZFML11zkPUPk/yjfPQ572raQ27iwhfEu0mrgjGMCQVtlvtRWiFHQvZI/UF3eouk
         kOtkPPZF0Gth9cXyS9b6ZhizBWn4L9kBM1kCY+Rxk3FJvBJKwSSrt3DtQRL3tEoLMFX0
         XAi8z5EIOQuT+37ccnoNbFRfZtVtACC0F8JgkzQeJMkD5/hJTP+OVBLPCkHOtwXrsKnz
         HzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGC46KbmYROYYxDhAROysZXrq0zG10Sj1yxaQ9WTiJv2usvZMxY1wAxKYkMPu5KCuq76FZtHz+EA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS9NLmlvyayrQWxK51oGGnclCaxgU5yfSOH42vXk7orSSQKEPI
	JliSh0VAcCq9jmjyJOzktC7uSCXQHd3asFq8q9/epfQe7tTpIxPXy8YmQy7m+7dAaaA=
X-Gm-Gg: ASbGncvmGI1oNQkN+GUoazsa21r6jHkITKx6zZX8W5P+wZDbhJ6Mc/HTzTYRR5U6IKG
	jN/vLxdscoS2yRtlCBsD0ArKBqsBXSTY8tV+A346U4S5N/aPrapqH0y8eYC0aXK4FFgDBcbC5HC
	QD6w+91yZnKOafH1iAY69LqV0YK6keNZnlMrRuOrKoHtgIFf7GSfYfkyL/SeQ4QUtzY3+BmBhgt
	zDSqH+KHXk5Ic4u3iH2wm6AMGqS8vOcIdk6HgPMXQZ5bcDS+erlq1XUkYO+UK+vXYM+3tw7fCaA
	ORH3H92uGQD3GPnfy4mjRkFxRxQip9QNnUgU3Fg=
X-Google-Smtp-Source: AGHT+IFg+6q2IUBlKBteqcounl7lX9NwIth1jTPA47B/kJW1lDcCrpe2PThA1nJP2lbTdGGwBbnrEQ==
X-Received: by 2002:a17:90b:1dc4:b0:313:17e3:7ae0 with SMTP id 98e67ed59e1d1-318c93252admr20461773a91.34.1751348292231;
        Mon, 30 Jun 2025 22:38:12 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:11 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:00 +0800
Subject: [PATCH v2 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-6-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.

The PDMA0 node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 8f44c1458123be9e74a80878517b2b785d743bef..69e0b1edf3276df26c07c15d81607f83de0e5d57 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -591,6 +591,17 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			pdma0: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				interrupts = <72>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				#dma-cells= <2>;
+				#dma-channels = <16>;
+				status = "disabled";
+			};
+
 			sec_uart1: serial@f0612000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";

-- 
2.43.0

