Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCA39FCC8;
	Thu, 26 Mar 2026 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550288; cv=none; b=SsHab1N7h8wGQYFugTWtWTUiSKvt5eN7w0dTE0qcZhQofA1EdyGPew3zWPc5nUy2S7cfa5DWmt0wmLX32VnuNOmENOYpyOWJaekV+ikWpf+fLhwIxTV4+N/HpnF2YDPzkULtloiM1Q3u8+p5PZ8IGQzKPomqgNBNiRrNtY1rhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550288; c=relaxed/simple;
	bh=fHyoT2CDwUPiMN7cENHogAhqQHrCNYmiVY01k1kh80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2QC6+6CVXdSyDdgSstlGRzKGYADBJteFbgy1I/UX+GitcQbFM0Rv1DqmWIoh8rDTKOnBi1Q/MQTzdbnpOROp2qqwtFFpaSOvG8asOuctO8yvpCbkJLbtwp9TEZyO6AzdwsD7rWa7jtSTUrK/e4/YH6Se7EwJpeEOe+pnd9Fr6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=MY+xpJHD; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="MY+xpJHD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=fkXcxc78C3LR18JMiJxn0CXjcMZJuIDogetyJvmzDE4=; b=MY+xpJHD/r+E4BiiK/g79Pskb8
	kOb8RGhjKn9pXKLR4mCZqOh/rT9PPU+O96jmEvK8d4DrRJMZ/+fKJ06KxxaSgkQ2CP/VIaR0Hx5jv
	wYX6zXeVdrYxPEkZ2q8ajtTrWGGB9rTdyr0DikbApTx0UQCPd7liHivpAkFdR0LxAASqxULU9Zcmr
	2FOdanTyVxV6EET5xxunTkOiR1PDytcbp5sFWWeaNBSe98JAHKtVI/fJgoly138vWQV8H/tZXpFXR
	RluxkSHC9T8cZOL3v8KSo301QxBH5qcKZBuML7Mx6RiGNllfX3QKTaUzE+0y2/IFSI26IvZd1Ts44
	cgq2VnxQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pam-0000000GAjO-190Z;
	Thu, 26 Mar 2026 19:38:04 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Javier Martinez Canillas <javierm@redhat.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:30 +0100
Message-ID: <20260326183745.1370642-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Jupiter board includes a 24c04 eeprom on the i2c2 bus. The
eeprom contains an ONIE TLV table, which on the board I tested only
provides a product-name entry. Expose it via an onie,tlv-layout nvmem
layout.

The eeprom is marked as read-only since its contents are not supposed to
be modified.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

v2:
 - Collect Reviewed-by:

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 3cd83c5924e4f..bd48208a370cf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -108,6 +108,28 @@ &pdma {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
+		pagesize = <16>;
+		read-only;
+		size = <512>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
-- 
2.51.0

