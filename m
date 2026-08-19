Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224B3B47E0;
	Wed, 19 Aug 2026 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158896; cv=none; b=HI4BcEXTkjnBnD7YDSUC04fb7j6DBikmnqDhtjc7TmrBg9kgCKriLnsp1oiXsf8AOvJK2mcMl2zQCE3QckRlpfbfJjHVKN5BH4Ifluu1/VKAIRA8HJ2Aze76rvOOgoktLtw5ePQSkJl7t5uWh2Vgf2FpMV1df3MdPW05/9PRzlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158896; c=relaxed/simple;
	bh=o1eww7c13pM2K6b1n5nxgXZTfz7/nmgS9dxK+EPne8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGruTTyePlLjjD+ZDRTsEBAPjuliR1mWxRztlaGYat8qy7XZCSA0aIpCgAwD43ebt0zHu23fPcv+glIp6oS3/bap9X7UJQi/0gQ92Qu5NFip5YLipsBRMuba5VTMUaB2QCxFxy/uNfBEkugUaFJfqs2s1daTNRjZho1E3O7BU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=iYW88pKr; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="iYW88pKr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FRQS4Gu3K1UkoAbTFDfDTx1Q+vsx7N9SeYOIsx1Uuv4=; b=iYW88pKrgC/MSw4gpXaiLJ7tHt
	McrtUQTYMOYe9QtDUuh4R5ChwP1kcy9d82pslQJehwPquNgL49APlh9gzZlQMRqBL+fR1r5XOpRHH
	9ZQk8zdJBTJ4UWFSomHbVesv7M1OE5RJ5mt4/kBjcbBanJptOf5We9kKcOnKL//bRrNHKlRNiSU6c
	oT4pMEOll46GgyETzmPr84TkyidtGPDjFVQQJXFR91so0waZGJVbu3CPQBGwCXz8IUdF+/Nh0nfCu
	PXMptrEPzi6AJiFdTvOKB6KrE7dM+Kz5IJ/c5RAvJ5WDEc1FHwaz7PLdm3yR8u2Wmqko9OZHFOmYv
	+6yCSS7g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2e-0000000D4kp-1prc;
	Wed, 19 Aug 2026 18:21:28 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
Date: Wed, 19 Aug 2026 18:15:45 +0200
Message-ID: <20260819162115.2252812-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819162115.2252812-1-aurelien@aurel32.net>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the K3 Pico-ITX board, by default the GPIO pin that connects to the
RTL8852BE WLAN enable signal is driven low, resulting in impossibility
to connect to any network. Add a DT node to expose it as an RFKILL
device, which lets the WLAN driver or userspace toggle it as required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d2e8df5ebeec..68f8224eabcd 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -44,6 +44,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+	};
+
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
-- 
2.53.0

