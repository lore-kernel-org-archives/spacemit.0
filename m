Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6A34DCD9;
	Sun, 22 Mar 2026 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211653; cv=none; b=bVHg/Qt41z+UJPsa1zGsefzhsR1vGoKU7AoOpggd0vI9n4Q+yd6YUIGWBySD8sxm73OxdD9Bdcs50JAJxW66D6sf0rjkylIs1lVQeDi5OxsAs9v3Y8VWtmW4kA7w08ybOHym8RKMNkrNvG9/t7JT83kwx6N642NnTgmyYwn8d/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211653; c=relaxed/simple;
	bh=mwoHXnM/pxo6GxOzjIDCCqIQKAwDWHtO0cQX9CuQc3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du6eNPPhzOfLTK3FtS04NfEtfD84UrAr47ZMw7HhGCQLe5KClgFve90KxLtrUb0hOmURqXcuV+u9jhWNNg+2NAGj6bkhw5gG7dnuAvvsqzQ5W67IThPkag5G1OtRgLpcBv+hOGnK7aH2TcpmNtYnBaDMotwHEgZxqj18cwRumms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=t+BQsLVQ; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="t+BQsLVQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ydfM6LMwzB3xWLIuz6b1o5GNPNVH4RVJhYsd3HhRMIU=; b=t+BQsLVQib7a7op1itwU9Lr3xi
	wg6/lswBoDU4ArirScsnxuJH5EzHipPLTpEauZgZVERQATQ+MLX04VPF2w5bAURaJ3nAuph71081/
	jS163ZHOvd8y3Y3GbanP9wVjFpvth9lRV7GYbQE7/EiwS1qQKdHXODvqAmv/9G49UC+9sH/uzCpGr
	Py4G1JQ18cBEHecNK5FPf3CLBypakawyeEYOIB6H8tHGNrnkVzgee37M8AfaTLVEbKNgmHE22ONRx
	uBApRCuXS1fcWFrGUvzqaLz4yaJluA30OLG7jr8oCA+bKD2vPcNIjFYWpZoY1DeWAEvf8/Dlfy0rH
	K/E52dOA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUw-0000000AseM-3KP2;
	Sun, 22 Mar 2026 21:34:10 +0100
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
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:33 +0100
Message-ID: <20260322203356.2206927-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
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
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

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

