Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338303A3E97;
	Wed, 19 Aug 2026 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158885; cv=none; b=FBD3fTyxD42rEy99kkC7aKb2YvEDtOH8M1WkqFDkmJUgIXwT+yzYxDQ9FU9Qjl4Iqxn8if54VJN197M8Sw2X8Mc0ZbTaRgKWLKLq2DNmPqsPhxQrz/1sgUJUbI9u3gARt2MQXNnoD/xQuIfdNbIFGuQamesNQPEXwHhEtWvAZDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158885; c=relaxed/simple;
	bh=djLhmH+rEuWSw0DRm02kaBTI/cOxRszyU0CtxesWkJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PX3ZY9PtAW76iqpGT4i7oUyoAldJAUBCZRpxtpYFDJWAn5+0A7GvbtxitqggNv/yxHwJCwgmFrrAMzIwbdQeDYWzgRgvxtWfbFwICK0F2GtUpbiozd8aOooqJiE2XwfnN8wJZfQo0lM3lv5r3JTMiDXr9pz/1xQ7L38XDkJ9rJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=dG00cBmD; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="dG00cBmD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=4344Z1O6P410+9Rw0PrnC8sQMpTkULdUUbmywnkl0ts=; b=dG00cBmDO0ZIYbfOEb0bj+5FF3
	TViICLQd6/n3IpTVK5zSzVj+DBEfswP+9rR5B9H2kGRXHy0wUG3Dk+nXg9iHqWdIlT1YAR+z5Wbta
	rb9oVRbeTH6lv71qXpsuRpSQni5dj8z+U3OxtFaiIFTQW6GptRdTjxU4RvU19BiAgVax6zDsaYzLw
	90BHruxK+EDRQLyXhbw7uaSO2yuBMJvQ0wH9guelMsJsCwpajt9BfjwOGyz4XrE14p0Myi4+4bZhp
	NF1CzHeTsnykpHGF7YV6egrg+ftep/4K8HNp4HtK/Xcii90PzryUewUXRzHcvAoiwWVnVqoXE36rp
	ANh3Uorw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2c-0000000D4kh-0xUB;
	Wed, 19 Aug 2026 18:21:26 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
Date: Wed, 19 Aug 2026 18:15:42 +0200
Message-ID: <20260819162115.2252812-2-aurelien@aurel32.net>
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

On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
either be used for PCIe or USB3, depending on its configuration
(spacemit,apmu). This configuration is defined at the board level, and
assigning a phy line to a USB3 controller while it is configured as PCIe
results in an "Invalid PHY mode" error.

Move the USB3 phy at the board level, the as it is done for the
submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
there is one phy per USB controller.

[1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/

Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
Cc: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e..171bd2f40aa6 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -328,5 +328,8 @@ &usb3d_u2phy {
 };
 
 &usb3d {
+	phys = <&usb3d_u2phy>,
+	       <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..3e24054d2084 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
 				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
 				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
 			reset-names = "ahb", "vcc", "phy";
-			phys = <&usb3d_u2phy>,
-			       <&combophy 4 PHY_TYPE_USB3>;
-			phy-names = "usb2-phy", "usb3-phy";
+			phys = <&usb3d_u2phy>;
+			phy-names = "usb2-phy";
 			phy_type = "utmi";
 			snps,dis_enblslpm_quirk;
 			snps,dis_u2_susphy_quirk;
-- 
2.53.0

