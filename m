Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FF742CB1B
	for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299606; cv=none; b=ce2aFD7nR9KPUX2WTHFD4fd2eQpEpx4gAMoepb1rCxzALZJKlZ7DAXHvQYzRdxIOaKjRWsk+r/upfcZ6jeiiU550bvNnIJdyziveAEPMTKZPTIYnxXZkF7FfENQa5Og5+e6QVJmow6YUHKcmBB+rq/Os7SDv62DTH7ZE/wwm6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299606; c=relaxed/simple;
	bh=YAX4yrYf2N460ZM8PKjQ0E9u10cSDf5RPLDAQ5nktPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQuccqnHnWSHnjAEz1rL5v32DmYuLb6S7pYywuBZGU2VnBqyvm9QrPYL0HWXUXNLqLm/LC0pE9f13mV90bUMNhps7a7tpnx1PfAZJEadDEaMMatwLDWw/CPNIUBwVxPXBQMfkO5aClOe4ZU4+eNa2zyTrD5/MVC29rMxH+2UEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScIp0cbo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScIp0cbo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso8771875b3a.2
        for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299604; x=1784904404; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10KlgQy9N9MJdDXX/XSsz8Ezi+ZEbWPgqyBT/h/8Ao8=;
        b=ScIp0cboMc7tWW9eL68sM1iT0bpZiC2Y+YFJmZnTCQKdAr8JeRjpyNCgaumRFTDHUc
         lTGTSYAOv6DJJKSBvsTXcZXRQDh9EotxenoFDPGxrChh6xwl6g9h0rb7susoEPwS4sWj
         hcsuGErsrZm18MzyZq4Q7khbwdS9EJ5UKLiGPjVfW+HjbsbIoCQX/uPwI4rupid2Q13q
         UVgI1MKVkMoWQ9/z4SU5ZVc99Q8x5ZBYzYE5skNWLby64RjwHTvpOHSeBDn9u4fH29Fr
         EsHyN28JUVqTYGvEGNGiFhitf7JnbbuUu+fzaZ6Q0LTN4w8/P77LinT4bfSkcanR5jpl
         OL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299604; x=1784904404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10KlgQy9N9MJdDXX/XSsz8Ezi+ZEbWPgqyBT/h/8Ao8=;
        b=nQSb1IVSxbY+IvgLy12F+XbOSZkiHM3abh4rwjcSQCQIymGWbZnOmuyWnI5QwZM0h1
         YDA9+Nq2/Tu/jwjEU+guTveCHoyPyRbwsmmZatstiUKQfjbaMrq4N8EcW0r8BfPDKbMe
         i0eltQaOtqrS202vM2cWF/hXW9n2a0MoaJsAUaqXGLcMzGxEvEn8aFVcSyZg4BaAfwHo
         D7tBi+aoUBzATXW6f2YXWrZ17RXVnHC79fALv6Rp226lb9AYzXOtEU9UQG1mlZDsyzLh
         5yyqn72pdhRVifix9k9/7W7S41CAsVL3Xf02cUIUQoK6GDWaiNsLndg1euwHjWL1k0Of
         zXNw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5ICEepl92WagPNt2GSU9nkjb1XxnhTtJmLSLE454gVdvLA3cSkdav+BKJrhIJo4PXcpsGL0/psg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhuVRIqlRupI1nlbpD/m7xVV3lobypJjR4aR7NGKIe1Cq949GR
	lhoP9O9piHsDR1Ll25l7gixeybJwu0DnofzmdJRGthWaklBjhEFi/+yE
X-Gm-Gg: AfdE7clNi5aESQptlzP32B7sONJ+jJxMKgNUdofWOcDmKMW6myUSbNj2c0MElweEWNk
	P+Wk63zMJFP+yHy1FR5XKru5huldrG+c38n8boVUFuXqcE8OiB9mNRfCb+57AC7+tQdap1x93He
	Z1bDc1p8M4wr0hn8u+eFECJIif192Db30/EP9ZmRn8KE4NPUVZ8WCHnQHe3a0cH7k66H3jT8qSr
	kVwuLd/zI3LtvWPfGwDTiqQIpTxxFTy0Y3xz2HZVim+U0uR2liHQAwdysLMF4Wuy1a8NoGTIb52
	OQDBUhm6BQedpNxb59Jo/WE9Y4GFPhbU2mscDAw8swy1BLDJO2/9ndI6pqlHhUS9eEBGhkaxCji
	1eicwHJn2FtNGhmZ2M3SNDiefKhySCy+bPdAxb7xIU1DZzLGp6x33cg5m5OssH09KBzFFrnbUTb
	azLA==
