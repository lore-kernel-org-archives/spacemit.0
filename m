Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819563;
	b=EnHkiEAeLHj0A1owtmIuonQri8q0nVZGj9iQAloKS3pL2CHkr3U4JxmdESiiwWnR2qpS
	 J6qnuqTDW8tzOnw2aWKE6/fA64zrGQIZ0Kj8hxUvZIVS2fZ2HeeqFv7E7M3H1IS3g5ovY
	 ww2lJyHpXy8eVc8150VyUPDxhteG7IkiBGAnSMvy6MzIDbLVxMJHE720rxvVuwwf3ovj4
	 ffNe3wd3Oj70cKzNy4zZHgOLdBhIY+WzSX6Dy6UhiEUo4SPE3QyTsGcxrvuKJotzYnTxJ
	 /KUIYI001qfkOBmm2+/BXyLB06FPaRG7ifK37RnxVBsyD6d/LFhPgOH5FHOcKILc8YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819563;
	h=DMARC-Filter:DKIM-Signature:Cc:X-Original-From:
	 Content-Transfer-Encoding:Received:To:Subject:Date:References:From:
	 In-Reply-To:Content-Type:Message-Id:Mime-Version:X-Lms-Return-Path:
	 X-Mailer;
	bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
	b=kF/hrLMRCVkKZxkg34Ft7BdKXwg4rT9rp7iBKWh/XRvdy51P+4/J0bJNVdP+1ncFo1Vw
	 updDvpuhxdMseybRXmuzbGVlIFXb8EnYpGL3iUMWb0IIWZWhO0O22LBGPyo6doP3PgOTz
	 B5prEn7eHlBVFcm/5cuV2M3m1O53RGtA5MGYD3L0xVpPIGI1X4MZ4Ay8fUYhRPzbw8qBr
	 tL7qgROIGBueTvtOPfLMOia7gDgAL0deSw9J/BYGI9fnDkfG41oxivYS0MRQtv3CI+LRV
	 K9bCdbg7LRhYUuTcB7f1cbTMehwS3PA5IbXlwXs+mY/4xv/UuLkF45Q/tniqkTWvvRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rFAVqFjH;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADA6606A884
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 08:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADA6606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rFAVqFjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819558;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
 b=rFAVqFjH+7l58QG4x0f4bERb85yghQzn75dTcd1eLvmuGc1z45eXB6TOqb9UzNLYQIREGW
 u1rIAbNkpNDZlm4wqRMk2/K/YW8CDD/FfM3TiOfupd9PkfeaS2d3DcmxJygZegQ/XfGin3
 pguU4KbLMC118rQaDhx/UdxR+a1quL28KHfq8Q4L6w2rV3Y/U30NgZBZNFsXKmLKN6ytYq
 uZ05CCbVK84H1SD0b1Oy126AUBv2WHa/6OcVakpY0EcffeYtNRBVPq0MkGJdwWQxHXfxip
 Qf0x2R/t1yJ3vWstuZw4jfKglIGY8h3uvLIguyU6AOEsNx2+SQSqSJ4MDxNA3w==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:15 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for WLAN
Date: Mon, 16 Nov 2026 16:59:06 +0800
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261116085906.951287-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afac5e4+fa3e42+lists.linux.dev+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0

Expose the WLAN enable signal of the FML13V05 as an rfkill-gpio
device so the WLAN driver or userspace can toggle it, following the
K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804a9e64cf6e..f84225cda1e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -30,6 +30,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0
