Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C427E1D0
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832025; cv=none; b=Mf19Qnc1jSTWd7FpzinyiBWxpXVDPpsu90RGC4SRa67hJqE4bvm0/S7GskJV0ac1GVT+PoHI/D+DWvHUuw+8Pwp9+gIhQmRMHCm8cor9qn2wUpJmKCzvDKQGzLmIfoxjoH3pTXTLkfzQFG+XM6z2Q5q/Fun5h+Bg2is40rh573I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832025; c=relaxed/simple;
	bh=cFrWQEEvMc/7ZId6uak27PuJOXHlyYH9+xN4BakqZpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdJnxJKywwB3DhVQ/uOXb/IqMBp54/0kcSEXEpK2Yv4uvJDZ2B7bo3ZHiPYv6U7YBDMOn6yiGNs6yGk+XXQs4X4eg9r+sQhSIllqIrLlCiwIj9qlVtN1+WqmKemKguIpL3sYOqFqwtyprz2eMV1pC3C4JNv5wWpLeEF/EWTEQw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A295diIS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A295diIS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b47175d02dcso1272859a12.3
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832023; x=1756436823; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZudeS21S7Z9HKYl2WwDLHxu+6vkPHg6qhFAwHt0tdNs=;
        b=A295diIS15qzboh1n6JXBx97AjSeLkwxwKtmp0ojpCVBSfZJlezExr90KJ0EGoJSb/
         Esi5PtFhann7FJ18PMisRAXCGHxsM2RuHphbyIufWQZ9OrGFfnfU52+DNYDIs8jz/csz
         QxUfXNqSysHc0xEHa0YQs2+FkhqB0I6QqhMswdeVTcmBaLDBTM+Dv0VtUS+6k41+NwHo
         0gLh/SttSuZFZ4JLuc00v+bmb6x3mIeToV5yDne5sIvnqoRb5bTzMALy3C4Nsxipe7/f
         2TAmzX1o1q9dcS7rTSUnUYmiGoSnMAwYW/JJYSXlc2X8A0d5thhgznTu7HO0c5L9+R53
         k1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832023; x=1756436823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZudeS21S7Z9HKYl2WwDLHxu+6vkPHg6qhFAwHt0tdNs=;
        b=vpP+MweAjytoUfuB9xKfPnDFFUjTZkJ0m3K5dUrxPIp97BFCu6nHu2xoBY3zETxfWf
         MkVyA9n1JA4YQyn+LFbI28uKprDewLVdkWMM2D58zY3htJof8VoLOoru4SFGfmeslrT9
         D9He/c5jhnhfW1HxnUo+EQGPS+CORLVffge5JS8khuC+h7PehZ0MtyuM+639tsGIFROu
         c+oaeSOjE8CGlRBK2CLR3rWWYxrU6ZjEn58OeQOAoR4Ss8AvH+xo8adcHKH+wsGe+TUq
         mI/jt6xI9jUqOiTnJGKLMROx7CPmRNuaK/8GsgSgnt5dM6wpfDNCHaB48+6NXfUBsvV0
         0S1g==
X-Forwarded-Encrypted: i=1; AJvYcCWJdFSx2YFNjxxMW10vY5+/BbsvNZREn98gJKgfPLNOyfpXaAT8DcNX8KgGqXKpQ0L4hauz+9GCIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyihB/ZpWVHDk9BD3z+rseaZRKaD0aZdCVy8+CfdMapv5o0neiU
	kPtLesrml/sDfsrViU6Y43xittHTeaHOOmPpAcwETdCKBv8xL8lG6hJoMfSz/f/wnfM=
X-Gm-Gg: ASbGncvmVuG4NXUwLfMKj71NRJBuF6etufDDVPBIdkEOvXHK2QVTQq2GsgVxYM1YfY9
	RIhst6uUVyVPdh73FuSm+O9pNw3MxVtGmCu0+LY2Yfk6Ow05P/gbCRzqdR2EZi2YRjGr21t/kw3
	qo9BP1ILBFNkcslqiCdIoxCJyuuu4eddcbrxu43wJnzpsAGuYl2+pqt4Rjhnw6cPS+tXsWJMvjE
	SV0n/xiyqs35xvxA4Qbl2YQTY2zsM4rA1WEPOoN8egmk40NmNvKnt1m56N+wyhhLjtJqwObgau/
	/edITgBOVbD8+dJap+6Gg/ZFBgFU+Te9YLkODWQiQerZz+OqPa9XbcCzNweb1G7Ix0ZK3NHxTci
	u/5rCttqIwT0eVjsTkjGSJgAQ5WDQhRAV5Ra/svuoDqQx
X-Google-Smtp-Source: AGHT+IGm4j2NRRY1FzjfoUSGytYiPyWd0cIxjX3x+KRIkqu4iEC4XXZhVq4VrVHDhxiZRilFQYwnKA==
X-Received: by 2002:a05:6a20:6a0b:b0:240:489:be9c with SMTP id adf61e73a8af0-24340cd3104mr2211058637.39.1755832023564;
        Thu, 21 Aug 2025 20:07:03 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:07:03 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:32 +0800
Subject: [PATCH v5 6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-6-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Add PDMA dma-controller node under dma_bus for SpacemiT K1 SoC.

The PDMA node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
v5:
- Add reviewed-by from Troy.
v4:
- Rename the node from pdma0 to pdma
- For consistnecy, put the "interrupts" after "clocks" and "resets"
v3:
- Adjust pdma0 position, ordering by device address
- Update properties according to the newly created schema binding
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..861f0fe18083fa158da51bd3be2808609f6233f4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -660,6 +660,17 @@ dma-bus {
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
 
+			pdma: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				interrupts = <72>;
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

