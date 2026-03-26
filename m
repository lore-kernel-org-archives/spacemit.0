Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F13A2569;
	Thu, 26 Mar 2026 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550290; cv=none; b=a1WzZQ0xeNibanabDTcE+tYwoKse8sXMuJcaWGvMywSGd9B1zVC59cOMsakMSc56blqv3QhLeJ12CjyaPAGkqKBzeaRXCLpp1puNEZY60Js91SAsmljsV9pQtUbfuTIjpcejVdBx7IT9nsj3/5uzclmnFpzgOpVb8RMABLg+nqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550290; c=relaxed/simple;
	bh=aoTx0M62WPQUSa6YRlTCH6X4r6DsNP7Snxsf5BAYfEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qobVLF4YWNvBAg4fTWLZrqkJsf86aDaBS2VKK72ee0bv+xIbX25ro19cNR+V0FKlTGDn+cQnQu7lZW4RwwrPBp+0CYkfvU5T5/Zy7zjtSf8Pa4erega/tnn1NrD2jloGgZy3pDOiQ3G2aklRHExKLNDyz6nEvPa1z5Tx1u9+R3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=aEAZ2zOV; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="aEAZ2zOV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=iO1EmeWh+Lq1L5K3DhLyTQerUA8FzD+PRV6OahdSGak=; b=aEAZ2zOVYyHxILLKf1Ha2rJt8o
	Myh3pxFRNIUwlFYVO8Y9pBvUmYMFjOOsWO8Kzm2FzeH+08L1NP9m1KztnevK5sqyuP+rBXjvBDg/H
	X2Vg5qa1RQJdxR+CME2XYZW6QeXGQ8/gge+LjBD3VCVhyj2yTG2a5Nv1Lws9CSH7yuD/nVqHTBXfD
	eMwJV+POi874Gar2tRYB8y8HtXTmysPhL4fgLX6cY9sKRbqnUPnz3INXNR0PrtMI/SpiRvkiGDcB5
	IGJRlVZd4MDwrgS0wy4r+SDJIyGxsneEFcBYaXwHg02/4iKCH3bm59s3sjVZLmc5Y1+tUIrnxjS0l
	yFiVNOHA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pao-0000000GAk7-09cX;
	Thu, 26 Mar 2026 19:38:06 +0100
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
Subject: [PATCH v2 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:34 +0100
Message-ID: <20260326183745.1370642-7-aurelien@aurel32.net>
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

Enable the two PCIe controller along with and their associated PHY. They
are routed to the M.2 M-key connector and to the PCIe x8 slot.

Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
the PCIe ports.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

v2:
 - Collect Reviewed-by:
 - Fix a typo in the description

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 8eeaf2631b719..afaad59e6bce2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -40,6 +40,16 @@ led2 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_dc_in: regulator-dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
@@ -291,6 +301,38 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.51.0

