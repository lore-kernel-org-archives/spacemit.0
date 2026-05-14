Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381CB3264FD;
	Thu, 14 May 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774676; cv=none; b=HYvUmQ/GvLwSWMkxhoMQVSNBzd9YZuVcnpSKWeu6BUQnpfyGKEoDxUHEW+Nm2HwPzsHUT5VtOuqlaqFnjBakhsEL7gY16KLqqfuE0t0KvYGBXr311NJl/scQHUQdYgz6YUL2ZTgIp+jEzmpmBXKjp2Kg+uYE3RN2uS9hzYD1ngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774676; c=relaxed/simple;
	bh=SDBMuQKwD535Qqg1XjqjuYM6h0x6PydibQyyVhZd9LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSatRzBGXSgz6Bpt77u+9RtF+o9J67c0CtocyYsKf/OktamSh1Cb0Ub+6+cj/zOR3rx7sDd7tLYTO73aIz89PIzgkbY+kG5S4VM8yicQpISSjIn/Rz1ZdUG2GpzoyehoGcLB5zFD8ftT+hzpR6mmK3EyBQ197WOVXb/HAAQQFvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=DgBxONhy; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="DgBxONhy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=MDcF53V9v5HqtxunpienYMcM0tRyYISFa1MdRC1QzVQ=; b=DgBxONhy/TY6ZRn+5OyMN1kj3x
	bW5DyDiWmAfvdOr3j/NToJdpSwi2LERqUXuSZAoW0dD0PQypa5V0E2zxdjSJY2xnIoFe1zOnAp7KZ
	gBNoy95/V2OqOen/T0lNrSML/nPe4B+zsuDlxWLmghUNuEhsQNLHhQRaiWi2LTBq00IyszLXaaPX+
	7d3PEbAEPitrp2xl1f769C18OzeQGJwdogP3kMi0cAj1h0Lj/TZo5OcxH0HjyUeeu/LWphhW/A1I1
	VpQN4J5EmLWF5Z6wqIh/WQq6EAUDL9NKt6zS7ifl0iR+apvgVBIhczvagBJBB2zvmaD3/qB9V5YRS
	0reKX3Pg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYXz-00000007W2G-2Go9;
	Thu, 14 May 2026 18:04:27 +0200
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
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Date: Thu, 14 May 2026 17:56:23 +0200
Message-ID: <20260514160356.1642075-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514160356.1642075-1-aurelien@aurel32.net>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Jupiter board has a connector for an eMMC module. Add an
entry for it in the device tree and alias it mmc0. As it is not
populated by default, do no mark it as non-removable.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 450d28e438293..b9b8ddc8e7fb0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -17,6 +17,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
 		serial0 = &uart0;
 	};
 
@@ -138,6 +139,15 @@ &cpu_7 {
 	cpu-supply = <&buck1_3v45>;
 };
 
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
-- 
2.53.0

