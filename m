Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262B569F37
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090598; cv=none; b=R7pscbk6zQ0vw77LD3yma+HV331fUHziyKcnLcTvjIjY+IN+ERVBseQFnhSoY7k1QWZPJ9p09sbsYd683oE0g0Nt3pKpqS6zS8KbjO1mKUh7Rf8AdZWQUhvymNSP8ok0qYaRMhmK1ZLzN3kWjrfa2P5NGBHnHeCS6zv4IXkammc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090598; c=relaxed/simple;
	bh=AYquGq+PWPwHCXs0e1iyppBvIZnSoNzpk6ygDyKiN40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c73TJTMCTUQJsa3cGnt5/cMrkAF6EVUGXTHgQw7mdTkkRxRnDCEvQpul1PniSWyOPjvxEh29abaJBdqAOSb2s4MftGzKDiiZmmiW+9MmeuW67PHlr9OxzYOJA0PubbF4M5YoEm7IRZmV/tqNj8biGz5Mc85U6Wn2dRDHY1JwDgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSo0RsbQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSo0RsbQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so50302375e9.1
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090591; x=1792695391; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=qSo0RsbQNz8aDJwokWvwGsyJpDbaQeMQ7bUvlwQGYG8NWqJcIyypbhu1TNHeYDTMUc
         /lVGgzzjpnSwi1GwVLH76yeqDuUhGGZkCI6Tb+ChKKWKA22AtLgkauDtGRz2B0L1SB1K
         0DiWnXRsvsddNA9o9DWJs+MsBFOVm/db6yvhUGvnLUCw6yE35J2EIBnVlM4/6Ec+AcQI
         47RHaJEQSftL/0j/a31M8JojQo1zLFB4f1/mstIOKkthqEcud/I39CWJrX2C4peDfwL2
         ad+99Y+Wx/q7qGUdAhvZSRjQMDC55A0MJdebYYpAcZU15YwW+byUI506Aqm7jX6P579U
         dJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090591; x=1792695391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=SR+ChsmbwpNpf0NIVQgDzdU8ZeH4IsNata2W2CCJ1jbLijyR9GIQTNgiCJD9lXjorX
         yMfvCLEvSyrn0H0HJW5w7C0kpLM7K07TQJggFKUJ10NapFpChuguFyazr6y8OnQR6IiZ
         OLTSGgsThRZZ0RSEuIn/egAtcgM/MnLs5EJ3ovHgu1waHER3cep45H/rrDhNMGZKGGGa
         34mhQWqC7TCTTkCAncA6jf3Gdec/zHnISR26iGnBH8VkRYkQUISOqYXnSX+l35IB465z
         rPRuja009k61Ec3ZmrG6XfaPN/EjgC60BQz3UAmf5RRMf5x60VMreZu42rvtG4S6C7RT
         BNiA==
X-Forwarded-Encrypted: i=1; AKwUvBy5yEabkozvg9sQwGM90I98AOt8uw+xvVdf5v4KXg/Xbji9g0+Q6nGmC0juqc7EXk5MHhHzPhQLTw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIOmaDUhFqM9gfqJwUWaGeubQyH5OFPgoZhipdDSoorFyiVlzNX
	vTo4X9H923j4iQyKx3s7e023cY0nm1AlroxDMmjwcRUzKnJahZXFBkYf
X-Gm-Gg: AYBFou0wCEmWCFAHyKvEMIrN+/oYQ6vR9iWgmkNNL7m7KHs4KoSCN+JVfM7+n6us2sq
	TwENvVFsXn6o89BI7fvIbYr6AlddiPQv9tBUXunNvSdqTbLGBFIxFHDJGtkJFtTXzqZPHR3QzuY
	Ma48+VdVlndaxU1MicywQdwK4F+3B5rvVfGmLaKW4efq+CURTXCJbm42SpgJUwP36+XZPrh6njl
	iFNL0M9oDVRdCIqweCWxlGNOPNwaKxiC8SQ729uG9zQwahzmr1H4onpY0BIoVzmqJt11/oW30VM
	kx6DhNPrd7paz9Z4KB67fgzRyaLoZUNa+78OkU0M8rjHchbOmz2XDhgDIom+wLRwLStNQS9NGA4
	Vmtkpdzet6mt8p0TsVZpn5tAPqfxwpdiBSBPmsCo69PoQQtqwpcsQdKuZc9OyuY0KQE+wpoM9rm
	nDY6Ef6R6D/DT9oOG1WX8acbdvb+2L145al7T+f8SGDm2tz7VPWfGvgaxgkquvuDlL6he3HeUR5
	5hchwxkRsX7Dh6NChKpGXeMh76H0FK25Rx7SyAwAA==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr398603945e9.5.1792090590951;
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:05 +0200
Subject: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Add device tree node for the Imagination Technologies PowerVR Rogue GPU
(BVNC 36.29.52.182 / BXE-2-32) found in the Spacemit K1 SoC.

The GPU is located at address 0xcac00000 and uses:
- CLK_GPU for core clock from APMU controller
- RESET_GPU for reset control from APMU controller
- K1_PMDOMAIN_GPU for power management from syscon_apmu provider
- IRQ 75 for interrupt handling

Disabled by default; boards enable it individually.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..82cade2f76fe 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,17 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+				status = "disabled";
+			};
 		};
 
 		network-bus {

-- 
2.56.0