X-Received: by 2002:a05:6a00:a8f:b0:848:4424:2b83 with SMTP id d2e1a72fcca58-84c2954238bmr3024749b3a.77.1784299604142;
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:43 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:27 -0700
Subject: [PATCH 3/4] riscv: dts: spacemit: add SPI controllers for K3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-3-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=YAX4yrYf2N460ZM8PKjQ0E9u10cSDf5RPLDAQ5nktPU=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAzzUWNTaXHChqds5Phn3jjaTnkwxyqfGomF
 onOANxxQJSJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpAMwAKCRDN9pw2gLgN
 2ArQEACQlXLAyc0T7YWC/GlKp300rT+YQAKiyjUXrR3fagaj7UYOhGbbnJtWO+ghcEsN70g4HB7
 YhdRvGfH0TEkn9bSfCto9LINj3OCteLSYyClNXNyct2bV+z8HI9+WEguuVI1CKya9psbziK4x2p
 sq9xUN/mw+D5iAXruA6Z9R4QYSzBebu+6qKSMgfWXIznJRDRZ5DSMq883sYYRxcTaCmAqhqzHaP
 AqCGZ32BpIY8NiXfU2ksdoX10yM5MC6dWwDS9s/3LhteZefD8yjkylTU1M355RdLrdH23fd/XFu
 MHLr+SolRt3ZZPDdJT7P/z97p+QiI/fApiwBL4N/Iy4CrZyel4/cr78I2d6s8cQpCe9xWwqdArr
 vuGT5FA9YW+yAhs3JQOG1/zgi7pWf3sQ1X9MFlGzMC/QX2DpZNOMcaovYa055kVrvhaYlaJ4SRN
 0c+ig7XnB+Sjuyug95atqE3nmEmDcGaknPg+YQDg/aFauhdu/M+MhyDUCiGjlyaD+1Y48oPKTV4
 fq1AIzFOe2c+HwCmpSvXgZfiks//9nD3zs4lmXy400hJTElkxuP1vBtrQJMervvRlSW67csi/8C
 65oFmebChpmj2IRZfhXC+12itoIphkFhsyH0vybr1Bi2s9+WGNG0DENf0j4EKU3dgS1ggKdPE4s
 BqW8Ce04JNqI/GA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Add the SPI controller nodes for K3.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 49 +++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..dc44b5c77d41 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,8 +5,10 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
-#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+
+#include "k3-pdma.h"
 
 /dts-v1/;
 
@@ -927,6 +929,21 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		spi3: spi@d401c000 {
+			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
+			reg = <0x0 0xd401c000 0x0 0x30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_APBC_SPI3>,
+				 <&syscon_apbc CLK_APBC_SPI3_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_SPI3>;
+			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma K3_PDMA_SSP3_RX>, <&pdma K3_PDMA_SSP3_TX>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		pwm8: pwm@d4020000 {
 			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
 			reg = <0x0 0xd4020000 0x0 0x10>;
@@ -1081,6 +1098,36 @@ uart10: serial@d401f000 {
 			status = "disabled";
 		};
 
+		spi0: spi@d4040000 {
+			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
+			reg = <0x0 0xd4040000 0x0 0x30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_APBC_SPI0>,
+				 <&syscon_apbc CLK_APBC_SPI0_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_SPI0>;
+			interrupts = <283 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma K3_PDMA_SSP0_RX>, <&pdma K3_PDMA_SSP0_TX>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi1: spi@d4040800 {
+			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
+			reg = <0x0 0xd4040800 0x0 0x30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_APBC_SPI1>,
+				 <&syscon_apbc CLK_APBC_SPI1_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_SPI1>;
+			interrupts = <282 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma K3_PDMA_SSP1_RX>, <&pdma K3_PDMA_SSP1_TX>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k3-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x10000>;

-- 
2.53.0

