Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B807246327
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486049; cv=none; b=jlHkiBnzuZ+BcEwCsY8yXUk3N+OhGaku+btOpCa2B7cb02Gk+NBAlnXI6JIvD9QBQUrqi24sh0LjzpjtysaoXW1XpZv8byd+Z7OE+Rvcfx1xgS3GgMQ0ZGEBB9dlUV/nSPRRI++QtmqW1g0wTNKX1oLDAJQeAr5luEoK4GLpkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486049; c=relaxed/simple;
	bh=/btqLu9YUwLhGvieYWNsjaYgCGjJUVWfq3uFh2mxvQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sALQ8kN6QwvQbCwELdPlEj2r0sjrg2k+CI/fpua17uzjWUdOTE6CJz9TjdQMShX2UymDWa+tX9lApVGmnqPIBYd3r+1PAyU/m9WkQ2rbsMCEg28IjDSLctC3Ro8UTTR9mGwzVAGoO/OmANZr5XrMV5870BdiTQ7pz8BvvRcEYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XT1qYei/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XT1qYei/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45555e3317aso16239345e9.3
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486046; x=1753090846; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFrJpXFfbxx2B9ksANEMQWjDtT+enBv/IzvtrGekg3w=;
        b=XT1qYei/MPmSfYXUJD4HuemDfkCkSHBqFKLvmriFfOxdOPEXJhNUdm1Fj8fpK7vtBl
         sIFhRp3hB8T+/MkmYoxXwbcT+Gqj5vzDf898No4CHk9MeVLuMcqaAvNxUwl+M2q9/AUu
         2hdOUJehcIyBDHntyZhtgJuytp16nD2L0a3q+R1rEcxU0NxCavk4ubKfoAnzDoefDcCZ
         VVwAhqcWlcNsSqY/PYTu6jOYiCvAcWy2YupXpHHeGcfdJdT1taKlUoDM9Yf5UCuytNbF
         ANFh+Q74Ld9BzMEn94Q2gBROZCAEGr58aBNdP/2C6twV27FnYSb/iXwDDbhW5JOrtLKG
         x4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486046; x=1753090846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFrJpXFfbxx2B9ksANEMQWjDtT+enBv/IzvtrGekg3w=;
        b=F9cXEUaNZWvmKPriFiWpF8Nt9otLwRfsuoXGisO5PH4CmEMgZd1Z/MBEI+j8NyXxeT
         wsA90TGwO35jriWakWRlmcvQvgyIlefk2Mjaz70bSHQowNGjKOl+gltzpW/zRuRqrrRT
         AEBhHmSiQuxs3UQm++vPQPHxM8/e/J935dejthoF7a4b/uApTxMxIlh5QrTdFHD7tzn2
         gLPT9sK+cXTV8oCVDwZx3x/EjaQvJu9xsRPfpOa1ihd2wQApSyniMzqSgv+Z4y99VnJM
         PlG6o4QowjbQ2aHpijPYVQC1FrKLPrLksaOr3Ah8RWaaacE6NjXpCQ3YrFlA7fQlyXHR
         Sd7g==
X-Forwarded-Encrypted: i=1; AJvYcCUxIbL9mFjwEP5zmlyM+WEjthDlxEvGTkxOpPATGQ5CmKzcuFRZn9EIxrNwWPMnMt60+/DdTf82xA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKpVTfKGrR0qNRanb6BXAflN8+/DwJ3nD0LnDkzX5RsFS9L0oL
	EgB6p7ShPxYpWbCTVjyqfsTXbSXT7o2607rTNHYpFB7gNc6B2vkl049svWXLwd3hn5I=
X-Gm-Gg: ASbGncup3tdbIGntkIWG2fo6GidiH4+iOBa3NugT4Gy6oM68r1h6HA+CDLd4I6paFUM
	Nfn7uNjTNzWBa3RTaQsINwY6LSCST0a1igbxQfEPU3ru3RSsr6u+NiNEVNE9MOqcvyqKgPARewc
	LrUvO8K3EC+zC1ZEpbLJm7vgnLnWofFBnsAzYDVz0ld1gTyCCapW0mT6ORckYpj8HYUG6KvAAIg
	9n6CudR8mpR5awtg1BDzYA7YOwkuiemlzYBHjsNhH4yOkSBy69/9urTWP3rNsxy/dFYMNm5/4uA
	3mkMmwrzbayumtjUAhLOVrFS8mt/NrLx8vcrirhJrOxo+gdBE5Q37YNk2vMpNE6VX8l7L6i5ng=
	=
X-Google-Smtp-Source: AGHT+IF/LhOg6RIkatqA9vyQ71gHfsxJ1ctVouZmIzEYwK0/MuM77sFw7XTim5p/um56mFwUUDCigw==
X-Received: by 2002:a05:600c:198d:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-454f4253f14mr101420315e9.27.1752486046346;
        Mon, 14 Jul 2025 02:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:46 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:33 +0800
Subject: [PATCH v3 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-working_dma_0701_v2-v3-6-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
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
v3:
- adjust pdma0 position, ordering by device address
- update properties according to the newly created schema binding
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..46dc002af947893cc2c234ee61e63c371cd966ca 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -660,6 +660,17 @@ dma-bus {
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
 
+			pdma0: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				interrupts = <72>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				dma-channels = <16>;
+				#dma-cells= <1>;
+				status = "disabled";
+			};
+
 			uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";

-- 
2.43.0

