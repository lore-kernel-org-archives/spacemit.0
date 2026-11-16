Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819614;
	b=uEh/FyQ9p9N6jaBHxXOQ5VAeYJ0k+p5DFRDxJSAtlPjKVJaN/lHvmrFj0D6TKoaseLFn
	 6LUYMmVYiQVc8QK9gS5+GW1ZCF4BpuiDuRFyayFikBxb/4gsvt7G4gmHASK71W2+i4NBK
	 76ji/u7TWosQX1aehugatdWwW09rbSQppx9+uhSuVT7u5G0fJFkEpI7tHIw7mPReb/Ojv
	 8potgLHgTkh+XMUhRV0flvbxY4l5rWp729gBYdejQ7s3/x6fg231iayGy4XZfXe0KSLkJ
	 fjFvo0wwExp6VW9xkmnx0EgR4/7oun3fUEDaTvQjA7iAdLVGv9nYFH+bPaHLcHrKXng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819614;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Cc:Subject:In-Reply-To:
	 X-Mailer:X-Lms-Return-Path:References:Content-Transfer-Encoding:Date:
	 Message-Id:X-Original-From:Received:Content-Type:To:From;
	bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
	b=Gfe+4oxOKdwDf5UumuDx7iVAnLHpxbqpDAP+NfzfKULflEVGZ36YJKiejbhJI+8LPvco
	 CYlOqC4iUxXCXXmNkZ1Hg+VjTutFB0AmzaIN8zafNibV12jaIBr3qYXQvtncAdGCXkMJg
	 OvplXhdM3Vh//WTw/W7bCQFfs3PNOC/a5qWwP2Nvegctk1qWr9QfAV5sT7pGbXPedH0/a
	 ETcvCQy9OjmWnIWIMZuN6UF9ro9giB5YOK2CuoB3oCBvUZG+OIcoiqTWT5Xz1G4lSzon/
	 cD41VoawrmUEcnCyM1dHLRSV/uhTAIJCjM6wau+fB5yj8GZ736XUtLqJTaS+92HFtJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd;
	arc=none smtp.remote-ip=209.127.231.29
Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B16606A33E
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 09:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B16606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819602;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
 b=FSqZ+UAdMtrYBd8YAom/an2rtDRtOjJyQ1rLAW2iRUOX0mWbEeYYkIMHoIBEleSCOgbHqD
 EdGjlaEI4BKXxvBigTnHnLNkcC9iMvkg2gxBwpnY99Pj6C3+NM1A+huRp2gPnH3qQSxoFc
 awLnLvsK0erLl4v2Bvhp8ubctAzwwh5spGw54ZaE6tBaFe0bYYDGF5Iq/QWhQ1gXD+XzEr
 XixWqlNDO9zNvCEMsAjZ/UqHhWWGbqj3fIMIsT5igYrKBECBCbsx3OVFK3J+Zb6pTVtMF3
 /gwnGWmScBt35zyMJMdNnuGmxetYJQe9ljiLX0lFMrrJ7+dtBbDXhefEGA956Q==
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 4/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power regulator
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afac610+b3ecec+lists.linux.dev+sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Nov 2026 16:59:52 +0800
Message-Id: <20261116085952.951331-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:58 +0800
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

The WLAN module on the FML13V05 is powered from a 3.3V rail gated by
GPIO41 (WLAN_PWREN). Model the rail as a fixed regulator.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../boot/dts/spacemit/k3-deepcomputing-fml13v05.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 8c12fd01227b..2e1ad0929ee5 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -31,6 +31,17 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	reg_wlan_3v3: regulator-wlan-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio K3_GPIO(41) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	rfkill-pcie-wlan {
 		compatible = "rfkill-gpio";
 		label = "rfkill-pcie-wlan";
-- 
2.43.0
