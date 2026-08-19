Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F6B3C0608;
	Wed, 19 Aug 2026 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158900; cv=none; b=To1LsJpANixSOJPBuHpRll0igEjHzF2ysd8EV/nOzrQ0rxDW+FRl5PRrLsjZ4Zk1GvwSll1YT/+XvMhZnoiZ/JktYcgF9YYbpZR40+mw1xgNznxEVmiibeLbvU6N/n/ZCdRezFu+MjP4+kEMlyOptFc90GA5J/q8+CC1G55LB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158900; c=relaxed/simple;
	bh=wL/hYcdrMbUkX32th8ImTORzuHYCmqVe8LEgvlquT+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EE7Y7Vab1GkVNVbR/H3eZW9nsmP+CQKyqJM6q3lNXm1IqtFlTiNp+12eEDLCdFF3PeTa9xzmiSHCbpjUvEXg87MCPHLTe8ondogDDk2dfg1mYMAI/4AZDv+2lX7hEc9CT0whA4mwT7bEwUyi01WHxTLjc3bkqvIZQH43s3LSDhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=JUEF3VBo; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="JUEF3VBo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=fJTbyM7H+HD8boIQ2bH5NIgU8weFDSnU4WgmhSiMcHU=; b=JUEF3VBoqKY6CdM488xfnmCxoW
	GqHnaUT5WzTr23p/AIW+olhpHOuYtIglppVj86DYG2qWV8ymLT8WYOMfZ0OxkMCA2O9f0bDQsc2BE
	MNdj8Lz+YzdU9rB0OXJSAzstzucBvWtoSDO3h9oHO7rAX5PHVvc3HkVxTKsMuJJ5zFFxI3ADn19GX
	PnB3MwPswAe9pGxj6yt8GXlt+blsmw2wsWZwzaaDIbrmTaA/4w7QIoZrGpHsy9eUfVsdgvIBAxDTD
	Hb6On4gTEswHuLtjlKH4j3iG1glmq4mJqKBThQ89/twSKjsczoLun1vLkzYPM06G2faeRDSET/e0O
	mseWiuPA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2d-0000000D4ko-1STM;
	Wed, 19 Aug 2026 18:21:27 +0200
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
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 3/5] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
Date: Wed, 19 Aug 2026 18:15:44 +0200
Message-ID: <20260819162115.2252812-4-aurelien@aurel32.net>
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
RTL8852BE Bluetooth enable signal is driven low, resulting in
impossibility to use Bluetooth. Add a DT node to expose it as an RFKILL
device, which lets the Bluetooth driver or userspace toggle it as
required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index e932e464e645..d2e8df5ebeec 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio 0 30 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c2 {
-- 
2.53.0

