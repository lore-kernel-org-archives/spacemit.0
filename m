Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772401;
	b=HZGKn3/R33FTNvwgMPvdP0C8nDjKm6tVCACPUKKkppQVA1lAa51WjteHyJyFjt+VhqL1
	 TYnOx128+TSpaCpu1ZToLBijNwacZxyZW4hEY/cPJRAPkqigw7EO8vwsu7AkHh389Csyi
	 GPvq20p/kd2UO5lVMoConT3HKVSK5hZhv01JdWJw9I6OxCu76X3m8EmEO7fBQ4vKM/blC
	 gcKaAJW/dFYV5o0FNKq7NRETqD4V1jYV9dsgGELOKiOzc5w22Vdq7iwjvHgiErp7mQbC0
	 lB2d5RdgF8HxNIipx4djtnQTO7iqyBBzqhQkUW62xXKxmrVM6EQvsi6977B9xDPTvOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772401;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z8Udy+gpKS3X/0jkZQA4Y95ag0ehIFXEGZWv/GeBkw8=;
	b=4FllDhbPSzQm9tQPBW6bSgAKRzYzyf/XCGW3OOzK3O+nSNhG9M2PI3vtN1LPJ9xMVizM
	 Uh7v61XP9eyxXyodOz7oEBt2YlLcyWy27oc4jeNczDhIodcWpSXJJVt6znBmAtchyLP+Z
	 eKZBDHGdZAeAba1SITRoGvU+S0mJVHG9IGu4nBnTwRWqQuQ2txz4XW5DGwS8FI0RdFagZ
	 V8Q31vj7KXxWAOkBqEjoMUsdYnohGCBnGiidzU58qPlwNHFUKhE9FW5RdaxUHMVvS+Dcv
	 AC/7oB5txdnMlbHWEPh1M8ZdhD2HDc1Cdft8Qm2ZKzevFo2qwNnNydP7coTRe6RjpGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=cZ2PH9iF;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0379606A32C
	for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 19:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0379606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=cZ2PH9iF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772326;
	bh=z8Udy+gpKS3X/0jkZQA4Y95ag0ehIFXEGZWv/GeBkw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZ2PH9iFTQ+VBRORVMazOMTts1QCCspB2vi1ekqjU7ulTotDrWL0V/vxpVwTyazPf
	 PGGnG1ooq8tKWntpZZsSq+1DfyP0euayW6/VY+pYx1YONH9K7GFlKBMRpZWpse9rmf
	 4dne2atDuWxKvKPkAQJt2ftQ2s9++5mFD3NsX2leEx0nUYDHiCsOoXA109nQoBNnD2
	 +WCk+pY6RoOBAw75TuPS/ktgY9skbEL8aByrzTOlKnbTf764Xc7ImcVyhl+dsj48LI
	 gY4KXZ+aVIBUw94/O+mVKmVppT1vCgBT8Xz5SYhnxPR8osj7pKg/6aYVQSPZUAhrAt
	 E7oE0KQmU29Qw==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 55773B2202E6;
	Sun, 15 Nov 2026 20:52:03 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration
Date: Sun, 15 Nov 2026 11:51:00 -0800
Message-ID: <20261115195112.32120-3-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>
References: <20261115195112.32120-1-e@freeshell.de>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boot loader may override this configuration based on stored ID value
in EEPROM TLV and if it does not then the smallest common sold
configuration of 8gb is the most compatible option.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index dda420900aa2..8d1cd468cf8c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -25,7 +25,7 @@ chosen {
 
 	memory@100000000 {
 		device_type = "memory";
-		reg = <0x1 0x00000000 0x4 0x00000000>;
+		reg = <0x1 0x00000000 0x2 0x00000000>;
 	};
 
 	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
-- 
2.53.0

